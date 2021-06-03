<%-- 
7. View: JSP
▷ /webapp/WEB-INF/views/stu/list_all_join.jsp 
-> list_all.jsp 기반 작업
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 
<DIV class='title_line'><A href="../stugrp/list.do" class='title_link'>스터디 그룹</A> > 전체 스터디</DIV>

<DIV class='content_body'>
  <TABLE class='table table-striped'>
    <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>  <!-- /는 close 태그 == body 없이 태그의 속성만 사용 -->
    <col style='width: 10%;'/> <!--  그룹 번호 -->
    
    <col style='width: 15%;'/>
    <col style='width: 20%;'/>
    <col style='width: 10%;'/>
    
    <col style='width: 10%;'/>    
    <col style='width: 5%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  
  <thead>  
  <TR>
    <!-- erd 보고 값 지정 -->
    <TH class="th_bs">스터디 번호(PK)</TH>
    <TH class="th_bs">스터디그룹 번호</TH>
    <TH class="th_bs">스터디그룹 이름</TH>
    
    <TH class="th_bs">스터디 이름</TH>
    <TH class="th_bs">스터디 설명</TH>
    <TH class="th_bs">스터디 지역</TH>
    
    <TH class="th_bs">등록일</TH>
    <TH class="th_bs">자료수</TH>
    <TH class="th_bs">기타</TH>
  </TR>
  </thead>
  
<tbody>
      <c:forEach var="Stugrp_StuVO" items="${list}">
        <c:set var="stuno" value="${Stugrp_StuVO.stuno }" />
        <%-- <c:set var="r_stugrpno" value="${Stugrp_StuVO.r_stugrpno }" /> --%>
        <c:set var="stugrpno" value="${Stugrp_StuVO.stugrpno }" />
        <c:set var="stugrpname" value="${Stugrp_StuVO.stugrpname }" />

        <c:set var="name" value="${Stugrp_StuVO.name }" />
        <c:set var="stuex" value="${Stugrp_StuVO.stuex }" />
        <c:set var="stulo" value="${Stugrp_StuVO.stulo }" />
        
        <c:set var="rdate" value="${Stugrp_StuVO.rdate.substring(0, 10) }" />
        <c:set var="cnt" value="${Stugrp_StuVO.cnt }" />
      
      <TR>
      <TD class="td_bs">${stuno }</TD>
        <TD class="td_bs">${stugrpno }</TD>
        <TD class="td_bs" style='font-weight: bold; color: #FF0000;'>${stugrpname }</TD>

        <TD class="td_bs" style='font-weight: bold;'>${name }</TD>
        <TD class="td_bs">${stuex }</TD>
        <TD class="td_bs">${stulo }</TD>
        
        <TD class="td_bs">${rdate }</TD>
        <TD class="td_bs">${cnt }</TD>        
        <TD class="td_bs">
         <A href="./read_update.do?stuno=${stuno }&stugrpno=${stugrpno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?stuno=${stuno }&stugrpno=${stugrpno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE><!-- table end -->

</DIV><!-- content body end -->

<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>