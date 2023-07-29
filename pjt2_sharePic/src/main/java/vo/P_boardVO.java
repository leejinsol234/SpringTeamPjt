package vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class P_boardVO {
	private int board_id; //일련번호
	private String content; //내용
	private String regdate; //작성일
	private int like_b; //좋아요 수
	private int member_idx; //작성자
	private String ip; //ip
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getLike_b() {
		return like_b;
	}
	public void setLike_b(int like_b) {
		this.like_b = like_b;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
}
