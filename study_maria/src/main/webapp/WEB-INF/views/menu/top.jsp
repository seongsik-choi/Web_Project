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
    <%-- <button class="btn btn-danger navbar-btn">GitHub</button> --%>
    <%-- <a href="https://www.facebook.com/" target='_blank' style="color:#000000; font-size: 18px;">
    <span class="glyphicon glyphicon-user"></span> FaceBook </a> --%>
   </DIV>  <!-- top_menu_label end -->
 </DIV> <!-- top_img end-->

  <nav class="navbar navbar-default" style='background-color: #FFFFFF;'> <!--  navbar-fixed-top -->
  <div class="container">
    <div class="navbar-header">
      <!-- 사이즈 축소시 햄버거가 속할 태그 내부에 아래 코드 생성 -->
      <!-- data-target을 'collapse navbar-collapse' 클래스의 id로 맞춰야 -->
      <!-- 숨긴 데이터들이 햄버거 안으로 들어가게 -->
      <button type="button" class="navbar-toggle collapsed"
      data-toggle="collapse" data-target="#bs-nav-demo" aria-expanded="false">
          <!-- 햄버거 내부에 들어갈 줄들 -->
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
      </button>
              
      <a href="http://localhost:9091" class="navbar-brand" style='font-size: 23px;
       color: #00000;'><span class="glyphicon glyphicon-home" style="color:#000000;">
       </span> DoStudy</a>
    </div><!-- navbar-header end -->
    
  <div class="collapse navbar-collapse" id="bs-nav-demo"> <!-- 햄버거 메뉴, 안쪽 기술된 자료들 숨김 -->
  <ul class="nav navbar-nav"> <!-- 네비바 구성 요소 -->
    <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown"
      role="button" aria-haspopup="true" aria-expanded="false"> 
      <span class="glyphicon glyphicon-pushpin" style="color:#000000;"></span>
      StudyGroup 등록<span class="caret"></span>
      </a>
      <ul class="dropdown-menu">
        
        <li><a href="/stugrp/list.do">
          <span class="glyphicon glyphicon-comment" style="color:#000000;"></span> 스터디 그룹 목록</a></li>
        <li role="separator" class="divider"></li>
        <li><a href="/stu/list_all_join.do">
          <span class="glyphicon glyphicon-pushpin" style="color:#000000;"></span> JOIN</a></li>
        <li role="separator" class="divider"></li>
        <li><a href="/contents/create.do?adminno=1&stuno=1&stugrpno=1">
          <span class="glyphicon glyphicon-pushpin" style="color:#000000;"></span> 컨텐츠 등록</a></li>  
      </ul>
     </li> <!-- dropdown end -->
     
     <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown"
      role="button" aria-haspopup="true" aria-expanded="false"> 
      <span class="glyphicon glyphicon-pushpin" style="color:#000000;"></span>
        Study 등록<span class="caret"></span>
      </a>
      <ul class="dropdown-menu">
        <li><a href='/stu/create.do?stugrpno=1' style="color:#000000; font-size: 16px;">
          <span class="glyphicon glyphicon-open" style="color:#000000;"></span> 스터디  등록 </a></li>
        <li role="separator" class="divider"></li>
        <li><a href="/stu/list_all.do">
          <span class="glyphicon glyphicon-comment" style="color:#000000;"></span> 스터디 목록</a></li>
      </ul>
     </li> <!-- dropdown end --> 
     
     <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown"
      role="button" aria-haspopup="true" aria-expanded="false"> 
      <span class="glyphicon glyphicon-pushpin" style="color:#000000;"></span>
        즐겨찾기 그룹 등록<span class="caret"></span>
      </a>
      <ul class="dropdown-menu">
        <li><a href='/favgrp/create.do' style="color:#000000; font-size: 16px;">
          <span class="glyphicon glyphicon-open" style="color:#000000;"></span> 즐겨찾기 그룹 등록 </a></li>
        <li role="separator" class="divider"></li>
        <li><a href="/favgrp/list.do">
          <span class="glyphicon glyphicon-comment" style="color:#000000;"></span> 즐겨찾기 그룹 목록</a></li>
         <li role="separator" class="divider"></li> 
         <li><a href="/fav/list_all_join.do">
          <span class="glyphicon glyphicon-comment" style="color:#000000;"></span> JOIN</a></li>  
      </ul>
     </li> <!-- dropdown end -->      

     <li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown"
      role="button" aria-haspopup="true" aria-expanded="false"> 
      <span class="glyphicon glyphicon-pushpin" style="color:#000000;"></span>
        즐겨찾기 등록<span class="caret"></span>
      </a>
      <ul class="dropdown-menu">
        <li><a href='/fav/create.do?favgrpno=1' style="color:#000000; font-size: 16px;">
          <span class="glyphicon glyphicon-open" style="color:#000000;"></span> 즐겨찾기 등록 </a></li>
        <li role="separator" class="divider"></li>
        <li><a href="/fav/list_all.do">
          <span class="glyphicon glyphicon-comment" style="color:#000000;"></span> 즐겨찾기 목록</a></li>
      </ul>
     </li> <!-- dropdown end -->         
   </ul> <!-- nav navbar-nav end -->
   
   <ul class="nav navbar-nav navbar-right">
      <li><a href="/member/list.do">
       <span class="glyphicon glyphicon-user"></span>목록(회원)</a></li>   

      <c:choose>
        <c:when test="${sessionScope.id == null}">
         <li><A href='/member/login.do' ><span class='glyphicon glyphicon-user'></span>
         Login</A></li>
        </c:when>
        <c:otherwise>
         <li> <A href='/member/logout.do' ><span class='glyphicon glyphicon-user'> </span>
         <span style='color: #FF0000; font-weight: bold;'>${sessionScope.id }</span> Logout</A></li>
        </c:otherwise>
      </c:choose>   
      
   </ul>
  </div> <!-- collapse navbar-collapse (햄버거 감싸는 div 태그) -->
  </div> <!-- container -->
 </nav>
  
  <%-- 내용 --%> 
  <DIV class='content'>
