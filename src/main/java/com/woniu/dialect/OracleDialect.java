package com.woniu.dialect;

public class OracleDialect implements Dialect{

	@Override
	public String getLimitString(String sql, int offset, int limit) {
		String pageSql = "select * from " + 
				"		(select rownum rn,a.* from ("+sql+") a <"+(offset+limit)+") b" + 
				"		where b.rn>"+offset;
		return pageSql;
	}

}
