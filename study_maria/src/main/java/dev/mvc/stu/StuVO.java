package dev.mvc.stu;
/*
CREATE TABLE stu(
    stuno                             INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '스터디 번호',
    stugrpno                          INT(10)    NULL  COMMENT '스터디 그룹 번호',
    name                              VARCHAR(40)    NOT NULL COMMENT '스터디 이름',
    stuex                             VARCHAR(300)     NOT NULL COMMENT '스터디 설명',
    stulo                             VARCHAR(25)    NOT NULL COMMENT '스터디 지역',
    rdate                             DATETIME     NOT NULL COMMENT '생성일',
    cnt                               INT(10)    NOT NULL COMMENT '관련 자료 수',
  FOREIGN KEY (stugrpno ) REFERENCES stugrp (stugrpno )
) COMMENT='스터디';
 */

public class StuVO {
  
  /** 스터디 번호 */
  private int stuno;  
  /** 스터디 그룹 번호 */
  private int stugrpno;
  
  /** 스터디 제목 */
  private String name;
  /** 스터디 설명 */
  private String stuex;
  /** 스터디 지역 */
  private String stulo;
 
  /** 생성 일 */
  private String rdate;
  /** 관련 자료 수 */
  private int cnt;
  public int getStuno() {
    return stuno;
  }
  public void setStuno(int stuno) {
    this.stuno = stuno;
  }
  public int getStugrpno() {
    return stugrpno;
  }
  public void setStugrpno(int stugrpno) {
    this.stugrpno = stugrpno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getStuex() {
    return stuex;
  }
  public void setStuex(String stuex) {
    this.stuex = stuex;
  }
  public String getStulo() {
    return stulo;
  }
  public void setStulo(String stulo) {
    this.stulo = stulo;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  
}
