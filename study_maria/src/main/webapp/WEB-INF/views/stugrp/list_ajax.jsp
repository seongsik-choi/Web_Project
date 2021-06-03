<%--
list_ajax : 수정 + 삭제(자식 레코드가 없는 경우)처리 ajax
 --%>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <!--  부트 스트랩에서 제공하는 javascript -->

<script type="text/javascript">
  $(function() { // 동적 JQuery 사용 
    $('#btn_update_cancel').on('click', cancel);
    $('#btn_delete_cancel').on('click', cancel);
  });

  function cancel() {
    $('#panel_create').css("display",""); 
    $('#panel_update').css("display","none"); 
    $('#panel_delete').css("display","none"); 
  }
    
  function read_update_ajax(stugrpno) {
    // display=none; 속성의 panel_update FORM을 -> 출력
    $('#panel_update').css("display","");  // update form은 none -> show
    $('#panel_create').css("display","none"); // 기존 create 폼 -> hide
    $('#panel_delete').css("display","none"); // 기존 delete 폼 -> hide
    
    // console.log('-> stugrpno: ' +stugrpno); // stugrpno의 전달 확인.
    var params = "";
    params = 'stugrpno= ' + stugrpno; // 공백이 값으로 있으면 안됨!!! 중요 = 기호★★★★★★★
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    
    $.ajax({
      url: '/stugrp/read_ajax.do',  // Spring Controller의 requestmapping 요청 url 
      type: 'get',  // 변경이 아니기에 get
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터

      success: function(rdata) { // 응답이 온경우 Spring에서 하나의 전체를 전달한 경우 -> 통문자열
        var stugrpno = rdata.stugrpno;  // JSON객체(rdata).VO변수명
        var stugrpname = rdata.stugrpname;  
        var stugrpex = rdata.stugrpex;  
        var seqno = rdata.seqno;  
        var rdate = rdata.rdate;  

        var frm_update = $('#frm_update');
        $('#stugrpno', frm_update).val(stugrpno); // frm_update FROM을 찾아서 -> id가 stugrpno인 INPUT tag 값 가져옴.
        $('#stugrpname', frm_update).val(stugrpname); 
        $('#stugrpex', frm_update).val(stugrpex); 
        $('#seqno', frm_update).val(seqno); 
        $('#rdate', frm_update).val(rdate); 
        
        // input tag의 값은 가져오는경우  .val()
        // console.log('->btn_recom: ' + $('#btn_recom').val()); // 값을 받아옴

        // Button tag의 값을 가져오는 경우 .html()
        // console.log('->btn_recom: ' + $('#btn_recom').html()); // 값을 받아옴
        
        // 실제 버튼 태그에서 실시간으로 값 증가 시키기
        // $('#btn_recom').html('♡추천♡('+rdata.recom+')');
     
        // $('#span_animation').hide(); // 애니메이션 태그 숨김
      },
      
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        console.log(error);
      }
     }
    ); // $.ajax end
    
    // $('#panel').html('조회 중입니다...');
    // $('#span_animation').html("<img src='/contents/images/ani04.gif' style='width: 8%;'>");
    // $('#span_animation').show(); // 숨겨진 태그의 출력
        
  }// read_update_ajax() end

  // 삭제 폼(자식 레코드가 없는 경우의 삭제)
  function read_delete_ajax(stugrpno) {
    $('#panel_create').css("display","none"); // hide, 태그를 숨김
    $('#panel_update').css("display","none"); // hide, 태그를 숨김  
    $('#panel_delete').css("display",""); // show, 숨겨진 태그 출력 
    // return;
    
    // console.log('-> stugrpno:' + stugrpno);
    var params = "";
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    params = 'stugrpno=' + stugrpno; // 공백이 값으로 있으면 안됨.
    $.ajax(
      {
        url: '/stugrp/read_ajax.do',
        type: 'get',  // get, post
        cache: false, // 응답 결과 임시 저장 취소
        async: true,  // true: 비동기 통신
        dataType: 'json', // 응답 형식: json, html, xml...
        data: params,      // 데이터
        success: function(rdata) { // 응답이 온경우, Spring에서 하나의 객체를 전달한 경우 통문자열
          // {"stugrpno":1,"seqno":1,"stugrpex":"TOEIC 관련 그룹을 등록해주세요.","rdate":"2021-04-11 16:51:53","stugrpname":"TOEIC/TOEIC SPEAKING"}
          var stugrpno = rdata.stugrpno;
          var stugrpname = rdata.stugrpname;
          var stugrpex = rdata.stugrpex;
          var seqno = rdata.seqno;
          // var rdate = rdata.rdate;

          var count_by_stugrpno = parseInt(rdata.count_by_stugrpno);
          // console.log("count_by_stugrpno : " + count_by_stugrpno);          
          
          var frm_delete = $('#frm_delete');
          $('#stugrpno', frm_delete).val(stugrpno);
          
          $('#frm_delete_stugrpname').html(stugrpname);
          $('#frm_delete_stugrpex').html(stugrpex);
          $('#frm_delete_seqno').html(seqno);

          if (count_by_stugrpno > 0 ) { // 자식 레코드가 있다면
            // $('#frm_delete_count_by_stugrpno').html(count_by_stugrpno); // 자식레코값, TAG가 덮여서 X
            //$('#frm_delete_count_by_stugrpno').append(count_by_stugrpno); // 마지막 자식으로 추가(append)
            // $('#frm_delete_count_by_stugrpno').prepend('관련자료 : ' + count_by_stugrpno +'건'); // 첫부분에 자식으로 추가(append)

            $('#frm_delete_count_by_stugrpno').show(); // 자식레코드 보여줌
            $('#frm_delete_count_by_stugrpno_panel').html('관련자료 : ' + count_by_stugrpno +'건'); 
            // 건수 누적되는 문제 해결 : Span으로 id 값을 전달해주기

             // alert($('#a_list_by_stugrpno').attr('href'));
             // A 태그 : $('#id').attr('href', '../list.do');
             // 삭제 클릭시 -> 링크 주소 출력 가능 : ../stu/list_by_stugrpno.do?stugrpno=
            
            $('#a_list_by_stugrpno').attr('href', '../stu/list_by_stugrpno.do?stugrpno=' + stugrpno);
            // JQuery 앵커값 전달 + stugrpno 값
            // 관련자료 삭제하기 -> stuno값으로 이동
          } else { // 자식 레코드가 없는 경우
            $('#frm_delete_count_by_stugrpno').hide(); // 자식레코드 숨김
          } //else end

          
          // console.log('-> btn_recom: ' + $('#btn_recom').val());  // X
          // console.log('-> btn_recom: ' + $('#btn_recom').html());
          // $('#btn_recom').html('♥('+rdata.recom+')');
          // $('#span_animation').hide();
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          console.log(error);
        }
      }
    );  //  $.ajax END

    // $('#span_animation').css('text-align', 'center');
    // $('#span_animation').html("<img src='/contents/images/ani04.gif' style='width: 8%;'>");
    // $('#span_animation').show(); // 숨겨진 태그의 출력
  } 
    
