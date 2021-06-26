package com.swdo.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value = "/company")
@Controller
public class CompanyViewController {
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String moveToAbout() {
		return "company/about";
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String moveTocontact() {
		return "company/contact";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String moveToIndex() {
		return "company/index";
	}
}
