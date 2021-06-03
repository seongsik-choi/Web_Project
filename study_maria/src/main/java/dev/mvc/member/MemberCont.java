package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;
 
@Controller
public class MemberCont {
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc = null;
  
  public MemberCont(){
    System.out.println("--> MemberCont created.");
  }

  /**
   * 새로고침을 방지하는 메시지 출력
   * @param memberno
   * @return
   */
  @RequestMapping(value="/member/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    // 등록 처리 메시지: create_msg --> /member/create_msg.jsp
    // 수정 처리 메시지: update_msg --> /member/update_msg.jsp
    // 삭제 처리 메시지: delete_msg --> /member/delete_msg.jsp
    mav.setViewName("/member/" + url); // forward
    
    return mav; // forward
  }  
  
  // http://localhost:9091/member/checkID.do?id=tonny1225
  /**
  * [54][Member] 회원 가입 폼, 중복 ID 검사, Daum 우편번호 API 이용
  * ID 중복 체크, JSON 출력
  * @return
  */
  @ResponseBody // Spring Controller - 출력이 단순 문자열인경우 사용(html, json)
  @RequestMapping(value="/member/checkID.do", method=RequestMethod.GET ,
                         produces = "text/plain;charset=UTF-8" )
  public String checkID(String id) {
    // System.out.println("아이디 확인 요청됨" + id);
    int cnt = this.memberProc.checkID(id);
   
    JSONObject json = new JSONObject(); // JSON 객체 생성
    json.put("cnt", cnt);
   
    return json.toString(); 
  }
  
  // http://localhost:9091/member/checkEMAIL.do?email=tonny@daum.net
  /**
  * email 중복 체크, JSON 출력
  * @return
  */
  @ResponseBody // Spring Controller - 출력이 단순 문자열인경우 사용(html, json)
  @RequestMapping(value="/member/checkEMAIL.do", method=RequestMethod.GET ,
                         produces = "text/plain;charset=UTF-8" )
  public String checkEMAIL(String email) {
    // System.out.println("이메일 확인 요청됨" + email);
    int cnt = this.memberProc.checkEMAIL(email);
   
    JSONObject json = new JSONObject(); // JSON 객체 생성
    json.put("cnt", cnt);
   
    return json.toString(); 
  }
  
  // http://localhost:9091/member/checkVNAME.do?vname=별명
  /**
  * vname(별명) 중복 체크, JSON 출력
  * @return
  */
  @ResponseBody // Spring Controller - 출력이 단순 문자열인경우 사용(html, json)
  @RequestMapping(value="/member/checkVNAME.do", method=RequestMethod.GET ,
                         produces = "text/plain;charset=UTF-8" )
  public String checkVNAME(String vname) {
    // System.out.println("이메일 확인 요청됨" + email);
    int cnt = this.memberProc.checkVNAME(vname);
   
    JSONObject json = new JSONObject(); // JSON 객체 생성
    json.put("cnt", cnt);
   
    return json.toString(); 
  }  

  // http://localhost:9091/member/create.do
  /**
   * [54][Member] 회원 가입 폼, 중복 ID 검사, Daum 우편번호 API 이용
  * 등록 폼
  * @return
  */
  @RequestMapping(value="/member/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/create"); // webapp/member/create.jsp
   
