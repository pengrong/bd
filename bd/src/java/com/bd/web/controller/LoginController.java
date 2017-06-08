package com.bd.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bd.common.Constant;
import com.bd.common.Md5PasswordEncoder;
import com.bd.user.data.User;
import com.bd.web.service.UserService;

@Controller
@RequestMapping(value = "/web/login")
public class LoginController {
	private static final Log LOG = LogFactory.getLog(LoginController.class);
	@Autowired
	private UserService userService;
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
		return "/jsp/public/login";
	}
	/**
	 * 登录
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> login(HttpSession session, String username, String password) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", false);
		String info = null;
		if (StringUtils.isEmpty(username)) {
			info = "用户名不能为空";
			resultMap.put("message", info);
			resultMap.put("success", false);
			return resultMap;
		}
		if (StringUtils.isEmpty(password)) {
			info = "密码不能为空";
			resultMap.put("message", info);
			resultMap.put("success", false);
			return resultMap;
		}
		User user = null;
		try {
			// user = userService.getByUsername(username);
			user = getTest();
			if (!user.getPassword().equals(Md5PasswordEncoder.encrypt(password))) {
				info = "用户名或密码不正确";
				resultMap.put("message", info);
				resultMap.put("success", false);
				return resultMap;
			}
			session.setAttribute(Constant.SESSION_BD_USER, user);
			resultMap.put("success", true);
		} catch (Exception e) {
			LOG.error("获取用户失败 ", e);
			resultMap.put("message", "获取用户失败");
		}
		return resultMap;
	}

	@ResponseBody
	public Map<String, Object> logout(HttpSession session) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("success", false);
		try {
			session.removeAttribute(Constant.SESSION_BD_USER);
		} catch (Exception e) {
			LOG.error("退出失败 ", e);
			resultMap.put("message", "退出失败");
		}
		return resultMap;
	}

	private User getTest() {
		User user;
		user = new User();
		user.setId("2");
		user.setUsername("1");
		user.setPassword(Md5PasswordEncoder.encrypt("1"));
		return user;
	}

}
