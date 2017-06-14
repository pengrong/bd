package com.pr.search.util;

import java.io.IOException;
import java.util.List;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;

public class SolrUtil {
	// solr server URL指的时solr发布到web工程后的访问路径
	private static final String SOLRURL = "http://localhost:8983/solr";

	private HttpSolrServer solrServer = null;

	private static class SolrUtilHodler {
		private static final SolrUtil instance = new SolrUtil();
	}

	private SolrUtil() {
		// solrServer是线程安全的，所以在使用时需要使用单例的模式，减少资源的消耗
		solrServer = new HttpSolrServer(SOLRURL);
	}

	public static SolrUtil getInstance() {
		return SolrUtilHodler.instance;
	}

	public void add(List<IndexBean> indexBeans) {
		try {
			for (IndexBean indexBean : indexBeans) {
				SolrInputDocument doc = tranToDoc(indexBean);
				solrServer.add(doc);
			}
			solrServer.commit();// 提交，将所有更细提交到索引中
		} catch (SolrServerException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public SolrInputDocument tranToDoc(IndexBean indexBean) {
		SolrInputDocument doc = new SolrInputDocument();
		doc.addField("id", indexBean.getId());
		doc.addField("name_entname", indexBean.getEntName());
		doc.addField("name_area", indexBean.getArea());
		doc.addField("name_enttype", indexBean.getEntType());
		doc.addField("name_industry", indexBean.getIndustry());
		doc.addField("name_keyword", indexBean.getKeyword());
		doc.addField("name_pinyin", indexBean.getPinyin());
		doc.addField("name_type", indexBean.getType());
		return doc;
	}

	// 企业名称：mingcheng:山东浪潮软件股份有限公司
	// 字号：zihao:浪潮
	// 拼音：pinyin:lang chao
	// 驰名品牌：chiming:浪潮
	// 禁用：jinyong:王八蛋
	// 行业用语：hangye:软件
	//
	public void add(IndexBean indexBean) {
		try {
			SolrInputDocument doc = tranToDoc(indexBean);
			solrServer.add(doc);
			solrServer.commit();// 提交，将所有更细提交到索引中
		} catch (SolrServerException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void delete(String id) {
		try {
			solrServer.deleteById(id);
		} catch (SolrServerException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void clearAll() {
		try {
			solrServer.deleteByQuery("*:*");
		} catch (SolrServerException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void query(IndexBean indexBean) {
		try {
			SolrQuery query = new SolrQuery();
			StringBuilder sb = new StringBuilder();
			if (indexBean.getArea() != null) {
				sb.append(" name_area:").append(indexBean.getArea());
			}
			if (indexBean.getIndustry() != null) {
				sb.append(" name_industry:").append(indexBean.getIndustry()).append(" AND ");
			}
			if (indexBean.getKeyword() != null) {
				sb.append(" name_keyword:").append(indexBean.getKeyword());
//				sb.append(" OR name_entname:").append(indexBean.getKeyword());
//				sb.append(" OR name_industry:").append(indexBean.getKeyword());
			}
			if (indexBean.getEntName() != null) {
				sb.append(" name_entname:").append(indexBean.getEntName());
			}

			query.setQuery(sb.toString());
			query.setStart(0).setRows(10);// 进行分页查询
			query.set("fl", "*,score");
			// 分片信息
			query.setFacet(true).setFacetMinCount(1).addFacetField("name_type");// 分片字段

			QueryResponse resp = solrServer.query(query);
			SolrDocumentList sdList = resp.getResults();
			long totalResults = sdList.getNumFound();// 命中的总记录数
			System.out.println("totalResults-->" + totalResults);
			for (SolrDocument sd : sdList) {
				// Collection<String> strs = sd.getFieldNames();
				System.out.println(sd.getFieldValue("name_entname") + "\t" + sd.getFieldValue("name_keyword") + "\t" + sd.getFieldValue("name_industry") + "\t"
						+ sd.getFieldValue("name_type") + "\t" + sd.getFieldValue("score"));
			}
		} catch (SolrServerException e) {
			e.printStackTrace();
		}
	}
}
