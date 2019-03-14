package com.haroobang.mapper;

import java.util.List;

import com.haroobang.vo.ReservationVO;

public interface MyRoomMapper {

	List<ReservationVO> selectAllMyRoomReservation(int memberNo);




}
