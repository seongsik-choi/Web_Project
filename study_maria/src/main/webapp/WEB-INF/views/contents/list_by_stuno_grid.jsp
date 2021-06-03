<%-- 
7. View: JSP
1)목록 화면
▷ /webapp/WEB-INF/views/stu/list_all.jsp기반
/contents/list_by_stuno 생성 기반
grid 생성
--%>
<%@page import="dev.mvc.contents.ContentsVO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>DoStudy Home</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
</script>
 
</head> 
<body>

<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>
  <A href="../stugrp/list.do" class='title_link'>스터디 그룹 전체</A> > 
  <A href="../stu/list_by_stugrpno.do?stugrpno=${stugrpVO.stugrpno }" class='title_link'>${stugrpVO.stugrpname }</A> > 
  <A href="./list_by_stuno.do?stuno=${stuVO.stuno }" class='title_link'>${stuVO.name }</A> 
  </DIV>
  
<DIV class='content_body'>
  <ASIDE class="aside_right"> <!-- 서브 메뉴 -->
    <A href="./create.do?stuno=${stuVO.stuno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>    <%-- 앵커 태그를 사용해 javaSript 사용  --%>
    <span class='menu_divide' >│</span>
    <A href="./list_by_stuno_search_paging.do?stuno=${stuVO.stuno }">기본 목록형</A>
  </ASIDE> 

 <DIV class='menu_line'></DIV>
  <div style='width: 100%;'> <%-- 갤러리 Layout 시작 --%>
    <c:forEach var="contentsVO" items="${list }" varStatus="status"> <%-- Controller의 addobject--%>
      <c:set var="contentsno" value="${contentsVO.contentsno }" />

      <c:set var="name" value="${contentsVO.name }" />
      <c:set var="intro" value="${contentsVO.intro }" />  
      <c:set var="certi" value="${contentsVO.certi }" />
      <c:set var="id" value="${contentsVO.id }" />

      <c:set var="thumb1" value="${contentsVO.thumb1 }" />
      <c:set var="file1" value="${contentsVO.file1 }" />
      <c:set var="size1" value="${contentsVO.size1 }" />
      
      <%--하나의 행에 이미지를 4개씩 출력후 행 변경 --%>
      <c:if test="${status.index % 4 == 0 && status.index != 0 }"> 
        <HR class='menu_line'>
      </c:if>
      
      <!-- 하나의 이미지, 24 * 4 = 96% -->
      <DIV style='width: 24%; 
              float: left; 
              margin: 0.5%; padding: 0.5%; background-color: #EEEFFF; text-align: center;' > <!-- 반응형 웹 표현, 가변적인 위치 -->
        <c:choose>
          <c:when test="${size1 > 0}"> <!-- 파일이 존재하면 -->
            <c:choose> 
              <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}"> <!-- 이미지 인경우 -->
                <a href="./read.do?contentsno=${contentsno}">               
                  <IMG src="./storage/${thumb1 }" style='width: 100%; height: 150px;'> <!-- width는 %, 높이는 px로 고정 -->
                </a>
                
              <DIV class='menu_line2'><strong>${name}</strong></DIV>
              <strong>ID : ${id}</strong>
                 
              </c:when>
              <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                <DIV style='width: 100%; height: 150px; display: table; border: solid 1px #CCCCCC;'>
                  <DIV style='display: table-cell; vertical-align: middle; text-align: center;'> <!-- 수직 가운데 정렬 -->
                    <a href="./read.do?contentsno=${contentsno}">${file1}</a><br>
                  </DIV>
                </DIV>
                ${name} (${cnt})              
              </c:otherwise>
            </c:choose>
          </c:when>
          <c:otherwise> <%-- 파일이 없는 경우 기본 이미지 출력 --%>
            <a href="./read.do?contentsno=${contentsno}">
              <img src='/contents/images/none2.png' style='width: 100%; height: 150px;'>
            </a><br>
            이미지를 등록해주세요.
          </c:otherwise>
        </c:choose>         
      </DIV>  
    </c:forEach>
    <!-- 갤러리 Layout 종료 -->
    <br><br>
  </div>        
 
</DIV> <!--content body end -->

<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>