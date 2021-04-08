# Web Personal Project : Spring Boot
## STS 4.6.0(Spring Tool Suite4) Tree Structure  
  **1) Did : C:/dic/WS_FRAME/study_maria**    
  **2) package : dev.mvc.study_maria**  
├─bin/main/dev/mvc/study_maria  <- JAVA class 실행: 내장 톰캣이 실행되어 동일하게 작동  
│              
├─build.gradle <- gradle build 명세, lib 정의, 빌드 및 배포 설정,  Boot 및 JAVA 버전 명시, Jar library 의존성 옵션  
│  
├─Project and External Dependencies   <- gradle에 명시한 Spring project 의존 lib 목록  
└─src   <- jsp 등 resource dic  
     └─/main/java   <- JAVA source dic    
            └──/기본패키지/StartApplication.java   <- main method가 존재하는 JAVA class(구성과 최초 실행)  
     └─/main/resources/static	 <- Image, CSS, Javascript등 static files 저장  
     └─/main/resources/application.properties   <- 환경 설정에 사용할 properties 정의  
     └─/main/webapp/WEB-INF       <- Web Service를 위한 dic  

---
 **3) Technology**
  - O/S : Windows 10  
  - Language : JAVA (JDK1.8.0_281)   
  - DBMS : MariaDB, MYSQL  
  - Web Application Server : Tomcat 9.0  
  - Framework : Spring Boot 2.4.3, Mybatis 3.4.1, BootStrap 3.4.1  
  - Technology : JDBC, HTML 5.0, CSS3, JSP  
  - Tools : STS4, Amateras UML, Amateras ERD, SQLdeveloper  
---
**4) 기본 설정**
~~~
- MariaDB Setup -> Server.bat + root.bat -> root password -> CREATE DB
1. Spring Boot 프로젝트 생성 
  * a. FILE -> NEW -> 'Spring Starter Project' 실행
2. 프로젝트명: study_maria, / Package: dev.mvc.study_maria
    * Service URL : https://start.spring.io 웹 상에서 프로젝트 기초 소스 생성  
    * Type : library 관리 툴, Gradle  
    * Packaging : 배포 형태, War  
    * Group : dev.boot  
    * Artifact : study_maria   
    * version : source version  
    * Package : project main source package  
    - v1: version 1.0, sb: Spring Boot, m3: Mybatis 3.0
3. 의존 library 추가 : Spring boot Version(2.4.3)  
    * Spring Boot Version : 2.4.3
    * Spring Boot DevTools, Spring Web, MyBatis Framework, JDBC API : 4가지 의존성 추가
    * [Finish] 버튼을 클릭 
    - Oracle Driver 절대 설치하지 말것, 버그로 인해 드라이버 인식 불규칙
4. /src/main/resources/application.properties 
: 프로젝트에서 사용되는 오라클 계정 설정 + 포트설정 + DEVTOOLS 설정
   * #MariaDB hikari 선언
5. jsp 사용을위한 의존성 추가
  ▷ build.gradle 편집
6. Component scan "dev.mvc.resort_sbv2" 패키지 설정
  - Controller, DAO, Process class 등을 자동으로 인식할 패키지 선언
  ★★ 프로젝트별 파일명 : 프로젝트명Application.java★★
▷ dev.boot.study_mariaApplication.java
7. 관련 폴더 생성
  1) JSP views: /src/main/webapp/WEB-INF/views
  2) JSP views: /src/main/webapp/WEB-INF/lib
  3) CSS: /src/main/resources/static/css
  4) images: /src/main/resources/static/images
  5) Javascript: /src/main/resources/static/js
8. MyBatis 설정
  1. /src/main/resources/mybatis 패키지 생성 ★★★★★
  2. MyBatis 설정
  - @MapperScan(basePackages= {"dev.mvc"}): DAO interface 검색 패키지 설정
  ▷ /src/main/java/dev.mvc.study_maria.DatabaseConfiguration.java 설정
9. MyBatis 설정 JUnit 테스트(/src/test/java 폴더에 테스트 기초 파일이 생성되어 있음)
  ▷ /src/test/java/dev.mvc.resort_v1sbm3a.ResortV1sbm3aApplicationTests.java 설정
  --> Debug as --> JUnit test : HikariDataSource (HikariPool-1)
