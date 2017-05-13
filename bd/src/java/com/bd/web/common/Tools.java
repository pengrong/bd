package com.bd.web.common;

import java.sql.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.codec.digest.DigestUtils;
import org.loushang.framework.util.UUIDGenerator;

public class Tools {
	private static final IdWorker idWorker = new IdWorker(0, 0);

	/**
	 * 验证邮箱
	 *
	 * @param email
	 * @return
	 */
	public static boolean checkEmail(String email) {
		boolean flag = false;
		try {
			String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
			Pattern regex = Pattern.compile(check);
			Matcher matcher = regex.matcher(email);
			flag = matcher.matches();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	public static String md5Hex(String email) {
		return DigestUtils.md5Hex(email);
	}

	public static String uuid() {
		return UUIDGenerator.getUUID();
	}

	public static long nextId() {
		return idWorker.nextId();
	}

	public static Date getCurrentDateTime() {
		return new Date(System.currentTimeMillis());
	}

	public static void main(String[] args) {
		System.out.println(checkEmail(""));
	}
}
