package context;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;


@Configuration
public class Context_2_mybatis {
	
	@Bean
	public SqlSessionFactory factoryBean(DataSource ds) throws Exception {
		// throws Exception를 하면 try catch를 사용하지 않아도 된다
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(ds);
		
		// 추가적인 MyBatis 설정
        factoryBean.setConfigLocation(new ClassPathResource("config/mybatis/mybatis-config.xml"));
        return factoryBean.getObject();
  
	}
	
	@Bean
	public SqlSessionTemplate sqlSessionBean(SqlSessionFactory factoryBean) {
//		SqlSessionTemplate sqlSessionBean = new SqlSessionTemplate(factoryBean);
//		return sqlSessionBean;
		return new SqlSessionTemplate(factoryBean);
	}
}
