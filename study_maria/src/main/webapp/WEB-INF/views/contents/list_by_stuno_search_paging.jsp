<%-- 
7. View: JSP
1)목록 화면
▷ /list_by_stuno_search 기반 list_by_stuno_search_paging 구현
--%>
<%@page import="dev.mvc.contents.ContentsVO"%>
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

  function reocm_ajax(contentsno, status_count) { // tag에 contentsno와 id 값 이 들어옴
    // 핵심 태그를 찾는 방.
    console.log("-> recom_ " + status_count + ":"  + $('#recom_' + status_count).html()); // JQuery tag의 id 값을 받아 콘솔에 출력

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
        if (rdata.cnt == 1) {
          // $('#span_animation_' + status_count).hide();   // SPAN 태그에 animation 출력
          $('#recom_' + status_count).html('♥('+rdata.recom+')');     // A 태그에 animation 출력
        } else {
          // $('#span_animation_' + status_count).html("X");
          $('#recom_' + status_count).html('♥(X)');
        }
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        console.log(error);
      }
    }
  );  //  $.ajax END

  $('#recom_' + status_count).html("<img src='/contents/images/ani04.gif' style='width: 10%;'>");
  // $('#span_animation_' + status_count).css('text-align', 'center');
  // $('#span_animation_' + status_count).html("<img src='/contents/images/ani04.gif' style='width: 10%;'>");
  // $('#span_animation_' + status_count).show(); // 숨겨진 태그의 출력
  }
</script>
 
</head> 
<body>

<jsp:include page="../menu/top.jsp" />
 
<DIV class='title_line'>
  <A href="../stugrp/list.do" class='title_link'>스터디 그룹 전체</A> > 
  <A href="../stu/list_by_stugrpno.do?stugrpno=${stugrpVO.stugrpno }" class='title_link'>${stugrpVO.stugrpname }</A> > 
   ${stuVO.name }
  </DIV>
  
<DIV class='content_body'>
  <ASIDE class="aside_right"> <!-- 서브 메뉴 -->
    <A href="./create.do?stuno=${stuVO.stuno }">등록</A>
    <span class='menu_divide' >│</span>
    <A href="javascript:location.reload();">새로고침</A>    <%-- 앵커 태그를 사용해 javaSript 사용  --%>
    <span class='menu_divide' >│</span>
    <A href="./list_by_stuno_grid_paging.do?stuno=${stuVO.stuno }&now_page=${param.now_page }">갤러리형</A>
  </ASIDE> 

<DIV style="text-align: right; clear: both;" >  
    <form name='frm' id='frm' method='get' action='./list_by_stuno_search_paging.do'>
      <input type='hidden' name='stuno' value='${stuVO.stuno }'>
      <c:choose>
        <c:when test="${param.intro != '' }"> <%-- 공백이 아니면, 검색하는 경우 --%>
          <input type='text' name='intro' id='intro' value='${param.intro }'  
                     style='width: 20%;' autofocus="autofocus"><%--value에 값 출력  --%>
        </c:when>
        <c:otherwise> <%-- 검색하지 않는 경우, value는 비어있어야함--%>
          <input type='text' name='intro' id='intro' value='' style='width: 20%;'>
        </c:otherwise>
      </c:choose>
      <button type='submit'>검색</button>
      <c:if test="${param.intro.length() > 0 }">  <%-- 검색 취소 부분 --%>
        <button type='button' 
                     onclick="location.href='./list_by_stuno_search_paging.do?stuno=${stuVO.stuno}&intro='">검색 취소</button>  
      </c:if>    
    </form>
  </DIV>

 <DIV class='menu_line'></DIV>
    
  <table class="table table-striped" style='width: 100%;'>
  <colgroup>
    <col style="width: 10%;"></col>
    <col style="width: 10%;"></col>
    <col style="width: 40%;"></col>
    <col style="width: 15%;"></col>
    <col style="width: 15%;"></col>
    <col style="width: 10%;"></col>
  </colgroup>
  
  <%-- table 컬럼 --%>
<thead>
    <tr>
      <th style='text-align: center;'>파일</th>
      <th style='text-align: center;'>이름</th>
      <th style='text-align: center;'>자기 소개</th>
      <th style='text-align: center;'>자격증</th>
      <th style='text-align: center;'>카카오톡 ID</th>
      <th style='text-align: center;'>기타</th>
    </tr>
  </thead> 
    
  <%-- table 내용 --%>
  <tbody>
    <c:forEach var="contentsVO" items="${list }" varStatus="status">
      <c:set var="contentsno" value="${contentsVO.contentsno }" />
      <c:set var="thumb1" value="${contentsVO.thumb1 }" />
      <c:set var="recom" value="${contentsVO.recom }" />
      
      <tr> <%-- 레코드 들 (등록일 부터~ 기타까지) --%>
        
        <td style='vertical-align: middle; text-align: center;'>
          
          <%-- 이미지(파일) 출력 고정 소스  --%>
          <c:choose>
            <c:when test="${thumb1.endsWith('jpg') || thumb1.endsWith('png') || thumb1.endsWith('gif')}">
              <IMG src="/contents/storage/${thumb1 }" style="width: 120px; height: 80px;"> 
            </c:when>
            <c:otherwise> <!-- 이미지가 아닌 일반 파일 -->
              ${contentsVO.file1}
            </c:otherwise>
          </c:choose>  <%-- 이미지 출력 고정 소스 종료 --%>
        </td>  
       
        <td style='vertical-align: middle; text-align: center;'>
          <%-- ContentProc에서 content 컬럼은 200자 이상 시...으로 설정  --%>
          <%-- String tag 사용 강조 --%>
          <a href="./read.do?contentsno=${contentsno}&now_page=${param.now_page}&intro=${param.intro }"> <strong>${contentsVO.name}</strong></a> 
        </td>   
        <td style='vertical-align: middle; text-align: center;'><strong>${contentsVO.intro}</strong></td>
        <td style='vertical-align: middle; text-align: center;'>${contentsVO.certi}</td>
        
        
        <td style='vertical-align: middle; text-align: center;'>${contentsVO.id}</td>
          <td style='vertical-align: middle; text-align: center;'>
           <A href="./update_text.do?contentsno=${contentsno }&now_page=${param.now_page}"><span class="glyphicon glyphicon-pencil"></span></A>
           <A href="./delete.do?contentsno=${contentsno }&now_page=${param.now_page}"><span class="glyphicon glyphicon-trash"></span></A>
            <br>
            <%-- 추천수 출력 --%>
            <span>
            <A id="recom_${status.count }" 
                  href="javascript:reocm_ajax(${contentsno }, ${status.count })" 
                  class="recom_link">♥(${recom })
            </A> </span>
            <!-- contentsno(숫자)와, recom(숫자) 값을 전달해줘야함
            status.count와 같이 여러개의 값을 전달할때는 숫자 값을 전달해줘야함. -->
            <!--  javascript send_recom으로 전달되는 태그의 값음 문자열''로 전달-->
            <%-- <span id="span_animation_${status.count }"></span> --%>            
            
           <%-- <A href="./personal_update.do?stuno=${param.stuno}&stugrpno=${param.stugrpno }&contentsno=${contentsno }">개인 정보</A> --%>
          </td>
      </tr>
    </c:forEach>
    
  </tbody>
 </table>
  <DIV class='bottom_menu'>${paging }</DIV> 
</DIV>

<jsp:include page="../menu/bottom.jsp" />
</body>
 
</html>