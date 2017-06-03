package com.bd.user.service;

import com.bd.user.data.User;

/**
 * 用户管理
 * 
 * @author ipeng
 *
 */
public interface UserService {

	/**
	 * 注册
	 * 
	 * @param user
	 * @return
	 */
	int register(User user);

	/**
	 * 注销
	 * 
	 * @param id
	 * @return
	 */
	int cancel(String id);

	/**
	 * 修改
	 * 
	 * @param user
	 * @return
	 */
	User update(User user);

	/**
	 * 查询
	 * 
	 * @param username
	 * @return
	 */
	User getByUsername(String username);
	// 找回密码:验证码将会发送至你的注册邮箱或手机


}
