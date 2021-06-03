package dev.mvc.favgrp;

import java.util.List;

public interface FavgrpProcInter {
  /**
   * [15]등록
   * @param favgrpVO
   * @return 등록된 레코드 갯수
   */
  public int create(FavgrpVO favgrpVO);
  
  /**
   * [16][Favgrp] Favgrp 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), Bootstrap 적용, 등록 기능의 결합
   * 등록 순서별 목록
   * @return
   */
  public List<FavgrpVO> list_favgrpno_asc();

  /**
   * [17][Favgrp] Favgrp 조회, 수정폼 기능의 제작, JSP 수정과 목록의 결합  : 조회폼
   * [19][Favgrp] Favgrp 삭제 폼 기능의 제작, JSP 삭제와 목록의 결합  : 삭제폼
   * 조회, 수정폼, 삭제폼1
   * @param favgrpno 카테고리 그룹 번호, PK
   * @return
   */
  public FavgrpVO read(int favgrpno);
  
  /**
   * [18][Favgrp] Favgrp 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~) : 수정처리
   * 수정 처리
   * @param favgrpVO
   * @return 처리된 레코드 갯수
   */
  public int update(FavgrpVO favgrpVO);
  
  /**
   * [20][Favgrp] Favgrp 삭제 처리 기능의 제작(DELETE FROM처~ WHERE ~)  : 삭제처리
   * 삭제 처리
   * @param favgrpno
   * @return 처리된 레코드 갯수
   */
  public int delete(int favgrpno);
}
