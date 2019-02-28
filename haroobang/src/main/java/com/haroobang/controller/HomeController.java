package com.haroobang.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@RequestMapping(value = {"/","home.action"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {	
		return "home";
	}
	@RequestMapping(value = "blog.action", method = RequestMethod.GET)
	public String blog(Locale locale, Model model) {	
		return "blog";
	}
	@RequestMapping(value = "cart.action", method = RequestMethod.GET)
	public String cart(Locale locale, Model model) {	
		return "cart";
	}	
	
	
	
}
