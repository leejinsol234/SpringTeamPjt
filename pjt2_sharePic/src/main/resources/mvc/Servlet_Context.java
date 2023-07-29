package mvc;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.project.pro.BoardController;
import com.project.pro.CommentController;
import com.project.pro.FrameController;
import com.project.pro.IntroController;
import com.project.pro.MapController;
import com.project.pro.MemberController;

import dao.B_commentDAO;
import dao.Board_PhotoDAO;
import dao.Brand_nameDAO;
import dao.MapDAO;
import dao.P_boardDAO;
import dao.ProMemberDAO;
import dao.ProPhotoDAO;


@Configuration
@EnableWebMvc
//자동탐색
// @ComponentScan("com.project.pro")
//@ComponentScan(basePackages = {"controller", "dao"})
//컨트롤러 뿐만 아니라 Component의 자식요소를 전부 탐색해서 객체로 만들어 준다.
//자동 생성으로 객체를 생성하면 setter, 생성자 injection으로 sqlSession을 받을 수 없다.
//어노테이션에도 상속관계가 있다
/*
 *@Component
 *	ㄴ@Controller
 *	ㄴ@Service
 *	ㄴ@Repository 
 * */
//컴포넌트의 자식객체가 들어있으면 사실 Controller가 아니어도 만들어 질 수 있다.
public class Servlet_Context implements WebMvcConfigurer {
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
	
	/*
	 * @Bean public InternalResourceViewResolver resolver() {
	 * InternalResourceViewResolver resolver = new InternalResourceViewResolver();
	 * resolver.setViewClass(JstlView.class); resolver.setPrefix("/WEB-INF/views/");
	 * resolver.setSuffix(".jsp"); return resolver; }
	 */
	
	// 회원컨트롤러
	@Bean
	public MemberController memberController(ProMemberDAO proMember_dao, 
											 ProPhotoDAO proPhoto_dao, 
											 Board_PhotoDAO board_photo_dao) {
		
		return new MemberController(proMember_dao, proPhoto_dao, board_photo_dao);
	}
	
	// 게시판컨트롤러
	@Bean
	public BoardController boardController(
										ProMemberDAO proMember_dao,
										ProPhotoDAO proPhoto_dao,
										P_boardDAO board_dao,
										Brand_nameDAO brand_dao,
										Board_PhotoDAO board_photo_dao,
										B_commentDAO comment_dao
										) {
		return new BoardController(
								proMember_dao, 
								proPhoto_dao, 
								board_dao, 
								brand_dao, 
								board_photo_dao,
								comment_dao);
	}
	
	// 댓글 컨트롤러
	@Bean
	public CommentController commentController(
							B_commentDAO comment_dao,
							ProMemberDAO proMember_dao) {
		return new CommentController(comment_dao, proMember_dao);
	}
	
	// 프레임 컨트롤러
	@Bean 
	FrameController frameController() {
		return new FrameController();
	}
	
	// 소개 컨트롤러
	@Bean
	IntroController introController() {
		return new IntroController();
	}
	
	// Map controller
	@Bean
	public MapController mapController(MapDAO map_dao) {
		MapController mapController = new MapController();
		mapController.setMap_dao(map_dao);
		
		return mapController;
	}
	
}