    return mav; // forward
  } 
  
  /**
   * [55][Member] 회원 가입 처리, create_msg.jsp, 메시지 처리 콘트롤러, msg.do 구현
   * 등록 처리
   * @param memberVO
   * @return
   */
  @RequestMapping(value="/member/create.do", method=RequestMethod.POST)
  public ModelAndView create(MemberVO memberVO){
    ModelAndView mav = new ModelAndView();
    
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String file1 = "";          // 원본 파일명 image
    String file1saved = "";  // 저장된 파일명, image
    String thumb1 = "";     // preview image

    // 기준 경로 확인
    String user_dir = System.getProperty("user.dir");
    System.out.println("--> User dir: " + user_dir);
    //  --> User dir: F:\ai8\ws_frame\resort_v1sbm3a
    
    // 파일 접근임으로 절대 경로 지정, static 지정
    // 완성된 경로 F:/ai8/ws_frame/resort_v1sbm3a/src/main/resources/static/contents/storage
    String upDir =  user_dir + "/src/main/resources/static/member/storage/"; // 절대 경로
    
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    // <input type='file' class="form-control" name='file1MF' id='file1MF' 
    //           value='' placeholder="파일 선택">
    MultipartFile mf = memberVO.getFile1MF();
    
    file1 = mf.getOriginalFilename(); // 원본 파일명
    long size1 = mf.getSize();  // 파일 크기
    
    if (size1 > 0) { // 파일 크기 체크
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      file1saved = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(file1saved)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
        thumb1 = Tool.preview(upDir, file1saved, 200, 150); 
      }
    }    
    
    memberVO.setFile1(file1);
    memberVO.setFile1saved(file1saved);
    memberVO.setThumb1(thumb1);
    memberVO.setSize1(size1);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
    
    
    // System.out.println("id: " + memberVO.getId());
    memberVO.setGrade(11); // 기본 회원 가입 등록 11 지정

    int cnt= memberProc.create(memberVO);
    mav.addObject("cnt", cnt); // redirect parameter 적용
    mav.addObject("url", "create_msg"); // create_msg.jsp, redirect parameter 적용
    
    mav.setViewName("redirect:/member/msg.do"); // 새로고침 방지
    
    return mav;
  }  
  
  /**
  * [56][Member] 회원 목록 출력 기능 제작
  * 목록 출력 가능
  * @param session
  * @return
  */
  @RequestMapping(value="/member/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    List<MemberVO> list = memberProc.list();
    mav.addObject("list", list);

    mav.setViewName("/member/list"); // /webapp/WEB-INF/views/member/list.jsp
    
    return mav;
  }    
  
  /**
   * [57][Member] 회원 조회(수정 폼) 기능 제작
   * 회원 조회
   * @param memberno
   * @return
   */
  @RequestMapping(value="/member/read.do", method=RequestMethod.GET)
  public ModelAndView read(int memberno){
    ModelAndView mav = new ModelAndView();
    
    MemberVO memberVO = this.memberProc.read(memberno);
    mav.addObject("memberVO", memberVO);
    mav.setViewName("/member/read"); // webapp/WEB-INF/member/read.jsp
    
    return mav; // forward
  }    
  
  /**
   * [58][Member] 회원 수정 처리
   * 회원 정보 수정 처리
   * @param memberVO
   * @return
   */
  @RequestMapping(value="/member/update.do", method=RequestMethod.POST)
  public ModelAndView update(MemberVO memberVO){
    ModelAndView mav = new ModelAndView();
    
    // System.out.println("id: " + memberVO.getId());
    
    int cnt= memberProc.update(memberVO);
    mav.addObject("cnt", cnt); // redirect parameter 적용
    mav.addObject("memberno", memberVO.getMemberno()); // redirect parameter 적용
    mav.addObject("url", "update_msg"); // update_msg.jsp, redirect parameter 적용

    mav.setViewName("redirect:/member/msg.do");
    
    return mav;
  }  
  
  /**
   * [59] 회원 삭제
   * @param memberno
   * @return
   */
  @RequestMapping(value="/member/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(int memberno){
    ModelAndView mav = new ModelAndView();
    
    MemberVO memberVO = this.memberProc.read(memberno);
    mav.addObject("memberVO", memberVO);
    mav.setViewName("/member/delete"); // /member/delete.jsp
    
    return mav; // forward
  }
 
  /**
   * [59] 회원 삭제 처리
   * @param memberVO
   * @return
   */
  @RequestMapping(value="/member/delete.do", method=RequestMethod.POST)
  public ModelAndView delete_proc(int memberno){
    ModelAndView mav = new ModelAndView();
    
    // System.out.println("id: " + memberVO.getId());
    MemberVO memberVO = this.memberProc.read(memberno);
    
    int cnt= memberProc.delete(memberno);
    mav.addObject("cnt", cnt); // redirect parameter 적용
    mav.addObject("mname", memberVO.getMname()); // redirect parameter 적용
    mav.addObject("url", "delete_msg"); // delete_msg.jsp, redirect parameter 적용
    
    mav.setViewName("redirect:/member/msg.do");
    
    return mav;
  }  
  
  /**
   * [60] 패스워드를 변경 검사
   * @param memberno
   * @return
   */
  @RequestMapping(value="/member/passwd_update.do", method=RequestMethod.GET)
  public ModelAndView passwd_update(int memberno){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/passwd_update");
    
    return mav;
  }
  
  /**
   * [60] 패스워드를 변경 처리
   * @param memberno 회원 번호
   * @param current_passwd 현재 패스워드
   * @param new_passwd 새로운 패스워드
   * @return
   */
  @RequestMapping(value="/member/passwd_update.do", method=RequestMethod.POST)
  public ModelAndView passwd_update(int memberno, String current_passwd, String new_passwd){
    ModelAndView mav = new ModelAndView();
    
    // 현재 패스워드 검사
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("memberno", memberno);
    map.put("passwd", current_passwd);
    
    int cnt = memberProc.passwd_check(map);
    int update_cnt = 0; // 변경된 패스워드 수
    
    if (cnt == 1) { // 현재 패스워드가 일치하는 경우
      map.put("passwd", new_passwd); // 새로운 패스워드를 저장
      update_cnt = memberProc.passwd_update(map); // 패스워드 변경 처리
      mav.addObject("update_cnt", update_cnt);  // 변경된 패스워드의 갯수    
    }

    mav.addObject("cnt", cnt); // 패스워드 일치 여부
    mav.addObject("url", "passwd_update_msg");
    
    mav.setViewName("redirect:/member/msg.do");
    
    return mav;
  }      
 
  /**
   * [62] 로그인 폼
   * @return
   */
  // http://localhost:9091/member/login.do 
  @RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
  public ModelAndView login() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/login_form");
    return mav;
  }

  /**
   * [62] 로그인 처리
   * @return
   */
  // http://localhost:9091/member/login.do 
  @RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
  public ModelAndView login_proc(HttpSession session, String id, String passwd) {
   
    ModelAndView mav = new ModelAndView();
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("id", id);
    map.put("passwd", passwd);
    
    int count = memberProc.login(map); // mybatis 까지 전달(id, passwd 일처 여부 확인)
    if (count == 1) { // 로그인 성공
      // System.out.println(id + " 로그인 성공");
      MemberVO memberVO = memberProc.readById(id); // id 기반 회원정보 받아옴.
      session.setAttribute("memberno", memberVO.getMemberno());
      session.setAttribute("id", id);
      session.setAttribute("mname", memberVO.getMname());
      
      mav.setViewName("redirect:/index.do"); // 시작 페이지로 이동  
    } else {
      mav.addObject("url", "login_fail_msg"); // login_fail_msg.jsp, redirect parameter 적용
      mav.setViewName("redirect:/member/msg.do"); // 새로고침 방지
    }
        
    return mav;
  }
  
  /**
   * [62]  로그아웃 처리
   * @param session
   * @return
   */
  @RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session){
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // 모든 session 변수 삭제
    
    mav.addObject("url", "logout_msg"); // logout_msg.jsp, redirect parameter 적용
    mav.setViewName("redirect:/member/msg.do"); // 새로고침 방지
    
    return mav;
  }    
  
}