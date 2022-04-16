package student.model;

import java.sql.Timestamp;

public class STUOrderDeBean {
	private int odnum;
	private String oid;
	private int onum; //orderbean 주문번호
	private int conum;
	private Timestamp oddate;
	
	public int getOdnum() {
		return odnum;
	}
	public void setOdnum(int odnum) {
		this.odnum = odnum;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getOnum() {
		return onum;
	}
	public void setOnum(int onum) {
		this.onum = onum;
	}
	public int getConum() {
		return conum;
	}
	public void setConum(int conum) {
		this.conum = conum;
	}
	public Timestamp getOddate() {
		return oddate;
	}
	public void setOddate(Timestamp oddate) {
		this.oddate = oddate;
	}
	
}
