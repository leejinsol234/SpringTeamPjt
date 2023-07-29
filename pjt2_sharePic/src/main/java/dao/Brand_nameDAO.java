package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.Brand_nameVO;

public class Brand_nameDAO {
	SqlSession sqlSession;
	
	public Brand_nameDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Brand_nameVO> selectList() {
		List<Brand_nameVO> list = sqlSession.selectList("bn.selectList");
		return list;
	}
}
