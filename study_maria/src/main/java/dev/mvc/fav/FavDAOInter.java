package dev.mvc.fav;

import java.util.List;

import dev.mvc.fav.FavVO;
import dev.mvc.fav.Favgrp_FavVO;

public interface FavDAOInter {
  /**
   * 등록
   * @param favVO
   * @return 등록된 갯수
   */
  public int create(FavVO favVO);
 
  /**
   * [27] 전체목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~)
   *  목록
   * @return
   */
  public List<FavVO> list_all();  

  /**
   * [28][Fav] favgrpno별 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~)
   *  favgrpno 별 목록
   * @return
   */
  public List<FavVO> list_by_favgrpno(int favgrpno);  
  
  /**
   * [29][Fav] Favgrp + Fav join 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), 등록과 목록이 결합된 화면 제작
   * JOIN 목록
   * @return
   */
  public List<Favgrp_FavVO> list_all_join();  
  
  /**
   *  [30][Fav] Fav 조회 + 수정폼, 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~ )
   * 조회, 수정폼
   * @param favno 카테고리 번호, PK
   * @return
   */
  public FavVO read(int favno);
  
  /**
   *  [30][Fav] Fav 조회 + 수정폼, 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~ )
   * 수정 처리
   * @param favVO
   * @return
   */
  public int update(FavVO favVO); 
  
  /**
   * [31][fav] fav 삭제 기능의 제작(DELETE ~ WHERE~)
   * 삭제 처리 
   * @param cateno
   * @return
   */
  public int delete(int favno);
}

