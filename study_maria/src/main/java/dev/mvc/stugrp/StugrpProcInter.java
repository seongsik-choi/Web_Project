/*
- Process interface(Manager, Service): DBMS 접속이 아닌 알고리즘 및 제어문 선언
1) DAO Interface의 많은 메소드가 Process Interface에서 재사용
 */
package dev.mvc.stugrp;
import java.util.List;

public interface StugrpProcInter {
  /**
   * [15][Stugrp] Stugrp 등록 기능 제작(INSERT~)
   * 등록
   * @param categrpVO
   * @return 등록된 레코드 갯수
   */
  public int create(StugrpVO stugrpVO);
  
  
  /**
   * [16][Stugrp] Stugrp 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), Bootstrap 적용, 등록 기능의 결합
   * 등록 순서별 목록
   * @return
   */
  public List<StugrpVO> list_stugrpno_asc();

  public List<StugrpVO> read1();
  
  /**
   * [22][Stugrp] 출력 순서별 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), redirect의 적용
   * 출력 순서별 목록
   * @return
   */
  public List<StugrpVO> list_seqno_asc();
    
  
  /**
   * [17][Stugrp] Stugrp 조회, 수정폼 기능의 제작, JSP 수정과 목록의 결합  : 조회폼
   * [19][Stugrp] Stugrp 삭제 폼 기능의 제작, JSP 삭제와 목록의 결합  : 삭제폼
   * 조회, 수정폼, 삭제폼1
   * @param categrpno 카테고리 그룹 번호, PK
   * @return
   */
  public StugrpVO read(int stugrpno);

  /**
   * [18][Stugrp] Stugrp 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~) : 조회처리
   * @param stugrpVO
   * @return 처리된 레코드 갯수
   */
  public int update(StugrpVO stugrpVO);

  
  /**
   * [20][Stugrp] Stugrp 삭제 처리 기능의 제작(DELETE FROM처~ WHERE ~)  : 삭제처리
   * 삭제 처리
   * @param stugrpno
   * @return 처리된 레코드 갯수
   */
  public int delete(int stugrpno);
 
  
  /**
   * [21][Stugrp] Stugrp 출력 순서의 변경 제작(UPDATE ~ SET ~ WHERE ~)
   * 출력 순서 상향
   * @param stugrpno
   * @return 처리된 레코드 갯수
   */
  public int update_seqno_up(int stugrpno);
 
  
  /**
   * [21][Stugrp] Stugrp 출력 순서의 변경 제작(UPDATE ~ SET ~ WHERE ~)
   * 출력 순서 하향
   * @param stugrpno
   * @return 처리된 레코드 갯수
   */
  public int update_seqno_down(int stugrpno); 

    
  
}