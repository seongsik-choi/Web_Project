package dev.mvc.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {

  /*
CREATE TABLE member (
    memberno                          INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '회원 번호',
    id                                VARCHAR(20)    NOT NULL COMMENT '아이디',
    passwd                            VARCHAR(30)    NOT NULL COMMENT '패스워드',
    mname                             VARCHAR(20)    NOT NULL COMMENT '성명',
    tel                               VARCHAR(20)    NOT NULL COMMENT '전화번호',
    zipcode                           VARCHAR(5)     NULL  COMMENT '우편번호',
    address1                          VARCHAR(80)    NULL  COMMENT '주소 1',
    address2                          VARCHAR(50)    NULL  COMMENT '주소 2',
    mdate                             DATETIME     NOT NULL COMMENT '가입일',
    grade                             INT(3)     NOT NULL COMMENT '등급' -- (1~10: 관리자, 11~20: 회원, 비회원: 30~39, 정지 회원: 40~49, 탈퇴 회원: 99)
    
    email                             VARCHAR(30)    NOT NULL COMMENT '이메일',
    vname                             VARCHAR(20)    NOT NULL COMMENT '별명',
    job                               VARCHAR(15)    NOT NULL COMMENT '직업',
    
    file1                             VARCHAR(100)     NULL  COMMENT '메인 이미지',
    file1saved                        VARCHAR(100)     NULL  COMMENT '실제 저장된 메인 이미지',
    thumb1                            VARCHAR(100)     NULL  COMMENT '메인 이미지 Preview',
    size1                             INT(10)    DEFAULT 0     NULL  COMMENT '메인 이미지 크기'
);
  */
 
  /** 관리자 번호 */
  private int memberno;
  /** 아이디 */
  private String id = "";
  /** 패스워드 */
  private String passwd = "";
  /** 관리자 성명 */
  private String mname = "";
  /** 전화 번호 */
  private String tel = "";
  /** 우편 번호 */
  private String zipcode = "";
  /** 주소 1 */
  private String address1 = "";
  /** 주소 2 */
  private String address2 = "";
  /** 가입일 */
  private String mdate = "";
  /** 등급 */
  private int grade = 0;
  
  /** 이메일 */
  private String email = "";
  /** 별명 */
  private String vname = "";
  /** 직업 */
  private String job = "";

  /** 등록된 패스워드 */
  private String old_passwd = "";
  /** id 저장 여부 */
  private String id_save = "";
  /** passwd 저장 여부 */
  private String passwd_save = "";
  /** 이동할 주소 저장 */
  private String url_address = "";
  
  /** 메인 이미지 */
  private String file1 = "";
  /** 실제 저장된 메인 이미지 */
  private String file1saved = "";  
  /** 메인 이미지 preview */
  private String thumb1 = "";
  /** 메인 이미지 크기 */
  private long size1;

  /** 
   * FILE명에 해당하는 실제 파일을 저장하는 객체
   * VO에 실제 존재하지않는 컬럼을 명시해도 됨
  이미지 MultipartFile 
  <input type='file' class="form-control" name='file1MF' id='file1MF' 
                   value='' placeholder="파일 선택" >
  */
  private MultipartFile file1MF;

  /* 파일 크기 단위 출력 */
  private String size1_label;

  public int getMemberno() {
    return memberno;
  }

  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPasswd() {
    return passwd;
  }

  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }

  public String getMname() {
    return mname;
  }

  public void setMname(String mname) {
    this.mname = mname;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public String getZipcode() {
    return zipcode;
  }

  public void setZipcode(String zipcode) {
    this.zipcode = zipcode;
  }

  public String getAddress1() {
    return address1;
  }

  public void setAddress1(String address1) {
    this.address1 = address1;
  }

  public String getAddress2() {
    return address2;
  }

  public void setAddress2(String address2) {
    this.address2 = address2;
  }

  public String getMdate() {
    return mdate;
  }

  public void setMdate(String mdate) {
    this.mdate = mdate;
  }

  public int getGrade() {
    return grade;
  }

  public void setGrade(int grade) {
    this.grade = grade;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getVname() {
    return vname;
  }

  public void setVname(String vname) {
    this.vname = vname;
  }

  public String getJob() {
    return job;
  }

  public void setJob(String job) {
    this.job = job;
  }

  public String getOld_passwd() {
    return old_passwd;
  }

  public void setOld_passwd(String old_passwd) {
    this.old_passwd = old_passwd;
  }

  public String getId_save() {
    return id_save;
  }

  public void setId_save(String id_save) {
    this.id_save = id_save;
  }

  public String getPasswd_save() {
    return passwd_save;
  }

  public void setPasswd_save(String passwd_save) {
    this.passwd_save = passwd_save;
  }

  public String getUrl_address() {
    return url_address;
  }

  public void setUrl_address(String url_address) {
    this.url_address = url_address;
  }

  public String getFile1() {
    return file1;
  }

  public void setFile1(String file1) {
    this.file1 = file1;
  }

  public String getFile1saved() {
    return file1saved;
  }

  public void setFile1saved(String file1saved) {
    this.file1saved = file1saved;
  }

  public String getThumb1() {
    return thumb1;
  }

  public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
  }

  public long getSize1() {
    return size1;
  }

  public void setSize1(long size1) {
    this.size1 = size1;
  }

  public MultipartFile getFile1MF() {
    return file1MF;
  }

  public void setFile1MF(MultipartFile file1mf) {
    file1MF = file1mf;
  }

  public String getSize1_label() {
    return size1_label;
  }

  public void setSize1_label(String size1_label) {
    this.size1_label = size1_label;
  }


}