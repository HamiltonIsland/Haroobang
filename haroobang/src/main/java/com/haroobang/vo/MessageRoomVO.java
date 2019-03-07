package com.haroobang.vo;

import java.util.List;

public class MessageRoomVO {
	private int messageRoomNo;
	private int memberNo;
	private int memberNo2;
	private String regDate;
	private List<AccountVO> memberList;
	
	public int getMessageRoomNo() {
		return messageRoomNo;
	}
	public void setMessageRoomNo(int messageRoomNo) {
		this.messageRoomNo = messageRoomNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getMemberNo2() {
		return memberNo2;
	}
	public void setMemberNo2(int memberNo2) {
		this.memberNo2 = memberNo2;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public List<AccountVO> getMemberList() {
		return memberList;
	}
	public void setMemberList(List<AccountVO> memberList) {
		this.memberList = memberList;
	}

}
