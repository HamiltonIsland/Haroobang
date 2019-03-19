package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public interface LastReservationDao {

	//List<ReservationVO> selectAllMyLastReservation(int memberNo);

	ReservationVO selectRoomByRoomNo(int roomNo, int memberNo, String startdate);

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);

	List<ReservationVO> selectAllMyLastReservationByPage(int memberNo, int from, int to);

	int selectRoomCount(int memberNo);

	String findComment(int reservationNo);

}
