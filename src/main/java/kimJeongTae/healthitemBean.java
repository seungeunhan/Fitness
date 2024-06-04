package kimJeongTae;

public class healthitemBean {
	private int num;
	private String itemname;
	private String hcontent;
	private String fcperiod;
	private int ptnum;
	private int gxnum;
	private int frnum;
	private String sellperiod;
	private int price;
	private boolean sellflag;
	private String deadlinedate;
	
	public healthitemBean() {
		// TODO Auto-generated constructor stub
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getHcontent() {
		return hcontent;
	}
	public void setHcontent(String hcontent) {
		this.hcontent = hcontent;
	}
	public String getFcperiod() {
		return fcperiod;
	}
	public void setFcperiod(String fcperiod) {
		this.fcperiod = fcperiod;
	}
	public String getDeadlinedate() {
		return deadlinedate;
	}
	public void setDeadlinedate(String deadlinedate) {
		this.deadlinedate = deadlinedate;
	}
	public int getPtnum() {
		return ptnum;
	}
	public void setPtnum(int ptnum) {
		this.ptnum = ptnum;
	}
	public int getGxnum() {
		return gxnum;
	}
	public void setGxnum(int gxnum) {
		this.gxnum = gxnum;
	}
	public int getFrnum() {
		return frnum;
	}
	public void setFrnum(int frnum) {
		this.frnum = frnum;
	}
	public String getSellperiod() {
		return sellperiod;
	}
	public void setSellperiod(String sellperiod) {
		this.sellperiod = sellperiod;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public boolean getSellflag() {
		return sellflag;
	}
	public void setSellflag(boolean sellflag) {
		this.sellflag = sellflag;
	}
	
}
