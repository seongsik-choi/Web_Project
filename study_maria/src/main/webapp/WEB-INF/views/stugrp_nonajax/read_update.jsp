<%-- 
0407
7. View: JSP : 조회
▷ /webapp/WEB-INF/views/stugrp/read_update.jsp  
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
 
<DIV class='title_line'>스터디 그룹 > ${stugrpVO.stugrpname } 조회(수정)</DIV>

<DIV class='content_body'>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='stugrpno' id='stugrpno' value='${stugrpVO.stugrpno }'>
        
      <label>스터디 그룹 이름</label>
      <input type='text' name='stugrpname' value="${stugrpVO.stugrpname }" required="required" 
                 autofocus="autofocus" style='width: 30%;'><BR>
      
      <label>스터디 그룹 설명</label>
      <input type='text' name='stugrpex' value="${stugrpVO.stugrpex }" required="required" 
                 autofocus="autofocus" style='width: 60%;'><BR>
 
      <label>순서</label>
      <input type='number' name='seqno' value="${stugrpVO.seqno }" required="required" 
                min='1' max='1000' step='1' style='width: 5%;'><BR>
  
       
      <button type="submit" id='submit'>저장</button>
      <button type="button" onclick="location.href='./list.do'">취소</button>
    </FORM>
  </DIV>
   
   <TABLE class='table table-hover'>
    <colgroup>
      <col style='width: 5%;'/>
      <col style='width: 15%;'/>
      <col style='width: 40%;'/>
      <col style='width: 10%;'/>    
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">순서</TH>
      <TH class="th_bs">스터디 그룹 이름</TH>
      <TH class="th_bs">스터디 그룹 설명</TH>
      <TH class="th_bs">등록 날짜</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="stugrpVO" items="${list}">
      <c:set var="stugrpno" value="${stugrpVO.stugrpno }" />
      <TR>
        <TD class="td_bs">${stugrpVO.seqno }</TD>
        <TD class="td_bs">${stugrpVO.stugrpname }</TD>
        <TD class="td_bs">${stugrpVO.stugrpex }</TD>
        <TD class="td_bs">${stugrpVO.rdate.substring(0, 10) }</TD>
        <TD class="td_bs">
          <A href="./read_update.do?stugrpno=${stugrpno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?stugrpno=${stugrpno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
          <A href="./update_seqno_up.do?stugrpno=${stugrpno }" title="우선순위 상향"><span class="glyphicon glyphicon-arrow-up"></span></A>
          <A href="./update_seqno_down.do?stugrpno=${stugrpno }" title="우선순위 하향"><span class="glyphicon glyphicon-arrow-down"></span></A>         
         </TD>   
  
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>