package vo;

public class ProMemberVO {
	
	private int member_idx; // 멤버 관리번호
	private String email; // 이메일
	private String pw; // 비밀번호
	private String name; // 이름
	private String nickname; // 별명
	private String address_postcode; // 우편번호
	private String address; // 주소
	private String address_detail; // 상세주소
	private String phone; // 핸드폰
	
	
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAddress_postcode() {
		return address_postcode;
	}
	public void setAddress_postcode(String address_postcode) {
		this.address_postcode = address_postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
