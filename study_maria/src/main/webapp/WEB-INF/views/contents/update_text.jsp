<%--
create.jsp 기반 update_jsp(내용 수정)
 --%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="name" value="${contentsVO.name }" />
<c:set var="intro" value="${contentsVO.intro }" />
<c:set var="certi" value="${contentsVO.certi }" />
<c:set var="id" value="${contentsVO.id }" />
<c:set var="contentsno" value="${contentsVO.contentsno }" /> 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>DoStudy Home</title>
 
<link href="/css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    
<script type="text/javascript">
  $(function(){
 
  });
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
<DIV class='title_line'>
  <A href="../stugrp/list.do" class='title_link'>스터디 그룹</A> > 
  <A href="../stu/list_by_stugrpno.do?stugrpno=${stugrpVO.stugrpno }" class='title_link'>${stugrpVO.stugrpname }</A> >
  <A href="./list_by_stuno_search_paging.do?stuno=${stuVO.stuno }" class='title_link'>${stuVO.name }</A> >
  ${name} 수정
</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <A href="./create.do?stuno=${stuVO.stuno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href="./list_by_stuno_search_paging.do?stuno=${stuVO.stuno }">기본 목록형</A>    
    <span class='menu_divide' >│</span>
    <A href="./list_by_stuno_grid.do?stuno=${stuVO.stuno }">갤러리형</A>
  </ASIDE> 
  
    <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_stuno_search_paging.do'>
      <input type='hidden' name='stuno' value='${stuVO.stuno }'>
      <input type='hidden' name='now_page' value='${param.now_page }'> <!-- POST 값 -->
      
      <c:choose>
        <c:when test="${param.intro != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='intro' id='intro' value='${param.intro }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
          <input type='text' name='intro' id='intro' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.intro.length() > 0 }">
        <button type='button' 
                     onclick="location.href='./list_by_stuno_search_paging.do?stuno=${stuVO.stuno}&intro='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>
  <DIV class='menu_line'></DIV>
  
  <FORM name='frm' method='POST' action='./update_text.do' class="form-horizontal"
              enctype="multipart/form-data">
    <input type='hidden' name='contentsno' value='${contentsno }'>
    <input type="hidden" name="stuno" value="${stuVO.stuno }">
    <input type='hidden' name='now_page' value='${param.now_page }'>
    <input type="hidden" name="adminno" value="1"> <%-- 관리자 개발후 변경 필요 --%>
    
    <div class="form-group">
       <label class="control-label col-md-2">이름</label>
       <div class="col-md-10">
         <input type='text' name='name' value='' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 20%;'>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">자기 소개</label>
       <div class="col-md-10">
         <textarea name='intro' required="required" class="form-control" rows="12" style='width: 100%;'>해당 스터디 지원합니다.</textarea>
       </div>
    </div>
    <div class="form-group">
       <label class="control-label col-md-2">자격증</label>
       <div class="col-md-10">
         <input type='text' name='certi' value='토익, 정보처리기사' required="required" 
                    class="form-control" style='width: 60%;'>
       </div>
    </div>   
    <div class="form-group">
       <label class="control-label col-md-2">카카오톡 ID</label>
       <div class="col-md-10">
         <input type='text' name='id' value='tonny96' required="required" 
                    class="form-control" style='width: 20%;'>
       </div>
    </div>      
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">저장</button>
      <button type="button" onclick="history.back();" class="btn btn-primary">취소</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>