package com.haroobang.dao;

import java.util.List;

import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;

public interface CurrentReservationDao {

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);
//썅

	List<ReservationVO> selectAllCurrentReservations(int memberNo);
}
