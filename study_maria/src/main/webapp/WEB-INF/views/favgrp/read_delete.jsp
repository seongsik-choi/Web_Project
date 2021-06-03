<%-- 
0407
7. View: JSP : 삭제기능1 
▷ read_delete.jsp
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>DoFavdy Home</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
  
</script>
 
</head> 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>즐겨찾기 그룹 > ${favgrpVO.favgrpname } 삭제</DIV>

<DIV class='content_body'>
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">즐겨찾기 그룹을 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='favgrpno' id='favgrpno' value='${favgrpVO.favgrpno }'>
        
      <label>즐겨찾기 그룹 이름</label>: ${favgrpVO.favgrpname }<BR>
      <label>즐겨찾기 그룹 설명</label>: ${favgrpVO.favgrpex }<BR>

      <button type="submit" id='submit'>삭제</button>
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
      <TH class="th_bs">그룹 번호</TH>
      <TH class="th_bs">즐겨찾기 그룹 이름</TH>
      <TH class="th_bs">즐겨찾기 그룹 설명</TH>
      <TH class="th_bs">그룹 생성일</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="favgrpVO" items="${list}">
      <c:set var="favgrpno" value="${favgrpVO.favgrpno }" />
      <TR>
        <TD class="td_bs">${favgrpVO.favgrpno }</TD>
        <TD class="td_bs">${favgrpVO.favgrpname }</TD>
        <TD class="td_bs">${favgrpVO.favgrpex }</TD>
        <TD class="td_bs">${favgrpVO.rdate.substring(0, 10) }</TD>
        
        <TD class="td_bs">
          <A href="./read_update.do?favgrpno=${favgrpno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?favgrpno=${favgrpno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>     
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV> 

<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>