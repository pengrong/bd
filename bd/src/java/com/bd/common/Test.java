package com.bd.common;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.sql.Date;

import javax.persistence.Table;

import com.bd.base.data.Topic;

public class Test {
	public static final String LF = "\n";

	public static void main(String[] args) {
		Class clazz = Topic.class;
		Table a = (Table) clazz.getAnnotation(Table.class);
		Field[] fields = clazz.getDeclaredFields();
		StringBuilder sb = new StringBuilder();
		sb.append("CREATE TABLE `" + a.name() + "` (            ").append(LF);
		for (Field f : fields) {
			String name = f.getName();
			Class type = f.getType();
			if ("id".equals(name)) {
				sb.append("  `id` bigint(20) NOT NULL,             ").append(LF);
			} else if (type.equals(int.class)) {
				sb.append("  `" + name + "` bigint(20) DEFAULT NULL,             ").append(LF);
			} else if (type.equals(boolean.class)) {
				sb.append("  `" + name + "` bit(1) DEFAULT NULL,             ").append(LF);
			} else if (type.equals(Date.class)) {
				sb.append("  `" + name + "` datetime DEFAULT NULL,             ").append(LF);
			} else if (type.equals(String.class)) {
				sb.append("  `" + name + "` varchar(255) DEFAULT NULL,             ").append(LF);
			} else {
				System.err.println(name + " 类型不能处理");
			}
		}
		sb.append("  PRIMARY KEY (`id`)                    ").append(LF);
		sb.append(") ENGINE=InnoDB DEFAULT CHARSET=latin1; ").append(LF);
		System.out.println(sb.toString());
	}

	public static void genMybatisUpdate(Class clazz) {
		Field[] fields = clazz.getDeclaredFields();
		StringBuilder sb = new StringBuilder();
		for (Field f : fields) {
			String name = f.getName();
			sb.append("<if test=\"" + name + " != null\">\n");
			sb.append("" + name + " = #{" + name + "},\n");
			sb.append("</if>\n");
		}
		System.out.println(sb.toString());
	}
}