10. 프로젝트 실행 테스트
프로젝트 선택 -> Run As -> Spring Boot App 실행
11. WEB 접속 확인 : http://localhost:9091
~~~
---
**5) 개발과정**
~~~
- 0402 :
 1) style.css 제작 : @CHARSET "UTF-8";: CSS 인코딩 방식 지정
    ▷/src/main/resources/static/css/style.css
 2) Main 페이지 제작
     Controller(dev.mvc.study_maria.HomeCont.java) : @RequestMapping, setViewName 설정
     top, bottom jsp 제작 -> index.jsp에서 <jsp:include> 설정
 3) Amateras ERD 를 통한 DMBS 모델링
    /WEB-INF/doc/스터디그룹' dic 생성 -> ER Diagram file 생성
    설정 : MySQL(MariaDB) / JDBC Driver: org.gjt.mm.mysql.Driver / Database URI: jdbc:mysql://localhost:3306/resort
    TABLE(stugrp) 생성 : Logical, Physical Modeling 
    Column 생성 : DataTpye 참고, EX) MYSQL은 Varchar(10)이면 모든 문자를 10자 저장 가능 
 4) SQL 생성 : Export -> DDL -> Constraints Generate 지정 해제 -> stugrp_c.sql
    SEQUENCE 테이블 추가
 5) VO제작 및 MyBATIS 설정
     - VO : stugrp_c.sql에서 제작한 컬럼 값들 기반 private 멤벼변수 지정 + Getter, Setter 선언
       -> 패키지명 : dev.mvc.stugrp / 클래스명 : StugrpVO.java
     - MyBATIS 설정 : @PropertySource와 @MapperScan 설정
       -> 패키지명 : dev.mvc.study_maria / 클래스명 : DatabaseConfiguration .java
 6) 접속 설정
  server.bat 실행 -> root.bat 실행
  MariaDB [(none)]> use study  <- 자신의 DB 사용
  Database changed
  MariaDB [study]>
~~~

~~~
- 0405 : ERD export 후 SQL 작성
 1) MariaDB Client HeidiSQL 다운
 2) HeidiSQL에서 stugrp_c.sql 작업
-- MYSQL : FROM이 필요 없음, sysdate(Oracle)<->NOW()(MYSQL), SEQUENCE TABLE 필요 없음.
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

-- ★★★Create, 등록 : CREATE + INSERT
INSERT INTO stugrp(stugrpname, stugrpex, seqno, rdate)
VALUES('토익 스터디', '토익스터디 그룹입니다 환영합니다!', 1, NOW());

INSERT INTO stugrp(stugrpname, stugrpex, seqno, rdate)
VALUES('자격증 스터디', '자격증스터디 그룹입니다 환영합니다!', 2, NOW());

INSERT INTO stugrp(stugrpname, stugrpex, seqno, rdate)
VALUES('정보처리기사 스터디', '정보처리기사스터디 그룹입니다 환영합니다!', 3, NOW());

-- ★★★Read, 조회 : 한 건의 레코드를 읽는 것
SELECT stugrpno, stugrpname, stugrpex, seqno, rdate FROM stugrp
WHERE stugrpno = 1;

-- ★★★List, 목록
SELECT stugrpno, stugrpname, stugrpex, seqno, rdate
FROM stugrp
ORDER BY stugrpno ASC;

-- ★★★Read, 조회
SELECT stugrpno, stugrpname, stugrpex, seqno, rdate
FROM stugrp
WHERE stugrpno = 1;

-- ★★★Update, 수정, PK는 일반적으로 update 불가능, 컬럼의 특징을 파악후 변경여부 결정,
-- ★★★WHERE 절에 PK 컬럼 명시
UPDATE stugrp
SET stugrpname='새로운 스터디', stugrpname='새로운 스터디 그룹입니다' seqno=2
WHERE stugrpno=1;

-- ★★★Delete, 삭제
DELETE FROM stugrp
WHERE stugrpno=3;

-- ★★★SELECT * FROM stugrp;
SELECT * FROM stugrp; 
~~~

~~~
- 0406~7~8 : CRUD SQL 작성 및 View.jsp 작업
[15][Stugrp] Stugrp 등록 기능 제작(INSERT~ )
  ▶ create.jsp(그룹 등록) / create_msg.jsp(그룹 등록 확인 메시지 창)
