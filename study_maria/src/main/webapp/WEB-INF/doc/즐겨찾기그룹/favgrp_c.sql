/**********************************/
/* Table Name: 즐겨찾기 그룹 */
/**********************************/
DROP TABLE favgrp;

CREATE TABLE favgrp(
		favgrpno                      INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '즐겨찾기 그룹 번호',
		favgrpname                       VARCHAR(20)		 NOT NULL COMMENT '즐겨찾기 그룹 이름',
		favgrpex                         		VARCHAR(100)		 NOT NULL COMMENT '즐겨찾기 그룹 설명',
		rdate                         		DATETIME		 NOT NULL COMMENT '즐겨찾기 그룹 생성일'
) COMMENT='즐겨찾기 그룹';

COMMENT ON TABLE favgrp IS '즐겨찾기 그룹';
COMMENT ON COLUMN favgrp.favgrpno is '즐겨찾기 그룹 번호';
COMMENT ON COLUMN favgrp.favgrpname is '즐겨찾기 그룹 이름';
COMMENT ON COLUMN favgrp.favgrpex IS '즐겨찾기 그룹 설명';
COMMENT ON COLUMN favgrp.rdate is '즐겨찾기 그룹 생성일';

-- Create, 등록 : CREATE + INSERT
INSERT INTO favgrp(favgrpname, favgrpex, rdate)
VALUES('서울/북부', '서울/북부 지역 스터디카페 홍보해주세요', NOW());

INSERT INTO favgrp(favgrpname, favgrpex, rdate)
VALUES('서울/남부', '서울/남부 지역 스터디카페 홍보해주세요', NOW());

INSERT INTO favgrp(favgrpname, favgrpex, rdate)
VALUES('경기/북부', '경기/북부 지역 스터디카페 홍보해주세요', NOW());

INSERT INTO favgrp(favgrpname, favgrpex, rdate)
VALUES('경기/남부', '경기/남부 지역 스터디카페 홍보해주세요', NOW());

COMMIT;

-- Read, 조회 : 한 건의 레코드를 읽는 것 
SELECT favgrpno, favgrpname, favgrpex, rdate FROM favgrp
WHERE favgrpno = 1;

-- List, 목록
SELECT favgrpno, favgrpname, favgrpex, rdate 
FROM favgrp
ORDER BY favgrpno ASC;

-- Update, 수정, PK는 일반적으로 update 불가능, 컬럼의 특징을 파악후 변경여부 결정,
-- WHERE 절에 PK 컬럼 명시
UPDATE favgrp
SET favgrpname='서울시/북부'
WHERE favgrpno=1;

-- Delete, 삭제
DELETE FROM favgrp
WHERE favgrpno=5;

-- SELECT * FROM favgrp;
SELECT * FROM favgrp; 
