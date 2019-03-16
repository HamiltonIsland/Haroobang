package com.haroobang.mapper;

import java.util.HashMap;
import java.util.List;

import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;

public interface CurrentReservationMapper {

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);

	List<ReservationVO> selectAllCurrentReservations(int memberNo);

	int selectCurrentCount(int memberNo);

	List<ReservationVO> selectCurrentRoomByPage(HashMap<String, Object> params);

	void refundCheck(int refundNum);
}
