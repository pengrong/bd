package com.bd.admin.domain;

import java.util.List;
import java.util.Map;

import com.bd.admin.data.Menu;

public interface MenuDomain {

	int insert(Menu menu);

	int update(Menu menu);

	int delete(long menuId);

	Menu get(long menuId);

	List<Menu> query(Map paramMap);
}
