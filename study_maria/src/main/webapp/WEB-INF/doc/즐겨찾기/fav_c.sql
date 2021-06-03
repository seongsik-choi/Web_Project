/**********************************/
/* Table Name: 즐겨찾기 */
/**********************************/
DROP TABLE fav;

CREATE TABLE fav(
		favno                         		INT(10)		 NOT NULL		 PRIMARY KEY AUTO_INCREMENT COMMENT '즐겨찾기 번호',
		favgrpno                      		INT(10)		 NULL  COMMENT '즐겨찾기 그룹 번호',
		favname                       		VARCHAR(20)		 NOT NULL COMMENT '즐겨찾기 이름',
		favex                         		VARCHAR(50)		 NOT NULL COMMENT '즐겨찾기 설명',
		favli                         		VARCHAR(30)		 NOT NULL COMMENT '즐겨찾기 링크',
		rdate                         		DATETIME		 NOT NULL COMMENT '즐겨찾기 생성일',
  FOREIGN KEY (favgrpno) REFERENCES favgrp (favgrpno)
) COMMENT='즐겨찾기';

COMMENT ON TABLE fav is '스터디';
COMMENT ON COLUMN fav.favno IS '즐겨찾기 번호';
COMMENT ON COLUMN fav.favgrpno IS '즐겨찾기 그룹 번호';
COMMENT ON COLUMN fav.favname is '즐겨찾기 이름';
COMMENT ON COLUMN fav.favex IS '즐겨찾기 설명';
COMMENT ON COLUMN fav.favli IS '즐겨찾기 링크';
COMMENT ON COLUMN fav.rdate IS '즐겨찾기 생성일';

-- Create, 등록 : CREATE + INSERT
INSERT INTO fav(favgrpno, favname, favex, favli, rdate)
VALUES(1, '성북구스터디', '성북스터디 분위기 좋아요!', '010-2222-2222', NOW());

INSERT INTO fav(favgrpno, favname, favex, favli, rdate)
VALUES(1, '스터디 용산', '스터디용산 리뉴얼했어요~!', 'http://www.favdyyonsan.co.kr', NOW());

INSERT INTO fav(favgrpno, favname, favex, favli, rdate)
VALUES(2, '잠실Stduy', '잠실Stduy 파격 이벤트!', '010-3333-2222', NOW());

INSERT INTO fav(favgrpno, favname, favex, favli, rdate)
VALUES(3, 'Stduy일산', 'Stduy일산단체할인해드려요~', 'http://www.ilsan.co.k', NOW());

-- LIST(조회, 다중) : favgrpno(부모테이블 번호) 기준
SELECT * FROM fav ORDER BY favgrpno ASC;

-- 27) 전체 목록 출력 기능 제작
SELECT favno, favgrpno, favname, favex, favli, rdate
FROM fav
ORDER BY favgrpno ASC;

-- 28) favgrpno 별 목록(WHER로 favgrpno = 1(TOEIC) 인 레코드만 출력.
SELECT favno, favgrpno, favname, favex, favli, rdate
FROM fav
WHERE favgrpno = 1
ORDER BY favno ASC;

-- 29) Favgrp + Fav join, 연결 목록 
-- 1) FROM절의 r과 c는 TABLE에 대한 별명
-- 2) SLEECT 절에 컬럼은 별명.컬럼명 / 겹치는 컬럼명 반드시 명시 + 별명 선언(AS)
-- 3) AS로 컬럼명 선언시 실제 컬럼명은 사용 NO.
-- 4) 부모쪽에 AS로 별병 선언 시, 자식은 별명 선언 필요 NO.
-- 5) WHERE 조건에 부모 PK(favgrpno)와 자식 FK(favgrpno) 비교해 같으면 Join하여 출력
-- 6) 결합시 자식 테이블의 레코드 갯수만큼 결합(Join)이 발생
-- Favgrpno의 name = favgrpname / fav의 name = name -> 겹치는 컬럼명은 FK와 PK뿐
SELECT r.favgrpno AS r_favgrpno, r.favgrpname,
   	 c.favno, c.favgrpno, c.favname, c.favex, c.favli, c.rdate
FROM favgrp r, fav c
WHERE r.favgrpno = c.favgrpno
ORDER BY favgrpno ASC, favno ASC;

-- 30) 수정 삭제, 데이터 읽기부터
SELECT favno, favgrpno, favname, favex, favli, rdate
FROM fav
WHERE favno = 1;

-- UPDATE(수정)
UPDATE fav
SET favex='성북스터디 이벤트 합니다! 많이들 오세요!'
WHERE favno=1;

-- LIST(조회, 다중) : favno(스터디 테이블 번호) 기준
SELECT * FROM fav ORDER BY favno ASC;

-- READ(조회, 단일)
SELECT * FROM fav WHERE favno = 3;

-- READ(조회, 단일)
SELECT * FROM fav WHERE favgrpno = 1;

-- UPDATE(수정)
UPDATE fav
SET favex='성북스터디 이벤트 합니다! 많이들 오세요!'
WHERE favno=1;

-- Delete(삭제)
DELETE FROM fav WHERE favno=6;

SELECT * FROM fav;

commit;