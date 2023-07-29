package vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Brand_nameVO {
	private int brand_num; //브랜드 관리를 위한 번호
	private String brand_name; //브랜드 명
	
	public int getBrand_num() {
		return brand_num;
	}
	public void setBrand_num(int brand_num) {
		this.brand_num = brand_num;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	
	
}
