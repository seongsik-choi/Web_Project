/*
Controller
- View와의 연동을 통해 Method() 구현
 */
package dev.mvc.stugrp;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.stu.StuProcInter;

@Controller
public class StugrpCont {
  @Autowired
  @Qualifier("dev.mvc.stugrp.StugrpProc")
  private StugrpProcInter stugrpProc;
  
  @Autowired // StugrpProcInter 인터페이스를 구현한 StuProc.java가 할당
  @Qualifier("dev.mvc.stu.StuProc") // proc에 전송
  private StuProcInter stuProc;
  
  public StugrpCont() {
    System.out.println("-> StugrpCont created.");
  }
  
  // http://localhost:9091/stugrp/create.do
  /**
   * [15][Stugrp] Stugrp 등록 기능 제작(INSERT~)
   * 등록 폼
   * @return
   */
  @RequestMapping(value="/stugrp/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/stugrp/create"); // webapp/WEB-INF/views/stugrp/create.jsp
    
    return mav; // forward
  }
  
  // http://localhost:9091/stugrp/create.do
  /**
   * 등록 처리
   * @param stugrpVO
   * @return
   */
  @RequestMapping(value="/stugrp/create.do", method=RequestMethod.POST)
  public ModelAndView create(StugrpVO stugrpVO) { // stugrpVO 자동 생성, Form -> VO
    // StugrpVO stugrpVO <FORM> 태그의 값으로 자동 생성됨.
    // request.setAttribute("StugrpVO stugrpVO); 자동 실행
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.stugrpProc.create(stugrpVO); // 등록 처리
    mav.addObject("cnt", cnt); // request에 저장, request.setAttribute("cnt", cnt)
    
    if (cnt == 1) {
      mav.setViewName("redirect:/stugrp/list.do");  
    } else {
       mav.addObject("code", "create"); // request에 저장, request.setAttribute("code", "create")  
       mav.setViewName("/stugrp/error_msg"); // /webapp/WEB-INF/views/stugrp/error_msg.jsp
    }
    return mav; // forward
  }
  
  // http://localhost:9091/stugrp/list.do
  /**
   * 등록 순서별 목록 : [16][Stugrp] Stugrp 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), Bootstrap 적용, 등록 기능의 결합
   * 출력 순서별 목록 : [22][Stugrp] 출력 순서별 목록 출력 기능 제작(SELECT ~ FROM ~ ORDER BY ~), redirect의 적용
   * @return
   */
  /*
  @RequestMapping(value="/stugrp/list.do", method=RequestMethod.GET )
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    
    // [16]등록 순서별 출력
    // List<StugrpVO> list = this.stugrpProc.list_stugrpno_asc();
    
    // [22] 출력 순서별 출력
    List<StugrpVO> list = this.stugrpProc.list_seqno_asc();

    mav.addObject("list", list); // request.setAttribute("list", list);
    mav.setViewName("/stugrp/list"); // /webapp/WEB-INF/views/stugrp/list.jsp
    return mav;
  }
  */

  // http://localhost:9091/stugrp/list.do
  /**
   * AJAX 활용, 목록
   * 함수명과 jsp 변경, url 변경은 no
   * @return
   */
  @RequestMapping(value="/stugrp/list.do", method=RequestMethod.GET )
  public ModelAndView list_ajax() {
    ModelAndView mav = new ModelAndView();

    // 등록 순서별 출력    
    // List<CategrpVO> list = this.categrpProc.list_categrpno_asc();
    // 출력 순서별 출력
    List<StugrpVO> list = this.stugrpProc.list_seqno_asc();

    mav.addObject("list", list); // request.setAttribute("list", list);

    mav.setViewName("/stugrp/list_ajax"); // /webapp/WEB-INF/views/stugrp/list_ajax.jsp
    return mav;
  }    
  
