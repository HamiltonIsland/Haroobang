package com.haroobang.controller;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.bytecode.ByteArray;
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
import com.haroobang.service.AccountService;
import com.haroobang.service.MessageService;
import com.haroobang.vo.AccountVO;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	@Qualifier("AccountService")
	private AccountService accountService;
	
	@Autowired
	@Qualifier("MessageService")
	private MessageService messageService;
	
	//login창 보여주기
	@RequestMapping (value = "/login.action", method = RequestMethod.GET)
	public String loginView(AccountVO vo, HttpSession session) {	
		
		return "account/login";
	}
	
	//register창 보여주기
	@RequestMapping(value = "/register.action", method = RequestMethod.GET)
	public String registerView() {	
		return "account/register";
	}
	
	//login
	@RequestMapping (value = "/login.action", method = RequestMethod.POST)
	public String login(AccountVO vo, HttpSession session) {
		List<AccountVO> login = accountService.loginService(vo);	
		if(login == null || login.size()==0) {
			return "account/login"; 
		}
		
		session.setAttribute("login", login.get(0));
		
		AccountVO logins = (AccountVO)session.getAttribute("login");
		if(login!=null){
			int message = messageService.countMessageService(logins.getMemberNo());
			session.setAttribute("messageCount",message);
		}
		return "redirect:/home.action";
	}
	
	//register insert
	@RequestMapping (value = "/register.action", method = RequestMethod.POST)
	@ResponseBody
	public String registerInsert(MultipartHttpServletRequest req, AccountVO vo,HttpSession session) throws IOException {
		
		MultipartFile attach = req.getFile("file");	
		
		
	if (attach != null && !attach.isEmpty()) {
		
		byte[] bytes = attach.getBytes();
		ByteArrayInputStream is = new ByteArrayInputStream(bytes);
		
		int width = 500;
		int height = 500;
		
		BufferedImage image = ImageIO.read(is);
		
		
		BufferedImage resized= resize(image, height, width);
		
		String savedFileName = Util.makeUniqueFileName(attach.getOriginalFilename());
		String path = req.getServletContext().getRealPath("/resources/upload/" + savedFileName);

		try {
//			attach.transferTo(new File(path));
			File output = new File(path);
			boolean result = ImageIO.write(resized,"jpg",output);
			
			vo.setSavedFileName(savedFileName);
			vo.setUserFileName(attach.getOriginalFilename());

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}else {
		vo.setSavedFileName("default.jpg");
		vo.setUserFileName("default.jpg");
	}
		accountService.insertAccountService(vo);
		
		return "success";
	}
	
	private static BufferedImage resize(BufferedImage img, int height, int width) {
        Image tmp = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
        BufferedImage resized = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = resized.createGraphics();
        g2d.drawImage(tmp, 0, 0, null);
        g2d.dispose();
        return resized;
    }
	
	
	//logout
	@RequestMapping (value = "/logout.action", method = RequestMethod.GET)
	public String logout(HttpSession session) {	
		session.removeAttribute("login");
		return "redirect:/home.action";
	}
	
	//프로필 화면
	@RequestMapping(value="/profile.action",method=RequestMethod.GET)
	public String profileView(HttpSession session) {
		if(session.getAttribute("login")==null)
		{
			return "redirect:/account/login.action";
		}
		return "account/profile";
	}
	
	//프로필 화면
	@RequestMapping(value="/profile.action",method=RequestMethod.POST)
	public String profileUpdate(MultipartHttpServletRequest req, AccountVO vo,HttpSession session) throws IOException {
		
		MultipartFile attach = req.getFile("file");
		vo.setUserFileName(attach.getOriginalFilename());
		
		if (attach != null && !attach.isEmpty()) {
			
			byte[] bytes = attach.getBytes();
			ByteArrayInputStream is = new ByteArrayInputStream(bytes);
			
			int width = 500;
			int height = 500;
			
			BufferedImage image = ImageIO.read(is);
			
			
			BufferedImage resized= resize(image, height, width);
			
			String savedFileName = Util.makeUniqueFileName(attach.getOriginalFilename());
			String path = req.getServletContext().getRealPath("/resources/upload/" + savedFileName);

			try {
//				attach.transferTo(new File(path));
				File output = new File(path);
				boolean result = ImageIO.write(resized,"jpg",output);
				
				vo.setSavedFileName(savedFileName);
				vo.setUserFileName(attach.getOriginalFilename());

			} catch (Exception ex) {
			}
		}else {
		AccountVO logins = (AccountVO)session.getAttribute("login");
		vo.setSavedFileName(logins.getSavedFileName());
		vo.setUserFileName(logins.getUserFileName());
		}
		accountService.updateProfileService(vo);
		List<AccountVO> login = accountService.loginServices(vo);
		session.setAttribute("login", login.get(0));

		return "redirect:/home.action";
	}
	
	//비밀번호 찾기 view
	@RequestMapping (value = "/findPassword.action")
	public String findPasswordView() {
		
		return "account/password";
	}
	
	@RequestMapping (value = "/password.action", method = RequestMethod.POST)
	@ResponseBody
	public int findPassword(AccountVO vo, Model model) {	
		AccountVO member = accountService.getAccountService(vo);
		if(member==null) {
			return 0;
		}		
		model.addAttribute("member",member);
		return member.getMemberNo();
	}
	//비밀번호 변경
	@RequestMapping (value = "/updatePassword.action", method = RequestMethod.GET)
	public String updatePasswordView(AccountVO vo,Model model,int memberNo) {
		model.addAttribute("memberNo",memberNo);
		return "account/updatePassword";
	}
	
	//비밀번호 변경
	@RequestMapping (value = "/updatePassword.action", method = RequestMethod.POST)
	public String updatePassword(AccountVO vo) {
		accountService.updatePasswordService(vo);
		
		return "redirect:/account/login.action";
	}
	
	
	
	
	
}
