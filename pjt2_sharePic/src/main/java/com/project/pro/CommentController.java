package com.project.pro;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.B_commentDAO;
import dao.ProMemberDAO;
import vo.B_commentVO;

@Controller
public class CommentController {
	B_commentDAO comment_dao;
	
	ProMemberDAO proMember_dao;
	
	@Autowired
	HttpServletRequest request;
	
	public CommentController(B_commentDAO comment_dao, ProMemberDAO proMember_dao) {
		this.comment_dao = comment_dao;
		this.proMember_dao = proMember_dao;
	}
	
	//댓글 달기
	@RequestMapping("reply")
	@ResponseBody
	public String reply(int member_idx, int board_id, String content, HttpServletRequest request) {		
		//ip 가져오기
		String ip = request.getRemoteAddr();		
		
		
		B_commentVO comment = new B_commentVO();
		
		System.out.println(member_idx);
		System.out.println(board_id);
		System.out.println(content);
		comment.setMember_idx(member_idx);
		comment.setBoard_id(board_id);
		comment.setContent(content);
		comment.setIp(ip);
		
		int real_res = comment_dao.insert(comment);
		
		
		if (real_res > 0) {
			return "[{'result' : 'yes'}]"; 
		}
		return "[{'result' : 'no'}]";
	}
	
	@RequestMapping("re_reply")
	@ResponseBody
	public String re_reply(int member_idx, String content, int idx, HttpServletRequest request) {
//		System.out.println(nickname);
//		System.out.println(content);
//		System.out.println(ref);
		
		String ip = request.getLocalAddr();
		
		//대댓글이 달릴 댓글 한 건 조회하기
		B_commentVO base_comment = comment_dao.selectOne(idx);

		
		//대댓글 등록해주기
		B_commentVO reply_comment = new B_commentVO();
		reply_comment.setContent(content);					//content
		reply_comment.setParentnum(base_comment.getIdx()); 	//부모댓글의 idx값
		reply_comment.setRef(base_comment.getRef());		//댓글들을 그룹으로 묶기 위함 
		reply_comment.setStep(base_comment.getStep() + 1);  //step +1 증가
		reply_comment.setBoard_id(base_comment.getBoard_id()); //작성된 게시물의 번호
		reply_comment.setMember_idx(member_idx);
		reply_comment.setIp(ip);
		
		comment_dao.insert_reply(reply_comment);
		
		//base_comment의 answernum(해당 댓글의 자식 댓글 수)도 바꿔주기 +1 해주기
		comment_dao.update_answernum(idx);
		
		return "redirect:board.view";
	}
	
	//댓글 삭제
	@RequestMapping("del_reply")
	@ResponseBody
	public String del_reply(int idx) {
		comment_dao.delete(idx);
		return "redirect:board_view";	
	}
	
	//댓글 좋아요 기능
	@RequestMapping("comment_like")
	@ResponseBody
	public List<Map<String, Object>> comment_like(int idx, String comment_like) {
		B_commentVO vo = comment_dao.selectOne(idx);
		
		System.out.println(comment_like);
		int likehit = vo.getLike_b();
		List<Map<String, Object>> response = new ArrayList<>();

	    if (likehit >= 0) {
	        if (comment_like.equals("true")) {
	            int res = comment_dao.count_plus(idx);
	            Map<String, Object> resultMap = new HashMap<>();
	            resultMap.put("res", "up");
	            response.add(resultMap);
	        } else if (comment_like.equals("false")) {
	            int res = comment_dao.count_minus(idx);
	            Map<String, Object> resultMap = new HashMap<>();
	            resultMap.put("res", "down");
	            resultMap.put("like", likehit);
	            response.add(resultMap);
	        }
	    } else {
	        Map<String, Object> resultMap = new HashMap<>();
	        resultMap.put("res", "none");
	        response.add(resultMap);
	    }

	    return response;
	}
	














}
