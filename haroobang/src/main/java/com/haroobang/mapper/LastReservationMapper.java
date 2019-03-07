package com.haroobang.mapper;

import java.util.List;

import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;

public interface LastReservationMapper {

	List<ReservationVO> selectAllMyLastReservation(int memberNo);

	//ReservationVO selectRoomByRoomNo(int roomNo);
	
}
