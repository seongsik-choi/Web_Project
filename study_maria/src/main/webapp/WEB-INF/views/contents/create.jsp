<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Dostudy Home</title>

<link href="/css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">


  $(function() { // 자동 실행
    // id가 'btn_checkID'인 태그를 찾아 'click' 이벤트 처리자(핸들러)로 checkID 함수를 등록
    // document.getElementById('btn_checkID').addEventListener('click', checkID); 동일
    // $('#btn_checkID').on('click', checkID);  
    // $('#btn_checkNAME').on('click', checkNAME);  
    $('#btn_checkINTRO').on('click', checkINTRO);  
    $('#btn_close').on('click', setFocus); // Dialog창을 닫은후의 focus 이동
  });

  /*
  // jQuery ajax 요청 : CheckID(), SPring Controller의 값을 전달받아 검사
  function checkID() {
    // $('#btn_close').attr("data-focus", "이동할 태그 지정");
    
    var frm = $('#frm2'); // id가 frm2인 태그 검색
    var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
    var params = '';
    var msg = '';

    if ($.trim(id).length == 0) { // id를 입력받지 않은 경우
      msg = '· ID를 입력하세요.<br>· ID 입력은 필수 입니다.<br>· ID는 3자이상 권장합니다.';
      
      $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
      $('#modal_title').html('ID 중복 확인'); // 제목 
      $('#modal_content').html(msg);        // 내용
      $('#btn_close').attr("data-focus", "id");  // 닫기 버튼 클릭시 id 입력으로 focus 이동
      $('#modal_panel').modal();               // 다이얼로그 출력
      return false;
    } else {  // when ID is entered
      params = 'id=' + id;
      // var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
      // alert('params: ' + params);

      $.ajax({
        url: './checkID.do', // spring execute
        type: 'get',  // post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
          // alert(rdata);
          var msg = "";
          
          if (rdata.cnt > 0) {
            $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
            msg = "이미 사용중인 ID 입니다.";
            $('#btn_close').attr("data-focus", "id");  // id 입력으로 focus 이동
          } else {
            $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
            msg = "사용 가능한 ID 입니다.";
            $('#btn_close').attr("data-focus", "file1MF");  // passwd 입력으로 focus 이동
            // $.cookie('checkId', 'TRUE'); // Cookie 기록
          }
          
          $('#modal_title').html('ID 중복 확인'); // 제목 
          $('#modal_content').html(msg);        // 내용
          $('#modal_panel').modal();              // 다이얼로그 출력
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }); 
    }
  }

  // jQuery ajax 요청 : checkNAME(), SPring Controller의 값을 전달받아 검사
  function checkNAME() {
    // $('#btn_close').attr("data-focus", "이동할 태그 지정");
    
    var frm = $('#frm2'); // id가 frm2인 태그 검색
    var name = $('#name', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
    var params = '';
    var msg = '';

    if ($.trim(name).length == 0) { // id를 입력받지 않은 경우
      msg = '·이름을 입력해주세요<br> .성과 이름을 포함한 이름';
      $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
      $('#modal_title').html('이름 확인'); // 제목 
      $('#modal_content').html(msg);        // 내용
      $('#btn_close').attr("data-focus", "name");  // 닫기 버튼 클릭시 name 입력으로 focus 이동
      $('#modal_panel').modal();               // 다이얼로그 출력
      return false;
    } else  if ($.trim(name).length < 2) { // name을 1글자로 입력
      msg = '·이름을 두 자 이상 입력하세요.';
      $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
      $('#modal_title').html('이름 확인'); // 제목 
      $('#modal_content').html(msg);        // 내용
      $('#btn_close').attr("data-focus", "name");  // 닫기 버튼 클릭시 name 입력으로 focus 이동
      $('#modal_panel').modal();               // 다이얼로그 출력
      return false;
    } else {  // when name is entered
      params = 'name=' + name;
      // var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
      // alert('params: ' + params);

      $.ajax({
        url: './checkNAME.do', // spring execute
        type: 'get',  // post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
          var msg = "";
          
          if (rdata.cnt > 0) {
            $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
            msg = " .이미 사용중인 이름 입니다<br>.이름 뒤에 영문을 붙여주세요.";
            $('#btn_close').attr("data-focus", "name");  // id 입력으로 focus 이동
          } else {
            $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
            msg = "사용 가능한 이름 입니다.";
            $('#btn_close').attr("data-focus", "intro2");  // passwd 입력으로 focus 이동
            // $.cookie('checkId', 'TRUE'); // Cookie 기록
          }
          
          $('#modal_title').html('이름 확인'); // 제목 
          $('#modal_content').html(msg);        // 내용
          $('#modal_panel').modal();              // 다이얼로그 출력
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }); 
    }
  }  
  */
  
  // jQuery ajax 요청 : checkIntro(), SPring Controller의 값을 전달받아 검사
  function checkINTRO() {
    
    var frm = $('#frm2'); // id가 frm2인 태그 검색
    var intro2 = $('#intro2', frm).val(); // frm 폼에서 id가 'intro2'인 태그 검색
    var params = '';
    var msg = '';

    if ($.trim(intro2).length < 10) { // 자기소개를 입력받지 않은 경우
      msg = '·자기소개 10자 이상 입력하세요.';
      $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
      $('#modal_title').html('자기소개 확인'); // 제목 
      $('#modal_content').html(msg);        // 내용
      $('#btn_close').attr("data-focus", "intro2");  // 닫기 버튼 클릭시 name 입력으로 focus 이동
      $('#modal_panel').modal();               // 다이얼로그 출력
      return false;
    } else {  // when name is entered
      params = 'intro2=' + intro2;

      $.ajax({
        url: './checkINTRO.do', // spring execute
        type: 'get',  // post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
          var msg = "";
         
          $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
          msg = "사용 가능한 자기소개 입니다.";
          $('#btn_close').attr("data-focus", "certi");  // passwd 입력으로 focus 이동

          
          $('#modal_title').html('자기소개 확인'); // 제목 
          $('#modal_content').html(msg);        // 내용
          $('#modal_panel').modal();              // 다이얼로그 출력
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }); 
    }
  }    

  function setFocus() {  // focus 이동
    // console.log('btn_close click!');
    var tag = $('#btn_close').attr('data-focus'); // data-focus 속성에 선언된 값을 읽음 
    // console.log('tag: ' + tag);
    $('#' + tag).focus(); // data-focus 속성에 선언된 태그를 찾아서 포커스 이동
  }

    
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />

  <!-- ******************** Modal 알림창 시작 ******************** -->
  <div id="modal_panel" class="modal fade"  role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" id="btn_close" data-focus="" class="btn btn-default" 
                      data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
  <!-- ******************** Modal 알림창 종료 ******************** -->
 