</script>

 
</head> 
<body>
<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>등록된 스터디 그룹 목록</DIV>

<DIV class='content_body'>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      
      <label>스터디 그룹 이름</label>
      <input type='text' name='stugrpname' id='stugrpname' value='' required="required" style='width: 40%;'
                 placeholder="ex) 스터디 이름이 요리일 경우 '요리'만 명시" autofocus="autofocus"><BR>
                 
      <label>스터디 그룹 설명</label>
      <input type='text' name='stugrpex' id='stugrpex' value='' required="required" style='width: 40%;'
                placeholder="ex) OOO 그룹을 등록해주세요."><BR>          
  
      <label>순서</label>
      <input type='number' name='seqno' id='seqno' value='1' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'><BR>

      <button type="submit" id='submit' class="btn btn-primary">등록</button>
      <button type="button" onclick="cancel();" class="btn btn-warning">취소</button>
    </FORM>
  </DIV>
  
  <%-- 삭제(자식 레코드가 없는 경우) 등록 --%>
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; 
            text-align: center; display: none;'>
    <div class="msg_warning">스터디 그룹을 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='stugrpno' id='stugrpno' value='${stugrpVO.stugrpno }'>
        
      <label>스터디 그룹 이름 : </label><SPAN id='frm_delete_stugrpname'></SPAN><BR>
      <label>스터디 그룹 설명 : </label><SPAN id='frm_delete_stugrpex'></SPAN><BR>
      <label>순서 : </label><SPAN id='frm_delete_seqno'></SPAN><BR>

      <%-- 자식 레코드 갯수 출력 --%>
      <div id='frm_delete_count_by_stugrpno' style='margin:10px auto;
               color:#FF0000; font-weight: bold; display: none;'>
        
       <%--건수 누적되는 문제 SPAN id 값 주기  --%>       
       <span id='frm_delete_count_by_stugrpno_panel'></span>
       
       <%-- id를 줘 stugrpno 를 전달 --%>
       『<A id='a_list_by_stugrpno' href="../stu/list_by_stugrpno.do?stugrpno=${stugrpno }">관련 자료 삭제하기</A>』
      </div>

      <button type="submit" id='submit' class="btn btn-warning">삭제</button>
      <button type="button" id='btn_delete_cancel' class="btn btn-primary">취소</button>
    </FORM>
  </DIV>    
  
  <%-- 수정 등록 --%>
  <DIV id='panel_update' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; 
           text-align: center; display: none;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <!--  값전달을 위한 hidden type 필요 -->
      <input type="hidden" name='stugrpno' id='stugrpno' value=''>
      
      <label>스터디 그룹 이름</label>
      <input type='text' name='stugrpname' id='stugrpname' value='' required="required" style='width: 25%;'
                 autofocus="autofocus"><BR>
  
      <label>스터디 그룹 설명</label>
      <input type='text' name='stugrpex' id='stugrpex' value='' required="required" style='width: 40%;'><BR>   
  
      <label>순서</label>
      <input type='number' name='seqno' id='seqno' value='1' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'><BR>
       
      <button type="submit" id='submit' class="btn btn-warning">저장</button>
      <button type="button" id='btn_update_cancel' class="btn btn-primary">취소</button>
      </FORM>
  </DIV>    
   
    
  <TABLE class='table table-hover'>
    <colgroup>
      <col style='width: 5%;'/>
      <col style='width: 15%;'/>
      <col style='width: 40%;'/>
      <col style='width: 10%;'/>    
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs">순서</TH>
      <TH class="th_bs">스터디 그룹 이름</TH>
      <TH class="th_bs">스터디 그룹 설명</TH>
      <TH class="th_bs">등록 날짜</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="stugrpVO" items="${list}">
      <c:set var="stugrpno" value="${stugrpVO.stugrpno }" />
      <TR>
        <TD class="td_bs">${stugrpVO.seqno }</TD>
        
        <!-- stugrpno에 해당하는 stu 테이블의 컬럼값들 출력   -->
        <TD class="td_bs">
        <A href="../stu/list_by_stugrpno.do?stugrpno=${stugrpno }">${stugrpVO.stugrpname }</A></TD>
        
        <TD class="td_bs">${stugrpVO.stugrpex }
        <IMG src="/stugrp/images/open.png" style='width: 18px;'>
        </TD>
        <TD class="td_bs">${stugrpVO.rdate.substring(0, 10) }</TD>
        
        <TD class="td_bs">
          <A href="javascript: read_update_ajax(${stugrpno})" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>

          <%-- <A href="./read_delete.do?stugrpno=${stugrpno }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A> --%>
          <%-- AJAX 기반 삭제 폼 --%>
          <A href="javascript: read_delete_ajax(${stugrpno})" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
                  
          <A href="./update_seqno_up.do?stugrpno=${stugrpno }" title="우선순위 상향"><span class="glyphicon glyphicon-arrow-up"></span></A>
          <A href="./update_seqno_down.do?stugrpno=${stugrpno }" title="우선순위 하향"><span class="glyphicon glyphicon-arrow-down"></span></A>         
        </TD>   
      </TR>   
    </c:forEach> 
    </tbody>
   
  </TABLE>
</DIV>

 
<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>