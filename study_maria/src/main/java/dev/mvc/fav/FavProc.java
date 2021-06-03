package dev.mvc.fav;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.fav.FavVO;
import dev.mvc.fav.Favgrp_FavVO;
import dev.mvc.fav.FavVO;


@Component("dev.mvc.fav.FavProc")
public class FavProc implements FavProcInter {

  @Autowired
  private FavDAOInter favDAO;
 
  public FavProc() {
    System.out.println("-> FavProc created");
  }
  
  // [26]_INSERT레코드 추가 : create, create_msg
  @Override
  public int create(FavVO favVO) {
    int cnt = this.favDAO.create(favVO);
    return cnt;
  }
  
  // [27] 전체목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~)
  @Override
  public List<FavVO> list_all() {
    List<FavVO> list = this.favDAO.list_all();
    return list;
  }  

  // [28][Fav] favgrpno별 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~)
  @Override
  public List<FavVO> list_by_favgrpno(int favgrpno) {
    List<FavVO> list = this.favDAO.list_by_favgrpno(favgrpno);
    return list;
  }
  
  // [29] Join
  @Override
  public List<Favgrp_FavVO> list_all_join() {
    List<Favgrp_FavVO> list = this.favDAO.list_all_join();
    return list;
  }
  
  // [30][Fav] Fav 조회 + 수정폼, 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~ )
  @Override
  public FavVO read(int favno) {
    FavVO favVO = this.favDAO.read(favno);
    return favVO;
  }

  // [30][Fav] Fav 조회 + 수정폼, 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~ )
  @Override
  public int update(FavVO favVO) {
    int cnt = this.favDAO.update(favVO);
    return cnt;
  }
  
  // [31][fav] fav 삭제 기능의 제작(DELETE ~ WHERE~)
  @Override
  public int delete(int favno) {
    int cnt = this.favDAO.delete(favno);
    return cnt;
  }
  
}