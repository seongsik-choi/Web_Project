<%-- 
목록 입력화면
1) 입력 화면
- http://localhost:9091/fav/create.do?favgrpno=1 
-> 1(서울/북부)  / 2(서울/남부) / 3(경기/북부) 4(경기/남부) 

http://localhost:9091/fav/create.do?favgrpno=1
▷ /webapp/WEB-INF/views/fav/create.jsp 
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
 
<DIV class='title_line'>즐겨찾기 등록</DIV>

<DIV class='content_body'>
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
    <!-- 
    부모테이블 favgrpno PK 컬럼 값 이용, FK 선언
    http://localhost:9090/fav/create.do?favgrpno=1
     -->
    <input type="hidden" name="favgrpno" value="${param.favgrpno }"> 
    
    <div class="form-group">
       <label class="control-label col-md-3">즐겨찾기 이름</label>
      
       <!-- name(즐겨찾기 이름)에 대한 값 입력 -->
       <div class="col-md-9">
         <input type='text' name='favname' value='' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 50%;' 
                   placeholder="스터디카페 이름을 입력해주세요.">
          (부모 즐겨찾기 번호: ${param.favgrpno }) <BR>        
       </div>
       
       
        <label class="control-label col-md-3">즐겨찾기 설명</label>
       <!-- favex(즐겨찾기 설명)에 대한 값 입력 -->
       <div class="col-md-9">
         <input type='text' name='favex' value='' required="required" 
                   class="form-control" style='width: 50%;' placeholder="카페에 대한 홍보를 해주세요."><BR>
       </div>
       
        <label class="control-label col-md-3">즐겨찾기 링크</label>
       <!-- favlo(즐겨찾기 지역)에 대한 값 입력 -->
       <div class="col-md-9">
         <input type='text' name='favli' value='' required="required" 
                    class="form-control" style='width: 50%;' 
                    placeholder="ex) site나 번호를 적어주세요.">
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