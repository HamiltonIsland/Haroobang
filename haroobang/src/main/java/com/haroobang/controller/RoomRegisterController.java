package com.haroobang.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.haroobang.common.Util;
import com.haroobang.service.RoomRegisterService;
import com.haroobang.vo.RoomAttachVO;
import com.haroobang.vo.RoomVO;

@Controller
@RequestMapping("/room")
public class RoomRegisterController {
	@Autowired
	@Qualifier("RoomRegisterService")
	private RoomRegisterService roomRegisterService;

	// 숙소등록 페이지 보여주기
	@RequestMapping(value = "/roomRegister.action", method = RequestMethod.GET)
	public String roomRegisterView(HttpSession session) {
		if (session.getAttribute("login") == null) {
			return "account/login";
		}
		return "room/roomRegister";
	}

	// 숙소 등록하기
	@RequestMapping(value = "/roomRegister.action", method = RequestMethod.POST)
	public String roomRegisterInsert(RoomAttachVO vos, RoomVO vo, HttpSession session,
			MultipartHttpServletRequest req) {
		if (session.getAttribute("login") == null) {
			return "redirect:/account/login.action";
		}

		roomRegisterService.roomRegisterService(vo);
		
		
		List<MultipartFile> attach = req.getFiles("file");
		ArrayList<RoomAttachVO> attachs = new ArrayList<RoomAttachVO>();
		if (attach != null && !attach.isEmpty()) {

			for (MultipartFile mf : attach) {
				String savedFileName = Util.makeUniqueFileName(mf.getOriginalFilename());
				String path = req.getServletContext().getRealPath("/resources/upload/" + savedFileName);
				try {
				mf.transferTo(new File(path));
				vos.setSavedFileName(savedFileName);
				vos.setUserFileName(mf.getOriginalFilename());
				attachs.add(vos);
				vo.setRoomAttachList(attachs);
				
				vos.setRoomNo(vo.getRoomNo());// 위에서 등록한 글번호 저장
				roomRegisterService.insertRoomAttachService(vos);		
				
				} catch (Exception ex) {
				}
			}
		}

		
		return "redirect:/home.action";
	}

}
