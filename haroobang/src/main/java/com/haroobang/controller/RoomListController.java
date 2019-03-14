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
import com.haroobang.vo.RoomVO;

@Controller
@RequestMapping("/room")//커밋...
public class RoomListController {
	
	@Autowired
	@Qualifier("RoomListService")
	private RoomListService roomListService;
	
	@RequestMapping(value="/roomList.action", method=RequestMethod.GET)
	public String roomList(Model model) {//(@RequestParam(value = "pageno", required = false, defaultValue = "1")Integer pageNo, Model model) {
		
		/*int pageSize = 12;	//한 페이지에 표시되는 데이터 개수
		int from = (pageNo - 1) * pageSize + 1; //해당 페이지에 포함된 시작 글번호
		int to = from + pageSize;				//해당 페이지에 포함된 마지막 글번호 + 1
		int pagerSize = 3;	//한 번에 표시되는 페이지 번호 개수
		String linkUrl = "roomList.action"; //페이지 번호를 눌렀을 때 이동할 경로
*/		
		List<RoomVO> rooms = roomListService.findAllRooms();
		//List<RoomVO> rooms = roomListService.findAllRoomsByPage(from, to);
		//int roomCount = roomListService.findRoomCount();
		
		List<RoomVO> disapproval = roomListService.findAllDisapprovalRooms();
		//List<RoomVO> disapproval = roomListService.findAllDisapprovalRoomsByPage(from, to);
		//int disapprovalCount = roomListService.findDisapprovalRoomsCount();
		
		//ThePager pager = new ThePager(roomCount, pageNo, pageSize, pagerSize, linkUrl);
		//ThePager disPager = new ThePager(disapprovalCount, pageNo, pageSize, pagerSize, linkUrl);
		
		model.addAttribute("rooms", rooms);
		model.addAttribute("disapproval", disapproval);
		//model.addAttribute("pager", pager);
		//model.addAttribute("pageno", pageNo);
		
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
	public String roomUnLiked(String formdate) {//HttpSession session, HttpServletRequest req, AccountVO account) {
		
		
		
		return "success";
	}
	
	
	//home에서 검색목록
	@RequestMapping(value="/searchRoomList.action", method=RequestMethod.GET)
	public String searchRoomList(RoomVO vo,Model model) {
		
		List<RoomVO> roomList = roomListService.searchRoomListService(vo);
		model.addAttribute("rooms",roomList);
		return "room/roomList";
	}
}
