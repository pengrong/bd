package com.pr.search.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pr.search.util.IndexBean;
import com.pr.search.util.IndexType;

public class EntTest {

	public static List<IndexBean> getInfo(int start, int end) throws Exception {
		List<IndexBean> list = new ArrayList<IndexBean>();
		Connection conn = DBHelper.getConn();
		try {
			String sql = "select * from ( select id,enterprise_name,key_word,key_word_pinyin,industry_name,area_code,rownum as rn from NAME_ENTERPRISE_INFO where rownum<="
					+ end + ")where rn >" + start;
			System.out.println(sql);
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet r = ps.executeQuery();
			while (r.next()) {
				IndexBean bean = new IndexBean();
				bean.setType(IndexType.MINGCHENG);
				bean.setId(r.getString(1));
				bean.setEntName(r.getString(2));
				bean.setKeyword(r.getString(3));
				bean.setPinyin(r.getString(4));
				bean.setIndustry(r.getString(5));
				bean.setArea(r.getString(6));
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
