package dev.mvc.favgrp;
/*
CREATE TABLE favgrp(
    favgrpno                      INT(10)    NOT NULL    PRIMARY KEY AUTO_INCREMENT COMMENT '즐겨찾기 그룹 번호',
    favgrpname                       VARCHAR(20)     NOT NULL COMMENT '즐겨찾기 그룹 이름',
    favgrpex                            VARCHAR(100)     NOT NULL COMMENT '즐겨찾기 그룹 설명',
    rdate                             DATETIME     NOT NULL COMMENT '즐겨찾기 그룹 생성일'
) COMMENT='즐겨찾기 그룹';


 */
public class FavgrpVO {
 
  /** 즐겨찾기 그룹 번호 */
  private int favgrpno;
  /**  즐겨찾기 이름 */
  private String favgrpname;
  /** 즐겨찾기 설명 */
  private String favgrpex;
  /** 즐겨찾기 생성일 */
  private String rdate;
  
  public int getFavgrpno() {
    return favgrpno;
  }
  
  public void setFavgrpno(int favgrpno) {
    this.favgrpno = favgrpno;
  }
  public String getFavgrpname() {
    return favgrpname;
  }
  public void setFavgrpname(String favgrpname) {
    this.favgrpname = favgrpname;
  }
  public String getFavgrpex() {
    return favgrpex;
  }
  public void setFavgrpex(String favgrpex) {
    this.favgrpex = favgrpex;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }


  
  
}
