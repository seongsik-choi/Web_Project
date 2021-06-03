<%-- 
View: JSP, 등록과 목록의 결합
- <TABLE><TH><TD>는 Bootstrap에 기본 속성이 설정되어 있음
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Dostudy Home</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
 
</script>
 
</head> 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>등록된 즐겨찾기 그룹 목록</DIV>

<DIV class='content_body'>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      
      <!-- <label>즐겨찾기 그룹 번호</label>
      <input type='text' name='favgrpno' value='' required="required" style='width: 40%;'
                 placeholder="ex) 즐겨찾기 이름이 요리일 경우 '요리'만 명시" autofocus="autofocus"><BR> -->
                 
      <label>즐겨찾기 그룹 이름</label>
      <input type='text' name='favgrpname' value='' required="required" style='width: 30%;'
                placeholder="ex) OO도/OO시"><BR>          
  
      <label>즐겨찾기 그룹 설명</label>
      <input type='text' name='favgrpex' value='' required="required" style='width: 60%;'
                placeholder="ex) OO/OO 지역 스터디 카페를 홍보해주세요."><BR>    

      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
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
        <TD class="td_bs">
        <A href="../fav/list_by_favgrpno.do?favgrpno=${favgrpno }">${favgrpVO.favgrpname  }</A></TD>
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