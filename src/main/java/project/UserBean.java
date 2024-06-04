package project;

public class UserBean {
	 private int num;
	 private String id; 
	 private String pwd; 
	 private String name; 
	 private int gender; 
	 private String birth; 
	 private String email;
	 private String postnum;
	 private String city;
	 private String streetaddr;
	 private String joindate; 
	 private int point;
	 private int company;
	 private String phone;
	 private int sns;
	 private String snsid;
	 private String snspwd;
	 private int frnum;
	 private int authority;
	 private TrainerBean trainerInfo;

	 
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPostnum() {
		return postnum;
	}
	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getStreetaddr() {
		return streetaddr;
	}
	public void setStreetaddr(String streetaddr) {
		this.streetaddr = streetaddr;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getCompany() {
		return company;
	}
	public void setCompany(int company) {
		this.company = company;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getSns() {
		return sns;
	}
	public void setSns(int sns) {
		this.sns = sns;
	}
	public String getSnsid() {
		return snsid;
	}
	public void setSnsid(String snsid) {
		this.snsid = snsid;
	}
	public String getSnspwd() {
		return snspwd;
	}
	public void setSnspwd(String snspwd) {
		this.snspwd = snspwd;
	}
	public int getFrnum() {
		return frnum;
	}
	public void setFrnum(int frnum) {
		this.frnum = frnum;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	 
    // 트레이너 정보를 설정하는 메소드
    public void setTrainerInfo(TrainerBean trainerInfo) {
        this.trainerInfo = trainerInfo;
    }

    // 트레이너 정보를 가져오는 메소드
    public TrainerBean getTrainerInfo() {
        return this.trainerInfo;
    }
 
	 

	 
	 
}
