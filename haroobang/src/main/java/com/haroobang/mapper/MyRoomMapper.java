package com.haroobang.mapper;

import java.util.HashMap;
import java.util.List;

import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

public interface MyRoomMapper {

	List<RoomVO> selectAllMyRooms(int memberNo);

	List<RoomAttachVO> selectAllMyRoomAttachByRoomNo(int roomNo);

	List<ReservationVO> selectReservationByRoomNo(HashMap<String, Object> params);

	List<RoomAttachVO> selectRoomAttachByRoomNo(int roomNo);



	


}
