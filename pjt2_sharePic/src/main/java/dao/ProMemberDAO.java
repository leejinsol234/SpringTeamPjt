package dao;

import org.apache.ibatis.session.SqlSession;

import vo.ProMemberVO;

public class ProMemberDAO {
	
	SqlSession sqlSession;
	
	public ProMemberDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 로그인 검증
	public ProMemberVO loginCheck(String email) {
		
		ProMemberVO vo = sqlSession.selectOne("m.loginCheck", email);
		return vo;
	}
	
	// 별명 중복체크
	public int check_nickname(String nickname) {
		
		int res = sqlSession.selectOne("m.check_nickname", nickname);
		return res;
	}
	
	// 이메일 중복체크
	public int check_email(String email) {
		
		int res = sqlSession.selectOne("m.check_email", email);
		return res;
	}
	
	// 회원추가
	public int insert(ProMemberVO vo) {
		
		int res = sqlSession.insert("m.member_insert",vo);
		return res;
	}
	
	// 회원정보수정
	public int update(ProMemberVO vo) {
		
		int res = sqlSession.update("m.member_update",vo);
		return res;
	}
	
	// 회원탈퇴
	public int delete(ProMemberVO vo) {
		
		int res = sqlSession.delete("m.member_delete",vo);
		return res;
	}
	
	// 게시판으로 멤버관리번호(idx) 보내주기
	public ProMemberVO selectOne(int member_idx) {
		ProMemberVO vo = sqlSession.selectOne("m.member_selectOne", member_idx);
		return vo;
	}

}
