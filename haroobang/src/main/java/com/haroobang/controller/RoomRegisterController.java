package com.haroobang.controller;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	// 숙소등록확인 페이지 보여주기
	@RequestMapping(value = "/roomRegisterConfig.action", method = RequestMethod.GET)
	public String roomRegisterConfigView(HttpSession session, Model model,int roomNo) {
		if (session.getAttribute("login") == null) {
			return "account/login";
		}
		RoomVO list = roomRegisterService.roomListService(roomNo);
		
		model.addAttribute("room",list);
		
		return "room/roomRegisterConfig";
	}


	// 숙소 등록하기
	@RequestMapping(value = "/roomRegister.action", method = RequestMethod.POST)
	@ResponseBody
	public int roomRegisterInsert(RoomAttachVO vos, RoomVO vo, HttpSession session,
			MultipartHttpServletRequest req,Model model) throws IOException {
		
		if(vo.getRoomProfile().equals("")) {
			vo.setRoomProfile("안녕하세요 "+vo.getRoomName()+" 입니다");
		}
		roomRegisterService.roomRegisterService(vo);
		
		int roomNo = 0;
		
		List<MultipartFile> attach = req.getFiles("file");
		
		ArrayList<RoomAttachVO> attachs = new ArrayList<RoomAttachVO>();
		
		if (attach != null && !attach.isEmpty()) {

			for (MultipartFile mf : attach) {
				
				ByteArrayInputStream is = new ByteArrayInputStream(mf.getBytes());
				
				int width = 500;
				int height = 500;
				
				BufferedImage image = ImageIO.read(is);
				
				
				BufferedImage resized= resize(image, height, width);
				
				String savedFileName = Util.makeUniqueFileName(mf.getOriginalFilename());
				String path = req.getServletContext().getRealPath("/resources/upload/" + savedFileName);
				try {
//				mf.transferTo(new File(path));
				File output = new File(path);
				boolean result = ImageIO.write(resized,"jpg",output);
				
				vos.setSavedFileName(savedFileName);
				vos.setUserFileName(mf.getOriginalFilename());
				attachs.add(vos);
				vo.setRoomAttachList(attachs);
				
				roomNo = vo.getRoomNo();
				vos.setRoomNo(vo.getRoomNo());// 위에서 등록한 글번호 저장
				roomRegisterService.insertRoomAttachService(vos);		
				
				} catch (Exception ex) {
				}
			}
		}else{
			vos.setSavedFileName("default.jpg");
			vos.setUserFileName("default.jpg");
			attachs.add(vos);
			vo.setRoomAttachList(attachs);
			
			roomNo = vo.getRoomNo();
			vos.setRoomNo(vo.getRoomNo());// 위에서 등록한 글번호 저장
			roomRegisterService.insertRoomAttachService(vos);
		}

		
		return roomNo;
	}
	
	private static BufferedImage resize(BufferedImage img, int height, int width) {
        Image tmp = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
        BufferedImage resized = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = resized.createGraphics();
        g2d.drawImage(tmp, 0, 0, null);
        g2d.dispose();
        return resized;
    }
	
	// 숙소등록확인 페이지 보여주기
		@RequestMapping(value = "/deleteRegister.action", method = RequestMethod.GET)
		public String deleteRoom(HttpSession session,int roomNo) {
			if (session.getAttribute("login") == null) {
				return "account/login";
			}
			
			roomRegisterService.deleteRoomService(roomNo);
			
			
			return "redirect:/room/roomRegister.action";
		}

}
