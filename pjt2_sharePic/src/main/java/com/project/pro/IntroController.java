package com.project.pro;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IntroController {

	// 소개 페이지
	@RequestMapping("intro.do")
	public String intro() {
		return "/WEB-INF/views/intro/intro.jsp";
	}
}
