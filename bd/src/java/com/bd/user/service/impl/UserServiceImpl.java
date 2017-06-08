package com.bd.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bd.common.Md5PasswordEncoder;
import com.bd.common.Tools;
import com.bd.user.dao.UserMapper;
import com.bd.user.data.User;
import com.bd.user.service.UserService;

@Service("adminUserService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public int insert(User user) {
		user.setId(Tools.nextId());
		user.setCreatetime(Tools.getCurrentDateTime());
		user.setEnabled(true);
		user.setLocked(false);
		user.setPassword(Md5PasswordEncoder.encrypt("1"));
		user.setNickname(user.getUsername());
		return userMapper.insert(user);
	}

	@Override
	public int delete(String id) {
		return userMapper.delete(id);
	}

	@Override
	public int update(User user) {
		return userMapper.update(user);
	}

	/**
	 * 保存新增和修改后的用户信息
	 * 
	 * @param user
	 * 
	 * @return User
	 * 
	 */
	@Transactional("mybatisTransactionManager")
	public User save(User user) {
		if (user.getId() != null && !"".equals(user.getId())) {
			// 更新用户信息
			update(user);
		} else {
			// 保存用户信息
			insert(user);
		}
		return user;
	}

	@Override
	public List<User> query(Map<String, String> map) {
		// Map<String, String> map=new HashMap<String, String>();
		// map.put("username", username);
		return userMapper.query(map);
	}

	@Override
	public User findOne(String id) {
		return userMapper.get(id);
	}
}
