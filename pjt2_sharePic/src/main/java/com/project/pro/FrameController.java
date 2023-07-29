package com.project.pro;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import path.MyCommon;

@Controller
public class FrameController {

	
//	@RequestMapping("bmain") 
//	 public String bmain() { 
//		  return MyCommon.FRAME_PATH + "bmain.jsp";
//	}
	
	@RequestMapping("life.do")
	public String life4() {
		return MyCommon.FRAME_PATH + "life4.jsp";
	}
	
	@RequestMapping("haru.do")
	public String haru() {
		return MyCommon.FRAME_PATH + "haru.jsp";
	}
	
	@RequestMapping("ism.do")
	public String ism() {
		return MyCommon.FRAME_PATH + "ism.jsp";
	}
	
	@RequestMapping("gray.do")
	public String gray() {
		return MyCommon.FRAME_PATH + "gray.jsp";
	}
	
	@RequestMapping("matic.do")
	public String matic() {
		return MyCommon.FRAME_PATH + "matic.jsp";
	}
}
