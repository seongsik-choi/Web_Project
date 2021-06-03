package dev.mvc.favgrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dev.mvc.favgrp.FavgrpVO;
import dev.mvc.favgrp.FavgrpVO;
import dev.mvc.favgrp.FavgrpVO;

//Autowired 기능에의해 자동 할당될 때 사용되는 이름
@Component("dev.mvc.favgrp.FavgrpProc")
public class FavgrpProc implements FavgrpProcInter {
  @Autowired  // DI: Spring 자동으로 구현한 DAO class 객체를 할당
  private FavgrpDAOInter favgrpDAO;
  // private FavgrpDAOInter favgrpDAO = new FavgrpDAO();

  // [15]_등록
  @Override
  public int create(FavgrpVO favgrpVO) {
    int cnt = favgrpDAO.create(favgrpVO);
    
    return cnt;
  }

  // [16][Favgrp] Favgrp 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), Bootstrap 적용, 등록 기능의 결합
  @Override
  public List<FavgrpVO> list_favgrpno_asc() {
    List<FavgrpVO> list = null;
    list = this.favgrpDAO.list_favgrpno_asc();
    return list;
  }
  
  // [17][Favgrp] Favgrp 조회, 수정폼 기능의 제작, JSP 수정과 목록의 결합  : 조회폼
  // [19][Favgrp] Favgrp 삭제 폼 기능의 제작, JSP 삭제와 목록의 결합  : 삭제폼
  @Override
  public FavgrpVO read(int favgrpno) {
    FavgrpVO favgrpVO = null;
    favgrpVO = this. favgrpDAO.read(favgrpno);
    return  favgrpVO;
  }
  
  // [18][Favgrp] Favgrp 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~) : 수정처리
  @Override
  public int update(FavgrpVO favgrpVO) {
    int cnt = 0;
    cnt = this.favgrpDAO.update(favgrpVO);
    return cnt;
  }
  
  // [20][Favgrp] Favgrp 삭제 처리 기능의 제작(DELETE FROM처~ WHERE ~)  : 삭제처리
  @Override
  public int delete(int favgrpno) {
    int cnt = 0;
    cnt = this.favgrpDAO.delete(favgrpno);
    return cnt;
  }
}