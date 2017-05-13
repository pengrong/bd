package com.bd.web.service.impl.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bd.web.common.Md5PasswordEncoder;
import com.bd.web.common.Tools;
import com.bd.web.dao.user.UserMapper;
import com.bd.web.data.user.User;
import com.bd.web.service.user.IUserService;

@Service("userService")
public class UserServiceImpl implements IUserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public int register(User user) {
		user.setId(Tools.nextId());
		user.setCreatetime(Tools.getCurrentDateTime());
		user.setEnabled(true);
		user.setLocked(false);
		user.setPassword(Md5PasswordEncoder.encrypt(user.getPassword()));
		user.setNickname(user.getUsername());
		return userMapper.insert(user);
	}

	@Override
	public int cancel(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public User update(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getByUsername(String username) {
		return userMapper.getByUsername(username);
	}
}
