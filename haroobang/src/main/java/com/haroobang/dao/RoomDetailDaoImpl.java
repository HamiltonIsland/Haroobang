package com.haroobang.dao;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.haroobang.mapper.RoomDetailMapper;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.CommentVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

@Repository("RoomDetailDao")
public class RoomDetailDaoImpl implements RoomDetailDao{

	@Autowired
	@Qualifier("RoomDetailMapper")
	private RoomDetailMapper roomDetailMapper;
	
	@Override
	public String addLike(int roomNo, int memberNo) {
		
		String result = "success";
		try {
			HashMap<String,Object> params = new HashMap<String, Object>();
			
			params.put("roomNo", roomNo);
			params.put("memberNo", memberNo);
			roomDetailMapper.addLike(params);
		} catch (Exception e) {
			result = "fail";
		}
		return result;
		
		
	}

	@Override
	public RoomVO findRoomDetail(int roomNo) {
		
		RoomVO room = roomDetailMapper.findRoomDetail(roomNo);
		int memberNo = room.getMemberNo();
		room.setMemberSavedFileName(roomDetailMapper.findMemberSavedFileName(memberNo));
		
		List<RoomAttachVO> roomAttachList = roomDetailMapper.findRoomAttach(roomNo);
		List<CommentVO> commentList = roomDetailMapper.findCommentList(roomNo);
		for(int i =0;i<commentList.size();i++) {
			AccountVO member = roomDetailMapper.findMemberId(commentList.get(i).getMemberNo());
			commentList.get(i).setMember(member);
		}
		try {
			room.setAverageRates(roomDetailMapper.averageRate(roomNo));
		} catch (Exception e) {
			
		}
		
		room.setRoomCommentList(commentList);
		room.setRoomAttachList(roomAttachList);
		
		return room;
	}

	@Override
	public AccountVO findMember(int memberNo) {
		AccountVO member = roomDetailMapper.findMemberId(memberNo);
		return member;
	}

	@Override
	public String addRoomReservation(ReservationVO reservationVo,List<LocalDate> dateList) {
		
		roomDetailMapper.addRoomReservaion(reservationVo);
		int reservationNo = reservationVo.getReservationNo();
		
		int roomNo = reservationVo.getRoomNo();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("reservationNo",reservationNo);
		params.put("roomNo", roomNo);
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd");
		try{
			for(int i=0;i<dateList.size()-1;i++) {
				params.put("date",formatter.format(dateList.get(i)));
				roomDetailMapper.addReservationDate(params);
			}
			return "success";
		}catch(Exception e) {
			return "fail";
		}
		
		
	}

	@Override
	public List<String> findDateList(int roomNo) {
		
		List<String> dateList = new ArrayList<String>();

		dateList = roomDetailMapper.findDateList(roomNo);
		
		if(dateList.size() == 0) {
			dateList.add("none");
		}
		
		return dateList;
	}

	@Override
	public String findReservedDate(int roomNo, String checkinDate, String endDate) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("roomNo", roomNo);
		params.put("checkinDate",checkinDate);
		params.put("endDate",endDate);

		List<Integer> reservationNo = new ArrayList<Integer>();
		String result = "success";
				
		try {
			reservationNo = roomDetailMapper.findReservedDate(params);
			if(reservationNo.size()>0) {
				result = "fail";
			}
		} catch (Exception e) {
			result = "fail";
		}
		
			
		return result;
		
}

	@Override
	public void roomDelete(int roomNo) {
		
		roomDetailMapper.roomDelete(roomNo);
		
	}

	@Override
	public String commentReport(int commentNo, String content, int memberNo) {
		
		String result = "success";
		try {
			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("commentNo", commentNo);
			params.put("content",content);
			params.put("memberNo",memberNo);
			
			roomDetailMapper.commentReport(params);
			roomDetailMapper.addReportCount(commentNo);
			
		} catch (Exception e) {
			result = "fail";
		}
		
		return result;
	
		
	}

	@Override
	public String findMyLike(int roomNo, int memberNo) {
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("roomNo",roomNo);
		params.put("memberNo", memberNo);
		
		String result ="true";
		
		int count = roomDetailMapper.findMyLike(params);
		if(count==0) {
			result = "false";
		}
		return result;
	}
}
