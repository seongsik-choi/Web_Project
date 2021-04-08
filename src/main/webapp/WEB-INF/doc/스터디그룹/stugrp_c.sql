/**********************************/
/* Table Name: 스터디그룹 */
/**********************************/
DROP TABLE stugrp;
CREATE TABLE stugrp(
		stugrpno                      	INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '스터디 그룹 번호',
		stugrpname                    VARCHAR(50)		 NOT NULL COMMENT '스터디 그룹 이름',
		stugrpex                      		VARCHAR(300)		 NULL  COMMENT '스터디 그룹 설명',
		seqno                         		MEDIUMINT(10)		 NOT NULL COMMENT '출력 순서',
		rdate                         		DATETIME		 NOT NULL COMMENT '그룹 생성일'
) COMMENT='스터디그룹';

COMMENT ON TABLE stugrp is '스터디 그룹';
COMMENT ON COLUMN stugrp.stugrpno is '스터디 그룹 번호';
COMMENT ON COLUMN stugrp.stugrpname is '스터디 그룹 이름';
COMMENT ON COLUMN stugrp.stugrpex is '스터디 그룹 설명';
COMMENT ON COLUMN stugrp.seqno is '출력 순서';
COMMENT ON COLUMN stugrp.rdate IS '그룹 생성일';

-- Create, 등록 : CREATE + INSERT
INSERT INTO stugrp(stugrpname, stugrpex, seqno, rdate)
VALUES('토익 스터디', '토익스터디 그룹입니다 환영합니다!', 1, NOW());

INSERT INTO stugrp(stugrpname, stugrpex, seqno, rdate)
VALUES('자격증 스터디', '자격증스터디 그룹입니다 환영합니다!', 2, NOW());

INSERT INTO stugrp(stugrpname, stugrpex, seqno, rdate)
VALUES('정보처리기사 스터디', '정보처리기사스터디 그룹입니다 환영합니다!', 3, NOW());

-- Read, 조회 : 한 건의 레코드를 읽는 것
SELECT stugrpno, stugrpname, stugrpex, seqno, rdate FROM stugrp
WHERE stugrpno = 1;

-- List, 목록
SELECT stugrpno, stugrpname, stugrpex, seqno, rdate
FROM stugrp
ORDER BY stugrpno ASC;

-- Read, 조회
SELECT stugrpno, stugrpname, stugrpex, seqno, rdate
FROM stugrp
WHERE stugrpno = 1;

-- Update, 수정, PK는 일반적으로 update 불가능, 컬럼의 특징을 파악후 변경여부 결정,
-- WHERE 절에 PK 컬럼 명시
UPDATE stugrp
SET stugrpname='새로운 스터디', stugrpname='새로운 스터디 그룹입니다' seqno=2
WHERE stugrpno=1;

-- Delete, 삭제
DELETE FROM stugrp
WHERE stugrpno=3;

-- seqno 정렬_[22][Categrp] 출력 순서별 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), redirect의 적용
SELECT stugrpno, stugrpname, seqno, rdate
FROM stugrp
ORDER BY seqno ASC;

-- SELECT * FROM stugrp;
SELECT * FROM stugrp; 