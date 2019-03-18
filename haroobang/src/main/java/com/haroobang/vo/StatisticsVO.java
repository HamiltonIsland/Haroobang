package com.haroobang.vo;

import java.util.List;

public class StatisticsVO {
	
	private List<ReservationVO> monthCount;
	private int memberCount;

	public int getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}

	public List<ReservationVO> getMonthCount() {
		return monthCount;
	}

	public void setMonthCount(List<ReservationVO> monthCount) {
		this.monthCount = monthCount;
	}

}
