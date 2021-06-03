package dev.mvc.contents;

import java.util.HashMap;
import java.util.List;

public interface ContentsProcInter {
  /**
   * [36][Contents] 등록 기능 제작(INSERT ~ INTO ~ VALUES ~)
   * 등록
   * @param contentsVO
   * @return
   */
  public int create(ContentsVO contentsVO);

  /**
   * [37][Contents] 테이블 이미지 기반 stuno별 목록 출력 변경(list_by_stuno.do)
   * + 그리드
   * 특정 스터디의 등록된 글목록
   * @return
   */
  public List<ContentsVO> list_by_stuno(int stuno);
  
  /**
   * [38][Contents] 검색 기능을 지원하는 목록
   * 스터디별 검색 목록
   * @param hashMap
   * @return
   */
  public List<ContentsVO> list_by_stuno_search(HashMap<String, Object> hashMap);

  /**
   * [38][Contents] 검색된 레코드의 갯수
   * 스터디별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);  
  
  /**
  * [40][Contents] 페이징, SQL, DAO, Process, list_by_stuno_search_paging.jsp 
  * 검색 + 페이징 목록
  * @param map
  * @return
  */
 public List<ContentsVO> list_by_stuno_search_paging(HashMap<String, Object> map);

 /**
  * [40][Contents] 페이징, SQL, DAO, Process, list_by_stuno_search_paging.jsp 
  * 페이지 목록 문자열 생성, Box 형태
  * @param list_File 목록 파일명 
  * @param stugrpno 카테고리번호
  * @param search_count 검색 갯수
  * @param now_Page 현재 페이지, now_Page는 1부터 시작
  * @param intro 소개글
  * @return
  */
 public String pagingBox(String listFile, int stugrpno, int search_count, int nowPage, String intro);
 
 // 43, 44의 연속입력은 기능이 없음으로 pass  
 
 /**
  * + [41.5]  그리드 페이징
  * 특정 스터디의 등록된 글목록
  * @return
  */
 public List<ContentsVO> list_by_stuno_grid_paging(HashMap<String, Object> map);
 
 /**
  * [42,5][Contents] 조회 기능의 제작
  * 조회
  * @param contentsno
  * @return
  */
 public ContentsVO read(int contentsno);
 
 /**
  * 텍스트 수정용 조회
  * @param contentsno
  * @return
  */
 public ContentsVO read_update_text(int contentsno);

 /**
  * 텍스트 정보 수정
  * @param contentsVO
  * @return
  */
 public int update_text(ContentsVO contentsVO);

 /**
  * [47] 파일 정보 수정
  * @param contentsVO
  * @return
  */
 public int update_file(ContentsVO contentsVO);  
 
 /**
  * [48] 삭제 기능 제작
  * @param contentsno
  * @return
  */
 public int delete(int contentsno);
 
 public int checkID(String id);
 
 public int checkNAME(String name);
 
 /**
  * recom(추천수) AJAX
  * @param contentsVO
  * @return
  */
 public int update_recom(int contentsno);  
 
 
}
 