<DIV class='title_line'>
  <A href="../stugrp/list.do" class='title_link'>스터디 그룹</A> > 
  <A href="../stu/list_by_stugrpno.do?stugrpno=${stugrpVO.stugrpno }" class='title_link'>${stugrpVO.stugrpname }</A> >
  <A href="./list_by_stuno_search_paging.do?stuno=${stuVO.stuno }" class='title_link'>${stuVO.name }</A>
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
      <c:choose>
        <c:when test="${param.intro != '' }"> 
          <input type='text' name='intro' id='intro' value='${param.intro }' style='width: 20%;'>
        </c:when>
        <c:otherwise> 
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
  
  <FORM name='frm' id='frm2' method='POST' action='./create.do' class="form-horizontal"
              enctype="multipart/form-data"> 
    <input type="hidden" name="stugrpno" value="${stuVO.stugrpno }"> 
    <input type="hidden" name="stuno" value="${param.stuno }">
    <input type="hidden" name="adminno" value="1"> <%-- 관리자 개발후 변경 필요 --%>
    
    <div class="form-group">
       <label class="control-label col-md-2">이름</label>
       <div class="col-md-10">
         <input type='text' name='name' id='name' required="required" 
                   autofocus="autofocus" class="form-control" style='width: 20%;'>
        <!-- 동일 이름에 대한 AJAX 처리 -->
        <!-- <button type='button' id="btn_checkNAME" class="btn btn-info btn-md">이름 확인</button>
        <SPAN id='id_span'></SPAN> ID 중복 관련 메시지   -->
       </div>
    </div>

    <div class="form-group">
       <label class="control-label col-md-2">자기 소개</label>
       <div class="col-md-10">
         <textarea name='intro' id='intro2' required="required" class="form-control" rows="3" style='width: 100%;'></textarea>
          <!-- 자기소개 문자열 개수에 대한 AJAX 처리 -->
         <button type='button' id="btn_checkINTRO" class="btn btn-info btn-md">자기소개 확인</button>
         <SPAN id='id_span'></SPAN> <!-- ID 중복 관련 메시지 --> 
       </div>
    </div>
    
    <div class="form-group">
       <label class="control-label col-md-2">자격증</label>
       <div class="col-md-10">
         <input type='text' name='certi' id='certi' value='토익, 정보처리기사' required="required" 
                    class="form-control" style='width: 60%;'>
       </div>
    </div>   
    
    <div class="form-group">
       <label class="control-label col-md-2">카카오톡 ID</label>
       <div class="col-md-10">
         <input type='text' name='id' id='id' required="required" 
                    class="form-control" style='width: 20%;'>
         <!-- 카카오톡 id에 대한 AJAX 처리 -->
        <!-- <button type='button' id="btn_checkID" class="btn btn-info btn-md">카카오톡 id 확인</button>
        <SPAN id='id_span'></SPAN> ID 중복 관련 메시지   -->
       </div>
    </div>      
        
    <div class="form-group">
       <label class="control-label col-md-2">이미지</label>
       <div class="col-md-10">
         <input type='file' class="form-control" name='file1MF' id='file1MF'  required="required"
                    value='' placeholder="파일 선택">
       </div>
    </div>   
    <div class="form-group">
       <label class="control-label col-md-2">패스워드</label>
       <div class="col-md-10">
         <input type='password' name='passwd' value='1234' required="required" 
                    class="form-control" style='width: 20%;'>
       </div>
    </div>   
    <div class="content_body_bottom">
      <button type="submit" class="btn btn-primary">등록</button>
      <button type='button' onclick="location.href='./list_by_stuno_search_paging.do?stuno=${param.stuno}'" class="btn btn-primary">목록</button>
    </div>
  
  </FORM>
</DIV>
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>