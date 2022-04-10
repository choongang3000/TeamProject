package boardst.model;

import java.sql.Timestamp;

public class BSTReplyBean {
	private int num;
	private int pnum;
	private String teachid;
	private String content;
	private String image;
	private Timestamp repdate;
	public BSTReplyBean(int num, int pnum, String teachid, String content, String image, Timestamp repdate) {
		super();
		this.num = num;
		this.pnum = pnum;
		this.teachid = teachid;
		this.content = content;
		this.image = image;
		this.repdate = repdate;
	}
	public BSTReplyBean() {
		super();
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getTeachid() {
		return teachid;
	}
	public void setTeachid(String teachid) {
		this.teachid = teachid;
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
	public Timestamp getRepdate() {
		return repdate;
	}
	public void setRepdate(Timestamp repdate) {
		this.repdate = repdate;
	}
	
	
	
}
