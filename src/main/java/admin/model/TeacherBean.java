package admin.model;


import org.springframework.web.multipart.MultipartFile;

public class TeacherBean {
	
	private int anum;
	private String aname;
	private String type;
	private String id;
	private String pw;
	private int rrn1;
	private int rrn2;
	private String email;
	private int phone1;
	private int phone2;
	private int phone3;
	private String addr;
	private String joindate;
	
	private String addr_num;
	private String addr_first;
	private String addr_last;	
	
	private int tnum;
	private String tid;
	private String tname;
	private String t_image;
	private String subject;
	private String visa;
	private String tterm;
	private float twageratio;
	private String introduction;
	
	private MultipartFile upload;
	
	public String getAddr_num() {
		return addr_num;
	}
	
	public void setAddr_num(String addr_num) {
		this.addr_num = addr_num;
	}

	public String getAddr_first() {
		return addr_first;
	}

	public void setAddr_first(String addr_first) {
		this.addr_first = addr_first;
	}

	public String getAddr_last() {
		return addr_last;
	}

	public void setAddr_last(String addr_last) {
		this.addr_last = addr_last;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
		System.out.println("upload : " + upload); //객체 정보가 들어감
		System.out.println("upload.getName() : " + upload.getName()); //파일을 올린곳의 이름이 나옴 : upload
		System.out.println("upload.getOriginalFilename() : " + upload.getOriginalFilename()); //파일이름이 나옴
		this.t_image = upload.getOriginalFilename();
	}
	
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public int getTnum() {
		return tnum;
	}
	public void setTnum(int tnum) {
		this.tnum = tnum;
	}
	public String getT_image() {
		return t_image;
	}
	public void setT_image(String t_image) {
		this.t_image = t_image;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getVisa() {
		return visa;
	}
	public void setVisa(String visa) {
		this.visa = visa;
	}
	public String getTterm() {
		return tterm;
	}
	public void setTterm(String tterm) {
		this.tterm = tterm;
	}
	public float getTwageratio() {
		return twageratio;
	}
	public void setTwageratio(float twageratio) {
		this.twageratio = twageratio;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public int getAnum() {
		return anum;
	}
	public void setAnum(int anum) {
		this.anum = anum;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getRrn1() {
		return rrn1;
	}
	public void setRrn1(int rrn1) {
		this.rrn1 = rrn1;
	}
	public int getRrn2() {
		return rrn2;
	}
	public void setRrn2(int rrn2) {
		this.rrn2 = rrn2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPhone1() {
		return phone1;
	}
	public void setPhone1(int phone1) {
		this.phone1 = phone1;
	}
	public int getPhone2() {
		return phone2;
	}
	public void setPhone2(int phone2) {
		this.phone2 = phone2;
	}
	public int getPhone3() {
		return phone3;
	}
	public void setPhone3(int phone3) {
		this.phone3 = phone3;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
}
