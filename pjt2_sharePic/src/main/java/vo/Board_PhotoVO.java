package vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Board_PhotoVO {
	private int board_id;
	private String content;
	private String regdate;
	private int like_b;
	private int member_idx;
	private String ip;
	private int brand_num;
	private String photo_name;
	private int photp_num;
	private String photo_regi;
	private String nickname;
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
	public int getBrand_num() {
		return brand_num;
	}
	public void setBrand_num(int brand_num) {
		this.brand_num = brand_num;
	}
	public String getPhoto_name() {
		return photo_name;
	}
	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}
	public int getPhotp_num() {
		return photp_num;
	}
	public void setPhotp_num(int photp_num) {
		this.photp_num = photp_num;
	}
	public String getPhoto_regi() {
		return photo_regi;
	}
	public void setPhoto_regi(String photo_regi) {
		this.photo_regi = photo_regi;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
}	
