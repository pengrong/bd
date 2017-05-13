package com.bd.web.data.user;

import java.sql.Date;

import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Table(name = "BD_WEB_USER")
public class User {
	@Id
	private long id; // 主键id
	private String username; // 账户名
	private String password; // 账户密码
	@Transient
	private String password2; // 账户密码
	private String email; // 邮箱
	private boolean online; // 是否在线
	private boolean enabled; // 是否禁用:默认1
	private boolean locked; // 是否锁住:默认0
	@Temporal(TemporalType.TIMESTAMP)
	private Date locktime; // 账号锁定时间
	@Temporal(TemporalType.TIMESTAMP)
	private Date createtime; // 创建时间
	@Temporal(TemporalType.TIMESTAMP)
	private Date updatetime; // 更新时间
	private String nickname;
	private String cellphone; // 手机号码

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isOnline() {
		return online;
	}

	public void setOnline(boolean online) {
		this.online = online;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public boolean isLocked() {
		return locked;
	}

	public void setLocked(boolean locked) {
		this.locked = locked;
	}

	public Date getLocktime() {
		return locktime;
	}

	public void setLocktime(Date locktime) {
		this.locktime = locktime;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
}
