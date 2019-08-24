package com.woniu.dialect;

public class DialectFactory {
	public static Dialect getInstance(String type) {
		Dialect dialect = null;
		if("mysql".equalsIgnoreCase(type)) {
			dialect = new MysqlDialect();
		}else if("oracle".equalsIgnoreCase(type)) {
			dialect = new OracleDialect();
		}
		return dialect;
	}
}
