package com.woniu.dialect;

public interface Dialect {
	public String getLimitString(String sql,int offset,int limit);
}