//http://localhost:9091/stugrp/list1.do
 /**
  * LIKE 실습
  * @return
  */
 @RequestMapping(value="/stugrp/list1.do", method=RequestMethod.GET )
 public ModelAndView list1() {
   ModelAndView mav = new ModelAndView();
   
    List<StugrpVO> list = this.stugrpProc.read1();

   mav.addObject("list", list); // request.setAttribute("list", list);
   mav.setViewName("/stugrp/list1"); // /webapp/WEB-INF/views/stugrp/list.jsp
   return mav;
 }

  // http://localhost:9091/stugrp/read_update.do
  /**
   * [17][Stugrp] Stugrp 조회, 수정폼 기능의 제작, JSP 수정과 목록의 결합  : 조회폼
   * 조회 + 수정폼
   * @param stugrpno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/stugrp/read_update.do", method=RequestMethod.GET )
  public ModelAndView read_update(int stugrpno) {
    // request.setAttribute("stugrpno", int stugrpno) 작동 안됨.
    
    ModelAndView mav = new ModelAndView();
    
    StugrpVO stugrpVO = this.stugrpProc.read(stugrpno);
    mav.addObject("stugrpVO", stugrpVO);  // request 객체에 저장
    
    List<StugrpVO> list = this.stugrpProc.list_stugrpno_asc();
    mav.addObject("list", list);  // request 객체에 저장

    mav.setViewName("/stugrp/read_update"); // /WEB-INF/views/stugrp/read_update.jsp 
    return mav; // forward
  }
  
  // http://localhost:9091/stugrp/read_ajax.do?stugrpno=1
  /**
   * AJAX 기반 조회 + 수정 + 삭제폼
   * {"stugrpno":1,"seqno":1,"stugrpex":"TOEIC 관련 그룹을 등록해주세요.","rdate":"2021-04-11 16:51:53","stugrpname":"TOEIC/TOEIC SPEAKING"}
   * @param categrpno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/stugrp/read_ajax.do", method=RequestMethod.GET )
  @ResponseBody
  public String read_ajax(int stugrpno) {
   
    StugrpVO stugrpVO = this.stugrpProc.read(stugrpno);
    JSONObject json = new JSONObject();
    json.put("stugrpno", stugrpVO.getStugrpno());
    json.put("stugrpname", stugrpVO.getStugrpname());
    json.put("stugrpex", stugrpVO.getStugrpex());
    json.put("seqno", stugrpVO.getSeqno());
    json.put("rdate", stugrpVO.getRdate());
    
    // 자식 레코드가 있는 레코드 삭제시 -> 자식 레코드의 개수 추가 필요
    int count_by_stugrpno = this.stuProc.count_by_stugrpno(stugrpno);
    json.put("count_by_stugrpno", count_by_stugrpno);
    
    return json.toString();
  }      
  
  // http://localhost:9091/stugrp/update.do
  /**
   * [18][Stugrp] Stugrp 수정 처리 기능의 제작(UPDATE ~ SET ~ WHERE ~) : 수정처리
   * 수정 처리
   * @param stugrpVO
   * @return
   */
  @RequestMapping(value="/stugrp/update.do", method=RequestMethod.POST )
  public ModelAndView update(StugrpVO stugrpVO) {
    // StugrpVO stugrpVO <FORM> 태그의 값으로 자동 생성됨.
    // request.setAttribute("stugrpVO", stugrpVO); 자동 실행
    
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.stugrpProc.update(stugrpVO);
    mav.addObject("cnt", cnt); // request에 저장
    
    if (cnt == 1) {
      mav.setViewName("redirect:/stugrp/list.do");  
    } else {
       mav.addObject("code", "update"); // request에 저장, request.setAttribute("code", "update")  
       mav.setViewName("/stugrp/error_msg"); // /webapp/WEB-INF/views/stugrp/error_msg.jsp
    }
    return mav; // forward
  }

  // http://localhost:9091/stugrp/read_delete.do
  /**
   * [19][Stugrp] Stugrp 삭제 폼 기능의 제작, JSP 삭제와 목록의 결합  : 삭제폼
   * 조회 + 삭제폼
   * @param stugrpno 조회할 카테고리 번호
   * @return
   */
  @RequestMapping(value="/stugrp/read_delete.do", method=RequestMethod.GET )
  public ModelAndView read_delete(int stugrpno) {
    ModelAndView mav = new ModelAndView();
    
    StugrpVO stugrpVO = this.stugrpProc.read(stugrpno); // 삭제할 자료 읽기
    mav.addObject("stugrpVO", stugrpVO);  // request 객체에 저장
    
    List<StugrpVO> list = this.stugrpProc.list_stugrpno_asc();
    mav.addObject("list", list);  // request 객체에 저장

    mav.setViewName("/stugrp/read_delete"); // read_delete.jsp
    return mav;
  }  
  
  // http://localhost:9091/stugrp/delete.do
  /**
   * [20][Stugrp] Stugrp 삭제 처리 기능의 제작(DELETE FROM처~ WHERE ~)  : 삭제처리
   * 삭제처리
   * @param stugrpno 조회할 스터디 번호
   * @return
   */
  @RequestMapping(value="/stugrp/delete.do", method=RequestMethod.POST )
  public ModelAndView delete(int stugrpno) {
    ModelAndView mav = new ModelAndView();
    
    StugrpVO stugrpVO = this.stugrpProc.read(stugrpno); // 삭제 정보
    mav.addObject("stugrpVO", stugrpVO);  // request 객체에 저장
    
    int cnt = this.stugrpProc.delete(stugrpno); // 삭제 처리
    mav.addObject("cnt", cnt);  // request 객체에 저장
    
    if (cnt == 1) {
      mav.setViewName("redirect:/stugrp/list.do");  
    } else {
       mav.addObject("code", "delete"); // request에 저장, request.setAttribute("code", "delete")  
       mav.setViewName("/stugrp/error_msg"); // /webapp/WEB-INF/views/stugrp/error_msg.jsp
    }
    return mav; // forward
  }
 
   //http://localhost:9091/stugrp/update_seqno_up.do?stugrpno=1
   // http://localhost:9091/stugrp/update_seqno_up.do?stugrpno=1000
   /**
    * [21][Stugrp] Stugrp 출력 순서의 변경 제작(UPDATE ~ SET ~ WHERE ~)
    * 우선순위 상향 up 10 ▷ 1
    * @param stugrpno 카테고리 번호
    * @return
    */
   @RequestMapping(value="/stugrp/update_seqno_up.do", 
                               method=RequestMethod.GET )
   public ModelAndView update_seqno_up(int stugrpno) {
     ModelAndView mav = new ModelAndView();
     
     StugrpVO stugrpVO = this.stugrpProc.read(stugrpno); // 카테고리 그룹 정보
     mav.addObject("stugrpVO", stugrpVO);  // request 객체에 저장
     
     int cnt = this.stugrpProc.update_seqno_up(stugrpno);  // 우선 순위 상향 처리
     mav.addObject("cnt", cnt);  // request 객체에 저장
  
     //mav.setViewName("/stugrp/update_seqno_up_msg"); // update_seqno_up_msg.jsp
     mav.setViewName("redirect:/stugrp/list.do");  
     return mav;
   }  
 
 // http://localhost:9090/stugrp/update_seqno_down.do?stugrpno=1
 // http://localhost:9090/stugrp/update_seqno_down.do?stugrpno=1000
 /**
  * [21][Stugrp] Stugrp 출력 순서의 변경 제작(UPDATE ~ SET ~ WHERE ~)
  * 우선순위 하향 up 1 ▷ 10
  * @param stugrpno 카테고리 번호
  * @return
  */
 @RequestMapping(value="/stugrp/update_seqno_down.do", 
                             method=RequestMethod.GET )
 public ModelAndView update_seqno_down(int stugrpno) {
   ModelAndView mav = new ModelAndView();
   
   StugrpVO stugrpVO = this.stugrpProc.read(stugrpno); // 카테고리 그룹 정보
   mav.addObject("stugrpVO", stugrpVO);  // request 객체에 저장
   
   int cnt = this.stugrpProc.update_seqno_down(stugrpno);
   mav.addObject("cnt", cnt);  // request 객체에 저장

   //mav.setViewName("/stugrp/update_seqno_down_msg"); // update_seqno_down_msg.jsp
   mav.setViewName("redirect:/stugrp/list.do");  
   return mav;
 }  
 
 
 
}