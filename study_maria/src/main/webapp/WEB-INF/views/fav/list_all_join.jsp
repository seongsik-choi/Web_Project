<%-- 
7. View: JSP
▷ /webapp/WEB-INF/views/fav/list_all_join.jsp 
-> list_all.jsp 기반 작업
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>DoSudy Home</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
</script>
 
</head> 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'><A href="../favgrp/list.do" class='title_link'>즐겨찾기 그룹</A> > 전체 즐겨찾기</DIV>

<DIV class='content_body'>
  <TABLE class='table table-striped'>
    <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>  <!-- /는 close 태그 == body 없이 태그의 속성만 사용 -->
    <col style='width: 10%;'/> <!--  그룹 번호 -->
    
    <col style='width: 15%;'/>
    <col style='width: 20%;'/>
    <col style='width: 10%;'/>
    
    <col style='width: 15%;'/>    
    <col style='width: 10%;'/>
  </colgroup>
  
  <thead>  
  <TR>
    <!-- erd 보고 값 지정 -->
    <TH class="th_bs">즐겨찾기 번호(PK)</TH>
    <TH class="th_bs">즐겨찾기그룹 번호</TH>
    <TH class="th_bs">즐겨찾기그룹 이름(JOIN)</TH>
    
    <TH class="th_bs">즐겨찾기 이름</TH>
    <TH class="th_bs">즐겨찾기 설명</TH>
    <TH class="th_bs">즐겨찾기 링크</TH>
    
    <TH class="th_bs">등록일</TH>
    <TH class="th_bs">기타</TH>
  </TR>
  </thead>
  
<tbody>
      <c:forEach var="Favgrp_FavVO" items="${list}">
        <c:set var="favno" value="${Favgrp_FavVO.favno }" />
        <%-- <c:set var="r_favgrpno" value="${Favgrp_FavVO.r_favgrpno }" /> --%>
        <c:set var="favgrpno" value="${Favgrp_FavVO.favgrpno }" />
        <c:set var="favgrpname" value="${Favgrp_FavVO.favgrpname }" />

        <c:set var="favname" value="${Favgrp_FavVO.favname }" />
        <c:set var="favex" value="${Favgrp_FavVO.favex }" />
        <c:set var="favli" value="${Favgrp_FavVO.favli }" />
      
        <c:set var="rdate" value="${Favgrp_FavVO.rdate.substring(0, 10) }" />
      
      <TR>
      <TD class="td_bs">${favno }</TD>
        <TD class="td_bs">${favgrpno }</TD>
        <TD class="td_bs" style='font-weight: bold; color: #FF0000;'>${favgrpname }</TD>

        <TD class="td_bs" style='font-weight: bold;'>${favname }</TD>
        <TD class="td_bs">${favex }</TD>
        
      <TD class="td_bs">
      <A href="./list_by_favgrpno.do?favgrpno=${favgrpno }">${favli }</A></TD>
      
        <TD class="td_bs">${rdate }</TD>  
        <TD class="td_bs">
           <A href="./read_update.do?favno=${favno }&favgrpno=${favgrpno} " title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?favno=${favno }&favgrpno=${favgrpno} " title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE><!-- table end -->

</DIV><!-- content body end -->

<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>