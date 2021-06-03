package dev.mvc.stu;

public class Stugrp_StuVO {
  // -------------------------------------------------------------------
  // stugrp table
  // -------------------------------------------------------------------
  /** 부모 테이블 스터디 그룹 번호 */
  private int r_stugrpno;
  /** 부모 테이블 스터디 그룹 이름 */
  private String stugrpname;
  // -------------------------------------------------------------------
  // stu table
  // -------------------------------------------------------------------  
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
  
  public int getR_stugrpno() {
    return r_stugrpno;
  }
  public void setR_stugrpno(int r_stugrpno) {
    this.r_stugrpno = r_stugrpno;
  }
  public String getStugrpname() {
    return stugrpname;
  }
  public void setStugrpname(String stugrpname) {
    this.stugrpname = stugrpname;
  }
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
  @Override
  public String toString() {
    return "[r_stugrpno=" + r_stugrpno + ", stugrpname=" + stugrpname + ", stuno=" + stuno + ", stugrpno="
        + stugrpno + ", name=" + name + ", stuex=" + stuex + ", stulo=" + stulo + ", rdate=" + rdate + ", cnt=" + cnt
        + "]";
  }
  
  
}
