package com.haroobang.vo;

import java.util.List;

public class StatisticsVO {
	
	private List<ReservationVO> monthCount;
	private int memberCount;
	private int genderCount;
	private int femaleCount;

	public int getGenderCount() {
		return genderCount;
	}

	public void setGenderCount(int genterCount) {
		this.genderCount = genterCount;
	}

	public int getFemaleCount() {
		return femaleCount;
	}

	public void setFemaleCount(int femaleCount) {
		this.femaleCount = femaleCount;
	}

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
