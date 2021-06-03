<%-- 
목록 입력화면
1) 입력 화면
- http://localhost:9091/stu/create.do?stugrpno=1 
-> 1(토익)  / 2(전산) / 3(국가기술) /4(기타) 

▷ /webapp/WEB-INF/views/stu/create.jsp 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
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
 
<DIV class='title_line'>스터디 등록</DIV>

<DIV class='content_body'>
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
    <!-- 
    부모테이블 stugrpno PK 컬럼 값 이용, FK 선언
    http://localhost:9090/stu/create.do?stugrpno=1
     -->
    <input type="hidden" name="stugrpno" value="${param.stugrpno }"> 
    
    <div class="form-group">
       <label class="control-label col-md-3">스터디 이름</label>
      
       <!-- name(스터디 이름)에 대한 값 입력 -->
       <div class="col-md-9">
         <input type='text' name='name' value='' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 50%;' placeholder="스터디 이름을 입력하세요.">
          (부모 스터디 번호: ${param.stugrpno }) <BR>        
       </div>
       
       
        <label class="control-label col-md-3">스터디 설명</label>
       <!-- stuex(스터디 설명)에 대한 값 입력 -->
       <div class="col-md-9">
         <input type='text' name='stuex' value='' required="required" 
                  class="form-control" style='width: 50%;' placeholder="스터디에 대한 설명을 입력하세요."><BR>
       </div>
       
        <label class="control-label col-md-3">스터디 지역</label>
       <!-- stulo(스터디 지역)에 대한 값 입력 -->
       <div class="col-md-9">
         <input type='text' name='stulo' value='' required="required" 
                   class="form-control" style='width: 50%;' placeholder="ex)경기도/일산">
       </div>
       
    </div>
    <div class="content_body_bottom" style="padding-right: 20%;">
      <button type="submit" class="btn btn-primary">등록</button>
      <button type="button" onclick="location.href='./list_all.do'" class="btn btn-primary">목록</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>