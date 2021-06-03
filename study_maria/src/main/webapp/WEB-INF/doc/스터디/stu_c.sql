/**********************************/
/* Table Name: 스터디 */
/**********************************/
DROP TABLE stu;

CREATE TABLE stu(
		stuno                         		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '스터디 번호',
		stugrpno                      		INT(10)		 NULL  COMMENT '스터디 그룹 번호',
		name                          		VARCHAR(40)		 NOT NULL COMMENT '스터디 이름',
		stuex                         		VARCHAR(300)		 NOT NULL COMMENT '스터디 설명',
		stulo                         		VARCHAR(25)		 NOT NULL COMMENT '스터디 지역',
		rdate                         		DATETIME		 NOT NULL COMMENT '생성일',
		cnt                           		INT(10)		 NOT NULL COMMENT '관련 자료 수',
  FOREIGN KEY (stugrpno ) REFERENCES stugrp (stugrpno )
) COMMENT='스터디';

COMMENT ON TABLE stu is '스터디';
COMMENT ON COLUMN stu.stuno IS '스터디 번호';
COMMENT ON COLUMN stu.stugrpno IS '스터디 그룹 번름';
COMMENT ON COLUMN stu.name is '스터디 제목';
COMMENT ON COLUMN stu.stuex IS '스터디 설명';
COMMENT ON COLUMN stu.stulo IS '스터디 지역';
COMMENT ON COLUMN stu.rdate IS '생성일';
COMMENT ON COLUMN stu.cnt IS '관련 자료 수';

-- Create, 등록 : CREATE + INSERT
INSERT INTO stu(stugrpno, name, stuex, stulo, rdate, cnt)
VALUES(1, '토익900', '토익900이상 스터디 모집해요~', '경기도/일산', NOW(), 0);

INSERT INTO stu(stugrpno, name, stuex, stulo, rdate, cnt)
VALUES(1, '토스레벨6', '토익스피킹 레벨6 이상 도전하실 스터디 모집해요~', '경기도/일산', NOW(), 0);

-- Create, 등록 : CREATE + INSERT
INSERT INTO stu(stugrpno, name, stuex, stulo, rdate, cnt)
VALUES(2, '정처기', '정보처리기사 2회 실기 스터디 모집합니다.', '경기도/일산', NOW(), 0);

INSERT INTO stu(stugrpno, name, stuex, stulo, rdate, cnt)
VALUES(2, 'SQLD', 'SQLD 빡공 하실분들 모집해요!', '경기도/일산', NOW(), 0);

-- Create, 등록 : CREATE + INSERT
INSERT INTO stu(stugrpno, name, stuex, stulo, rdate, cnt)
VALUES(3, '세무회계', '전산 세무회계 1급 자격증 공부하실분~', '경기도/일산', NOW(), 0);

INSERT INTO stu(stugrpno, name, stuex, stulo, rdate, cnt)
VALUES(4, '바리스타', '바리스타1급 자격 공부하시는분 들어오세요!!', '경기도/일산', NOW(), 0);

-- LIST(조회, 다중) : stugrpno(부모테이블 번호) 기준
SELECT * FROM stu ORDER BY stugrpno ASC;

-- 27) 전체 목록 출력 기능 제작
SELECT stuno, stugrpno, name, stuex, stulo, rdate, cnt
FROM stu
ORDER BY stugrpno ASC;

-- 28) stugrpno 별 목록(WHER로 stugrpno = 1(TOEIC) 인 레코드만 출력.
SELECT stuno, stugrpno, name, stuex, stulo, rdate, cnt
FROM stu
WHERE stugrpno = 1
ORDER BY stuno ASC;

-- 29) Stugrp + Stu join, 연결 목록 
-- 1) FROM절의 r과 c는 TABLE에 대한 별명
-- 2) SLEECT 절에 컬럼은 별명.컬럼명 / 겹치는 컬럼명 반드시 명시 + 별명 선언(AS)
-- 3) AS로 컬럼명 선언시 실제 컬럼명은 사용 NO.
-- 4) 부모쪽에 AS로 별병 선언 시, 자식은 별명 선언 필요 NO.
-- 5) WHERE 조건에 부모 PK(stugrpno)와 자식 FK(stugrpno) 비교해 같으면 Join하여 출력
-- 6) 결합시 자식 테이블의 레코드 갯수만큼 결합(Join)이 발생
-- Stugrpno의 name = stugrpname / stu의 name = name -> 겹치는 컬럼명은 FK와 PK뿐
SELECT r.stugrpno AS r_stugrpno, r.stugrpname,
   	 c.stuno, c.stugrpno, c.name, c.stuex, c.stulo, c.rdate, c.cnt
FROM stugrp r, stu c
WHERE r.stugrpno = c.stugrpno
ORDER BY stugrpno ASC, stuno ASC;

(부_PK)                (자_PK) (자_FK)
R_CATEGRPNO stugrpname  stuno  stugrpno   NAME      stuex         stulo        rdate  CNT
---------------- ----------------------- ---------- ---------------------------------------- 
1          TOEIC/SPEAKING 1      1       토익900    토익900이상~   경기도/일산   2021~  0

-- LIST(조회, 다중) : stuno(스터디 테이블 번호) 기준
SELECT * FROM stu ORDER BY stuno ASC;

-- READ(조회, 단일)
SELECT * FROM stu WHERE stuno = 3;

-- READ(조회, 단일)
SELECT * FROM stu WHERE stugrpno = 1;

-- 30) 수정 삭제, 데이터 읽기부터
SELECT stuno, stugrpno, name, stuex, stulo, rdate, cnt
FROM stu
WHERE stuno = 1;

-- UPDATE(수정)
UPDATE stu
SET stugrpno = 2, stuex='정보처리기사 1회 실기 스터디 모집해요!'
WHERE stuno=3;

-- Delete(삭제)
DELETE FROM stu WHERE stuno=3;

-- 갯수
SELECT COUNT(*) as cnt 
FROM stu;

-- 글수 증가
UPDATE stu
SET cnt = cnt + 1
WHERE stuno=1;

SELECT * FROM stu;

commit;

-- 글수 감소
UPDATE stu
SET cnt = cnt - 1
WHERE stuno=1;

SELECT * FROM stu;

commit;

-- 글수 추기화
UPDATE stu
SET cnt = 0
WHERE stuno=1;

SELECT * FROM stu;

commit;