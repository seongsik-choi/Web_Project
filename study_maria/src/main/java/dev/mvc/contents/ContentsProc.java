package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.contents.ContentsProc")
  public class ContentsProc implements ContentsProcInter {
    @Autowired
    private ContentsDAOInter contentsDAO;

    // [36][Contents] 등록 기능 제작(INSERT ~ INTO ~ VALUES ~)
    @Override
    public int create(ContentsVO contentsVO) {
       int cnt=this.contentsDAO.create(contentsVO);
      return cnt;
    }

    // [37][Contents] 테이블 이미지 기반 stuno별 목록 출력 변경(list_by_stuno.do)
    @Override
    public List<ContentsVO> list_by_stuno(int stuno) {
      List<ContentsVO> list = this.contentsDAO.list_by_stuno(stuno);
      for(ContentsVO contentsVO : list) {       // intro 컬럼(자기 소개)이 200자 이상 시 ... 표시로 출력되게하기
        String intro = contentsVO.getIntro(); // 내용을 가져와서
        if(intro.length() > 150) {
          intro = intro.substring(0, 150) + "...";  
          contentsVO.setIntro(intro);
        }// if end
      }// for end
      return list;
    }

    // [38][Contents] 검색 기능을 지원하는 목록
    @Override
    public List<ContentsVO> list_by_stuno_search(HashMap<String, Object> hashMap) {
      List<ContentsVO> list = contentsDAO.list_by_stuno_search(hashMap);
      for(ContentsVO contentsVO : list) {       // content 컬럼(내용)이 200자 이상 시 ... 표시로 출력되게하기
        String intro = contentsVO.getIntro(); // 내용을 가져와서
        if(intro.length() > 150) {
          intro = intro.substring(0, 150) + "...";  
          contentsVO.setIntro(intro);
        }// if end
      }// for end
      return list;
    }

  // [38][Contents] 검색된 레코드의 갯수
  @Override
  public int search_count(HashMap<String, Object> hashMap) {
    int count = contentsDAO.search_count(hashMap);
    return count;
  }    
     
  /** 
   *  [40][Contents] 페이징, SQL, DAO, Process, list_by_stuno_search_paging.jsp 
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param list_file 목록 파일명 
   * @param stuno 카테고리번호 
   * @param search_count 검색(전체) 레코드수 
   * @param now_page     현재 페이지
   * @param intro 검색어
   * @return 페이징 생성 문자열
   */ 
  @Override
  public String pagingBox(String list_file, int stuno, int search_count, int now_page, String intro){ 
    int total_page = (int)(Math.ceil((double)search_count/Contents.RECORD_PER_PAGE)); // 전체 페이지 수 
    int total_grp = (int)(Math.ceil((double)total_page/Contents.PAGE_PER_BLOCK)); // 전체 그룹  수
    int now_grp = (int)(Math.ceil((double)now_page/Contents.PAGE_PER_BLOCK));  // 현재 그룹 번호
    
    // 1 group: 1 2 3
    // 2 group: 4 5 6
    // 3 group: 7 8 9
    int start_page = ((now_grp - 1) * Contents.PAGE_PER_BLOCK) + 1; // 특정 그룹의 시작  페이지  
    int end_page = (now_grp * Contents.PAGE_PER_BLOCK);               // 특정 그룹의 마지막 페이지   
     
    StringBuffer str = new StringBuffer(); 
     
    str.append("<style type='text/css'>"); 
    str.append("  #paging {text-align: center; margin-top: 5px; font-size: 1em;}"); 
    str.append("  #paging A:link {text-decoration:none; color:black; font-size: 1em;}"); 
    str.append("  #paging A:hover{text-decoration:none; background-color: #FFFFFF; color:black; font-size: 1em;}"); 
    str.append("  #paging A:visited {text-decoration:none;color:black; font-size: 1em;}"); 
    str.append("  .span_box_1{"); 
    str.append("    text-align: center;");    
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("  .span_box_2{"); 
    str.append("    text-align: center;");    
    str.append("    background-color: #668db4;"); 
    str.append("    color: #FFFFFF;"); 
    str.append("    font-size: 1em;"); 
    str.append("    border: 1px;"); 
    str.append("    border-style: solid;"); 
    str.append("    border-color: #cccccc;"); 
    str.append("    padding:1px 6px 1px 6px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("    margin:1px 2px 1px 2px; /*위, 오른쪽, 아래, 왼쪽*/"); 
    str.append("  }"); 
    str.append("</style>"); 
    str.append("<DIV id='paging'>"); 
//      str.append("현재 페이지: " + nowPage + " / " + totalPage + "  "); 
 
    // 이전 10개 페이지로 이동
    // now_grp: 1 (1 ~ 10 page)
    // now_grp: 2 (11 ~ 20 page)
    // now_grp: 3 (21 ~ 30 page) 
    // 현재 2그룹일 경우: (2 - 1) * 10 = 1그룹의 마지막 페이지 10
    // 현재 3그룹일 경우: (3 - 1) * 10 = 2그룹의 마지막 페이지 20
    int _now_page = (now_grp - 1) * Contents.PAGE_PER_BLOCK;  
    if (now_grp >= 2){ // 현재 그룹번호가 2이상이면 이전 그룹으로 갈수 있는 링크 생성 
      str.append("<span class='span_box_1'><A href='"+list_file+"?&intro="+intro+"&now_page="+_now_page+"&stuno="+stuno+"'>이전</A></span>"); 
    } 
 
    // 중앙의 페이지 목록
    for(int i=start_page; i<=end_page; i++){ 
      if (i > total_page){ // 마지막 페이지를 넘어갔다면 페이 출력 종료
        break; 
      } 
  
      if (now_page == i){ // 목록에 출력하는 페이지가 현재페이지와 같다면 CSS 강조(차별을 둠)
        str.append("<span class='span_box_2'>"+i+"</span>"); // 현재 페이지, 강조 
      }else{
        // 현재 페이지가 아닌 페이지는 이동이 가능하도록 링크를 설정
        str.append("<span class='span_box_1'><A href='"+list_file+"?intro="+intro+"&now_page="+i+"&stuno="+stuno+"'>"+i+"</A></span>");   
      } 
    } 
 
    // 10개 다음 페이지로 이동
    // nowGrp: 1 (1 ~ 10 page),  nowGrp: 2 (11 ~ 20 page),  nowGrp: 3 (21 ~ 30 page) 
    // 현재 1그룹일 경우: (1 * 10) + 1 = 2그룹의 시작페이지 11
    // 현재 2그룹일 경우: (2 * 10) + 1 = 3그룹의 시작페이지 21
    _now_page = (now_grp * Contents.PAGE_PER_BLOCK)+1;  
    if (now_grp < total_grp){ 
      str.append("<span class='span_box_1'><A href='"+list_file+"?&intro="+intro+"&now_page="+_now_page+"&stuno="+stuno+"'>다음</A></span>"); 
    } 
    str.append("</DIV>"); 
       
      return str.toString(); 
    }
 
    @Override
    public List<ContentsVO> list_by_stuno_search_paging(HashMap<String, Object> map) {
      /* 
    페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작
    1 페이지 시작 rownum: now_page = 1, (1 - 1) * 10 --> 0 
    2 페이지 시작 rownum: now_page = 2, (2 - 1) * 10 --> 10
    3 페이지 시작 rownum: now_page = 3, (3 - 1) * 10 --> 20
    */
    int begin_of_page = ((Integer)map.get("now_page") - 1) * Contents.RECORD_PER_PAGE;
   
// ★★★★Mariadb는 이부분 대신에 offset에 대한 다른 값들 들어감   
    // 시작 rownum 결정
    // 1 페이지 = 0 + 1, 2 페이지 = 10 + 1, 3 페이지 = 20 + 1 
    int offset = ((Integer)map.get("now_page") - 1) * Contents.RECORD_PER_PAGE;
    System.out.println("-> offset: " + offset);
    
    map.put("offset", offset);
    map.put("page_size", Contents.RECORD_PER_PAGE);
    System.out.println("-> page_size: " + Contents.RECORD_PER_PAGE);
// ★★★★Mariadb는 이부분 대신에 offset에 대한 다른 값들 들어감 (종료)

    List<ContentsVO> list = this.contentsDAO.list_by_stuno_search_paging(map);
    for(ContentsVO contentsVO : list) {       // content 컬럼(내용)이 200자 이상 시 ... 표시로 출력되게하기
      String intro = contentsVO.getIntro(); // 내용을 가져와서
      if(intro.length() > 150) {
        intro = intro.substring(0, 150) + "...";  
        contentsVO.setIntro(intro);
      }// if end
      
        String name = Tool.convertChar(contentsVO.getName()); // 7729 추가
        contentsVO.setName(name);  // 7729 추가
      
         intro = Tool.convertChar(intro); // 7729 추가
         contentsVO.setIntro(intro);  // 7729 추가
    }// for end 
    return list;
  }
  
  // 43, 44의 연속입력은 기능이 없음으로 pass    
    
   // [41.5] 그리드 페이징
  @Override
  public List<ContentsVO> list_by_stuno_grid_paging(HashMap<String, Object> map) {
    /* 
    페이지에서 출력할 시작 레코드 번호 계산 기준값, nowPage는 1부터 시작
    1 페이지 시작 rownum: now_page = 1, (1 - 1) * 10 --> 0 
    2 페이지 시작 rownum: now_page = 2, (2 - 1) * 10 --> 10
    3 페이지 시작 rownum: now_page = 3, (3 - 1) * 10 --> 20
    */
    int begin_of_page = ((Integer)map.get("now_page") - 1) * Contents.RECORD_PER_PAGE;
   
    //★★★★Mariadb는 이부분 대신에 offset에 대한 다른 값들 들어감   
    // 시작 rownum 결정
    // 1 페이지 = 0 + 1, 2 페이지 = 10 + 1, 3 페이지 = 20 + 1 
    int offset = ((Integer)map.get("now_page") - 1) * Contents.RECORD_PER_PAGE;
    System.out.println("-> offset: " + offset);
    
    map.put("offset", offset);
    map.put("page_size", Contents.RECORD_PER_PAGE);
    System.out.println("-> page_size: " + Contents.RECORD_PER_PAGE);
    //★★★★Mariadb는 이부분 대신에 offset에 대한 다른 값들 들어감 (종료)

    List<ContentsVO> list = this.contentsDAO.list_by_stuno_grid_paging(map);
    return list;
  }  
    
  /**
   * [42,5][Contents] 조회 기능의 제작 
   */
  @Override
  public ContentsVO read(int contentsno) {
    ContentsVO contentsVO = this.contentsDAO.read(contentsno);
    
    String name = contentsVO.getName();
    String intro = contentsVO.getIntro();
    
     name = Tool.convertChar(name);  // 특수 문자 처리
     intro = Tool.convertChar(intro); 
    
    contentsVO.setName(name);
    contentsVO.setIntro(intro);  
    
    long size1 = contentsVO.getSize1();
    contentsVO.setSize1_label(Tool.unit(size1));
    
    return contentsVO;
  }


   /**
    * [46] 텍스트 수정용 조회
    * ContentsDAOInter interface에 존재하지 않는 메소드 선언 -> 태그 출력 문제 해결
    */
   @Override
   public ContentsVO read_update_text(int contentsno) {
     ContentsVO contentsVO = this.contentsDAO.read(contentsno);
     return contentsVO;
   }
   
   // [46] 텍스트 정보 수정
   @Override
   public int update_text(ContentsVO contentsVO) {
     int cnt = this.contentsDAO.update_text(contentsVO);
     return cnt;
   }

   // [47] 파일 정보 수정
  @Override
  public int update_file(ContentsVO contentsVO) {
   int cnt = this.contentsDAO.update_file(contentsVO);
   return cnt;
  } 
  
  // [48] 삭제 기능 제작
  @Override
  public int delete(int contentsno) {
    int cnt = this.contentsDAO.delete(contentsno);
    return cnt;
  }
  
  @Override
  public int checkID(String id) {
    int cnt = this.contentsDAO.checkID(id);
    return cnt;
  }
  
  @Override
  public int checkNAME(String name) {
    int cnt = this.contentsDAO.checkID(name);
    return cnt;
  }
  
  // recom(추천수) AJAX
  @Override
  public int update_recom(int contentsno) {
    int cnt = this.contentsDAO.update_recom(contentsno);
    return cnt;
  }      
  

}