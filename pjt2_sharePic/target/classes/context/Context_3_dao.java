package context;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.B_commentDAO;
import dao.Board_PhotoDAO;
import dao.Brand_nameDAO;
import dao.MapDAO;
import dao.P_boardDAO;
import dao.ProMemberDAO;
import dao.ProPhotoDAO;

//bean 객체를 만들어준다
@Configuration
public class Context_3_dao {
	
	@Bean
	public ProMemberDAO proMember_dao(SqlSession sqlSession) {
		return new ProMemberDAO(sqlSession);
		
	}
	
	@Bean
	public ProPhotoDAO proPhoto_dao(SqlSession sqlSession) {
		return new ProPhotoDAO(sqlSession);
	}
	
	@Bean
	public P_boardDAO board_dao(SqlSession sqlSession) {
		return new P_boardDAO(sqlSession);
	}

	@Bean
	public Brand_nameDAO brand_dao(SqlSession sqlSession) {
		return new Brand_nameDAO(sqlSession);
	}
	
	@Bean
	public Board_PhotoDAO board_photo_dao(SqlSession sqlSession) {
		return new Board_PhotoDAO(sqlSession);
	}
	
	@Bean
	public B_commentDAO comment_dao(SqlSession sqlSession) {
		return new B_commentDAO(sqlSession);
	}
	
	@Bean
	public MapDAO map_dao(SqlSession sqlSession) {
		return new MapDAO(sqlSession);
	}
}
