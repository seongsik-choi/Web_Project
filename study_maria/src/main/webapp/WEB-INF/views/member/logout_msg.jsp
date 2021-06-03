<%-- 
Session 활용 로그 아웃
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />  <!-- 모바일 뷰포트-->
<title></title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <!--  부트 스트랩에서 제공하는 javascript -->

<script type="text/javascript">
  $(function(){ 
    $('#btn_home').on('click', function() {
      location.href="/index.do";
    });
  });
</script>
 
</head> 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
  <DIV class='content_body'>  
    <DIV class='title_line'>알림</DIV>
      <DIV class='message'>
        <fieldset class='fieldset_basic'>
          <ul>
            <li class='li_none'>이용해 주셔서감사합니다.</li>
            <li class='li_none'>
              <button type="button" id="btn_home" class="btn btn-primary btn-md">확인</button>
            </li>
            
          </ul>
        </fieldset>    
      </DIV>
  </DIV><%-- content body end --%>
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>