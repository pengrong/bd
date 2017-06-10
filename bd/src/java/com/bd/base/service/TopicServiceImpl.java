package com.bd.base.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bd.base.dao.TopicMapper;
import com.bd.base.data.Topic;
import com.bd.common.Tools;

@Service("adminTopicService")
public class TopicServiceImpl implements TopicService {

	@Autowired
	private TopicMapper topicMapper;

	@Override
	public int insert(Topic topic) {
		topic.setCreatetime(Tools.getCurrentDateTime());
		topic.setUpdatetime(Tools.getCurrentDateTime());
		return topicMapper.insert(topic);
	}

	@Override
	public int delete(String[] ids) {
		return topicMapper.delete(ids);
	}

	@Override
	public int update(Topic topic) {
		topic.setUpdatetime(Tools.getCurrentDateTime());
		return topicMapper.update(topic);
	}

	/**
	 * 保存新增和修改后的用户信息
	 * 
	 * @param topic
	 * 
	 * @return Topic
	 * 
	 */
	@Transactional("mybatisTransactionManager")
	public Topic save(Topic topic) {
		if (topic.getId() != null && !"".equals(topic.getId())) {
			// 更新用户信息
			update(topic);
		} else {
			// 保存用户信息
			insert(topic);
		}
		return topic;
	}

	@Override
	public List<Topic> query(Map<String, String> map) {
		return topicMapper.query(map);
	}

	@Override
	public Topic findOne(String id) {
		return topicMapper.get(id);
	}

}
