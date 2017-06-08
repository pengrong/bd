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

	/**
	 * 用户管理
	 * 
	 * @return
	 */
	@RequestMapping(value = "/user")
	public String user() {
		return "/WEB-INF/admin/user";
	}

	/**
	 * 专题管理
	 * 
	 * @return
	 */
	@RequestMapping(value = "/topic")
	public String topic() {
		return "/WEB-INF/admin/topic";
	}

	/**
	 * 分类管理
	 * 
	 * @return
	 */
	@RequestMapping(value = "/category")
	public String category() {
		return "/WEB-INF/admin/category";
	}

	/**
	 * 系统通知管理
	 * 
	 * @return
	 */
	@RequestMapping(value = "/notice")
	public String notice() {
		return "/WEB-INF/admin/notice";
	}

	/**
	 * 快讯管理
	 * 
	 * @return
	 */
	@RequestMapping(value = "/news")
	public String news() {
		return "/WEB-INF/admin/news";
	}

	/**
	 * 广告管理
	 * 
	 * @return
	 */
	@RequestMapping(value = "/ad")
	public String ad() {
		return "/WEB-INF/admin/ad";
	}

	@RequestMapping(value = "/login")
	public String doLogin() {
		return "redirect:/service/admin/user";
	}
}
