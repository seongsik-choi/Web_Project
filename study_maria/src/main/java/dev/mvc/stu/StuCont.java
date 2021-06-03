package dev.mvc.stu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.stu.StuVO;
import dev.mvc.stugrp.StugrpVO;
import dev.mvc.stu.StuVO;
import dev.mvc.stugrp.StugrpVO;
import dev.mvc.stugrp.StugrpProcInter;
import dev.mvc.stugrp.StugrpVO;

@Controller
public class StuCont {
  
  @Autowired // StugrpProcInter 인터페이스를 구현한 StugrpProc.java가 할당
  @Qualifier("dev.mvc.stugrp.StugrpProc") // proc에게 전송
  private StugrpProcInter stugrpProc; 
  
  @Autowired
  @Qualifier("dev.mvc.stu.StuProc")
  private StuProcInter stuProc;
  
  public StuCont() {
    System.out.println("-> StuCont created.");
  }
  
  /**
   * 새로고침 방지
   * @return
   */
  @RequestMapping(value="/stu/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
  
  /**
   * 등록폼 http://localhost:9091/stu/create.do?stugrpno=1
   * 
   * @return
   */
  @RequestMapping(value = "/stu/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/stu/create"); // /webapp/WEB-INF/views/stu/create.jsp

    return mav;
  }

  /**
   * 등록처리
   * http://localhost:9091/stu/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/stu/create.do", method = RequestMethod.POST)
  public ModelAndView create(StuVO stuVO) {
    ModelAndView mav = new ModelAndView();

    // System.out.println("-> stugrpno: " + stuVO.getStugrpno());
    
    int cnt = this.stuProc.create(stuVO);
    mav.addObject("cnt", cnt);
    mav.addObject("stugrpno", stuVO.getStugrpno());
    mav.addObject("name", stuVO.getName());
    mav.addObject("stuex", stuVO.getStuex());
    mav.addObject("stulo", stuVO.getStulo());
    mav.addObject("url", "/stu/create_msg");  // /stu/create_msg -> /stu/create_msg.jsp
    
    ///stu/list_by_stugrpno.do
    mav.setViewName("redirect:/stu/msg.do");
    // response.sendRedirect("/stu/msg.do");
    
    return mav;
  }
  
  // http://localhost:9091/stu/list.do?stugrpno=1 기존의 url 사용
  /**
   * [27][Stu] Stugrp 전체목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~)
   * stugrp + stu 전체 목록(조인 NO)
   * @return
   */
  @RequestMapping(value="/stu/list_all.do", method=RequestMethod.GET )
  public ModelAndView list_all() {
    ModelAndView mav = new ModelAndView();
    
    List<StuVO> list = this.stuProc.list_all();
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/stu/list_all"); // /stu/list_all.jsp
    return mav;
  }
  
  // http://localhost:9091/stu/list_by_stugrpno.do?stugrpno=1
  /**
   * [28][Stu] stugrpno별 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), 등록과 목록이 결합된 화면 제작 
   * 스터디 그룹별 전체 목록
   * @return
   */
  @RequestMapping(value="/stu/list_by_stugrpno.do", method=RequestMethod.GET )
  public ModelAndView list_by_stugrpno(int stugrpno) { // 파라미터 값 전달
    ModelAndView mav = new ModelAndView();
    
    List<StuVO> list = this.stuProc.list_by_stugrpno(stugrpno); // 객체 사용.
    mav.addObject("list", list); // request.setAttribute("list", list);

    // import + autowired하여 stugrp proc 객체 사용.
    StugrpVO stugrpVO = stugrpProc.read(stugrpno); // 스터디  그룹 정보
    mav.addObject("stugrpVO", stugrpVO);
    
    mav.setViewName("/stu/list_by_stugrpno"); // /stu/list_by_stugrpno.jsp
    return mav;
  }
  
  // http://localhost:9091/stu/list_all_join.do
  /**
   * list.all 기반 수정
   * [29][Stu] Stugrp + Stu join 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), 등록과 목록이 결합된 화면 제작
   * stugrp + stu join JOIN 목록
   * @return
   */
  @RequestMapping(value="/stu/list_all_join.do", method=RequestMethod.GET )
  public ModelAndView list_all_join() {
    ModelAndView mav = new ModelAndView();
    
    List<Stugrp_StuVO> list = this.stuProc.list_all_join();
    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/stu/list_all_join"); // /stu/list_all_join.jsp
    return mav;
  }   
  
