-- 1) 테이블 생성 및 데이터 준비
DROP TABLE PG;
 
CREATE TABLE PG(
  NO     int NOT NULL AUTO_INCREMENT,
  title  VARCHAR(20) NOT NULL,
  PRIMARY KEY(no )
);

INSERT INTO pg(title) VALUES('01월');
INSERT INTO pg(title) VALUES('02월');
INSERT INTO pg(title) VALUES('03월');
INSERT INTO pg(title) VALUES('04월');
INSERT INTO pg(title) VALUES('05월');
INSERT INTO pg(title) VALUES('06월');
INSERT INTO pg(title) VALUES('07월');
INSERT INTO pg(title) VALUES('08월');
INSERT INTO pg(title) VALUES('09월');
INSERT INTO pg(title) VALUES('10월');
INSERT INTO pg(title) VALUES('11월');
INSERT INTO pg(title) VALUES('12월');

COMMIT;
 
SELECT no , title FROM pg;
 
 NUM TITLE
 --- -----
   1 01월
   2 02월
   3 03월
   4 04월
   5 05월
   6 06월
   7 07월
   8 08월
   9 09월
  10 10월
  11 11월
  12 12월
 
-- 분기별로 분할하여 레코드를 추출하는 경우(페이징)
SELECT no, title FROM pg;
 
-- 1) 2,3월 삭제
DELETE FROM pg WHERE no =2 or no =3;
COMMIT;
 
SELECT no, title FROM pg;
 

 
INSERT INTO pg(title) VALUES('봄');
INSERT INTO pg(title) VALUES('여름');
INSERT INTO pg(title) VALUES('가을');
INSERT INTO pg(title) VALUES('겨울');
commit;

SELECT no, title FROM pg;

-- 3) 데이터 확인
-- rownum은 정렬시에 순서가 일정하지 않게됨.
-- SELECT → ORDER BY ~
SELECT no, title 
FROM pg
ORDER BY title ASC;

  
-- 4) 1 페이지
SELECT no, title
FROM pg
LIMIT 0, 3;

       NUM TITLE                    ROWNUM
---------- -------------------- ----------
         1 01월                          1
         4 04월                          2
         5 05월                          3
         

-- 4) 2 페이지
SELECT no, title
FROM pg
LIMIT 3, 3;

       NUM TITLE                    ROWNUM
---------- -------------------- ----------
         6 06월                          4
         7 07월                          5
         8 08월                          6
         
-- 5) 3 페이지
SELECT no, title
FROM pg
LIMIT 6, 3;

       NUM TITLE                    ROWNUM
---------- -------------------- ----------
         9 09월                          7
        10 10월                          8
        11 11월                          9
