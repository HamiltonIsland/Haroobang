package com.haroobang.mapper;

import java.util.HashMap;
import java.util.List;

import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;

public interface ReservationMapper {

	List<ReservationVO> selectAllReservations();

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);

	List<ReservationVO> selectReservationsByPage(HashMap<String, Object> params);

	int selectReserCount();

	void deleteReservation(int reservationNo);

	void refundRservation(int parseInt);

}