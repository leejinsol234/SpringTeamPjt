package vo;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ProPhotoVO {
	private int photo_num; //사진관리번호
	private String photo_name; //사진 이름
	private int member_idx; //작성자 번호
	private String regdate; //사진 저장날짜
	private int brand_num; //사진의 브랜드 번호
	private int board_id; //seq_board_id.currval을 담을 변수
	
	public int getPhoto_num() {
		return photo_num;
	}
	public void setPhoto_num(int photo_num) {
		this.photo_num = photo_num;
	}
	public String getPhoto_name() {
		return photo_name;
	}
	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getBrand_num() {
		return brand_num;
	}
	public void setBrand_num(int brand_num) {
		this.brand_num = brand_num;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	
	
}
