package com.haroobang.mapper;

import java.util.List;

import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;

public interface CurrentReservationMapper {

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);
//우헤헿헤

	List<ReservationVO> selectAllCurrentReservations(int memberNo);
}
