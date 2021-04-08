package dev.mvc.stugrp;
/*
    stugrpno                       INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '스터디 그룹 번호',
    stugrpname                    VARCHAR(50)    NOT NULL COMMENT '스터디 그룹 이름',
    stugrpex                          VARCHAR(300)     NULL  COMMENT '스터디 그룹 설명',
    seqno                             MEDIUMINT(10)    NOT NULL COMMENT '출력 순서',
    rdate                             DATETIME     NOT NULL COMMENT '그룹 생성일'
 */

public class StugrpVO {
  /** 스터디 그룹 번호 */
  private int stugrpno;
  /**  스터디 그룹 이름 */
  private String stugrpname;
  /**  스터디 그룹 내용 */
  private String stugrpex;
  /** 출력 순서 */
  private int seqno;
  /** 그룹 생성일 */
  private String rdate;
  
//Getter Setter로 private 멤버변수 접근 허용
  public int getStugrpno() {
    return stugrpno;
  }
  public void setStugrpno(int stugrpno) {
    this.stugrpno = stugrpno;
  }
  public String getStugrpname() {
    return stugrpname;
  }
  public void setStugrpname(String stugrpname) {
    this.stugrpname = stugrpname;
  }
  public String getStugrpex() {
    return stugrpex;
  }
  public void setStugrpex(String stugrpex) {
    this.stugrpex = stugrpex;
  }
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
}// class end
