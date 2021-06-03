<%--
create.jsp 기반 -> read.jsp
 --%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="name" value="${contentsVO.name }" />
        
<c:set var="intro" value="${contentsVO.intro }" />
<c:set var="certi" value="${contentsVO.certi }" />
<c:set var="id" value="${contentsVO.id }" />
<c:set var="contentsno" value="${contentsVO.contentsno }" />
<c:set var="recom" value="${contentsVO.recom }" />

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>DoStudy Home</title>
<link href="/css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
  $(function(){
    $('#btn_recom').on("click", function() {update_recom_ajax(${contentsno}); }); 
    // 클릭시 update_recom_ajax() 호출, contentsno를 전달
  });

  function update_recom_ajax(contentsno) {
    // console.log(" -> contentsno : " + contentsno);
    var params = "";
    params = 'contentsno= ' + contentsno; // 공백이 값으로 있으면 안됨!!! 중요 = 기호★★★★★★★
    // params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    
    $.ajax({
      url: '/contents/update_recom_ajax.do',  // Spring Controller의 requestmapping 요청 url 
      type: 'post',  // 변경이기에 post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터

      success: function(rdata) { // 응답이 온경우
        // console.log(" -> rdata : " + rdata);
        var str = '';
        if(rdata.cnt == 1) {
          // input tag의 값은 가져오는경우  .val()
          // console.log('->btn_recom: ' + $('#btn_recom').val()); // 값을 받아옴

          // Button tag의 값을 가져오는 경우 .html()
          // console.log('->btn_recom: ' + $('#btn_recom').html()); // 값을 받아옴
          
          // 실제 버튼 태그에서 실시간으로 값 증가 시키기
          $('#btn_recom').html('♡추천♡('+rdata.recom+')');
          
          $('#span_animation').hide(); // 애니메이션 태그 숨김
        } else { // ERROR
          $('#span_animation').html("지금은 추천 할 수 없습니다."); 
        }
      },
      
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        console.log(error);
      }
     }
    ); // $.ajax end
    
    // $('#panel').html('조회 중입니다...');
    $('#span_animation').html("<img src='/contents/images/ani04.gif' style='width: 8%;'>");
    $('#span_animation').show(); // 숨겨진 태그의 출력
    
  } //update_recom_ajax() end
  
</script>
 
</head> 
 
<body>
<jsp:include page="../menu/top.jsp" flush='false' />
 
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
    <A href="./list_by_stuno_search_paging.do?stuno=${stuVO.stuno }&now_page=${param.now_page}&intro=${param.intro }">기본 목록형</A>    
    <span class='menu_divide' >│</span>
    <A href="./list_by_stuno_grid_paging.do?stuno=${stuVO.stuno }&now_page=${param.now_page }">갤러리형</A>
    <span class='menu_divide' >│</span>
    <A href="./update_text.do?contentsno=${contentsno }&now_page=${param.now_page}">수정</A>
    <span class='menu_divide' >│</span>
    <A href="./update_file.do?contentsno=${contentsno }&now_page=${param.now_page}">파일수정</A>
    <span class='menu_divide' >│</span>
    <A href="./delete.do?contentsno=${contentsno }&now_page=${param.now_page}">삭제</A>
  </ASIDE> 
  
    <DIV style="text-align: right; clear: both;">  
    <form name='frm' id='frm' method='get' action='./list_by_stuno_search_paging.do'>
      <input type='hidden' name='stuno' value='${stuVO.stuno }'>
      <c:choose>
        <c:when test="${param.intro != '' }"> <%-- 검색하는 경우 --%>
          <input type='text' name='intro' id='intro' value='${param.intro }' style='width: 20%;'>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우 --%>
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

  <fieldset class="fieldset_basic">
    <ul>
      <li class="li_none">
        <c:set var="file1saved" value="${contentsVO.file1saved.toLowerCase() }" />
        <c:if test="${file1saved.endsWith('jpg') || file1saved.endsWith('png') || file1saved.endsWith('gif')}">
          <DIV style="width: 50%; float: left; margin-right: 10px;">
            <IMG src="/contents/storage/${contentsVO.file1saved }" style="width: 100%;">
          </DIV>
          <DIV style="width: 47%; height: 260px; float: left; margin-right: 10px;">
            <span style="font-size: 1.5em; font-weight: bold;"> 이름 : ${name }</span><br><BR>
            <span style="font-size: 1.2em; font-weight: bold;"> 지원 : ${stuVO.name }</span><br><BR>
            <span style="font-size: 1.0em; font-weight: bold;"> 카카오톡 ID : ${id }</span><br><BR>
            <span style="font-size: 1.0em; font-weight: bold;"> 자격증 : ${certi }</span><br>
            <form>
            <button type='button' id='btn_recom' class="btn btn-primary">♡추천♡(${recom }) </button>
            <span id='span_animation'></span>
            </form>            
          </DIV> 
        </c:if> 
        <DIV><span style="font-size: 1.5em; font-weight: bold;">${intro }</span></DIV>
      </li>
      <li class="li_none">
        <DIV style='text-decoration: none;'>
        </DIV>
      </li>
      <li class="li_none">
        <DIV>
          <c:if test="${contentsVO.file1.trim().length() > 0 }">
            첨부 파일: <A href='/download?dir=/contents/storage&filename=${contentsVO.file1saved}&downname=${contentsVO.file1}'>${contentsVO.file1}</A> (${contentsVO.size1_label})  
          </c:if>
        </DIV>
      </li>   
    </ul>
  </fieldset>

</DIV>  <!--  content body end -->
 
<jsp:include page="../menu/bottom.jsp" flush='false' />
</body>
 
</html>