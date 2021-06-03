package dev.mvc.fav;
/*
CREATE TABLE fav(
    favno                             INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '즐겨찾기 번호',
    favgrpno                        INT(10)    NULL  COMMENT '즐겨찾기 그룹 번호',
    favname                        VARCHAR(20)    NOT NULL COMMENT '즐겨찾기 이름',
    favex                             VARCHAR(50)    NOT NULL COMMENT '즐겨찾기 설명',
    favli                               VARCHAR(30)    NOT NULL COMMENT '즐겨찾기 링크',
    rdate                             DATETIME     NOT NULL COMMENT '즐겨찾기 생성일',
  FOREIGN KEY (favgrpno) REFERENCES favgrp (favgrpno)
) COMMENT='즐겨찾기';
 */
public class FavVO {

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
