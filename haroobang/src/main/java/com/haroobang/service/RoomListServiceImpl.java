package com.haroobang.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.haroobang.dao.RoomListDao;
import com.haroobang.vo.LikedVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

@Service("RoomListService") //커밋...
public class RoomListServiceImpl implements RoomListService{
	
	@Autowired
	@Qualifier("RoomListDao")
	private RoomListDao roomlistDao;

	@Override
	public List<RoomVO> findAllRooms() {
		List<RoomVO> rooms = roomlistDao.selectAllRooms();
		
		for(RoomVO room : rooms) {
			List<RoomAttachVO> attachments = roomlistDao.selectRoomAttachByRoomNo(room.getRoomNo());
			room.setRoomAttachList(attachments);
		}
		
		return rooms;
	}

	@Override
	public List<RoomVO> findAllDisapprovalRooms() {
		List<RoomVO> rooms = roomlistDao.selectAllDisapprovalRooms();

		for (RoomVO room : rooms) {
			List<RoomAttachVO> attachments = roomlistDao.selectRoomAttachByRoomNo(room.getRoomNo());
			room.setRoomAttachList(attachments);
		}

		return rooms;
	}

	@Override
	public void approvalRoom(String formdate) {
		roomlistDao.approvalRoom(formdate);
	}

	@Override
	public List<RoomVO> findAllRoomsByPage(int from, int to) {
		List<RoomVO> rooms = roomlistDao.selectAllRoomByPage(from, to);
		for(int i=0; i<rooms.size(); i++) {
			List<RoomAttachVO> attachVos = roomlistDao.selectRoomAttachByRoomNo(rooms.get(i).getRoomNo());
			rooms.get(i).setRoomAttachList(attachVos);
		}
		return rooms;
	}

	@Override
	public int findRoomCount() {
		int count = roomlistDao.selectRoomCount();
		return count;
	}

	@Override
	public List<RoomVO> searchRoomListService(RoomVO vo) {
		List<RoomVO> list = roomlistDao.searchRoomListDao(vo);
		for(RoomVO room : list) {
			List<RoomAttachVO> attachments = roomlistDao.selectRoomAttachByRoomNo(room.getRoomNo());
			room.setRoomAttachList(attachments);
		}
		return list;
	}

	@Override
	public void likedRoom(String memberno, String roomno) {
		roomlistDao.likedRoom(memberno, roomno);
	}

	@Override
	public void unLikedRoom(String memberno, String roomno) {
		roomlistDao.unLikedRoom(memberno, roomno);
	}

	@Override
	public List<LikedVO> findAllLikeds(int memberNo) {
		List<LikedVO> likeds = roomlistDao.selectAllLiked(memberNo);
		return likeds;
	}

	@Override
	public List<RoomVO> findAllDisapprovalRoomsByPage(int from, int to) {
		List<RoomVO> rooms = roomlistDao.selectAllDisapprovalRoomByPage(from, to);
		
		for(int i=0; i<rooms.size(); i++) {
			List<RoomAttachVO> attachVos = roomlistDao.selectRoomAttachByRoomNo(rooms.get(i).getRoomNo());
			rooms.get(i).setRoomAttachList(attachVos);
		}
		
		return rooms;
	}

	@Override
	public int findDisapprovalRoomsCount() {
		int count = roomlistDao.selectDisapprovalRoomCount();
		return count;
	}

}
