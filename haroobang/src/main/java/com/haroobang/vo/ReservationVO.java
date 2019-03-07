package com.haroobang.vo;

public class ReservationVO {
	 private int reservationNo;
	 private int memberNo;
	 private int roomNo;
	 private String regDate;
	 private String payment;
	 private int totalPrice;
	 private int nights;
	 private String request;
	 private boolean checkin;
	 private String startDate;
	 
	 private RoomVO roomVO;
	 
	 public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getNights() {
		return nights;
	}
	public void setNights(int nights) {
		this.nights = nights;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public boolean isCheckin() {
		return checkin;
	}
	public void setCheckin(boolean checkin) {
		this.checkin = checkin;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public RoomVO getRoomVO() {
		return roomVO;
	}
	public void setRoomVO(RoomVO roomVO) {
		this.roomVO = roomVO;
	}
	
}
