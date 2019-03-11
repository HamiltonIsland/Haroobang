package com.haroobang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.haroobang.service.MemberService;
import com.haroobang.vo.AccountVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	@Qualifier("memberService")
	private MemberService memberService;
	
	@RequestMapping(value="/memberlist.action", method=RequestMethod.GET)
	public String memberListForm(Model model) {
		
		List<AccountVO> members = memberService.findAllMembers();
		int memberCount = memberService.findAllMemberCount();
		
		model.addAttribute("members", members);
		model.addAttribute("countno", memberCount);
		
		return "member/memberlist";
	}
	
	@RequestMapping(value = "/memberdetail.action", method = RequestMethod.GET)
	public String memberDetailForm(Model model, int memberNo) {
		
		AccountVO members = memberService.findMember(memberNo);
	//	List<PurchaseVo> purchases = memberService.findAllMemberProduct(memberNo);
		
		model.addAttribute("members", members);
	//	model.addAttribute("purchases", purchases);
		
		return "member/memberdetail";
	}
}
