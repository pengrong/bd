package com.pr.name.search.solr;

import java.io.IOException;
import java.io.Reader;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.Tokenizer;

public class NameAnalyzer extends Analyzer {

	@Override
	protected TokenStreamComponents createComponents(String fieldName, Reader reader) {
		Tokenizer nameTokenizer = null;
		try {
			nameTokenizer = new NameTokenizer(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new Analyzer.TokenStreamComponents(nameTokenizer);
	}

}
