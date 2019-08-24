package com.woniu.dialect;

public class MysqlDialect implements Dialect{
	
	//分页查询语句
	@Override
	public String getLimitString(String sql, int offset, int limit) {
		String pageSql = sql +" limit "+offset+","+limit;
		return pageSql;
	}

}
