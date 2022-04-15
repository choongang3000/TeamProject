package student.model;

import java.sql.Timestamp;

public class STUOrderBean {

	private int onum; //주문번호(primary key)
	private String oid; //주문자id
	private int totprice; //주문전체금액
	private Timestamp odate; //주문날짜
	
	public int getOnum() {
		return onum;
	}
	public void setOnum(int onum) {
		this.onum = onum;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getTotprice() {
		return totprice;
	}
	public void setTotprice(int totprice) {
		this.totprice = totprice;
	}
	public Timestamp getOdate() {
		return odate;
	}
	public void setOdate(Timestamp odate) {
		this.odate = odate;
	}
}
