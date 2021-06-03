<%-- 
0514
[56][Member] 회원 목록 출력 기능 제작 : 관리자 전용
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> <!--  모바일을 위함 --> 
<title>DoStudy Home</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <!--  부트 스트랩에서 제공하는 javascript -->
 
<script type="text/javascript">
  $(function(){
 
  });
</script>
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
  <DIV class='title_line'>
    회원(관리자 전용)
  </DIV>

  <DIV class='content_body'>

    <ASIDE class="aside_right">
      <A href="javascript:location.reload();">새로고침</A>
      <span class='menu_divide' >│</span> 
      <A href='./create.do'>회원 가입</A>
      <span class='menu_divide' >│</span> 
      <A href='./list.do'>목록</A>
    </ASIDE> 

    <div class='menu_line'></div>

    <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style='width: 2%;'/>  <%-- 번호 --%>
      <col style='width: 9%;'/> <%-- 아이디 --%>
      <col style='width: 6%;'/> <%-- 성명 --%>
      <col style='width: 13%;'/> <%-- 전화번호 --%>  <%-- 30 --%>
      
      <col style='width: 15%;'/> <%-- 이메일 --%>
      <col style='width: 5%;'/> <%-- 별명 --%>
      <col style='width: 5%;'/> <%-- 직업 --%> <%-- 25 --%>
      
      <col style='width: 20%;'/> <%-- 주소 --%>
      <col style='width: 10%;'/> <%-- 등록일 --%>
      <col style='width: 10%;'/> <%-- 이미지 --%>
      <col style='width: 5%;'/> <%-- 기타 --%>   <%-- 45 --%>
    </colgroup>
    <TR>
      <TH class='th_bs'>.</TH>
      <TH class='th_bs'>ID</TH>
      <TH class='th_bs'>성명</TH>
      <TH class='th_bs'>전화번호</TH>
      
      <TH class='th_bs'>이메일</TH>
      <TH class='th_bs'>별명</TH>
      <TH class='th_bs'>직업</TH>
      
      <TH class='th_bs'>주소</TH>
      <TH class='th_bs'>등록일</TH>
      <TH class='th_bs'>회원사진</TH>
      <TH class='th_bs'>기타</TH>
    </TR>
   
    <c:forEach var="memberVO" items="${list }">
      <c:set var="memberno" value ="${memberVO.memberno}" />
      <c:set var="id" value ="${memberVO.id}" />
      <c:set var="mname" value ="${memberVO.mname}" />
      <c:set var="tel" value ="${memberVO.tel}" />
      <c:set var="address1" value ="${memberVO.address1}" />
      <c:set var="mdate" value ="${memberVO.mdate}" />
      
      <!-- 추가된 이메일, 별명, 직업, 썸네일 -->
      <c:set var="email" value ="${memberVO.email}" />
      <c:set var="vname" value ="${memberVO.vname}" />
      <c:set var="job" value ="${memberVO.job}" />
      <c:set var="thumb1" value ="${memberVO.thumb1}" />

    <TR> <!--  실제 컨텐츠 --> 
      <TD class=td_basic>${memberno}</TD>
      <TD class='td_left'><Strong> <A href="./read.do?memberno=${memberno}">${id}</A></Strong></TD>
      <TD class='td_left'><Strong><A href="./read.do?memberno=${memberno}">${mname}</A></Strong></TD>
      <TD class='td_basic'>${tel}</TD>
      
      <TD class='td_basic'>${email}</TD>
      <TD class='td_basic'>${vname}</TD>
      <TD class='td_basic'>${job}</TD>
      <TD class='td_left'>
        <c:choose>
          <c:when test="${address1.length() > 18 }"> <!-- 긴 주소 처리 -->
            ${address1.substring(0, 18) }...
          </c:when>
          <c:otherwise>
            ${address1}
          </c:otherwise>
        </c:choose>
      </TD>
      <TD class='td_basic'>${mdate.substring(0, 10)}</TD> <!-- 년월일 -->
      
     <TD style='vertical-align: middle; text-align: center;'>
              <%-- 이미지(파일) 출력 고정 소스  --%>
              <c:choose>
                <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
                  <IMG src="/member/storage/${thumb1 }" style="width: 120px; height: 80px;"> 
                </c:when>
                <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
                  ${contentsVO.file1}
                </c:otherwise>
              </c:choose>  <%-- 이미지 출력 고정 소스 종료 --%>
      </TD>           
      
      <TD class='td_basic'> <%-- 기타 --%>
        <A href="./passwd_update.do?memberno=${memberno}"><IMG src='/member/images/passwd.png' title='패스워드 변경'></A>
        <A href="./read.do?memberno=${memberno}"><IMG src='/member/images/update.png' title='수정'></A>
        <A href="./delete.do?memberno=${memberno}"><IMG src='/member/images/delete.png' title='삭제'></A>
      </TD>
      
    </TR>
    </c:forEach>
    
  </TABLE>
   
  <DIV class='bottom_menu'>
    <button type='button' onclick="location.href='./create.do'" class="btn btn-primary">등록</button>
    <button type='button' onclick="location.reload();" class="btn btn-primary">새로 고침</button>
  </DIV>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>