[16][Stugrp] Stugrp 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), Bootstrap 적용, 등록 기능의 결합
  ▶ list.jsp(등록화면 윗쪽 + 등록된 그룹목록)

[17][Stugrp] Stugrp 조회, 수정폼 기능의 제작, JSP 수정과 목록의 결합  : 조회폼
  ▶ read_update.jsp(목록 확인창에서 등록된 그룹 조회, 수정준비 페이지)
[18][Stugrp] Stugrp 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~) : 수정처리
  ▶ update_msg.jsp(저장 버튼클릭시 수정처리 완료 메시지 페이지)

[19][Stugrp] Stugrp 삭제 폼 기능의 제작, JSP 삭제와 목록의 결합  : 삭제폼
  ▶ read_delete.jsp(삭제 글리크톤 클릭 시 출력되는 삭제 준비 폼)
[20][Stugrp] Stugrp 삭제 처리 기능의 제작(DELETE FROM처~ WHERE ~)  : 삭제처리
  ▶ delete_msg.jsp(삭제 버튼클릭시 삭제처리 완료 메시지 페이지)

[21][Stugrp] Stugrp 출력 순서의 변경 제작(UPDATE ~ SET ~ WHERE ~)
  ▶ update_seqno_up_msg.jsp update_seqno_down_msg.jsp 
     (우선 순위 상.하향 글리피콘 클릭시 동작, 메시지 페이지) -> 결과는 list.jsp에 적용

[22][Stugrp] 출력 순서별 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), redirect의 적용
   ▶ StugrpCont.java list() method update, redirect 적용

[23][Stugrp] Stugrp 출력 모드의 변경(UPDATE ~ SET ~ WHERE ~ ) : 출력모드(Y,N 이 없기에 샤사용No)
 
- stugrp_c.sql 기반 작업 절차
핵심 : CRUD Matrix
- stugrp(Studygroup) Table 기반 작업 명세
▶ create.jsp / create_msg.jsp : ★★★Create, 등록 : CREATE + INSERT
▶ list.jsp : ★★★List, 다중목록(ORDER BY)
▶ read_update.jsp : ★★★Read, 단일조회(WHERE)
  ▶ update_msg.jsp : ★★★Update, 수정
▶ read_delete.jsp : ★★★Read, 단일조회(WHERE)
  ▶ delete_msg.jsp : ★★★List, 다중목록(ORDER BY)
---
 ▶ update_seqno_up or down_msg.jsp : ★★★Update, 수정
 ▶ StugrpCont.java list() method update, redirect  : ★★★List, 다중목록(ORDER BY)

★ Spring Boot Process
 - MyBATIS ▷ /src/main/resources/mybatis/stugrp.xml : 데이터베이스 연결
 - DAO interface ▷ dev.mvc.stugrp.StugrpDAOInter.java : DBMS SQL 실행 객체
 - DAO class Spring : Spring FrameWork에 의해 자동 구현
 - Process interface ▷ dev.mvc.stugrp.StugrpProcInter.java : DBMS 접속이 아닌 알고리즘 및 제어문 선언
 - Process class ▷ dev.mvc.stugrp.StugrpProc.java : DI 구현, beans의 자동 생성
 - Controller class ▷ dev.mvc.stugrp.StugrpCont.java : 실행 주소의 조합

 - View: JSP1 ▷ /webapp/WEB-INF/views/
     index.jsp : content_body 부분, jsp include를 사용한 top.jsp ,bottom.jsp 호출

 - View: JSP2 ▷ /webapp/WEB-INF/views/menu/
    bottom.jsp, top.jsp : jsp include 활용, Content_header와 body 부분

 - View: JSP3 ▷ /webapp/WEB-INF/views/stugrp/ 
     create.jsp : 등록 화면
     create_msg.jsp : 등록 처리 메시지 화면
     list.jsp : 등록화면과 등록된 그룹목록의 결합
     read_update.jsp : 목록 확인창에서 등록된 그룹 조회, 수정준비 페이지
     update_msg.jsp : 저장 버튼클릭시 수정처리 완료 메시지 페이지
     read_delete.jsp : 삭제 글리크톤 클릭 시 출력되는 삭제 준비 폼
     delete_msg.jsp : 삭제 버튼클릭시 삭제처리 완료 메시지 페이지
     update_seqno_up_msg.jsp update_seqno_down_msg.jsp : 우선순위 상.하향 글리피콘 처리 메시지
~~~