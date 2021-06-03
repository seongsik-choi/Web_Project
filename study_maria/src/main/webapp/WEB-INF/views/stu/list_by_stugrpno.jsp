<%-- 
07. View: JSP
1)목록 화면 ▷ /webapp/WEB-INF/views/stu/list_by_stugrpno.jsp 
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
  <%-- stugrpno가 같은 모든 레코드 삭제 --%>
  function delete_by_stugrpno(stugrpno) {
    var f = $('#frm_delete_by_stugrpno');
    $('#stugrpno', f).val(stugrpno)
    f.submit();
  } 
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'><A href="../stugrp/list.do" class='title_link'>스터디 그룹</A> > ${stugrpVO.stugrpname }</DIV>

<DIV class='content_body'>
  <ASIDE class="aside_right">
    <form name='frm_delete_by_stugrpno' id='frm_delete_by_stugrpno' 
              action='./delete_by_stugrpno.do' method='post'>
      <input type='hidden' name='stugrpno' id='stugrpno' value=''>
      <%-- 앵커는 Get 방식이지만 -> FORM 으로 POST로 변경 --%>
      <A href="javascript: delete_by_stugrpno(${param.stugrpno})">모든 스터디 삭제</A>
    </form>
  </ASIDE> 
  <DIV class='menu_line'></DIV>


  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      
      <!-- value에 param(GET으로 전달받은 값을 기본 값으로 사용. ex) 여행-> 1 자동 입력 -->
      <!-- disable를 설정하여 값 설정 변경을 못하게 설정이 가능하나
       가장 큰 문제 ) 값 전달을 못함 : 무결성 제약 조건 위배
       해결) hidden type을 사용해 사용자에게 보이지않게 설정 + 실제 값 보여주기만 -> 
      -->
      <label>스터디 그룹 번호 : </label>
      <input type='hidden' name='stugrpno' value='${param.stugrpno }' >
      ${param.stugrpno }<BR>
    
      <label>스터디 제목</label>
      <input type='text' name='name' value='' required="required" style='width: 50%;'
                 placeholder="스터디 이름을 입력하세요." autofocus="autofocus"><BR>
                 
      <label>스터디 설명</label>
      <input type='text' name='stuex' value='' required="required" style='width: 50%;'
                  placeholder="스터디에 대한 설명을 입력하세요."><BR>         
  
      <label>스터디 지역</label>
      <input type='text' name='stulo' value='' required="required" style='width: 20%;'
                  placeholder="ex)경기도/일산"><BR>         
  
  
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
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
      
      <%-- contents로 넘어가기 위한 링크 설정 --%>
      <TD class="td_bs_left" style='font-weight: bold'>
<%--       <!-- 1) 검색하지 않는 목록 -->
      <A href="../contents/list_by_stuno.do?stuno=${stuno }">  ${stuVO.name }</A> --%>
<%--       <!-- 2) 검색하는 목록 -->
        <A href="../contents/list_by_stuno_search.do?stuno=${stuno }">${stuVO.name }</A> --%>
        <!--  3) 검색 + 페이징 목록  -->
        <A href="../contents/list_by_stuno_search_paging.do?stuno=${stuno }&now_page=${now_page=1}">${stuVO.name }</A>        
       </TD>
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