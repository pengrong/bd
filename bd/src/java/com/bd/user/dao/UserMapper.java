package com.bd.user.dao;

import org.loushang.framework.mybatis.mapper.EntityMapper;

import com.bd.user.data.User;

public interface UserMapper  extends EntityMapper<User>{

	User getByUsername(String username);

}
