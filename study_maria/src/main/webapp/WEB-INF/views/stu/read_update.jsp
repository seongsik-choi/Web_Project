<%-- 
07. View: JSP
1)목록 화면 ▷ /webapp/WEB-INF/views/stu/list_by_stugrpno.jsp 
 -> 수정 하여 read_update(삭제전 READ)
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
 
<DIV class='title_line'>
  <A href="../stugrp/list.do" class='title_link'> 카테고리 그룹</A> >
   <A href="./list_by_stugrpno.do?stugrpno=${param.stugrpno }" class='title_link'>${stugrpVO.stugrpname }</A> >
    (${stuVO.name }) 수정</DIV>
<DIV class='content_body'>

  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./update.do'>
      
      <!-- PK 키 기본값으로 받아와야지 가능 -->
      <input type='hidden' name='stuno' value='${param.stuno }' >
    
      <label>스터디 그룹 번호 : </label>
       <input type='number' name='stugrpno' value='${param.stugrpno }' required="required" 
                  min="1" max="100" step="1" autofocus="autofocus"><BR> 
    
      <label>스터디 제목</label>
      <input type='text' name='name' value='${stuVO.name }' required="required" style='width: 50%;'
                  autofocus="autofocus"><BR>
                 
      <label>스터디 설명</label>
      <input type='text' name='stuex' value='${stuVO.stuex }' required="required" style='width: 50%;'
                  ><BR>         
  
      <label>스터디 지역</label>
      <input type='text' name='stulo' value='${stuVO.stulo }' required="required" style='width: 50%;'
                  ><BR>         
                  
      <label>관련 자료수</label>
      <input type='text' name='cnt' value='${stuVO.cnt }' required="required" 
                  min="0" max="10000000" step="1"><BR>                   
  
      <button type="submit" id='submit'>수정</button>
      <button type="button" onclick="location.href='./list_by_stugrpno.do?stugrpno=${stuVO.stugrpno} '">취소</button> <!-- JAVAScript로 이전페이지로 -->
    </FORM>
  </DIV>

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
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>