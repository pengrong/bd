package com.pr.name.search.solr;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.lucene.analysis.Tokenizer;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.analysis.tokenattributes.PositionIncrementAttribute;
import org.apache.lucene.analysis.tokenattributes.TypeAttribute;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class NameTokenizer extends Tokenizer {
	Logger log = LoggerFactory.getLogger(NameTokenizer.class);
	private Reader reader;
	private final CharTermAttribute termAtt;
	private final TypeAttribute typeAtt;
	private List<String> phraseList;
	private int index;
	private PositionIncrementAttribute posIncrAttribute;

	public NameTokenizer(Reader input) throws IOException {
		super(input);
		this.termAtt = (CharTermAttribute) addAttribute(CharTermAttribute.class);
		this.typeAtt = (TypeAttribute) addAttribute(TypeAttribute.class);
		this.posIncrAttribute = ((PositionIncrementAttribute) addAttribute(PositionIncrementAttribute.class));
		this.reader = input;
		setup();
		log.debug("NameTokenizer init :" + input);
	}

	private void setup() throws IOException {
		log.debug("setup input :" + input);
		StringBuilder sb = new StringBuilder();
		int c = reader.read();
		while (c != -1) {
			sb.append((char) c);
			c = reader.read();
		}
		String keyword = sb.toString();
		if (!"".equals(keyword)) {
			phraseList = CombineAlgorithm.getCombine(keyword);
		}
		index = 0;
	}

	@Override
	public boolean incrementToken() throws IOException {
		clearAttributes();
		if (index < phraseList.size()) {
			log.debug("incrementToken index :" + index);
			char[] charArray = phraseList.get(index).toCharArray();
			termAtt.copyBuffer(charArray, 0, charArray.length);
			typeAtt.setType("cn_phrase");
			posIncrAttribute.setPositionIncrement(index + 1);
			index++;
			return true;
		}
		return false;
	}

	public void reset() throws IOException {
		super.reset();
		this.reader = input;
		setup();
		log.debug("reset :" + input);
	}

}
