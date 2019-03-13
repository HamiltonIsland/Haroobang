package com.haroobang.vo;

import java.util.List;

public class RoomVO {
	
	private int roomNo;
	private int memberNo;
	private String regDate;
	private String roomName;
	private boolean approval;
	private String address;
	private String longitude;
	private String latitude;
	private String roomProfile;
	private int price;
	private int readCount;
	private int maximum;
	private boolean deleted;
	private List<RoomAttachVO> roomAttachList;
	private List<CommentVO> roomCommentList;
	private float averageRates;
	private String checkIn;
	private String checkOut;
	private String memberSavedFileName;
	
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public boolean isApproval() {
		return approval;
	}
	public void setApproval(boolean approval) {
		this.approval = approval;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getRoomProfile() {
		return roomProfile;
	}
	public void setRoomProfile(String roomProfile) {
		this.roomProfile = roomProfile;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public int getMaximum() {
		return maximum;
	}
	public void setMaximum(int maximum) {
		this.maximum = maximum;
	}
	public boolean isDeleted() {
		return deleted;
	}
	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	public List<RoomAttachVO> getRoomAttachList() {
		return roomAttachList;
	}
	public void setRoomAttachList(List<RoomAttachVO> roomAttachList) {
		this.roomAttachList = roomAttachList;
	}
	public List<CommentVO> getRoomCommentList() {
		return roomCommentList;
	}
	public void setRoomCommentList(List<CommentVO> roomCommentList) {
		this.roomCommentList = roomCommentList;
	}
	public float getAverageRates() {
		return averageRates;
	}
	public void setAverageRates(float averageRates) {
		this.averageRates = averageRates;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public String getMemberSavedFileName() {
		return memberSavedFileName;
	}
	public void setMemberSavedFileName(String memberSavedFileName) {
		this.memberSavedFileName = memberSavedFileName;
	}


}
