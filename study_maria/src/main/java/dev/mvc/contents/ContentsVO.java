package dev.mvc.contents;

import org.springframework.web.multipart.MultipartFile;
/*
CREATE TABLE contents(
    contentsno                        INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '컨텐츠 번호',
    adminno                           INT(10)    NOT NULL COMMENT '관리자 번호',
    stuno                             INT(10)    NOT NULL COMMENT '스터디 번호',
    
    recom                     INT(10)    NULL COMMENT '추천수',
    name                              VARCHAR(100)     NOT NULL COMMENT '이름',
    intro                             TEXT     NOT NULL COMMENT '소개',
    cnt                               INT(7)     DEFAULT 0     NOT NULL COMMENT '조회수',
    certi                             VARCHAR(100)     NOT NULL COMMENT '자격증',
    id                                VARCHAR(20)    NOT NULL COMMENT '아이디',
    passwd                            VARCHAR(15)    NOT NULL COMMENT '패스워드',
    
    file1                             VARCHAR(100)     NULL  COMMENT '메인 이미지',
    file1saved                        VARCHAR(100)     NULL  COMMENT '실제 저장된 메인 이미지',
    thumb1                            VARCHAR(100)     NULL  COMMENT '메인 이미지 Preview',
    size1                             INT(10)    DEFAULT 0     NULL  COMMENT '메인 이미지 크기',
  FOREIGN KEY (adminno) REFERENCES admin (adminno),
  FOREIGN KEY (stuno) REFERENCES stu (stuno)
) COMMENT='컨텐츠';
 */
public class ContentsVO {
  
  /** 컨텐츠 번호 */
  private int contentsno;
  /** 관리자 번호 */
  private int adminno;
  /** 스터디 번호*/
  private int stuno;
  
  /** 추천수*/
  private int recom;
  
  /** 이름 */
  private String name = "";
  /** 소개 */
  private String intro = "";
  /** 조회수 */
  private int cnt = 0;

  /** 자격증 */
  private String certi = "";
  /** 아이디 */
  private String id = "";
  /** 패스워드 */
  private String passwd = "";

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
 
 // 추천수에 대한 getter, setter
  public int getRecom() {
  return recom;
  }

  public void setRecom(int recom) {
  this.recom = recom;
  }

  public int getContentsno() {
    return contentsno;
  }

  public void setContentsno(int contentsno) {
    this.contentsno = contentsno;
  }

  public int getAdminno() {
    return adminno;
  }

  public void setAdminno(int adminno) {
    this.adminno = adminno;
  }

  public int getStuno() {
    return stuno;
  }

  public void setStuno(int stuno) {
    this.stuno = stuno;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getIntro() {
    return intro;
  }

  public void setIntro(String intro) {
    this.intro = intro;
  }

  public int getCnt() {
    return cnt;
  }

  public void setCnt(int cnt) {
    this.cnt = cnt;
  }

  public String getCerti() {
    return certi;
  }

  public void setCerti(String certi) {
    this.certi = certi;
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