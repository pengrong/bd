package com.bd.base.data;

import java.sql.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * 专题
 * 
 * @author ipeng
 *
 */
@Table(name = "BD_WEB_TOPIC")
public class Topic {
	@Id
	private String id; // 主键id
	private String title; // 专题名称
	private String content; // 内容url
	private String cover; // 封面url
	@Temporal(TemporalType.TIMESTAMP)
	private Date createtime; // 创建时间
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatetime; // 更新时间
	private boolean istop; // 是否置顶专题
	private short nav; // 是否导航专题
	private int treads; // 阅读量
	private int collections; // 收藏量
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public Date getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	public boolean isIstop() {
		return istop;
	}
	public void setIstop(boolean istop) {
		this.istop = istop;
	}
	public int getCollections() {
		return collections;
	}
	public void setCollections(int collections) {
		this.collections = collections;
	}
	public short getNav() {
		return nav;
	}
	public void setNav(short nav) {
		this.nav = nav;
	}
	public int getTreads() {
		return treads;
	}
	public void setTreads(int treads) {
		this.treads = treads;
	}
}
