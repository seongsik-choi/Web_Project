package dev.mvc.stu;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.stu.StuVO;


@Component("dev.mvc.stu.StuProc")
public class StuProc implements StuProcInter {

  @Autowired
  private StuDAOInter stuDAO;
 
  public StuProc() {
    System.out.println("-> StuProc created");
  }
  
  // [26]_INSERT레코드 추가 : create, create_msg
  @Override
  public int create(StuVO stuVO) {
    int cnt = this.stuDAO.create(stuVO);
    return cnt;
  }

  // [27] 전체목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~)
  @Override
  public List<StuVO> list_all() {
    List<StuVO> list = this.stuDAO.list_all();
    return list;
  }

  // [28][Stu] stugrpno별 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), 등록과 목록이 결합된 화면 제작 
  @Override
  public List<StuVO> list_by_stugrpno(int stugrpno) {
    List<StuVO> list = this.stuDAO.list_by_stugrpno(stugrpno);
    return list;
  }
  
  // [29] Join
  @Override
  public List<Stugrp_StuVO> list_all_join() {
    List<Stugrp_StuVO> list = this.stuDAO.list_all_join();
    return list;
  }
  
  // [30][Stu] Stu 조회 + 수정폼, 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~ )
  @Override
  public StuVO read(int stuno) {
    StuVO stuVO = this.stuDAO.read(stuno);
    return stuVO;
  }

  // [30][Stu] Stu 조회 + 수정폼, 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~ )
  @Override
  public int update(StuVO stuVO) {
    int cnt = this.stuDAO.update(stuVO);
    return cnt;
  }
  
  // [31][stu] stu 삭제 기능의 제작(DELETE ~ WHERE~)
  @Override
  public int delete(int stuno) {
    int cnt = this.stuDAO.delete(stuno);
    return cnt;
  }

  // 스터디 그룹별 레코드 버호
  @Override
  public int count_by_stugrpno(int stugrpno) {
    int cnt = this.stuDAO.count_by_stugrpno(stugrpno); // 자기자신을 호출
    return cnt;
  }

  // stugrpno가 같은 모든 레코드 삭제
  @Override
  public int delete_by_stugrpno(int stugrpno) {
    int cnt = this.stuDAO.delete_by_stugrpno(stugrpno);
    return cnt;
  }  
  
}