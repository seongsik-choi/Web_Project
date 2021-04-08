<%-- 
2. 화면 상단 메뉴
- 자주 사용되는 EL 값의 활용: <c:set var="root" value="${pageContext.request.contextPath}" />
                                       ${root}
▷ /webapp/WEB-INF/views/menu/top.jsp
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<DIV class='container_main'> 
  <%-- 화면 상단 메뉴 --%>

 <DIV class='top_img'>
   <DIV class='top_menu_label'>
    <button class="btn btn-danger navbar-btn">GitHub</button>
    <a href="https://www.facebook.com/" target='_blank' style="color:#000000; font-size: 18px;">
    <span class="glyphicon glyphicon-user"></span> FaceBook</a>
   </DIV>  <!-- top_menu_label end -->
 </DIV> <!-- top_img end-->

  <NAV class="navbar navbar-default"> <!-- 네비게이션 링크 집합 --> <!-- navbar-inverse : 어두운색 -->
  <div class="container-fluid">
    <div class="navbar-header">
 
      <a class="navbar-brand" href="http://localhost:9091/"
      style="color:#000000; font-size: 25px; font-weight: bold;">
      <span class="glyphicon glyphicon-home" style="color:#000000;"></span>  DoStudy Home</a> <!--  로고 추가 가능 -->
    </div><!-- navbar-header end  -->
    
   <div class="collapse navbar-collapse" id="myNavbar"> 
    <ul class="nav navbar-nav">
      <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#"
          style="color:#000000; font-size: 20px;">
          <span class="glyphicon glyphicon-save" style="color:#000000;"></span> Group Join 
          <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">TOEIC Speaking </a></li>
          <li><a href="#">SQLD </a></li>
          <li><a href="#">정보처리기사 </a></li>
        </ul>
      </li>
      <li><a href='/stugrp/create.do' style="color:#000000; font-size: 20px;">
      <span class="glyphicon glyphicon-open" style="color:#000000;"></span> Group Open</a></li>
      <li><a href="#" style="color:#000000; font-size: 20px;">
      <span class="glyphicon glyphicon-comment" style="color:#000000;"></span>  Notice</a></li>
    </ul>
    
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#" style="color:#000000; font-size: 18px;">
      <span class="glyphicon glyphicon-user"></span> 회원 가입</a></li>
      <li><a href="#" style="color:#000000; font-size: 18px;">
      <span class="glyphicon glyphicon-hand-right"></span> 로그인</a></li>
    </ul>
    </div> <!-- collapse navbar-collapse end  -->
  </div> <!-- container-fluid end -->
</NAV> <!-- 네비게이션 링크 end -->
  
  <%-- 내용 --%> 
  <DIV class='content'>
