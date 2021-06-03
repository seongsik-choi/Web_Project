/**********************************/
/* Table Name: 회원 */
/**********************************/
-- member 삭제전에 FK가 선언된 자식 테이블 먼저 삭제
DROP TABLE attachfile;
DROP TABLE qna;
DROP TABLE reply;

-- 제약 조건과 함께 삭제(제약 조건이 있어도 삭제됨, 권장하지 않음.)
DROP TABLE member CASCADE CONSTRAINTS; 
DROP TABLE member;
CREATE TABLE member(
		memberno                      		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '회원 번호',
		id                            		VARCHAR(20)		 NOT NULL COMMENT '아이디',
		passwd                        		VARCHAR(30)		 NOT NULL COMMENT '패스워드',
		mname                         		VARCHAR(20)		 NOT NULL COMMENT '성명',
		tel                           		VARCHAR(20)		 NOT NULL COMMENT '전화번호',
		zipcode                       		VARCHAR(5)		 NULL  COMMENT '우편번호',
		address1                      		VARCHAR(80)		 NULL  COMMENT '주소 1',
		address2                      		VARCHAR(50)		 NULL  COMMENT '주소 2',
		mdate                         		DATETIME		 NOT NULL COMMENT '가입일',
		grade                         		INT(3)		 NOT NULL COMMENT '등급', 
		
		email                         		VARCHAR(30)		 NOT NULL COMMENT '이메일',
		vname                         		VARCHAR(20)		 NOT NULL COMMENT '별명',
		job                           		VARCHAR(15)		 NOT NULL COMMENT '직업',
		
		file1                         		VARCHAR(100)		 NULL  COMMENT '메인 이미지',
		file1saved                    		VARCHAR(100)		 NULL  COMMENT '실제 저장된 메인 이미지',
		thumb1                        		VARCHAR(100)		 NULL  COMMENT '메인 이미지 Preview',
		size1                         		INT(10)		 DEFAULT 0		 NULL  COMMENT '메인 이미지 크기'
) COMMENT='회원';

COMMENT ON TABLE MEMBER is '회원';
COMMENT ON COLUMN MEMBER.memberno is '회원 번호';
COMMENT ON COLUMN MEMBER.id is '아이디';
COMMENT ON COLUMN MEMBER.passwd is '패스워드';
COMMENT ON COLUMN MEMBER.mname is '성명';
COMMENT ON COLUMN MEMBER.tel IS '전화번호';
COMMENT ON COLUMN MEMBER.zipcode is '우편번호';
COMMENT ON COLUMN MEMBER.address1 is '주소1';
COMMENT ON COLUMN MEMBER.address2 is '주소2';
COMMENT ON COLUMN MEMBER.mdate is '가입일';
COMMENT ON COLUMN MEMBER.grade is '등급';

COMMENT ON COLUMN MEMBER.email is '이메일';
COMMENT ON COLUMN MEMBER.vname is '별명';
COMMENT ON COLUMN MEMBER.job is '직업';

COMMENT ON COLUMN contents.file1 is '메인 이미지';
COMMENT ON COLUMN contents.file1saved is '실제 저장된 메인 이미지';
COMMENT ON COLUMN contents.thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN contents.size1 IS ' 메인 이미지 크기';

-- (1~10: 관리자, 11~20: 회원, 비회원: 30~39, 정지 회원: 40~49, 탈퇴 회원: 99)

-- 1. 등록
-- 1) id 중복 확인(null 값을 가지고 있으면 count에서 제외됨)
SELECT COUNT(id)
FROM member
WHERE id='tonny1225';

SELECT COUNT(id) as cnt
FROM member
WHERE id='user1';

-- 1) 등록
-- 회원 관리용 계정, Q/A 용 계정
INSERT INTO member(id, passwd, mname, tel, zipcode,
                   address1, address2, mdate, grade,
						 email, vname, job,
						 file1, file1saved, thumb1, size1)
VALUES ('tonny1225', '1234', '질문답변관리자', '000-0000-0000', '12345',
             '서울시 종로구', '관철동', NOW(), 1,
				 'tonny1225@naver.com', '오딩', '학생',
				 'seongsik.jpg', 'seongsik_1.jpg', 'seongsik_t.jpg', 1000);
 
-- 개인 회원 테스트 계정
INSERT INTO member(id, passwd, mname, tel, zipcode,
                   address1, address2, mdate, grade,
						 email, vname, job,
						 file1, file1saved, thumb1, size1)
VALUES ('tonny', '1234', '질문답변관리자', '000-0000-0000', '12345',
             '서울시 종로구', '관철동', NOW(), 15,
				 'tonny@naver.com', '오딩2', '학생2',
				 'seong.jpg', 'seong_1.jpg', 'seong_t.jpg', 1000);
				 
-- 부서별(그룹별) 공유 회원 기준

-- 2. 목록
SELECT memberno, id, passwd, mname, tel, zipcode,
                   address1, address2, mdate, grade,
						 email, vname, job,
						 file1, file1saved, thumb1, size1
FROM member
ORDER BY memberno ASC;

-- 3. 조회
-- 1) tonny1225 사원 정보 보기
SELECT id, passwd, mname, tel, zipcode,
                   address1, address2, mdate, grade,
						 email, vname, job,
						 file1, file1saved, thumb1, size1
FROM member
WHERE memberno = 1;

SELECT id, passwd, mname, tel, zipcode,
                   address1, address2, mdate, grade,
						 email, vname, job,
						 file1, file1saved, thumb1, size1
FROM member
WHERE id = 'tonny1225';		 

-- 4. 수정
-- [46][Contents] 텍스트 관련 수정 기능의 제작
UPDATE member
SET mname='최성식수정', tel='010-1111-1111', 
			email='tonny@daum.net', vname='오딩오딩', job='학생2'
WHERE memberno = 1;
COMMIT;

-- [47][Contents] 파일 수정 기능의 제작
UPDATE member
SET file1='a.jpg', file1saved='a_0.jpg', 
			thumb1='a_t.jpg', size1='1000'
WHERE memberno = 1;
COMMIT;

-- 5. 삭제
-- 1) 모두 삭제
DELETE FROM member;
 
-- 2) 특정 회원 삭제
DELETE FROM member
WHERE memberno=5;
COMMIT;

-- 6. 패스워드 변경
-- 1) 패스워드 검사
SELECT COUNT(memberno) as cnt
FROM member
WHERE memberno=1 AND passwd='1234';
 
-- 2) 패스워드 수정
UPDATE member
SET passwd='0000'
WHERE memberno=1;

COMMIT;
 
-- 7. 로그인
SELECT COUNT(memberno) as cnt
FROM member
WHERE id='tonny1225' AND passwd='0000';
 

