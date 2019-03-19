package com.haroobang.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.haroobang.service.RoomListService;
import com.haroobang.ui.ThePager;
import com.haroobang.vo.AccountVO;
import com.haroobang.vo.LikedVO;
import com.haroobang.vo.ReservationVO;
import com.haroobang.vo.RoomVO;

@Controller
@RequestMapping("/room")//커밋...
public class RoomListController {
	
	@Autowired
	@Qualifier("RoomListService")
	private RoomListService roomListService;
	
	@RequestMapping(value="/roomList.action", method=RequestMethod.GET)
	public String roomList(@RequestParam(value = "pageno", required = false, defaultValue = "1")Integer pageNo, Model model,
			HttpSession session, HttpServletRequest req, AccountVO accountVO) {
	//(Model model, HttpSession session, HttpServletRequest req, AccountVO accountVO) {
		
		int pageSize = 8;	//한 페이지에 표시되는 데이터 개수
		int from = (pageNo - 1) * pageSize; // + 1; //해당 페이지에 포함된 시작 글번호
		int to = pageSize; /*from + pageSize;*/				//해당 페이지에 포함된 마지막 글번호 + 1
		int pagerSize = 10;	//한 번에 표시되는 페이지 번호 개수
		String linkUrl = "roomList.action"; //페이지 번호를 눌렀을 때 이동할 경로
		
		//List<RoomVO> rooms = roomListService.findAllRooms();
		List<RoomVO> rooms = roomListService.findAllRoomsByPage(from, to);
		int roomCount = roomListService.findRoomCount();
		
		//List<RoomVO> disapproval = roomListService.findAllDisapprovalRooms();
		List<RoomVO> disapproval = roomListService.findAllDisapprovalRoomsByPage(from, to);
		int disapprovalCount = roomListService.findDisapprovalRoomsCount();
		
		accountVO = (AccountVO)session.getAttribute("login");
		List<LikedVO> likeds = null;
		if (accountVO != null) {
			likeds = roomListService.findAllLikeds(accountVO.getMemberNo());
		}
		
		/*List<ReservationVO> reservations = null;
		if(accountVO.getUserType().equals("admin")) {
			reservations = roomListService.findReservation();
		}*/
		
		ThePager pager = new ThePager(roomCount, pageNo, pageSize, pagerSize, linkUrl);
		ThePager disPager = new ThePager(disapprovalCount, pageNo, pageSize, pagerSize, linkUrl);
		
		model.addAttribute("likeds", likeds);
		model.addAttribute("rooms", rooms);
		model.addAttribute("disapproval", disapproval);
		model.addAttribute("pager", pager);
		model.addAttribute("disPager", disPager);
		model.addAttribute("pageno", pageNo);
		
		return "room/roomList";
	}
	
	@RequestMapping(value="/roomApproval.action", method=RequestMethod.POST)
	@ResponseBody
	public String roomApproval(String formdate) {//HttpSession session, HttpServletRequest req, AccountVO account) {
		//@RequestParam(value="formdate")
		roomListService.approvalRoom(formdate);
		
		return "success";
	}
	
	@RequestMapping(value="/roomLiked.action", method=RequestMethod.POST)
	@ResponseBody
	public String roomLiked(String memberno, String roomno, HttpSession session) {//HttpSession session, HttpServletRequest req, AccountVO account) {
		//@RequestParam(value="userId")
		roomListService.likedRoom(memberno, roomno);
			
		return "success";
	}
	
	@RequestMapping(value="/roomUnLiked.action", method=RequestMethod.POST)
	@ResponseBody
	public String roomUnLiked(String memberno, String roomno) {//HttpSession session, HttpServletRequest req, AccountVO account) {
		
		roomListService.unLikedRoom(memberno, roomno);
		
		return "success";
	}
	
	@RequestMapping(value="/deleteapproval.action", method=RequestMethod.POST)
	@ResponseBody
	public String deleteapproval(String formdate) {//HttpSession session, HttpServletRequest req, AccountVO account) {
		
		roomListService.deleteapproval(formdate);
		
		return "success";
	}
	
	@RequestMapping(value="/roomDelete.action", method=RequestMethod.POST)
	@ResponseBody
	public String roomDelete(String roomno) {//HttpSession session, HttpServletRequest req, AccountVO account) {
		
		roomListService.deleteRoom(roomno);
		
		return "success";
	}
	
	
	//home에서 검색목록
	@RequestMapping(value="/searchRoomList.action", method=RequestMethod.GET)
	public String searchRoomList(@RequestParam(value = "pageno", required = false, defaultValue = "1")Integer pageNo,RoomVO vo,Model model,HttpSession session) {
		
		int pageSize = 8;	//한 페이지에 표시되는 데이터 개수
		int from = (pageNo - 1) * pageSize; // + 1; //해당 페이지에 포함된 시작 글번호
		int to = pageSize; /*from + pageSize;*/				//해당 페이지에 포함된 마지막 글번호 + 1
		int pagerSize = 2;	//한 번에 표시되는 페이지 번호 개수
		String linkUrl = "roomList.action"; //페이지 번호를 눌렀을 때 이동할 경로
		
		List<RoomVO> roomList = roomListService.searchRoomListService(vo, from, to);
		AccountVO accountVO = (AccountVO)session.getAttribute("login");
		List<LikedVO> likeds = null;
		if (accountVO != null) {
			likeds = roomListService.findAllLikeds(accountVO.getMemberNo());
		}
		
		int roomCount = roomListService.findSearchRoomCount(vo);
		
		ThePager pager = new ThePager(roomCount, pageNo, pageSize, pagerSize, linkUrl);
		
		model.addAttribute("pager", pager);
		model.addAttribute("pageno", pageNo);
		model.addAttribute("likeds", likeds);
		model.addAttribute("rooms",roomList);
		return "room/roomList";
	}
}
