package com.project.pro;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.B_commentDAO;
import dao.Board_PhotoDAO;
import dao.Brand_nameDAO;
import dao.P_boardDAO;
import dao.ProMemberDAO;
import dao.ProPhotoDAO;
import path.MyCommon;
import vo.B_commentVO;
import vo.Board_PhotoVO;
import vo.Brand_nameVO;
import vo.P_boardVO;
import vo.ProMemberVO;

@Controller
public class BoardController {

	@Autowired
	ServletContext application;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	ProMemberDAO proMember_dao;
	
	ProPhotoDAO proPhoto_dao;
	
	P_boardDAO board_dao;
	
	Brand_nameDAO brand_dao;
	
	Board_PhotoDAO board_photo_dao;
	
	B_commentDAO comment_dao;
	
	public BoardController(
			ProMemberDAO proMember_dao,
			ProPhotoDAO proPhoto_dao,
			P_boardDAO board_dao,
			Brand_nameDAO brand_dao,
			Board_PhotoDAO board_photo_dao,
			B_commentDAO comment_dao) {
		this.proMember_dao = proMember_dao;
		this.proPhoto_dao = proPhoto_dao;
		this.board_dao = board_dao;
		this.brand_dao = brand_dao;
		this.board_photo_dao = board_photo_dao;
		this.comment_dao = comment_dao;
	}
	
	//게시판 이동
	@RequestMapping("board.do")
	public String board(Model model) {
		List<Board_PhotoVO> list = board_photo_dao.selectList();
		List<Brand_nameVO> brand = brand_dao.selectList();

		model.addAttribute("list", list);
		model.addAttribute("brand", brand);
		return MyCommon.BOARD_PATH + "pro_board.jsp";
	}
	
	//게시판 등록 jsp로 이동하기
	@RequestMapping("insert_form.do")
	public String insert_form(Model model, int member_idx, String nickname) {
		ProMemberVO vo = proMember_dao.selectOne(member_idx);
		List<Brand_nameVO> brand_list = brand_dao.selectList();
		//System.out.println(nickname);
		model.addAttribute("vo", vo);
		model.addAttribute("brand", brand_list);
		return MyCommon.BOARD_PATH + "insert_form.jsp";
	}
	
