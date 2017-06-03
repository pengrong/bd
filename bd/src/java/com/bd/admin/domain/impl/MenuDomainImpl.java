package com.bd.admin.domain.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.bd.admin.dao.MenuMapper;
import com.bd.admin.data.Menu;
import com.bd.admin.domain.MenuDomain;
import com.bd.common.Tools;

public class MenuDomainImpl implements MenuDomain {
	@Autowired
	private MenuMapper menuMapper;

	@Override
	public int insert(Menu menu) {
		menu.setId(Tools.nextId());
		menu.setCategory("menu");
		menu.setDisplay(true);
		return menuMapper.insert(menu);
	}

	@Override
	public int update(Menu menu) {
		return menuMapper.update(menu);
	}

	@Override
	public int delete(long menuId) {
		// 外键级联删除
		return menuMapper.delete(menuId);
	}

	@Override
	public Menu get(long menuId) {
		return menuMapper.get(menuId);
	}

	@Override
	public List<Menu> query(Map paramMap) {
		return menuMapper.query(paramMap);
	}
}
