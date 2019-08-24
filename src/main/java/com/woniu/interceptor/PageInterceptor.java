package com.woniu.interceptor;

import java.sql.Connection;

import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.DefaultReflectorFactory;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.factory.DefaultObjectFactory;
import org.apache.ibatis.reflection.wrapper.DefaultObjectWrapperFactory;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.RowBounds;

import com.woniu.dialect.Dialect;
import com.woniu.dialect.DialectFactory;

/**   
 * @ClassName:  PageInterceptor   
 * @Description:TODO(用来做MyBatis的分页拦截器)   
 *     
 */  

//通过注解来声明拦截StatementHandler对象的prepare方法的参数为Connection和Integer
//有个这个拦截器，我们就能干很多的事情
//	1：记录用户的ip和用户的执行方法的参数  日志
//	2:执行每一条SQL的插入和修改的时候，把数据放在另外一个库上
//	3：能干的事多了，只要是关于MyBatis的整体的你想管理的地方都可以用拦截器
	
@Intercepts({@Signature(type=StatementHandler.class,method="prepare",args= {Connection.class,Integer.class})})  
public class PageInterceptor implements Interceptor{

	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		//System.out.println("准备开始搞SQL与");
		//取得当前MyBatis执行环境中是否有RowBounds
		//1:有rowBounds进行分页
		//2没有rowBounds进行放行
		
		//获取被拦截的对象就是我们的StatementHandler
		StatementHandler statementHandler = (StatementHandler)invocation.getTarget();
		//生成元对象 里面包含了数据库执行的各种环境
		MetaObject metaObject = MetaObject.forObject(statementHandler,new DefaultObjectFactory(),new  DefaultObjectWrapperFactory(), new DefaultReflectorFactory());
		//元数据  MetaData
		//从源对象中去是否容器中有RowBounds对象
		RowBounds rb = (RowBounds)metaObject.getValue("delegate.rowBounds");
		if(rb!=null&&!rb.equals(RowBounds.DEFAULT)) {//不为null并且不是默认的 证明你要分页了
			//要取得原有的SQL语句
			String sql = (String)metaObject.getValue("delegate.boundSql.sql");
			int offset = rb.getOffset();
			int limit = rb.getLimit();
			//before:select * from table
			//读取你的配置文件
			Configuration configuration = (Configuration)metaObject.getValue("delegate.configuration");
			String type = configuration.getVariables().getProperty("dialect");
			Dialect dialect = DialectFactory.getInstance(type);
			
			String pageSql = dialect.getLimitString(sql, offset, limit);
			//把xinSQL在放入到metaObject中去
			metaObject.setValue("delegate.boundSql.sql", pageSql);
			//把原来的内存分页还得清空
			metaObject.setValue("delegate.rowBounds.offset",RowBounds.NO_ROW_OFFSET);
			metaObject.setValue("delegate.rowBounds.limit",RowBounds.NO_ROW_LIMIT);
			//now:select * from table limit 0,6
		}		
		
		Object obj = invocation.proceed();
		return obj;
	}
	
	

}
