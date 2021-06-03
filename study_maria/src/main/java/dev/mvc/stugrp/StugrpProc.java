/*
Process class
- @Component("dev.mvc.stugrp.StugrpProc"): 자동으로 객체 생성이 필요한 Class에만 선언 가능
1) DI(Dependency Injection: 의존 주입)의 구현
  필요한 객체를 개발자는 선언만하고 객체 생성은 Framework

2) 스프링이 빈을 자동으로 생성 선언
   @Component("dev.mvc.stugrp.StugrpProc")
   public class CategrpProc implements CategrpProcInter {
 */
package dev.mvc.stugrp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// Controller에서 AutoWired 기능에 의해 호출될때 사용되는 이름
@Component("dev.mvc.stugrp.StugrpProc")   
public class StugrpProc implements StugrpProcInter {
  @Autowired  //  DI, Spring framework가 자동 구현한 DAO class 객체를 할당.
  private StugrpDAOInter stugrpDAO;
  // private StugrpDAOInter stugrpDAO = new stugrpDAO();
  // interface는 객체 생성할 수 없기에 인터페이스 = new 구현클래스()
  
  // [15][Stugrp] Stugrp 등록 기능 제작(INSERT~)
  @Override
  public int create(StugrpVO stugrpVO) {
    int cnt = stugrpDAO.create(stugrpVO);
    return cnt;  // 등록한 레코드 갯수 리턴
  }
  
  // [16][Stugrp] Stugrp 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), Bootstrap 적용, 등록 기능의 결합
  @Override
  public List<StugrpVO> list_stugrpno_asc() {
    List<StugrpVO> list = null;
    list = this.stugrpDAO.list_stugrpno_asc();
    return list;
  }
  
  // LIKE
  @Override
 public List<StugrpVO> read1() {
   List<StugrpVO> list = null;
   list = this.stugrpDAO.read1();
   return list;
 }

  // [22][Stugrp] 출력 순서별 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), redirect의 적용
  @Override
  public List<StugrpVO> list_seqno_asc() {
    List<StugrpVO> list = null;
    list = this.stugrpDAO.list_seqno_asc();
    return list;
  }  
  
  // [17][Stugrp] Stugrp 조회, 수정폼 기능의 제작, JSP 수정과 목록의 결합  : 조회폼
  // [19][Stugrp] Stugrp 삭제 폼 기능의 제작, JSP 삭제와 목록의 결합  : 삭제폼
  @Override
  public StugrpVO read(int stugrpno) {
    StugrpVO stugrpVO = null;
    stugrpVO = this. stugrpDAO.read(stugrpno);
    
    return  stugrpVO;
  }
 
  
  // [18][Stugrp] Stugrp 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~) : 수정처리
  @Override
  public int update(StugrpVO stugrpVO) {
    int cnt = 0;
    cnt = this.stugrpDAO.update(stugrpVO);
    return cnt;
  }

  // [20][Stugrp] Stugrp 삭제 처리 기능의 제작(DELETE FROM처~ WHERE ~)  : 삭제처리
  @Override
  public int delete(int stugrpno) {
    int cnt = 0;
    cnt = this.stugrpDAO.delete(stugrpno);
    return cnt;
  }

  // [21][Stugrp] Stugrp 출력 순서의 변경 제작(UPDATE ~ SET ~ WHERE ~)
  @Override
  public int update_seqno_up(int stugrpno) {
    int cnt = 0;
    cnt = this.stugrpDAO.update_seqno_up(stugrpno);
    return cnt;
  }
  
  // [21][Stugrp] Stugrp 출력 순서의 변경 제작(UPDATE ~ SET ~ WHERE ~)
  @Override
  public int update_seqno_down(int stugrpno) {
    int cnt = 0;
    cnt = this.stugrpDAO.update_seqno_down(stugrpno);    
    return cnt;
  }
   
}