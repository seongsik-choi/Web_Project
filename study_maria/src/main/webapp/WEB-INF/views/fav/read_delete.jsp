<%-- 
07. View: JSP
1)목록 화면 ▷ /webapp/WEB-INF/views/fav/list_by_favgrpno.jsp 
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
  <A href="../favgrp/list.do" class='title_link'> 즐겨찾기 그룹</A> >
   <A href="./list_by_favgrpno.do?favgrpno=${param.favgrpno }" class='title_link'>${favgrpVO.favgrpname }</A> >
    (${favVO.favname }) 수정</DIV>
<DIV class='content_body'>

  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">스터디를 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>

      <!-- 0414 PKKey 받아와야지 가능 -->
      <input type="hidden" name="favno" value='${favVO.favno }'>
      <input type='hidden' name='favgrpno' id='favgrpno' value="${param.favgrpno }">
      
      <label>즐겨찾기 그룹 번호 : </label>${favVO.favgrpno } <BR>
      <label>즐겨찾기 제목 : </label>${favVO.favname } <BR>
      <label>즐겨찾기 설명 : </label>${favVO.favex } <BR>
      <label>즐겨찾기 링크 : </label>${favVO.favli } <BR>

      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./list_by_favgrpno.do?favgrpno=${favVO.favgrpno} '">취소</button> <!-- JAVAScript로 이전페이지로 -->
    </FORM>
  </DIV>

<TABLE class='table table-striped'>
    <colgroup>
    <col style='width: 10%;'/>  <!-- /는 close 태그 == body 없이 태그의 속성만 사용 -->
    <col style='width: 10%;'/> <!--  그룹 번호 -->
    <col style='width: 10%;'/>  <!--  즐겨찾기 제목 -->
    <col style='width: 40%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/> 
    <col style='width: 10%;'/>
  </colgroup>
  
  <thead>  
  <TR>
    <!-- erd 보고 값 지정 -->
    <TH class="th_bs">즐겨찾기 번호</TH>
    <TH class="th_bs">즐겨찾기 그룹 번호</TH>
    <TH class="th_bs">즐겨찾기 제목</TH>
    <TH class="th_bs">즐겨찾기 설명</TH>
    <TH class="th_bs">즐겨찾기 링크</TH>
    <TH class="th_bs">등록일</TH>
    <TH class="th_bs">기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="favVO" items="${list}">
    <c:set var="favno" value="${favVO.favno }" />
    <c:set var="favgrpno" value="${favVO.favgrpno }" />
    <TR>
      <TD class="td_bs">${favVO.favno }</TD>
      <TD class="td_bs">${favVO.favgrpno }</TD>   <%-- FK 설정 --%>
      <TD class="td_bs_left" style='font-weight: bold'>${favVO.favname }</TD>
      <TD class="td_bs_left">${favVO.favex }</TD>
      <TD class="td_bs">${favVO.favli }</TD>
      <TD class="td_bs">${favVO.rdate.substring(0, 10) }</TD>
        
      <TD class="td_bs"> <!-- 기타  글리피콘-->
          <A href="./read_update.do?favno=${favno }&favgrpno=${favVO.favgrpno }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="./read_delete.do?favno=${favno }&favgrpno=${favVO.favgrpno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
      </TD>   
    </TR> <!-- 행 종료 -->  
  </c:forEach> 
  </tbody>
   
  </TABLE><!-- table end -->
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>