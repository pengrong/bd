package com.pr.search.util;

public class IndexBean {
	// id
	private String id;
	// 企业名称
	private String entName;
	// 字号
	private String keyword;
	// 拼音
	private String pinyin;
	// 行业
	private String industry;
	// 企业类型
	private String entType;
	// 行政区划
	private String area;
	// 类型
	private String type;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEntName() {
		return entName;
	}

	public void setEntName(String entName) {
		this.entName = entName;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getPinyin() {
		return pinyin;
	}

	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getEntType() {
		return entType;
	}

	public void setEntType(String entType) {
		this.entType = entType;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	// 1.相同企业名称
	// 2.相同区划下相同行业:
	// 相同、相似字号\相同拼音、相似拼音
	// 3.
	// 山东浪潮软件股份有限公司

}
