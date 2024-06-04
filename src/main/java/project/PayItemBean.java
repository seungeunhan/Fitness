package project;

public class PayItemBean {
	  private int num;
	  private int usernum;
	  private String paydate;
	  private int itemnum;
	  private int payprice;
	  private String paymethod;
	  private boolean payflag;
	  private boolean payback;
	  private boolean ccflag;
	  
	  
	  
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getUsernum() {
		return usernum;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public String getPaydate() {
		return paydate;
	}
	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}
	public int getItemnum() {
		return itemnum;
	}
	public void setItemnum(int itemnum) {
		this.itemnum = itemnum;
	}
	public int getPayprice() {
		return payprice;
	}
	public void setPayprice(int payprice) {
		this.payprice = payprice;
	}
	public String getPaymethod() {
		return paymethod;
	}
	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
	}
	public boolean isPayflag() {
		return payflag;
	}
	public void setPayflag(boolean payflag) {
		this.payflag = payflag;
	}
	public boolean isPayback() {
		return payback;
	}
	public void setPayback(boolean payback) {
		this.payback = payback;
	}
	public boolean isCcflag() {
		return ccflag;
	}
	public void setCcflag(boolean ccflag) {
		this.ccflag = ccflag;
	}
	  
	  
}
