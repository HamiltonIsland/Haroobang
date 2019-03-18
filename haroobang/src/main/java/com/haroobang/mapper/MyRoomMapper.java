package com.haroobang.mapper;

import java.util.HashMap;
import java.util.List;

import com.haroobang.vo.AccountVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public interface MyRoomMapper {

	List<RoomVO> selectAllMyRooms(int memberNo);

	List<RoomAttachVO> selectAllMyRoomAttachByRoomNo(int roomNo);

	List<ReservationVO> selectReservationByRoomNo(HashMap<String, Object> params);

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);

	List<RoomVO> selectWaitingsList(HashMap<String, Object> params);

	int selectWaitingCount(int memberNo);

	void deleteMyRoom(int roomNo);

	List<ReservationVO> selectReservationsByroomno(int roomNo);

	ReservationVO seletReservationByReservationNo(int reservationNo);

	RoomVO selectRoomDetailbyRoonNo(int roomNo);

	List<RoomAttachVO> selectRoomAttachbyRoomNo(int roomNo);

	AccountVO selectMemberByMemberNo(int memberNo);

	void checkinApproval(int reservationNo);

	void calcelCheckin(int reservationNo);



	


}
