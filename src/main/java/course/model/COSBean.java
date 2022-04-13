package course.model;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class COSBean {
	private int conum;
	private String coname;
	private String coteacher;
	private String cosubject;
	private String coimage;
	private String covideo;
	private String cocontent;
	private String coprice;
	private String coupload_date;
	
	private MultipartFile upload;
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		System.out.println("upload:" + upload);
		System.out.println("upload.getName():"+upload.getName());
		System.out.println("upload.getOriginalFilename():"+upload.getOriginalFilename());
		coimage = upload.getOriginalFilename();
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
	public String getCoprice() {
		return coprice;
	}
	public void setCoprice(String coprice) {
		this.coprice = coprice;
	}
	public String getCoupload_date() {
		return coupload_date;
	}
	public void setCoupload_date(String coupload_date) {
		this.coupload_date = coupload_date;
	}

}