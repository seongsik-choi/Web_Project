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
**5) ERD**
~~~

~~~