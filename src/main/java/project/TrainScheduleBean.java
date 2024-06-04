package project;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class TrainScheduleBean {
	private int num;
	private int user;
	private int trainer;
	private int lcontent;
	private String date;
	private String starttime;
	private String endtime;
	private int frnum;
	private boolean sflag;
	
	public TrainScheduleBean() {
		// TODO Auto-generated constructor stub
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
	public int getTrainer() {
		return trainer;
	}
	public void setTrainer(int trainer) {
		this.trainer = trainer;
	}
	public int getLcontent() {
		return lcontent;
	}
	public void setLcontent(int lcontent) {
		this.lcontent = lcontent;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public int getFrnum() {
		return frnum;
	}
	public void setFrnum(int frnum) {
		this.frnum = frnum;
	}
	public boolean getSflag() {
		return sflag;
	}
	public void setSflag(boolean sflag) {
		this.sflag = sflag;
	}
	
	
}

