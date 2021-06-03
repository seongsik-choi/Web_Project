<%-- 
View: JSP : action의 경로
http://localhost:9091/stugrp/list.do
 ./ → http://localhost:9091/categrp 나타냄
action="./create.do"
action="http://localhost:9091/stugrp/create.do"
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
 
<DIV class='title_line'>스터디 그룹  ▶  등록</DIV>

<DIV class='content_body'> 
  <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
    
    <div class="form-group">
       <label class="control-label col-md-3">스터디 그룹 이름</label>
       <div class="col-md-9">
         <input type='text' name='stugrpname' value='' required="required" 
                    placeholder="ex) 스터디 이름이 요리일 경우 '요리'만 명시"
                    autofocus="autofocus" class="form-control" style='width: 50%;'>
       </div>
    </div>
    
    <div class="form-group">
       <label class="control-label col-md-3">스터디 그룹 설명</label>
       <div class="col-md-9">
         <input type='text' name='stugrpex' value='' required="required" 
                    placeholder="ex) OOO 그룹을 등록해주세요."
                     class="form-control" style='width: 100%;'>
       </div>
    </div>
    
    <div class="form-group">
       <label class="control-label col-md-3">출력 순서</label>
       <div class="col-md-9">
         <input type='number' name='seqno' value='1' required="required" 
                   placeholder="${seqno }" min="1" max="1000" step="1" 
                   style='width: 20%;' class="form-control" >
       </div>
    </div>  
    
    <div class="content_body_bottom" style="padding-right: 20%;">
      <button type="submit" class="btn">등록</button>
      <button type="button" onclick="location.href='./list.do'" class="btn">목록</button>
    </div>
  
  </FORM>
 
</DIV> <!-- content_body end -->
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>
 