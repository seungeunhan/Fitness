package hanSeungEun;

public class ReservationBean {
	
	int num;
	int user;//0, 1
	String name;
	String pwd;
	String phonenum;
	String email;
	int population;
	int ccflag;
	int frnum;
	String reservdate;
	int carflag;
	int userflag;
	String time;
	
public ReservationBean() {}
	public ReservationBean(int num, int user, String name, String pwd, String phonenum, String email, int population, int ccflag, int frnum, String reservdate, int carflag, int userflag, String time) {
		
		this.num = num;
		this.user = user;
		this.name = name;
		this.pwd = pwd;
		this.phonenum = phonenum;
		this.email = email;
		this.population = population;
		this.ccflag = ccflag;
		this.frnum = frnum;
		this.reservdate = reservdate;
		this.carflag = carflag;
		this.userflag = userflag;
		this.time = time;
		
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getUser() {
		return user;
	}
	public void setUser(int user) {
		this.user = user;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPopulation() {
		return population;
	}
	public void setPopulation(int population) {
		this.population = population;
	}
	public int getCcflag() {
		return ccflag;
	}
	public void setCcflag(int ccflag) {
		this.ccflag = ccflag;
	}
	public int getFrnum() {
		return frnum;
	}
	public void setFrnum(int frnum) {
		this.frnum = frnum;
	}
	public String getReservdate() {
		return reservdate;
	}
	public void setReservdate(String reservdate) {
		this.reservdate = reservdate;
	}
	public int getCarflag() {
		return carflag;
	}
	public void setCarflag(int carflag) {
		this.carflag = carflag;
	}
	public int getUserflag() {
		return userflag;
	}
	public void setUserflag(int userflag) {
		this.userflag = userflag;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	

	
}
