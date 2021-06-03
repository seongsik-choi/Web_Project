/**********************************/
/* Table Name: 컨텐츠 */
/**********************************/
DROP TABLE attachfile;
DROP TABLE contents;
CREATE TABLE contents(
		contentsno                    		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '컨텐츠 번호',
		adminno                       		INT(10)		 NOT NULL COMMENT '관리자 번호',
		stuno                         		INT(10)		 NOT NULL COMMENT '스터디 번호',
		
		recom 										INT(10)		 DEFAULT 0 NULL COMMENT '추천수',
		name                          		VARCHAR(100)		 NOT NULL COMMENT '이름',
		intro                         		TEXT		 NOT NULL COMMENT '소개',
		cnt                           		INT(7)		 DEFAULT 0		 NOT NULL COMMENT '조회수',
		certi                         		VARCHAR(100)		 NOT NULL COMMENT '자격증',
		id                            		VARCHAR(20)		 NOT NULL COMMENT '아이디',
		passwd                        		VARCHAR(15)		 NOT NULL COMMENT '패스워드',
		
		file1                         		VARCHAR(100)		 NULL  COMMENT '메인 이미지',
		file1saved                    		VARCHAR(100)		 NULL  COMMENT '실제 저장된 메인 이미지',
		thumb1                        		VARCHAR(100)		 NULL  COMMENT '메인 이미지 Preview',
		size1                         		INT(10)		 DEFAULT 0		 NULL  COMMENT '메인 이미지 크기',
  FOREIGN KEY (adminno) REFERENCES admin (adminno),
  FOREIGN KEY (stuno) REFERENCES stu (stuno)
) COMMENT='컨텐츠';

COMMENT ON TABLE contents is '컨텐츠 - 영화 상품';
COMMENT ON COLUMN contents.contentsno is '컨텐츠 번호';
COMMENT ON COLUMN contents.adminno is '관리자 번호';
COMMENT ON COLUMN contents.stuno IS '스터디 번호';

COMMENT ON COLUMN contents.recom is '추천수';
COMMENT ON COLUMN contents.name is '이름';
COMMENT ON COLUMN contents.intro IS '소개';
COMMENT ON COLUMN contents.cnt IS '조회수';
COMMENT ON COLUMN contents.certi IS '자격증';
COMMENT ON COLUMN contents.id IS '아이디';
COMMENT ON COLUMN contents.passwd IS '패스워드';

COMMENT ON COLUMN contents.file1 is '메인 이미지';
COMMENT ON COLUMN contents.file1saved is '실제 저장된 메인 이미지';
COMMENT ON COLUMN contents.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN contents.size1 IS ' 메인 이미지 크기';


-- 오류 보고 - ORA-02291: integrity constraint (AI8.SYS_C007026) violated - parent key not found
-- (부모)admin 레코드 삽입후 (자식)contents 레코드 생성 가능  
-- 등록(CREATE + INSERT)

-- 컨텐츠번호(PK), 관리자번호(FK), 카테고리번호(FK), 제목,   내용,  추천수, 조회수, 댓글수  
-- 패스워드, 검색어, 등록일, 메인이미지, 실제 저장된 메인 이미지, 메인 이미지 preview, 메인이미지 크기
-- 정가, 할인률, 판매가, 포인트, 수량
INSERT INTO contents(adminno, stuno, name, intro, certi, id, passwd,
                     file1, file1saved, thumb1, size1)
VALUES(1, 1, '최성식', '스터디 지원합니다! 26세 남자입니다.', '토익700점 보유', 'tonny96', '1234', 
		'toeic.jpg', 'toeic_1.jpg', 'toeic_t.jpg', 1000);
		
COMMIT;

-- List, 목록 : 여러 건의 레코드를 읽는 것
SELECT contentsno, adminno, stuno, recom, name, intro, certi, id, passwd, file1, file1saved, thumb1, size1
FROM contents
ORDER BY contentsno ASC;      

-- [37][Contents] 테이블 이미지 기반 cateno별 목록 출력 변경(list_by_cateno.do)
SELECT contentsno,adminno, stuno, recom, name, intro, certi, id, passwd, file1, file1saved, thumb1, size1
FROM contents
WHERE stuno = 1
ORDER BY contentsno ASC;

-- [38] 검색 cateno별 검색 목록
-- word 컬럼의 사용(추가)로 검색 정확도를 높이기 위하여 중요 단어를 명시
-- ex) 노트북, notebook, 놋북 등
SELECT contentsno,adminno, stuno, recom, name, intro, certi, id, passwd, file1, file1saved, thumb1, size1
FROM contents
WHERE stuno=1 AND intro LIKE '%26%'
ORDER BY contentsno DESC;


-- [40][Contents] 페이징, SQL, DAO, Process, list_by_cateno_search_paging.jsp 
-- 13) 검색 + 페이징 + 메인 이미지
-- step 1 : stuno = 영화 등록된 cate의 번호(CONTENTS 가서 확인)
SELECT contentsno, adminno, stuno, recom, name, intro, certi, id, passwd, file1, file1saved, thumb1, size1
FROM contents
WHERE stuno=1 AND intro LIKE '%지원%'
ORDER BY contentsno DESC
LIMIT 0, 3;

-- 2 page
SELECT contentsno, adminno, stuno, recom, name, intro, certi, id, passwd, file1, file1saved, thumb1, size1
FROM contents
WHERE stuno=1 AND intro LIKE '%지원%'
ORDER BY contentsno DESC
LIMIT 3, 3;

-- 3 page
SELECT contentsno, adminno, stuno, recom, name, intro, certi, id, passwd, file1, file1saved, thumb1, size1
FROM contents
WHERE stuno=1 AND intro LIKE '%지원%'
ORDER BY contentsno DESC
LIMIT 6, 3;

-- [46][Contents] 텍스트 관련 수정 기능의 제작,패스워드는 향후(AJAX 배운 후)테스트 수정
UPDATE contents
SET name='최성식수정', intro='안녕하세요! 25세 스터디 지원합니다!', 
			certi='정처기, 토스6, 컴활', id='tonnyupdate'
WHERE contentsno = 11;

-- [47][Contents] 파일 수정 기능의 제작, 패스워드 검사(향후 Ajax 적용 구현)
UPDATE contents
SET file1='a.jpg', file1saved='a_0.jpg', 
			thumb1='a_t.jpg', size1='1000'
WHERE contentsno = 11;

-- [48][Contents] 삭제 기능의 제작, 패스워드 검사(향후 Ajax 적용 구현)
DELETE FROM contents
WHERE contentsno = 25;
COMMIT;

-- 추천수 AJAX 구현
UPDATE contents
SET recom = recom + 1
WHERE contentsno = 1;
commit;