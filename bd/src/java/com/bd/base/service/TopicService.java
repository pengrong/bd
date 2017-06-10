package com.bd.base.service;

import java.util.List;
import java.util.Map;

import com.bd.base.data.Topic;

/**
 * 专题管理
 * 
 * @author ipeng
 *
 */
public interface TopicService {

	/**
	 * 增加
	 * 
	 * @param topic
	 * @return
	 */
	int insert(Topic topic);

	/**
	 * 删除
	 * 
	 * @param ids
	 * @return
	 */
	int delete(String[] ids);

	/**
	 * 修改
	 * 
	 * @param topic
	 * @return
	 */
	int update(Topic topic);

	/**
	 * 查询
	 * 
	 * @param map
	 * @return
	 */
	List<Topic> query(Map<String, String> map);

	Topic findOne(String id);
}
