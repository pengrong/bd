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
	 * @param id
	 * @return
	 */
	int delete(String id);

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

	public Topic save(Topic topic);

	Topic findOne(String id);
}
