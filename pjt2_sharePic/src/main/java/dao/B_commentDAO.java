package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.B_commentVO;

public class B_commentDAO {
	SqlSession sqlSession;
	
	public B_commentDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int insert(B_commentVO vo) {
		int res = sqlSession.insert("bc.insert", vo);
		return res;
	}
	
	public List<B_commentVO> selectboard_id(int board_id) {
		List<B_commentVO> list = new ArrayList<B_commentVO>();
		list = sqlSession.selectList("bc.selectboard_id", board_id);
//		for(int i=0; i<list.size(); i++) {
//			System.out.println(list.get(i).getContent());
//		}
		return list;
	}
	
	//대댓글을 달기 위해 넘어온 idx에 해당하는 게시글 찾아오기
	public B_commentVO selectOne(int idx) {
		B_commentVO vo = sqlSession.selectOne("bc.selectOne", idx);
		return vo;
	}
	
	//대댓글 저장하기
	public int insert_reply(B_commentVO vo) {
		int res = sqlSession.insert("bc.reply_insert", vo);
		return res;

	}
	//대댓글 저장 후 부모댓글의 answernum + 1 증가
	public int update_answernum(int idx) {
		int res = sqlSession.update("bc.update_answernum", idx);
		return res;
	}
	
	//댓글 삭제
	public int delete(int idx) {
		int res = sqlSession.delete("bc.delete", idx);
		return res;
	}
	
	//댓글 좋아요 수 증가
	public int count_plus(int idx) {
		int res = sqlSession.update("bc.count_plus", idx);
		return res;
	}
	
	//댓글 좋아요 수 감소
	public int count_minus(int idx) {
		int res = sqlSession.update("bc.count_minus", idx);
		return res;
	}
	
	//게시글이 삭제될 때 댓글도 같이 삭제
	public int deleteonBoard(int board_id) {
		int res = sqlSession.delete("bc.deleteonBoard", board_id);
		return res;
	}
	
}
