package com.haroobang.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.haroobang.mapper.MyRoomMapper;
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
	public List<ReservationVO> selectReservationByRoomNo(int roomNo, int memberNo) {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("roomNo", roomNo);
		params.put("memberNo", memberNo);
		List<ReservationVO> myroom = myRoomMapper.selectReservationByRoomNo(params);
		return myroom;
	}



	@Override
	public List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo) {
		List<RoomAttachVO> attachs = myRoomMapper.selectRoomAttachByRoomNo(roomNo);
		return attachs;
	}

	
	

	


//	@Override
//	public List<ReservationVO> selectAllMyRoomReservation(int memberNo) {
//		List<ReservationVO> myrooms = myRoomMapper.selectAllMyRoomReservation(memberNo);
//		return myrooms;
//	}
//
//
//	@Override
//	public List<Integer> selectAllMyRoomNo(int memberNo) {
//		List<Integer> myroomNo = myRoomMapper.selectAllMyRoomNo(memberNo);
//		
//		for(int i = 0 ; i < myroomNo.size() ; i++) {
//			List<ReservationVO> myroomRes = myRoomMapper.selectAllMyRoomReservation(myroomNo.get(i));
//		}
//		
//		return myroomNo;
//	}

}
