package com.bd.web.controller.user;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bd.web.common.Tools;
import com.bd.web.data.user.User;
import com.bd.web.service.user.IUserService;

@Controller
@RequestMapping(value = "/db/user")
public class UserController {
	private IUserService userService;

	/**
	 * 注册
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/register")
	public Map<String, Object> register(User user) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String info = checkUser(user);
		if (info != null) {
			resultMap.put("message", info);
			resultMap.put("success", false);
		} else {
			try {
				int result = userService.register(user);
				resultMap.put("success", true);
			} catch (Exception e) {
				e.printStackTrace();
				resultMap.put("message", info);
				resultMap.put("success", false);
			}
		}
		return resultMap;
	}

	// 注销
	// 个人设置
	// 找回密码
	// 专题收藏
	/**
	 * 校验
	 * 
	 * @param user
	 * @return
	 */
	private String checkUser(User user) {
		if (StringUtils.isEmpty(user.getUsername())) {
			return "用户名不能为空";
		}
		if (StringUtils.isEmpty(user.getPassword())) {
			return "密码不能为空";
		}
		if (StringUtils.isEmpty(user.getPassword2())) {
			return "确认密码与密码不一致";
		}
		if (!Tools.checkEmail(user.getEmail())) {
			return "邮箱格式不正确";
		}
		return null;
	}
}
