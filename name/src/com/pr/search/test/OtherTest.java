package com.pr.search.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pr.search.util.IndexBean;

public class OtherTest {

	public static List<IndexBean> getInfo(int start, int end) throws Exception {
		List<IndexBean> list = new ArrayList<IndexBean>();
		Connection conn = DBHelper.getConn();
		try {
			PreparedStatement ps = conn.prepareStatement(
					"select * from (select id,key_word,key_pinyin,income_reason,rownum as rn from NAME_CHECK_BASE where rownum<=" + end + ")where rn >" + start);
			ResultSet r = ps.executeQuery();
			while (r.next()) {
				IndexBean bean = new IndexBean();
				bean.setId(r.getString(1));
				bean.setKeyword(r.getString(2));
				bean.setPinyin(r.getString(3));
				bean.setType(r.getString(4));
				list.add(bean);
			}
		} finally {
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return list;
	}

}
