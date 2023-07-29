package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MapVO;

public class MapDAO {
	
	SqlSession sqlSession;
	
	// 생성자 주입
	public MapDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 맵테이블조회
	public List<MapVO> selectList() {
		List<MapVO> list = sqlSession.selectList("m.map_list"); // map_list 부터 만들기
		return list;
	}
}
