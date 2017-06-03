package com.bd.admin.data;

import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "BD_ADMIN_MENU")
public class Menu {
	@Id
	private long id; // 主键id
	private long pid; // 上级分类
	private String name; // 分类名称
	private String title; // 显示标题
	private int ordernum; // 显示顺序
	private boolean display; // 是否显示
	private String category; // 分类
	private String url; // 链接地址
	private String background; // 背景图片
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getPid() {
		return pid;
	}
	public void setPid(long pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public boolean isDisplay() {
		return display;
	}
	public void setDisplay(boolean display) {
		this.display = display;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getBackground() {
		return background;
	}
	public void setBackground(String background) {
		this.background = background;
	}
}
