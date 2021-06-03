package dev.mvc.favgrp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.favgrp.FavgrpVO;
import dev.mvc.favgrp.FavgrpVO;
import dev.mvc.favgrp.FavgrpVO;
import dev.mvc.favgrp.FavgrpVO;
import dev.mvc.favgrp.FavgrpVO;

@Controller
public class FavgrpCont {
  @Autowired
  @Qualifier("dev.mvc.favgrp.FavgrpProc")
  private FavgrpProcInter favgrpProc;
  
  public FavgrpCont() {
    System.out.println("-> FavgrpCont created.");
  }
  
  // http://localhost:9091/favgrp/create.do
  /**
   * [15]_등록 폼
   * @return
   */
  @RequestMapping(value="/favgrp/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/favgrp/create"); // webapp/WEB-INF/views/favgrp/create.jsp
    
    return mav; // forward
  }
  
  // http://localhost:9091/favgrp/create.do
  /**
   * [15]_등록 처리
   * @param favgrpVO
   * @return
   */
  @RequestMapping(value="/favgrp/create.do", method=RequestMethod.POST )
  public ModelAndView create(FavgrpVO favgrpVO) { // favgrpVO 자동 생성, Form -> VO
    // FavgrpVO favgrpVO <FORM> 태그의 값으로 자동 생성됨.
    // request.setAttribute("favgrpVO", favgrpVO); 자동 실행
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.favgrpProc.create(favgrpVO); // 등록 처리
    mav.addObject("cnt", cnt); // request에 저장, request.setAttribute("cnt", cnt)
    
    //mav.setViewName("/favgrp/create_msg"); // /webapp/WEB-INF/views/favgrp/create_msg.jsp
    mav.setViewName("redirect:/favgrp/list.do"); // 새로고침 방지(list.jsp 반드시 필요)
    return mav; // forward
  }
  
  //http://localhost:9091/favgrp/list.do
 /**
  * 등록 순서별 목록 : [16][Favgrp] Favgrp 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), Bootstrap 적용, 등록 기능의 결합
  * 출력 순서별 목록 : [22][Favgrp] 출력 순서별 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), redirect의 적용
  * @return
  */
 @RequestMapping(value="/favgrp/list.do", method=RequestMethod.GET )
 public ModelAndView list() {
   ModelAndView mav = new ModelAndView();
   
   // [16]등록 순서별 출력
    List<FavgrpVO> list = this.favgrpProc.list_favgrpno_asc();
   
   // [22] 출력 순서별 출력
  // List<FavgrpVO> list = this.favgrpProc.list_seqno_asc();

   mav.addObject("list", list); // request.setAttribute("list", list);
   mav.setViewName("/favgrp/list"); // /webapp/WEB-INF/views/favgrp/list.jsp
   return mav;
 }
 
 // http://localhost:9091/favgrp/read_update.do
 /**
  * [17][Favgrp] Favgrp 조회, 수정폼 기능의 제작, JSP 수정과 목록의 결합  : 조회폼
  * 조회 + 수정폼
  * @param favgrpno 조회할 카테고리 번호
  * @return
  */
 @RequestMapping(value="/favgrp/read_update.do", method=RequestMethod.GET )
 public ModelAndView read_update(int favgrpno) {
   // request.setAttribute("favgrpno", int favgrpno) 작동 안됨.
   
   ModelAndView mav = new ModelAndView();
   
   FavgrpVO favgrpVO = this.favgrpProc.read(favgrpno);
   mav.addObject("favgrpVO", favgrpVO);  // request 객체에 저장
   
   List<FavgrpVO> list = this.favgrpProc.list_favgrpno_asc();
   mav.addObject("list", list);  // request 객체에 저장

   mav.setViewName("/favgrp/read_update"); // /WEB-INF/views/favgrp/read_update.jsp 
   return mav; // forward
 } 
 
 // http://localhost:9091/favgrp/update.do
 /**
  * [18][Favgrp] Favgrp 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~) : 수정처리
  * 수정 처리
  * @param favgrpVO
  * @return
  */
 @RequestMapping(value="/favgrp/update.do", method=RequestMethod.POST )
 public ModelAndView update(FavgrpVO favgrpVO) {
   // FavgrpVO favgrpVO <FORM> 태그의 값으로 자동 생성됨.
   // request.setAttribute("favgrpVO", favgrpVO); 자동 실행
   
   ModelAndView mav = new ModelAndView();
   
   int cnt = this.favgrpProc.update(favgrpVO);
   mav.addObject("cnt", cnt); // request에 저장
   
   mav.setViewName("/favgrp/update_msg"); // update_msg.jsp   
   return mav;
 } 
 
 // http://localhost:9091/favgrp/read_delete.do
 /**
  * [19][Favgrp] Favgrp 삭제 폼 기능의 제작, JSP 삭제와 목록의 결합  : 삭제폼
  * 조회 + 삭제폼
  * @param favgrpno 조회할 카테고리 번호
  * @return
  */
 @RequestMapping(value="/favgrp/read_delete.do", method=RequestMethod.GET )
 public ModelAndView read_delete(int favgrpno) {
   ModelAndView mav = new ModelAndView();
   
   FavgrpVO favgrpVO = this.favgrpProc.read(favgrpno); // 삭제할 자료 읽기(read함수 공유)
   mav.addObject("favgrpVO", favgrpVO);  // request 객체에 저장
   
   List<FavgrpVO> list = this.favgrpProc.list_favgrpno_asc();
   mav.addObject("list", list);  // request 객체에 저장

   mav.setViewName("/favgrp/read_delete"); // read_delete.jsp
   return mav;
 }   
 
 // http://localhost:9091/favgrp/delete.do
 /**
  * [20][Favgrp] Favgrp 삭제 처리 기능의 제작(DELETE FROM처~ WHERE ~)  : 삭제처리
  * 삭제처리
  * @param favgrpno 조회할 스터디 번호
  * @return
  */
 @RequestMapping(value="/favgrp/delete.do", method=RequestMethod.POST )
 public ModelAndView delete(int favgrpno) {
   ModelAndView mav = new ModelAndView();
   
   FavgrpVO favgrpVO = this.favgrpProc.read(favgrpno); // 삭제 정보
   mav.addObject("favgrpVO", favgrpVO);  // request 객체에 저장
   
   int cnt = this.favgrpProc.delete(favgrpno); // 삭제 처리
   mav.addObject("cnt", cnt);  // request 객체에 저장
   
   mav.setViewName("/favgrp/delete_msg"); // delete_msg.jsp

   return mav;
 } 
 
 
}