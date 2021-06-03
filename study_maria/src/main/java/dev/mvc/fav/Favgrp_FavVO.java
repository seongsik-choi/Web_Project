package dev.mvc.fav;

public class Favgrp_FavVO {
  // -------------------------------------------------------------------
  // favgrp table
  // -------------------------------------------------------------------
  /** 부모 테이블 즐겨찾기 그룹 번호 */
  private int r_favgrpno;
  /** 부모 테이블 즐겨찾기 그룹 이름 */
  private String favgrpname;
  
  /** 즐겨찾기 번호 */
  private int favno;  
  /** 즐겨찾기 그룹 번호 */
  private int favgrpno;
  /** 즐겨찾기 이름 */
  private String favname;
  /** 즐겨찾기 설명 */
  private String favex;
  /** 즐겨찾기 링크 */
  private String favli;
  
  /** 등록일 */
  private String rdate;

  public int getR_favgrpno() {
    return r_favgrpno;
  }

  public void setR_favgrpno(int r_favgrpno) {
    this.r_favgrpno = r_favgrpno;
  }

  public String getFavgrpname() {
    return favgrpname;
  }

  public void setFavgrpname(String favgrpname) {
    this.favgrpname = favgrpname;
  }

  public int getFavno() {
    return favno;
  }

  public void setFavno(int favno) {
    this.favno = favno;
  }

  public int getFavgrpno() {
    return favgrpno;
  }

  public void setFavgrpno(int favgrpno) {
    this.favgrpno = favgrpno;
  }

  public String getFavname() {
    return favname;
  }

  public void setFavname(String favname) {
    this.favname = favname;
  }

  public String getFavex() {
    return favex;
  }

  public void setFavex(String favex) {
    this.favex = favex;
  }

  public String getFavli() {
    return favli;
  }

  public void setFavli(String favli) {
    this.favli = favli;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  
  
}