	//Ajax를 이용한 게시글 추가
	@RequestMapping("upload.do")
	@ResponseBody
	public String upload(
					HttpServletRequest request,
					@RequestParam("photo_name") MultipartFile file, 
					@RequestParam("content") String content,
					@RequestParam("member_idx") int member_idx,
					@RequestParam("brand_num") int brand_num) {
		System.out.println(file.getOriginalFilename());
		System.out.println(content);
		System.out.println(member_idx);
		System.out.println(brand_num);
		
		//ip 받아오기
		String ip = request.getLocalAddr();
		
		//업로드 하기
		String webPath = "resources/upload/";
		String savePath = application.getRealPath(webPath);
		
		
		//System.out.println(savePath);
		//jsp에서 ajax를 통해 넘어온 사진을 담을 변수
		MultipartFile photo = file;
		
		String filename = "no_file";
		
		if (!photo.isEmpty()) {
			filename = photo.getOriginalFilename();
			
			File saveFile = new File(savePath, filename);
			
			if (!saveFile.exists()) {
				saveFile.exists();
			} else {
				long time = System.currentTimeMillis();
				
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}
			
			try {
				photo.transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		/* 각각의 board 테이블과 photo 테이블에 데이터를 입력해 주는 구간이다.
		 * 처음에는 오류가 났었는데, 이유는 pk와 fk의 순서도에 있었다.
		 * 어떤 의미냐 하면, photo 테이블의 마지막 column명은 board_id(board 테이블의 관리번호)이며,
		 * fk로서의 기능을 가지고 있기에 먼저 board 테이블에 데이터가 추가가 되어서 board_id.nextval이 생성이 되어야지만,
		 * seq_board_id.currval이 생성이 되므로 무엇을 먼저 DB에 추가할 것인지도 잘 생각해봐야한다.
		 * 그래서 오류가 났었던 이유도 photo 테이블에 먼저 데이터를 집어넣으려고 하니, seq_board_id.currval이 생성이 안되어서
		 * 오류가 났었다.
		 * */
		Map<String, Object> into_board = new HashMap<String, Object>();
		into_board.put("content", content);
		into_board.put("ip", ip);
		into_board.put("member_idx", member_idx);
		
		int res = board_dao.insert(into_board);
		
		Map<String, Object> into_photo = new HashMap<String, Object>();
		into_photo.put("photo_name", filename);
		into_photo.put("member_idx", member_idx);
		into_photo.put("brand_num", brand_num);
		
		int res1 = proPhoto_dao.insert(into_photo);
		
		session.getAttribute("email");
		
		//System.out.println(filename);
		//int res = photo_dao.insert(filename);
		
		return "";
	}
	
	//1건의 게시물 보여주기
	@RequestMapping("board.view")
	public String view(Model model, int member_idx, String photo_name) {
		List<Brand_nameVO> brand = brand_dao.selectList();
				
		Map<String, Object> to_board_photo = new HashMap<String, Object>();
		to_board_photo.put("member_idx", member_idx);
		to_board_photo.put("photo_name", photo_name);
		
		Board_PhotoVO board_photo = board_photo_dao.selectOne(to_board_photo);
		
		int board_photo_member_idx = board_photo.getMember_idx();
		
		ProMemberVO vo = proMember_dao.selectOne(board_photo_member_idx);
		String nickname = vo.getNickname();
		
		board_photo.setNickname(nickname);
		
		int board_id = board_photo.getBoard_id();
		
		//게시글의 id에 해당하는 댓글들 가져오기
		List<B_commentVO> comment = comment_dao.selectboard_id(board_id);
		
		model.addAttribute("nickname", nickname);
		model.addAttribute("brand", brand);
		model.addAttribute("bp", board_photo);
		model.addAttribute("comment", comment);
		return MyCommon.BOARD_PATH + "board_view.jsp";
	}
	
	//게시물 삭제하기
	@RequestMapping("del.do")
	@ResponseBody
	public String delete(int board_id) {
		int res = board_photo_dao.delete(board_id);
		if (res == 1) {
			comment_dao.deleteonBoard(board_id);
			proPhoto_dao.delete(board_id);
			board_dao.delete(board_id);
			return "[{'res' : 'yes'}]";
		}
		
		return "[{'res' : 'no'}]";
	}
	
	//좋아요 기능 추가
	@RequestMapping("like.do")
	@ResponseBody
	public String like_Count(int board_id, String like_count, String nickname, String photo_name) {
		//System.out.println(board_id);
		System.out.println(like_count);
		
		P_boardVO vo = board_dao.selectOne(board_id);
		
		//System.out.println(vo.getLike_b());
		
		int likehit = vo.getLike_b();
		int res = 0;
		
		if (likehit >= 0) {
			if (like_count.equals("true")) {
				res = board_dao.count_plus(board_id);
				return "[{'res' : 'up'}]";
			} else if (like_count.equals("false")) {
				res = board_dao.count_minus(board_id);
				return String.format("[{'res' : 'down'},{'like':'%d'}]", likehit);
			}			
		}
		
		System.out.println(res);
		
		return "[{'res' : 'none'}]";
	}
	
	//해당 상호의 게시물만 보여주기
	@RequestMapping("select_list")
	public String select(int brand_num, Model model) {
		List<Board_PhotoVO> list = board_photo_dao.selectListbyBrand_num(brand_num);
		
		model.addAttribute("list", list);
		return path.MyCommon.BOARD_PATH + "select_list.jsp";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	
	
	
	
	
	
	
}
