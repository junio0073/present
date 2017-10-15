package com.svl.present;

public class memberDTO {
private String userID;
private String userPW;
private String E_mail;

public memberDTO(String userID, String userPW,String E_mail)
{
	this.userID=userID;
	this.userPW=userPW;
	this.E_mail=E_mail;
}


public String getUserID() {
	return userID;
}
public void setUserID(String userID) {
	this.userID = userID;
}
public String getUserPW() {
	return userPW;
}
public void setUserPW(String userPW) {
	this.userPW = userPW;
}
public String getE_mail() {
	return E_mail;
}
public void setE_mail(String e_mail) {
	E_mail = e_mail;
}
}
