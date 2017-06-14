package com.pr.search.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pr.search.util.IndexBean;
import com.pr.search.util.IndexType;

public class IndustryTest {

	public static List<IndexBean> getInfo() throws Exception {
		List<IndexBean> list = new ArrayList<IndexBean>();
		Connection conn = DBHelper.getConn();
		try {
			PreparedStatement ps = conn.prepareStatement("select id,industry_name from NAME_INDUSTRY");
			ResultSet r = ps.executeQuery();
			while (r.next()) {
				IndexBean bean = new IndexBean();
				bean.setType(IndexType.HANGYE);
				bean.setId(r.getString(1));
				bean.setIndustry(r.getString(2));
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
