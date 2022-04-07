package boardst.model;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class BSTBean {
	private int num;
	private String stuid; 
	private String subject;
	private String teacher;
	private String title;
	private String content;
	private String image;
	private String st_check;
	private Timestamp write_date;
	
	private MultipartFile upload;
	

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		System.out.println("upload : " + upload); //객체 정보가 들어감
		System.out.println("upload.getName() : " + upload.getName()); //파일을 올린곳의 이름이 나옴 : upload
		System.out.println("upload.getOriginalFilename() : " + upload.getOriginalFilename()); //파일이름이 나옴
		this.image = upload.getOriginalFilename();
	}

	
	public BSTBean(int num, String stuid, String subject, String teacher, String title, String content, String image,
			String st_check, Timestamp write_date) {
		super();
		this.num = num;
		this.stuid = stuid;
		this.subject = subject;
		this.teacher = teacher;
		this.title = title;
		this.content = content;
		this.image = image;
		this.st_check = st_check;
		this.write_date = write_date;
	}
	public BSTBean() {
		super();
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getStuid() {
		return stuid;
	}
	public void setStuid(String stuid) {
		this.stuid = stuid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getSt_check() {
		return st_check;
	}
	public void setSt_check(String st_check) {
		this.st_check = st_check;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	
	
}
