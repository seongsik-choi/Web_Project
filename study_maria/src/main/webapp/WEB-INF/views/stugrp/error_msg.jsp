<%-- 
- 등록 처리 메시지 화면
▷ /webapp/WEB-INF/views/stugrp/create_msg.jsp 
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

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

</head> 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />

<DIV class='title_line'>카테고리 그룹 ▶ 생성된 그룹</DIV>

<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
      <%-- 등록 실패 --%>
        <c:when test="${code  == 'create'}">  <!-- if 문 -->
          <LI class='li_none'>
            <span class="span_success">새로운 스터디 그룹 [${stugrpVO.stugrpname }]을 실패했습니다.</span>
          </LI>
        </c:when>
        
        <%-- 수정 실패 --%>
        <c:when test="${code  == 'update'}">  <!-- if 문 -->
          <LI class='li_none'>
           <span class="span_fail">스터디 그룹 수정에 실패했습니다.</span>
          </LI>
        </c:when>
        
        <%-- 삭제 실패 --%>
        <c:when test="${code  == 'delete'}">  <!-- if 문 -->
          <LI class='li_none'>
             <span class="span_fail">스터디 그룹 삭제에 실패했습니다.</span>
          </LI>
        </c:when>            
        
        <%-- 등록, 수정, 식제 에러가 아닌경우 --%>
        <c:otherwise>   <!-- else -->
          <LI class='li_none_left'>
            <span class="span_fail">알수 없는 에러로 작업에 실패했습니다.</span>
          </LI>
          <LI class='li_none_left'>
            <span class="span_fail">다시 시도해주세요.</span>
          </LI>
        </c:otherwise>
      </c:choose>
      
      <LI class='li_none'>
        <br>
        <button type='button' onclick="history.back()" class="btn btn-primary">다시 시도</button>
        <button type='button' onclick="location.href='./list.do'" class="btn btn-default">목록</button>
      </LI>
    </UL>
  </fieldset>

</DIV>

<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>

</html>
