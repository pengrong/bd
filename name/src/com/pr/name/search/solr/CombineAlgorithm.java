package com.pr.name.search.solr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/**
 * @Description:组合算法 从M个数中取出N个数，无顺序 二维char数组
 */

public class CombineAlgorithm {
	/* src数组的长度 */
	private int m;
	/* 需要获取N个数 */
	private int n;
	// 临时变量，obj的行数
	private int objLineIndex;
	/* 存放结果的二维数组 */
	private char[][] obj;
	private int[] srcStringIndex;

	private CombineAlgorithm(char[] src, int getNum) {
		if (src == null)
			throw new RuntimeException("原数组为空.");
		if (src.length < getNum)
			throw new RuntimeException("要取的数据比原数组个数还 大 .");
		m = src.length;
		n = getNum;
		/* 初始化 */
		objLineIndex = 0;
		int num = combination(m, n);
		obj = new char[num][n];
		srcStringIndex = new int[num];
		char[] tmp = new char[n];
		combine(src, 0, 0, n, tmp);
	}

	/**
	 * <p>
	 * 计算 C(m,n)个数 = (m!)/(n!*(m-n)!)
	 * </p>
	 * 从M个数中选N个数，函数返回有多少种选法 参数 m 必须大于等于 n m = 0; n = 0; retuan 1;
	 * 
	 * @param m
	 * @param n
	 * @return
	 * @since royoan 2014-6-13 下午8:25:33
	 * 
	 */

	private int combination(int m, int n) {
		if (m < n)
			return 0; // 如果总数小于取出的数，直接返回0
		int k = 1;
		int j = 1;
		// 该种算法约掉了分母的(m-n)!,这样分子相乘的个数就是有n个了
		for (int i = n; i >= 1; i--) {
			k = k * m;
			j = j * n;
			m--;
			n--;
		}
		return k / j;

	}

	/**
	 * 
	 * <p>
	 * 递归算法，把结果写到obj二维数组对象
	 * </p>
	 * 
	 * @param src
	 * @param srcIndex
	 * @param i
	 * @param n
	 * @param tmp
	 * 
	 */
	private void combine(char src[], int srcIndex, int i, int n, char[] tmp) {
		int j;
		for (j = srcIndex; j < src.length - (n - 1); j++) {
			tmp[i] = src[j];
			if (n == 1) {
				System.arraycopy(tmp, 0, obj[objLineIndex], 0, tmp.length);
				srcStringIndex[objLineIndex] = srcIndex;
				objLineIndex++;
			} else {
				n--;
				i++;
				combine(src, j + 1, i, n, tmp);
				n++;
				i--;
			}
		}
	}

	private char[][] getResutl() {
		return obj;
	}

	private int[] getIndex() {
		return srcStringIndex;
	}

	public static List<String> getCombine(String str) {
		List<String> results = new ArrayList<String>();
		int m = str.length();
		char[] charArray = str.toCharArray();
		CombineAlgorithm ca;
		for (int n = 2; n <= m; n++) {
			ca = new CombineAlgorithm(charArray, n);
			char[][] c = ca.getResutl();
			int len = c.length;
			for (int i = 0; i < len; i++) {
				results.add(String.copyValueOf(c[i]));
			}
		}
		return results;
	}

	public static Map<String, Integer> getCombineWithIndex(String str) {
		Map<String, Integer> results = new HashMap<String, Integer>();
		int m = str.length();
		char[] charArray = str.toCharArray();
		CombineAlgorithm ca;
		for (int n = 2; n <= m; n++) {
			ca = new CombineAlgorithm(charArray, n);
			char[][] c = ca.getResutl();
			int[] idx = ca.getIndex();
			int len = c.length;
			for (int i = 0; i < len; i++) {
				results.put(String.copyValueOf(c[i]), idx[i]);
			}
		}
		return results;
	}

	/**
	 * 
	 * 用法实例
	 * 
	 * @param args
	 * 
	 */
	public static void main(String[] args) {
		Map<String, Integer> results = getCombineWithIndex("abcd");
		for (Entry<String, Integer> s : results.entrySet()) {
			System.out.println(s.getKey() + "\t" + s.getValue());
		}
	}

}