  /**
   * [30][Stu] Stu 조회 + 수정폼, 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~ ) 
   * 조회 + 수정폼 http://localhost:9091/stu/read_update.do
   * @return
   */
  @RequestMapping(value = "/stu/read_update.do", method = RequestMethod.GET)
  public ModelAndView read_update(int stuno, int stugrpno) { // 변수 2개 전달 -> 자동으로 requestgetParameter
    // int stuno = Integer.parseInt(request.getParameter("stuno")); //  자동으로 수행
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/stu/read_update"); // read_update.jsp

    StugrpVO stugrpVO =  this.stugrpProc.read(stugrpno);
    mav.addObject("stugrpVO", stugrpVO);  // request.setAttritube("stugrpVO", stugrpVO);
    
    StuVO stuVO = this.stuProc.read(stuno);
    mav.addObject("stuVO", stuVO);  // request.setAttritube("stuVO", stuVO);

    List<StuVO> list = this.stuProc.list_by_stugrpno(stugrpno); // FK(stugrpno)를 가지고 StuProc에서 목록가져오기
    mav.addObject("list", list);

    return mav; // forward
  }
  
  /**
   * 수정 처리
   * [30][Stu] Stu 조회 + 수정폼, 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~ ) 
   * @param stuVO
   * @return
   */
  @RequestMapping(value = "/stu/update.do", method = RequestMethod.POST)
  public ModelAndView update(StuVO stuVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.stuProc.update(stuVO);
    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("stuno", stuVO.getStuno());    
    
    mav.addObject("stugrpno", stuVO.getStugrpno());
    mav.addObject("name", stuVO.getName());      
    mav.addObject("stuex", stuVO.getStuex());      
    mav.addObject("stulo", stuVO.getStulo());       

    mav.addObject("url", "/stu/update_msg");  // /stu/create_msg -> /stu/update_msg.jsp로 최종 실행됨.
    
    mav.setViewName("redirect:/stu/msg.do");
    
    return mav;
  }    
  
  
  /**
   * [31][Stu] Stu 삭제 기능의 제작(DELETE ~ WHERE)~
   * 조회 + 삭제폼 http://localhost:9091/stu/read_delete.do
   * @return
   */
  @RequestMapping(value = "/stu/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int stuno, int stugrpno) { // 변수 2개 전달 -> 자동으로 requestgetParameter
    // int stuno = Integer.parseInt(request.getParameter("stuno")); //  자동으로 수행
    // int stugrpno = Integer.parseInt(request.getParameter("stugrpno")); //  자동으로 수행
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/stu/read_delete"); // read_delete.jsp

    StugrpVO stugrpVO =  this.stugrpProc.read(stugrpno);
    mav.addObject("stugrpVO", stugrpVO);  // request.setAttritube("stugrpVO", stugrpVO);
    
    StuVO stuVO = this.stuProc.read(stuno);
    mav.addObject("stuVO", stuVO);  // request.setAttritube("stuVO", stuVO);

    List<StuVO> list = this.stuProc.list_by_stugrpno(stugrpno); // FK(stugrpno)를 가지고 StuProc에서 목록가져오기
    mav.addObject("list", list);

    return mav; // forward
  }  

    /**
   * 삭제처리(수정처리 기반)
   * [31][Stu] Stu 삭제 기능의 제작(DELETE ~ WHERE)~
   * @param stuVO
   * @return
   */
  @RequestMapping(value = "/stu/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int stuno, int stugrpno) {
    ModelAndView mav = new ModelAndView();
    
 // 삭제될 레코드 정보를 삭제하기전에 읽음.
    StuVO stuVO = this.stuProc.read(stuno); 
    
    int cnt = this.stuProc.delete(stuno);
    
    mav.addObject("cnt", cnt); // request에 저장
    mav.addObject("stuno", stuVO.getStuno()); 
    mav.addObject("stugrpno", stuVO.getStugrpno());
    mav.addObject("name", stuVO.getName()); 
    
    mav.addObject("stuex", stuVO.getStuex());   
    mav.addObject("stulo", stuVO.getStulo()); 
    mav.addObject("url", "/stu/delete_msg");  // /stu/delete_msg.jsp로 최종 실행됨.
    
    mav.setViewName("redirect:/stu/msg.do"); // 새로고침 문제해결, request 초기화
    
    return mav;
  }    
  
  /**
   * stugrpno가 같은 모든 레코드 삭제
   * 
   * @param stuVO
   * @return
   */
  @RequestMapping(value = "/stu/delete_by_stugrpno.do", method = RequestMethod.POST)
  public ModelAndView delete_by_stugrpno(int stugrpno) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.stuProc.delete_by_stugrpno(stugrpno);
    
    mav.addObject("stugrpno", stugrpno);

    mav.setViewName("redirect:/stu/list_by_stugrpno.do"); // 새로고침 문제 해결, request 초기화
    return mav;
  }    
}