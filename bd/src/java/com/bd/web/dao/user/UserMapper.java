package com.bd.web.dao.user;

import org.loushang.framework.mybatis.mapper.EntityMapper;

import com.bd.web.data.user.User;

public interface UserMapper  extends EntityMapper<User>{

	User getByUsername(String username);

}
