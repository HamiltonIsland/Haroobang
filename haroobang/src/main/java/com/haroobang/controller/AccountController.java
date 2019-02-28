package com.haroobang.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	//login창 보여주기
	@RequestMapping (value = "/login.action", method = RequestMethod.GET)
	public String loginView() {	
		return "account/login";
	}
	
	//register창 보여주기
	@RequestMapping(value = "/register.action", method = RequestMethod.GET)
	public String registerView() {	
		return "account/register";
	}
	
	
}
