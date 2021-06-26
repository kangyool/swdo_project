package com.swdo.test.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.swdo.test.vo.UserVO;
import com.swdo.test.service.UserService;

@Controller
@RequestMapping(value="/user")
public class UserViewController {
	
	@Autowired
	private UserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(UserViewController.class);
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String moveToJoinForm(@RequestParam(name="flag", defaultValue="non-home")String flag) {
		return "user/joinForm";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(UserVO user) {
		String path = service.userInsert(user);
		return path; 
	}
	
	@RequestMapping(value = "/listForm", method = RequestMethod.GET)
	public String listForm(Model model) {
		ArrayList<UserVO> list = service.userSelectAll();
		model.addAttribute("userList", list);
		return "user/listForm";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(UserVO user, @RequestParam(name="flag", defaultValue="non-home")String flag) {
		
		service.userDelete(user);
		service.userLogout(flag);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String moveToDetailForm(UserVO user, Model model) {
		UserVO result = service.userSelectOne(user);
		model.addAttribute("detail", result);
		return "user/detailForm";
	}
	
	@RequestMapping(value = "/updateForm", method = RequestMethod.GET)
	public String moveToUpdateForm(UserVO user, Model model) {
		UserVO result = service.userSelectOne(user);
		model.addAttribute("detail", result);
		return "user/updateForm";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(UserVO user) {
		String path = service.userUpdate(user);
		return path;
	}
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String moveToLoginForm() {
		return "user/loginForm";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST )
	public String login(UserVO user, @RequestParam(name="flag", defaultValue="non-home")String flag) {
		String path = service.userLogin(user);
		return path;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(@RequestParam(name="flag", defaultValue="non-home")String flag) {
		System.out.println(flag);
		String path = service.userLogout(flag);
		return path;
	}
	
}
