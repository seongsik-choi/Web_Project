<%-- 
Session 활용 로그인 폼
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />  <!-- 모바일 뷰포트-->
<title>DoStudy Home</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <!--  부트 스트랩에서 제공하는 javascript -->
<script type="text/javascript">
  $(function() { // 자동 실행
    $('#btn_create').on('click', create);
    $('#btn_loadDefault').on('click', loadDefault);
  });
  
  function create() { // 회원가입
    location.href="./create.do";
  }

  function loadDefault() { // 테스트용 회원가입 기본값 로딩
    $('#id').val('tes1');
    $('#passwd').val('1234');
  }    
</script> 

</head> 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
<DIV class='title_line'>로그인</DIV>
 
  <DIV class='content_body'> 
   
    <DIV style='width: 80%; margin: 0px auto;'>
      <FORM name='frm' method='POST' action='./login.do' class="form-horizontal">
      
        <div class="form-group">
          <label class="col-md-4 control-label" style='font-size: 0.8em;'>아이디</label>    
          <div class="col-md-8">
            <input type='text' class="form-control" name='id' id='id' 
                       value='' required="required" 
                       style='width: 30%;' placeholder="아이디" autofocus="autofocus">
          </div>
        </div>   
     
        <div class="form-group">
          <label class="col-md-4 control-label" style='font-size: 0.8em;'>패스워드</label>    
          <div class="col-md-8">
            <input type='password' class="form-control" name='passwd' id='passwd' 
                      value='' required="required" style='width: 30%;' placeholder="패스워드">
          </div>
        </div>   
     
        <div class="form-group">
          <div class="col-md-offset-4 col-md-8">
            <button type="submit" class="btn btn-primary btn-md">로그인</button>
            <button type='button' id='btn_create' class="btn btn-primary btn-md">회원가입</button>
            <button type='button' id='btn_loadDefault' class="btn btn-primary btn-md">테스트 계정</button>
          </div>
        </div>   
        
      </FORM>
    </DIV>
</DIV> <%-- content_body end --%>

<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
</html>