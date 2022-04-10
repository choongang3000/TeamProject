package admin.model;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

//conum,coname,coteacher,cosubject,coimage,covideo,cocontent,coprice,coupload_date
public class CoBean {
	private int conum;
	private String coname;
	private String coteacher;
	private String cosubject;
	private String coimage;
	private String covideo;
	private String cocontent;
	private int coprice;
	private Timestamp coupload_date;
	
	private MultipartFile upimage; //coimage
	private MultipartFile upvideo; //covideo
	
	
	public MultipartFile getUpimage() { //coimage
		return upimage;
	}
	public void setUpimage(MultipartFile upimage) {
		this.upimage = upimage;
		coimage = upimage.getOriginalFilename();
	}
	
	public MultipartFile getUpvideo() { //covideo
		return upvideo;
	}
	public void setUpvideo(MultipartFile upvideo) {
		this.upvideo = upvideo;
		covideo = upvideo.getOriginalFilename();
	}
	
	
	public int getConum() {
		return conum;
	}
	public void setConum(int conum) {
		this.conum = conum;
	}
	public String getConame() {
		return coname;
	}
	public void setConame(String coname) {
		this.coname = coname;
	}
	public String getCoteacher() {
		return coteacher;
	}
	public void setCoteacher(String coteacher) {
		this.coteacher = coteacher;
	}
	public String getCosubject() {
		return cosubject;
	}
	public void setCosubject(String cosubject) {
		this.cosubject = cosubject;
	}
	public String getCoimage() {
		return coimage;
	}
	public void setCoimage(String coimage) {
		this.coimage = coimage;
	}
	public String getCovideo() {
		return covideo;
	}
	public void setCovideo(String covideo) {
		this.covideo = covideo;
	}
	public String getCocontent() {
		return cocontent;
	}
	public void setCocontent(String cocontent) {
		this.cocontent = cocontent;
	}
	public int getCoprice() {
		return coprice;
	}
	public void setCoprice(int coprice) {
		this.coprice = coprice;
	}
	public Timestamp getCoupload_date() {
		return coupload_date;
	}
	public void setCoupload_date(Timestamp coupload_date) {
		this.coupload_date = coupload_date;
	}
}

/*
--강의 테이블
drop sequence cos_seq;
create sequence cos_seq
start with 1
increment by 1
nocache;

drop table courses cascade constraints;
create table courses(
	conum number not null primary key, --강의번호
	coname varchar2(50) not null, --강의명
	coteacher varchar2(15) not null, --강의담당선생님
	cosubject varchar2(30) not null, --강의과목
	coimage varchar(100), --강의이미지
	covideo varchar2(100) not null, --강의영상
	cocontent varchar2(50) not null, --강의소개내용
	coprice number not null, --강의가격
	coupload_date date default sysdate --강의업로드날짜
);

*/