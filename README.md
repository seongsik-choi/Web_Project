# Web Personal Project : DoStudy

## 다양한 스터디 그룹을 개설하고 참여할 수 있는 Website

**1) Project Subject**
  - MariaDB기반 모델링을 토대로 Spring Boot 기반 동작하는 스터디 그룹 모임 Website를 제작한다.

  **2) Main Function**
  - 테이블은 총 6개로 '스터디 그룹', '스터디', '컨텐츠', '즐겨찾기 그룹', '즐겨찾기', '회원'이 존재한다.
  - '스터디 그룹' 테이블은 대분류로 자격증/요리/공시 등에 대한 그룹 생성 기능을 제공한다.
  - '스터디' 테이블은 중분류로 대분류에 해당하는 개별 스터디에 대한 생성 기능을 제공한다. '스터디 그룹'의 하위테이블로 참조관계를 갖고있다.
  - '컨텐츠' 테이블은 소분류로 등록된 개별 스터디에 자기소개, 이름, 이미지 등을 등록하는 기능을한다. '스터디 '의 하위테이블로 참조관계를 갖고있다.
  - '즐겨찾기 그룹'과 '즐겨찾기' 테이블은 각 지역별 스터디 카페의 홍보 글을 올릴 수 있는 기능을 제공한다. 
  - '회원' 테이블은 회원가입 및 로그인 기능을 제공하며 이름, 아이디, 패스워드, 이메일, 주소, 회원이미지 등의 데이터를 입력할 수있다. 
  - 테이블 간의 참조관계 및 제약조건 설정을 통해 무결성을 유지시켰다.
  - index 화면과 각각의 View는 CDN 방식의 BootStrap과 css를 활용해 UI의 접근성을 상승시켰다.
  - '스터디 그룹'과 '스터디' 등록 및 수정 삭제 시 Spring Controller와 AJAX 통신, JQuery를 사용해 메모리 사용을 절감하였다. 
  - '컨텐츠'와 '회원' 레코드 등록 시 id 및 이메일 등에 대한 유효성 검사를 위해 AJAX 통신과 JQuery가 사용됐다.

 **3) Technology**
  - O/S : Windows 10  
  - Language : JAVA (JDK1.8.0_281)   
  - DBMS : MySQL, MariaDB
  - Web Application Server : boot DEVTOOLS
  - Framework : Spring Boot 2.4.3, Mybatis 3.4.1, BootStrap 3.4.1, JQuery
  - Technology : JDBC, HTML5, CSS, EL, Javascript, JSON, JSP, AJAX  
  - Tools : STS4, Amateras UML, Amateras ERD, SQLdeveloper  
---

**4) ERD**

![image](https://user-images.githubusercontent.com/76051264/120607034-c257d880-c48a-11eb-8b0a-19432cbf49ac.png)  

---

**5) Action**
  - main(index) 

![1](https://user-images.githubusercontent.com/76051264/120608707-7443d480-c48c-11eb-9582-4dd34f713a4e.JPG)

  - 스터디 그룹 페이지  

![2](https://user-images.githubusercontent.com/76051264/120608840-98071a80-c48c-11eb-9199-7b7420e85b94.JPG)

  - 스터디 페이지  

![3](https://user-images.githubusercontent.com/76051264/120608937-afde9e80-c48c-11eb-9ac0-b280a2b88ee4.JPG)

  - 스터디에 해당하는 컨텐츠 등록 페이지 

![6](https://user-images.githubusercontent.com/76051264/120609038-ca187c80-c48c-11eb-9466-1945f53eb524.JPG)

  - 등록된 컨텐츠 페이지  

![4](https://user-images.githubusercontent.com/76051264/120609110-dc92b600-c48c-11eb-8616-4a7c98f2d53b.JPG)


  - 즐겨찾기 그룹과 해당하는 즐겨찾기 페이지  
  
![5](https://user-images.githubusercontent.com/76051264/120609309-03e98300-c48d-11eb-8f3e-bb698676c298.JPG)  
 
 
  - 회원가입 페이지  
  
![8](https://user-images.githubusercontent.com/76051264/120609417-1c599d80-c48d-11eb-8cdc-c19d5586ea42.JPG)

  - 회원 목록 페이지  
  
![7](https://user-images.githubusercontent.com/76051264/120609470-28455f80-c48d-11eb-8132-15ee5afc5719.JPG)
---
