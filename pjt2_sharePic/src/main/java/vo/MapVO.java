package vo;

import lombok.Getter;
import lombok.Setter;

@Getter // getter 만듦
@Setter // setter 만듦
public class MapVO {
	private String brand, region, location, address, latitude, longitude;
				// 브랜드이름,  지역,   지점이름, 도로명주소,      위도,      경도
}
