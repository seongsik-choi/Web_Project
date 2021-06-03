package dev.mvc.stu;

import java.util.List;

public interface StuProcInter {
  /**
   * 등록
   * @param stuVO
   * @return 등록된 갯수
   */
  public int create(StuVO stuVO);
  
  /**
   * [27] 전체목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~)
   *  목록
   * @return
   */
  public List<StuVO> list_all();  
  
  /**
   * [28][Stu] stugrpno별 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), 등록과 목록이 결합된 화면 제작 
   *  stugrpno 별 목록
   * @return
   */
  public List<StuVO> list_by_stugrpno(int stugrpno);  
  
  /**
   * [29][Stu] Stugrp + Stu join 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), 등록과 목록이 결합된 화면 제작
   * JOIN 목록
   * @return
   */
  public List<Stugrp_StuVO> list_all_join();  
  
  /**
   *  [30][Stu] Stu 조회 + 수정폼, 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~ )
   * 조회, 수정폼
   * @param stuno 카테고리 번호, PK
   * @return
   */
  public StuVO read(int stuno);
  
  /**
   *  [30][Stu] Stu 조회 + 수정폼, 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~ )
   * 수정 처리
   * @param stuVO
   * @return
   */
  public int update(StuVO stuVO); 
  
  /**
   * [31][stu] stu 삭제 기능의 제작(DELETE ~ WHERE~)
   * 삭제 처리 
   * @param stuno
   * @return
   */
  public int delete(int stuno);
  
  /**
   * 스터디 그룹별 레코드 번호
   * @param stugrpno
   * @return
   */
  public int count_by_stugrpno(int stugrpno);    
  
  /**
   * stugrpno가 같은 모든 레코드 삭제
   * @param stugrpno
   * @return 처리된 레코드 갯수
   */
  public int delete_by_stugrpno(int stugrpno);    
}
 