package dev.mvc.member;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
 
@Component("dev.mvc.member.MemberProc")
public class MemberProc implements MemberProcInter {
  @Autowired
  private MemberDAOInter memberDAO;
  
  public MemberProc(){
    System.out.println("-> MemberProc created.");
  }

  // [53][Member] 중복 ID 체크(DAO interface, DAO class, Processs interface, Process class)
  @Override
  public int checkID(String id) {
    int cnt = this.memberDAO.checkID(id);
    return cnt;
  }
  
  // 중복 EMAIL 체크
  @Override
  public int checkEMAIL(String email) {
    int cnt = this.memberDAO.checkEMAIL(email);
    return cnt;
  }
  
  // 중복 vname 체크
  @Override
  public int checkVNAME(String vname) {
    int cnt = this.memberDAO.checkVNAME(vname);
    return cnt;
  }
  
  // [55][Member] 회원 가입 처리, create_msg.jsp, 메시지 처리 콘트롤러, msg.do 구현
  @Override
  public int create(MemberVO memberVO) {
    int cnt = this.memberDAO.create(memberVO);
    return cnt;
  }

  // [56][Member] 회원 목록 출력 기능 제작
  @Override
  public List<MemberVO> list() {
    List<MemberVO> list = this.memberDAO.list();
    return list;
  }
 
  // [57][Member] 회원 조회(수정 폼) 기능 제작 -memberno로 회원 정보 조회
  @Override
  public MemberVO read(int memberno) {
    MemberVO memberVO = this.memberDAO.read(memberno);
    return memberVO;
  }

  // [57][Member] 회원 조회(수정 폼) 기능 제작- id로 회원 정보 조회
  @Override
  public MemberVO readById(String id) {
    MemberVO memberVO = this.memberDAO.readById(id);
    return memberVO;
  }  
  
  // [58][Member] 회원 수정 처리
  @Override
  public int update(MemberVO memberVO) {
    int cnt = 0;
    cnt = this.memberDAO.update(memberVO);
    return cnt;
  }  
  
  // [59][Member] 회원 삭제 기능의 제작
  @Override
  public int delete(int memberno) {
    int cnt = this.memberDAO.delete(memberno);
    return cnt;
  }  
  
  // [60] 현재 패스워드 검사
  @Override
  public int passwd_check(HashMap<Object, Object> map) {
    int cnt = this.memberDAO.passwd_check(map);
    return cnt;
  }

  // [60] 패스워드 변경
  @Override
  public int passwd_update(HashMap<Object, Object> map) {
    int cnt = this.memberDAO.passwd_update(map);
    return cnt;
  }    

   // [62] 로그인 처리
  @Override
  public int login(Map<String, Object> map) {
    int cnt = this.memberDAO.login(map);
    return cnt;
  }  
  

}