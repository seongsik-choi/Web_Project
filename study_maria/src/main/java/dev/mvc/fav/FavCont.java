package dev.mvc.fav;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.favgrp.FavgrpProcInter;
import dev.mvc.favgrp.FavgrpVO;
import dev.mvc.fav.Favgrp_FavVO;
import dev.mvc.fav.FavVO;
import dev.mvc.favgrp.FavgrpVO;
import dev.mvc.fav.FavVO;

@Controller
public class FavCont {
  
  @Autowired // FavgrpProcInter 인터페이스를 구현한 FavgrpProc.java가 할당
  @Qualifier("dev.mvc.favgrp.FavgrpProc") // proc에게 전송
  private FavgrpProcInter favgrpProc; 
  
  @Autowired
  @Qualifier("dev.mvc.fav.FavProc")
  private FavProcInter favProc;
  
  public FavCont() {
    System.out.println("-> FavCont created.");
  }
  
  /**
   * 새로고침 방지
   * @return
   */
  @RequestMapping(value="/fav/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
  
  /**
   * 등록폼 http://localhost:9091/fav/create.do?favgrpno=1
   * 
   * @return
   */
  @RequestMapping(value = "/fav/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/fav/create"); // /webapp/WEB-INF/views/fav/create.jsp

    return mav;
  }

  /**
   * 등록처리
   * http://localhost:9091/fav/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/fav/create.do", method = RequestMethod.POST)
  public ModelAndView create(FavVO favVO) {
    ModelAndView mav = new ModelAndView();

    // System.out.println("-> favgrpno: " + favVO.getFavgrpno());
    
    int cnt = this.favProc.create(favVO);
    mav.addObject("cnt", cnt);
    mav.addObject("favgrpno", favVO.getFavgrpno());
    mav.addObject("favname", favVO.getFavname());
    mav.addObject("favex", favVO.getFavex());
    mav.addObject("favli", favVO.getFavli());
    mav.addObject("url", "/fav/create_msg");  // /fav/create_msg -> /fav/create_msg.jsp
   
    mav.setViewName("redirect:/fav/msg.do");
    // response.sendRedirect("/fav/msg.do");
    return mav;
  }
  
  // http://localhost:9091/fav/list.do?favgrpno=1 기존의 url 사용
  /**
   * [27][Fav] Favgrp 전체목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~)
   * favgrp + fav 전체 목록(조인 NO)
   * @return
   */
  @RequestMapping(value="/fav/list_all.do", method=RequestMethod.GET )
  public ModelAndView list_all() {
    ModelAndView mav = new ModelAndView();
    
    List<FavVO> list = this.favProc.list_all();
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/fav/list_all"); // /fav/list_all.jsp
    return mav;
  }
  
  // http://localhost:9091/fav/list_by_favgrpno.do?favgrpno=1
  /**
   * [28][Fav] favgrpno별 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), 등록과 목록이 결합된 화면 제작 
   * 즐겨찾기 그룹별 전체 목록
   * @return
   */
  @RequestMapping(value="/fav/list_by_favgrpno.do", method=RequestMethod.GET )
  public ModelAndView list_by_favgrpno(int favgrpno) { // 파라미터 값 전달
    ModelAndView mav = new ModelAndView();
    
    List<FavVO> list = this.favProc.list_by_favgrpno(favgrpno); // 객체 사용.
    mav.addObject("list", list); // request.setAttribute("list", list);

    // import + autowired하여 favgrp proc 객체 사용.
    FavgrpVO favgrpVO = favgrpProc.read(favgrpno); // 스터디  그룹 정보
    mav.addObject("favgrpVO", favgrpVO);
    
    mav.setViewName("/fav/list_by_favgrpno"); // /fav/list_by_favgrpno.jsp
    return mav;
  }
  
  // http://localhost:9091/fav/list_all_join.do
  /**
   * list.all 기반 수정
   * [29][Fav] Favgrp + Fav join 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), 등록과 목록이 결합된 화면 제작
   * favgrp + fav join JOIN 목록
   * @return
   */
  @RequestMapping(value="/fav/list_all_join.do", method=RequestMethod.GET )
  public ModelAndView list_all_join() {
    ModelAndView mav = new ModelAndView();
    
    List<Favgrp_FavVO> list = this.favProc.list_all_join();
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/fav/list_all_join"); // /fav/list_all_join.jsp
    return mav;
  }   
  
