package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MemberProcInter {
  /**
   * [53][Member] 중복 ID 체크(DAO interface, DAO class, Processs interface, Process class)
   * 중복 아이디 검사
   * @param id
   * @return 중복 아이디 갯수
   */
  public int checkID(String id);
  
  public int checkEMAIL(String email); // 중복EMAIL 체크
  
  public int checkVNAME(String vname); // 중복EMAIL 체크
  
  /**
   * [55][Member] 회원 가입 처리, create_msg.jsp, 메시지 처리 콘트롤러, msg.do 구현
   * 회원 가입
   * @param memberVO
   * @return
   */
  public int create(MemberVO memberVO);
  
  /**
   * [56]-회원 전체 목록
   * @return
   */
  public List<MemberVO> list();

  /**
   * [57][Member] 회원 조회(수정 폼) 기능 제작 -memberno로 회원 정보 조회
   * @param memberno
   * @return
   */
  public MemberVO read(int memberno);
  
  /**
   * [57][Member] 회원 조회(수정 폼) 기능 제작- id로 회원 정보 조회
   * @param id
   * @return
   */
  public MemberVO readById(String id);  
 
  /**
   * [58][Member] 회원 수정 처리
   * 수정 처리
   * @param memberVO
   * @return
   */
  public int update(MemberVO memberVO);
  
  /**
   * [59][Member] 회원 삭제 기능의 제작
   * @param memberno
   * @return
   */
  public int delete(int memberno);
  
  /**
   * [60] 현재 패스워드 검사
   * @param map
   * @return 0: 일치하지 않음, 1: 일치함
   */
  public int passwd_check(HashMap<Object, Object> map);
  
  /**
   * [60] 패스워드 변경
   * @param map
   * @return 변경된 패스워드 갯수
   */
  public int passwd_update(HashMap<Object, Object> map);    
  
  /**
   * [62] 로그인 처리
   */
  public int login(Map<String, Object> map);  
}