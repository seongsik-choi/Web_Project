<%-- 
7. View: JSP
1)목록 화면
▷ /webapp/WEB-INF/views/stu/list_all.jsp기반
/contents/list_by_stuno 생성의 기반한 검색기능이 포함된 view

--%>
<%@page import="dev.mvc.contents.ContentsVO"%>
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
  <A href="../stugrp/list.do" class='title_link'>스터디 그룹 전체</A> > 
  <A href="../stu/list_by_stugrpno.do?stugrpno=${stugrpVO.stugrpno }" class='title_link'>${stugrpVO.stugrpname }</A> > 
  <A href="./list_by_stuno.do?stuno=${stuVO.stuno }" class='title_link'>${stuVO.name }</A> 
  </DIV>
  
<DIV class='content_body'>
  <ASIDE class="aside_right"> <!-- 서브 메뉴 -->
    <A href="./create.do?stuno=${stuVO.stuno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>    <%-- 앵커 태그를 사용해 javaSript 사용  --%>
    <span class='menu_divide' >│</span>
    <A href="./list_by_stuno_grid.do?stuno=${stuVO.stuno }">갤러리형</A>
  </ASIDE> 

<DIV style="text-align: right; clear: both;" >  
    <form name='frm' id='frm' method='get' action='./list_by_stuno_search_paging.do'>
      <input type='hidden' name='stuno' value='${stuVO.stuno }'>
      <c:choose>
        <c:when test="${param.intro != '' }"> <%-- 공백이 아니면, 검색하는 경우 --%>
          <input type='text' name='intro' id='intro' value='${param.intro }'  
                     style='width: 20%;' autofocus="autofocus"><%--value에 값 출력  --%>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우, value는 비어있어야함--%>
          <input type='text' name='intro' id='intro' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.intro.length() > 0 }">  <%-- 검색 취소 부분 --%>
        <button type='button' 
                     onclick="location.href='./list_by_stuno_search_paging.do?stuno=${stuVO.stuno}&intro='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>

 <DIV class='menu_line'></DIV>
    
  <table class="table table-striped" style='width: 100%;'>
  <colgroup>
    <col style="width: 10%;"></col>
    <col style="width: 10%;"></col>
    <col style="width: 40%;"></col>
    <col style="width: 15%;"></col>
    <col style="width: 15%;"></col>
    <col style="width: 10%;"></col>
  </colgroup>
  
  <%-- table 컬럼 --%>
<thead>
    <tr>
      <th style='text-align: center;'>파일</th>
      <th style='text-align: center;'>이름</th>
      <th style='text-align: center;'>자기 소개</th>
      <th style='text-align: center;'>자격증</th>
      <th style='text-align: center;'>카카오톡 ID</th>
      <th style='text-align: center;'>기타</th>
    </tr>
  </thead> 
    
  <%-- table 내용 --%>
  <tbody>
    <c:forEach var="contentsVO" items="${list }">
      <c:set var="contentsno" value="${contentsVO.contentsno }" />
      <c:set var="thumb1" value="${contentsVO.thumb1 }" />
      
      <tr> <%-- 레코드 들 (등록일 부터~ 기타까지) --%>
        
        <td style='vertical-align: middle; text-align: center;'>
          
          <%-- 이미지(파일) 출력 고정 소스  --%>
          <c:choose>
            <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
              <IMG src="/contents/storage/${thumb1 }" style="width: 120px; height: 80px;"> 
            </c:when>
            <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
              ${contentsVO.file1}
            </c:otherwise>
          </c:choose>  <%-- 이미지 출력 고정 소스 종료 --%>
        </td>  
       
        <td style='vertical-align: middle; text-align: center;'>
          <%-- ContentProc에서 content 컬럼은 200자 이상 시...으로 설정  --%>
          <%-- String tag 사용 강조 --%>
          <a href="./read.do?contentsno=${contentsno}"> <strong>${contentsVO.name}</strong></a> 
        </td>   
        <td style='vertical-align: middle; text-align: center;'><strong>${contentsVO.intro}</strong></td>
        <td style='vertical-align: middle; text-align: center;'>${contentsVO.certi}</td>
        
        
        <td style='vertical-align: middle; text-align: center;'>${contentsVO.id}</td>
        <td style='vertical-align: middle; text-align: center;'>수정/삭제<BR>개인정보</td>
      </tr>
    </c:forEach>
    
  </tbody>
 </table>
</DIV>

<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>