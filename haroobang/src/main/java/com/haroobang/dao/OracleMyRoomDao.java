package com.haroobang.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.jsp.tagext.TryCatchFinally;

import org.springframework.stereotype.Repository;

import com.haroobang.mapper.MyRoomMapper;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

@Repository("MyRoomDao")
public class OracleMyRoomDao implements MyRoomDao {

	private MyRoomMapper myRoomMapper;
	

	public void setMyRoomMapper(MyRoomMapper myRoomMapper) {
		this.myRoomMapper = myRoomMapper;
	}



	@Override
	public List<RoomVO> selectAllMyRooms(int memberNo) {
		List<RoomVO> rooms = myRoomMapper.selectAllMyRooms(memberNo);
		return rooms;
	}



	@Override
	public List<RoomAttachVO> selectAllMyRoomAttachByRoomNo(int roomNo) {
		List<RoomAttachVO> attachs = myRoomMapper.selectAllMyRoomAttachByRoomNo(roomNo);
		return attachs;
	}


	@Override
	public List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo) {
		List<RoomAttachVO> attachs = myRoomMapper.selectRoomAttachByRoomNo(roomNo);
		return attachs;
	}



	@Override
	public List<RoomVO> selectWaitingListByPage(int memberNo, int from, int to) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("memberNo", memberNo);
		params.put("first", from);
		params.put("last", to);
		
		List<RoomVO> waitings = myRoomMapper.selectWaitingsList(params);
		return waitings;
	}



	@Override
	public int selectWaitingCount(int memberNo) {
		int count = myRoomMapper.selectWaitingCount(memberNo);
		return count;
	}



	@Override
	public void deleteMyRoom(String roomNo) {
		myRoomMapper.deleteMyRoom(Integer.parseInt(roomNo));
	}



	@Override
	public List<ReservationVO> reservationByMyRoom(int roomNo) {
		List<ReservationVO> reservations = myRoomMapper.selectReservationsByroomno(roomNo);
		return reservations;
	}



	@Override
	public ReservationVO selectReservationByReservationNo(int reservationNo) {
		ReservationVO reservation = myRoomMapper.seletReservationByReservationNo(reservationNo);
		return reservation;
	}



	@Override
	public RoomVO selectRoomDetailbyRoonNo(int roomNo) {
		RoomVO roomDetail = myRoomMapper.selectRoomDetailbyRoonNo(roomNo);
		List<RoomAttachVO> attach = myRoomMapper.selectRoomAttachbyRoomNo(roomNo);
		
		roomDetail.setRoomAttachList(attach);
		return roomDetail;
	}



	@Override
	public AccountVO selectMemberByMemberNo(int memberNo) {
		AccountVO member = myRoomMapper.selectMemberByMemberNo(memberNo);
		return member;
	}



	@Override
	public String checkinApproval(int reservationNo) {
		String result = "success";
		try{
			myRoomMapper.checkinApproval(reservationNo);
		}catch(Exception e) {
			result="fail";
		}	
				
		return result;
	}



	@Override
	public String calcelCheckin(int reservationNo) {
		
		String result = "success";
		try{
			myRoomMapper.calcelCheckin(reservationNo);
		}catch(Exception e) {
			e.printStackTrace();
			result="fail";
		}
		return result;
	}


}
