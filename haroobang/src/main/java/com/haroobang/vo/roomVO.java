package com.haroobang.vo;

import java.util.List;

public class roomVO {
	int roomVO;
	int memberNo;
	String regDate;
	boolean approval;
	String address;
	String longitude;
	String latitude;
	String roomoProfile;
	int price;
	int readCount;
	int maximum;
	boolean deleted;
	String roomName;
	
	List<RoomAttachVO> RoomAttachList;
	
	public int getRoomVO() {
		return roomVO;
	}
	public void setRoomVO(int roomVO) {
		this.roomVO = roomVO;
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
	public String getRoomoProfile() {
		return roomoProfile;
	}
	public void setRoomoProfile(String roomoProfile) {
		this.roomoProfile = roomoProfile;
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
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public List<RoomAttachVO> getRoomAttachList() {
		return RoomAttachList;
	}
	public void setRoomAttachList(List<RoomAttachVO> roomAttachList) {
		RoomAttachList = roomAttachList;
	}
	
	

}
