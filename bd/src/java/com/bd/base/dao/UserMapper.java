package com.bd.base.dao;

import org.loushang.framework.mybatis.mapper.EntityMapper;

import com.bd.base.data.User;

public interface UserMapper extends EntityMapper<User> {

	User getByUsername(String username);

}
