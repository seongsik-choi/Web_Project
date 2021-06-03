<%-- 
7. View: JSP
1)목록 화면 ▷ /webapp/WEB-INF/views/stu/list_all.jsp 
-> /stugrp/list.jsp 기반 수정
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
    <col style='width: 10%;'/>  <!-- /는 close 태그 == body 없이 태그의 속성만 사용 -->
    <col style='width: 10%;'/> <!--  그룹 번호 -->
    <col style='width: 10%;'/>  <!--  스터디 제목 -->
    <col style='width: 30%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>    
    <col style='width: 10%;'/>
  </colgroup>
  
  <thead>  
  <TR>
    <!-- erd 보고 값 지정 -->
    <TH class="th_bs">스터디 번호</TH>
    <TH class="th_bs">스터디 그룹 번호</TH>
    <TH class="th_bs">스터디 제목</TH>
    <TH class="th_bs">스터디 설명</TH>
    <TH class="th_bs">스터디 지역</TH>
    <TH class="th_bs">등록일</TH>
    <TH class="th_bs">관련 자료수</TH>
    <TH class="th_bs">기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="stuVO" items="${list}">
    <c:set var="stuno" value="${stuVO.stuno }" />
    <c:set var="stugrpno" value="${stuVO.stugrpno }" />
    <TR>
      <TD class="td_bs">${stuVO.stuno }</TD>
      <TD class="td_bs">${stuVO.stugrpno }</TD>   <%-- FK 설정 --%>
      <TD class="td_bs_left" style='font-weight: bold'>${stuVO.name }</TD>
      <TD class="td_bs_left">${stuVO.stuex }</TD>
      <TD class="td_bs">${stuVO.stulo }</TD>
      <TD class="td_bs">${stuVO.rdate.substring(0, 10) }</TD>
      <TD class="td_bs">${stuVO.cnt }</TD>
        
      <TD class="td_bs"> <!-- 기타  글리피콘-->
         <A href="./read_update.do?stuno=${stuno }&stugrpno=${stuVO.stugrpno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?stuno=${stuno }&stugrpno=${stuVO.stugrpno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
      </TD>   
    </TR> <!-- 행 종료 -->  
  </c:forEach> 
  </tbody>
   
  </TABLE><!-- table end -->

</DIV><!-- content body end -->

<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>