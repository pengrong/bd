package com.bd.admin.controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	private static final Log LOG = LogFactory.getLog(AdminController.class);
	@RequestMapping(value = "")
	public String login() {
		return "/WEB-INF/admin/login";
	}
	@RequestMapping(value = "/home")
	public String home() {
		return "/WEB-INF/admin/home";
	}
	@RequestMapping(value = "/login")
	public String doLogin() {
		return "redirect:/service/admin/home";
	}
}
