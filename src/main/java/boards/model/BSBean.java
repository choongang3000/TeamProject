package boards.model;

import java.sql.Timestamp;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class BSBean {
	private int num;
	
	@NotBlank(message = "작성자를 입력해주세요.")
	private String writer; //text
	
	private String email;
	
	@NotBlank(message = "제목을 입력해주세요.")
	private String title; //text
	
	@NotBlank(message = "비밀번호를 입력해주세요.")
	private	String passwd; //password
	
	private	Timestamp reg_date;
	private	int readcount;
	private int ref;
	private int re_step;
	private int re_level;
	
	@NotBlank(message = "내용을 입력해주세요.")
	private String content; //textarea
	
	private String rating;
	
	@NotBlank(message = "강의명을 선택해주세요.")
	private String coname;
	
	@NotBlank(message = "선생님을 선택해주세요.")
	private String coteacher;
	
	
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
	private String image;
	private MultipartFile upload;
	
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		System.out.println("upload:" + upload);
		System.out.println("upload.getName():"+upload.getName()); //name=upload
		System.out.println("upload.getOriginalFilename():"+upload.getOriginalFilename()); //화일이름
		image = upload.getOriginalFilename(); //image에 화일이름을 넣습니다.
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
