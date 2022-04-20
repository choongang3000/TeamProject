package student.model;

public class StuCartBean {
	
	private int conum;
	private String coname;
	private String coteacher;
	private String cosubject;
	private String coimage;
	private int coprice;
	
	
	public StuCartBean() {
		super();
	}
	public StuCartBean(int conum, String coname, String coteacher, String cosubject, String coimage, int coprice) {
		super();
		this.conum = conum;
		this.coname = coname;
		this.coteacher = coteacher;
		this.cosubject = cosubject;
		this.coimage = coimage;
		this.coprice = coprice;
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
	public int getCoprice() {
		return coprice;
	}
	public void setCoprice(int coprice) {
		this.coprice = coprice;
	}
	
	
}
