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
  - Framework : Spring 4.6.0, Mybatis 3.4.1, BootStrap 3.4.1  
  - Technology : JDBC, HTML 5.0, CSS3, JSP  
  - Tools : STS4, Amateras UML, Amateras ERD, SQLdeveloper  
---

