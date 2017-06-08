package com.bd.user.service;

import java.util.List;
import java.util.Map;

import com.bd.user.data.User;

/**
 * 用户管理
 * 
 * @author ipeng
 *
 */
public interface UserService {

	/**
	 * 增加
	 * 
	 * @param user
	 * @return
	 */
	int insert(User user);

	/**
	 * 删除
	 * 
	 * @param id
	 * @return
	 */
	int delete(String id);

	/**
	 * 修改
	 * 
	 * @param user
	 * @return
	 */
	int update(User user);

	/**
	 * 查询
	 * 
	 * @param map
	 * @return
	 */
	List<User> query(Map<String, String> map);

	public User save(User user);

	User findOne(String id);
}
