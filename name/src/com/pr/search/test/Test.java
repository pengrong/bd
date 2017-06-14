package com.pr.search.test;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import com.pr.search.util.IndexBean;
import com.pr.search.util.SolrUtil;

public class Test {

	private static SolrUtil su = SolrUtil.getInstance();

	public static void main(String[] args) throws Exception {
		//createIndex();
		IndexBean indexBean = new IndexBean();
		indexBean.setKeyword("亚解飞猛简单是四点斯");
		//indexBean.setIndustry("科技");
		su.query(indexBean);
	}

	public static void createIndex() throws Exception {
		su.clearAll();
		for (int i = 1; i < 10; i++) {
			su.add(EntTest.getInfo(i * 100, (i + 1) * 100));
			System.out.print(i + "\t");
			// su.add(IndustryTest.getInfo());
			// System.out.println("ok");
			// su.add(OtherTest.getInfo(i * 100, (i + 1) * 100));
			// System.out.println(i);
		}
	}

	public static void createIndex1() throws Exception {
		// su.clearAll();
		ExecutorService es = Executors.newFixedThreadPool(6);

		for (int i = 1; i <= 10; i++) {
			final int j = i * 100000;
			es.execute(new Runnable() {
				@Override
				public void run() {
					try {
						for (int k = 1; k <= 10; k++) {
							su.add(EntTest.getInfo(j, j + 100 * k));
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					System.out.println(j);
				}
			});
		}
		es.shutdown();
	}
}
