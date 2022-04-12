package member.model;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberBean {
	
	private final String must_input = "필수 입력.";
	
	private int num;
	@NotBlank(message = "name 입력은 " +must_input)
	private String name;
	private String type;
	@NotBlank(message = "id 입력은 " + must_input)
	private String id;
	@NotBlank(message = "pw 입력은 " + must_input)
	private String pw;
	private int rrn1;
	private int rrn2;
	private String email;
	private int phone1;
	private int phone2;
	private int phone3;
	private String addr;
	private Date joindate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public String getMust_input() {
		return must_input;
	}
	
	

}
