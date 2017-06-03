package com.bd.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.loushang.framework.mybatis.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bd.admin.data.Menu;
import com.bd.admin.domain.MenuDomain;

@Controller
@RequestMapping(value = "/db/admin/menu")
public class MenuController {
	private static final Log LOG = LogFactory.getLog(MenuController.class);
	@Autowired
	private MenuDomain menuDomain;

	@RequestMapping(value = "/add")
	@ResponseBody
	public Map<String, Object> add(Menu menu) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			menuDomain.insert(menu);
			resultMap.put("success", true);
		} catch (Exception e) {
			LOG.error("保存失败", e);
			resultMap.put("message", "保存失败");
			resultMap.put("success", false);
			return resultMap;
		}
		return resultMap;
	}

	@RequestMapping(value = "/modify")
	@ResponseBody
	public Map<String, Object> modify(Menu menu) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			menuDomain.update(menu);
			resultMap.put("success", true);
		} catch (Exception e) {
			LOG.error("保存失败", e);
			resultMap.put("message", "保存失败");
			resultMap.put("success", false);
			return resultMap;
		}
		return resultMap;
	}

	/**
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete/{id}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable Long id) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		try {
			menuDomain.delete(id);
			resultMap.put("success", true);
		} catch (Exception e) {
			LOG.error("保存失败", e);
			resultMap.put("message", "保存失败");
			resultMap.put("success", false);
			return resultMap;
		}
		return resultMap;
	}

	/**
	 * *
	 * 
	 * 
	 * @param parameters,
	 *            key 分别为 ：
	 * 
	 *            <pre>
	 *              <code>orderfield<code>[排序列]
	 *              <code>orderdir<code>[排序方向desc或asc] 
	 *              <code>start<code>[起始行] 
	 *              <code>limit<code>[每页显示条数]
	 *            </pre>
	 * 
	 * @return Map, key分别为：
	 * 
	 *         <pre>
	 *              <code>total<code>[总记录条数] 
	 *              <code>data<code>[商品信息列表], List 内容为 Product
	 *         </pre>
	 */
	@RequestMapping("/query")
	@ResponseBody
	public Map query(@RequestBody Map<String, Object> parameters) {
		Map<String, Object> data = new HashMap<String, Object>();
		List<Menu> list = menuDomain.query(parameters);
		data.put("data", list);
		// 获取总记录条数
		int total = PageUtil.getTotalCount();
		data.put("total", total != -1 ? total : list.size());
		return data;
	}
}
