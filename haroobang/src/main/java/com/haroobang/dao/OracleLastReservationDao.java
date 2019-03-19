package com.haroobang.dao;

import java.util.HashMap;
import java.util.List;

import com.haroobang.mapper.LastReservationMapper;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public class OracleLastReservationDao implements LastReservationDao {
	
	private LastReservationMapper lastReservationMapper;
	
	public void setLastReservationMapper(LastReservationMapper lastReservationMapper) {
		this.lastReservationMapper = lastReservationMapper;
	}

	/*public List<ReservationVO> selectAllMyLastReservation(int memberNo) {
		List<ReservationVO> myrooms = lastReservationMapper.selectAllMyLastReservation(memberNo);
		return myrooms;
	}
*/
	@Override
	public ReservationVO selectRoomByRoomNo(int roomNo, int memberNo, String startdate) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("roomNo", roomNo);
		params.put("memberNo", memberNo);
		params.put("startDate", startdate);
		ReservationVO myroom = lastReservationMapper.selectRoomByRoomNo(params);
		return myroom;
	}

	@Override
	public List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo) {
		List<RoomAttachVO> attachs = lastReservationMapper.selectRoomAttachByRoomNo(roomNo);
		return attachs;
	}

	@Override
	public List<ReservationVO> selectAllMyLastReservationByPage(int memberNo, int from, int to) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("memberNo", memberNo);
		params.put("first", from);
		params.put("last", to);
		
		List<ReservationVO> myrooms = lastReservationMapper.selectAllMyLastReservationByPage(params);
		return myrooms;
	}

	@Override
	public int selectRoomCount(int memberNo) {
		int count = lastReservationMapper.selectRoomCount(memberNo);
		return count;
	}

	@Override
	public String findComment(int reservationNo) {
		String result = "success";
		try {
			int commentNo = lastReservationMapper.findComment(reservationNo);
			if(commentNo < 1) {
				result = "fail";
			}
		} catch (Exception e) {
			result="fail";
		}
		
		return result;
	}

}
