package dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class ProPhotoDAO {
	
	SqlSession sqlSession;
	
	public ProPhotoDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int insert(Map<String, Object> map) {
		int res = sqlSession.insert("p.insert", map);
		return res;
	}
	//게시물 1건 삭제
	public int delete(int board_id) {
		int res = sqlSession.delete("p.delete", board_id);
		return res;
	}
	
}
