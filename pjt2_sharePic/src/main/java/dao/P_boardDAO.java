package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.P_boardVO;

public class P_boardDAO {
	SqlSession sqlSession;
	
	public P_boardDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<P_boardVO> selectList() {
		List<P_boardVO> list = sqlSession.selectList("b.selectList");
		return list;
	}
	
	public int insert(Map<String, Object> map) {
		int res = sqlSession.insert("b.insert", map);
		return res;
	}
	
	public P_boardVO selectOne(int board_id) {
		P_boardVO vo = sqlSession.selectOne("b.selectOne", board_id);
		return vo;
	}
	
	//게시물 좋아요 수 증가
	public int count_plus(int board_id) {
		int res = sqlSession.update("b.count_plus", board_id);
		return res;
	}
	
	//게시물 1건 삭제
	public int delete(int board_id) {
		int res = sqlSession.delete("b.delete", board_id);
		return res;
	}
	
	//게시물 좋아요 수 감소
	public int count_minus(int board_id) {
		int res = sqlSession.update("b.count_minus", board_id);
		return res;
	}
}
