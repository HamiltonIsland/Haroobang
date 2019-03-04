package com.haroobang.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.haroobang.service.AccountService;
import com.haroobang.vo.AccountVO;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	@Qualifier("AccountService")
	private AccountService accountService;
	
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
		session.setAttribute("login", login);		
		return "home";
	}
	
	//register insert
	@RequestMapping (value = "/register.action", method = RequestMethod.POST)
	public String registerInsert(AccountVO vo) {	
		
		accountService.insertAccountService(vo);
		
		return "account/login";
	}
	
	
	
	
}
