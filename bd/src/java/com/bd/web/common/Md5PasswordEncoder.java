package com.bd.web.common;

public class Md5PasswordEncoder {

	private static final String salt = "dlkdsl$^$^76we978*&)(*&HIU";

	/**
	 * 客户端提交 md5(password) 密码, 服务端数据库通过 md5(salt+md5(password)) 的规则存储密码
	 * 
	 * @param passwd
	 * @return
	 */
	public static String encrypt(String passwd) {
		return Tools.md5Hex(passwd + "{" + salt + "}");
	}

}
