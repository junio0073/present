package com.svl.present;

import java.sql.Date;
public class sprintDTO {
	private int syear;
	private int smonth;
	private int sdays;
	private String sprint_color;
	private String sprint_name;
	private String special_day;
	
	public sprintDTO(int syear,int smonth,int sdays, String Sprint_color, String Sprint_name, String special_day) {
		this.setSyear(syear);
		this.setSmonth(smonth);
		this.setSdays(sdays);
		this.sprint_color=Sprint_color;
		this.sprint_name=Sprint_name;
		this.special_day=special_day;
	}
	
	public String getSprint_color() {
		return sprint_color;
	}
	public void setSprint_color(String sprint_color) {
		this.sprint_color = sprint_color;
	}
	public String getSprint_name() {
		return sprint_name;
	}
	public void setSprint_name(String sprint_name) {
		this.sprint_name = sprint_name;
	}

	public String getSpecial_day() {
		return special_day;
	}
	public void setSpecial_day(String special_day) {
		this.special_day = special_day;
	}

	public int getSyear() {
		return syear;
	}

	public void setSyear(int syear) {
		this.syear = syear;
	}

	public int getSmonth() {
		return smonth;
	}

	public void setSmonth(int smonth) {
		this.smonth = smonth;
	}

	public int getSdays() {
		return sdays;
	}

	public void setSdays(int sdays) {
		this.sdays = sdays;
	}
}
