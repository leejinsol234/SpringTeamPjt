package context;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

//bean 객체를 만들어준다
@Configuration
public class Context_4_fileupload {
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8");
		
		// 최대 업로드 용량 약 500mb로 지정
		multipartResolver.setMaxUploadSize(524288000); // 500mb(1024*1024*500)
		return multipartResolver;
	}

	
}
