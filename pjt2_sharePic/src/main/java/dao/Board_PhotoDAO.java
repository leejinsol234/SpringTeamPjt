package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.Board_PhotoVO;

public class Board_PhotoDAO {
	SqlSession sqlSession;
	
	public Board_PhotoDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	};
	
	//게시글 전체 조회
	public List<Board_PhotoVO> selectList() {
		List<Board_PhotoVO> list = sqlSession.selectList("bp.selectList");
		return list;
	}
	
	//게시글 한건 조회
	public Board_PhotoVO selectOne(Map<String, Object> map) {
		Board_PhotoVO vo = sqlSession.selectOne("bp.selectOne", map);
		return vo;
	}
	
	//게시물 1건 삭제
	public int delete(int board_id) {
		int res = sqlSession.delete("bp.delete", board_id);
		return res;
	}
	
	// 마이페이지 나의 게시물 조회
	public List<Board_PhotoVO> selectMylist(String nickname) {
		
		List<Board_PhotoVO> list = sqlSession.selectList("bp.selectMylist", nickname);
		return list;
	}
	
	
	public List<Board_PhotoVO> selectListLikeB() {
		List<Board_PhotoVO> list = sqlSession.selectList("bp.selectListLikeB");
		return list;
	}
	
		
	// 해당 상호의 게시물 찾기
	public List<Board_PhotoVO> selectListbyBrand_num(int brand_num) {
		List<Board_PhotoVO> list = sqlSession.selectList("bp.selectListBrandNum", brand_num);
		return list;
	}
}
