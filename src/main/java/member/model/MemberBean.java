package member.model;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Component
public class MemberBean {
	
	private int anum;
	
	@NotBlank(message="꼭 입력해 주세요")
	private String aname;
	
	private String type;
	
	@NotBlank(message="꼭 입력해 주세요")
	private String id;
	
	@NotBlank(message="꼭 입력해 주세요")
	private String pw;
	
	@NotNull(message="꼭 입력해 주세요")
	private int rrn1;
	
	@NotNull(message="꼭 입력해 주세요")
	private int rrn2;
	
	@NotBlank(message="꼭 입력해 주세요")
	private String email;
	
	@NotNull(message="꼭 입력해 주세요")
	private int phone1;
	
	@NotNull(message="꼭 입력해 주세요")
	private int phone2;
	
	@NotNull(message="꼭 입력해 주세요")
	private int phone3;
	
	private String addr;
	private Date joindate;
	
	private String addr_num;
	private String addr_first;
	private String addr_last;
	
	
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
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	
	
	

}