  /**
   * [30][Fav] Fav 조회 + 수정폼, 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~ ) 
   * 조회 + 수정폼 http://localhost:9091/fav/read_update.do
   * @return
   */
  @RequestMapping(value = "/fav/read_update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int favno, int favgrpno) { // 변수 2개 전달 -> 자동으로 requestgetParameter
    // int favno = Integer.parseInt(request.getParameter("favno")); //  자동으로 수행
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/fav/read_update"); // read_update.jsp

    FavgrpVO favgrpVO =  this.favgrpProc.read(favgrpno);
    mav.addObject("favgrpVO", favgrpVO);  // request.setAttritube("favgrpVO", favgrpVO);
    
    FavVO favVO = this.favProc.read(favno);
    mav.addObject("favVO", favVO);  // request.setAttritube("favVO", favVO);

    List<FavVO> list = this.favProc.list_by_favgrpno(favgrpno); // FK(favgrpno)를 가지고 FavProc에서 목록가져오기
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * 수정 처리
   * [30][Fav] Fav 조회 + 수정폼, 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~ ) 
   * @param favVO
   * @return
   */
  @RequestMapping(value = "/fav/update.do", method = RequestMethod.POST)
  public ModelAndView update(FavVO favVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.favProc.update(favVO);
    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("favno", favVO.getFavno());      // 0414 추가
    
    mav.addObject("favgrpno", favVO.getFavgrpno());
    mav.addObject("favname", favVO.getFavname());        // 0414 추가
    
    mav.addObject("url", "/fav/update_msg");  // /fav/create_msg -> /fav/update_msg.jsp로 최종 실행됨.
    
    mav.setViewName("redirect:/fav/msg.do");
    
    return mav;
  }    
  
  /**
   * [31][Fav] Fav 삭제 기능의 제작(DELETE ~ WHERE)~
   * 조회 + 삭제폼 http://localhost:9091/fav/read_delete.do
   * @return
   */
  @RequestMapping(value = "/fav/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int favno, int favgrpno) { // 변수 2개 전달 -> 자동으로 requestgetParameter
    // int favno = Integer.parseInt(request.getParameter("favno")); //  자동으로 수행
    // int favgrpno = Integer.parseInt(request.getParameter("favgrpno")); //  자동으로 수행
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/fav/read_delete"); // read_delete.jsp

    FavgrpVO favgrpVO =  this.favgrpProc.read(favgrpno);
    mav.addObject("favgrpVO", favgrpVO);  // request.setAttritube("favgrpVO", favgrpVO);
    
    FavVO favVO = this.favProc.read(favno);
    mav.addObject("favVO", favVO);  // request.setAttritube("favVO", favVO);

    List<FavVO> list = this.favProc.list_by_favgrpno(favgrpno); // FK(favgrpno)를 가지고 FavProc에서 목록가져오기
    mav.addObject("list", list);

    return mav; // forward
  }  

    /**
   * 삭제처리(수정처리 기반)
   * [31][Fav] Fav 삭제 기능의 제작(DELETE ~ WHERE)~
   * @param favVO
   * @return
   */
  @RequestMapping(value = "/fav/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int favno, int favgrpno) {
    ModelAndView mav = new ModelAndView();
    
 // 삭제될 레코드 정보를 삭제하기전에 읽음.
    FavVO favVO = this.favProc.read(favno); 
    
    int cnt = this.favProc.delete(favno);
    
    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("favno", favVO.getFavno()); // 0414 추가
    mav.addObject("favgrpno", favVO.getFavgrpno());
    mav.addObject("favname", favVO.getFavname()); // 0414 추가
    mav.addObject("favex", favVO.getFavex()); // 0414 추가    
    mav.addObject("favli", favVO.getFavli()); // 0414 추가    
    mav.addObject("url", "/fav/delete_msg");  // /fav/delete_msg.jsp로 최종 실행됨.
    
    mav.setViewName("redirect:/fav/msg.do"); // 새로고침 문제해결, request 초기화
    
    return mav;
  }    
  
}