package com.bd.base.service;

import java.util.List;
import java.util.Map;

import com.bd.base.data.User;

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

	User findOne(String id);
}
