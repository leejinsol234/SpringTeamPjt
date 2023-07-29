<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>포토그레이</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="resources/css/frame_css/brand.css">
		<style>
			#b1{filter:grayscale(100%);}
			#b2{filter:grayscale(100%);}
			#b3{filter:grayscale(100%);}
			#b4{box-shadow: 0px 0px 20px #727071;}
			#b5{filter:grayscale(100%);}
		</style>
	</head>
	
	<body>
		<header>	
			<div class="container" align="center">
				<div class="common" onclick="location.href='intro.do'">
					<img src="resources/img/banner_icon01.png" width="80px">
					<div class="hov_txt">
						<p>소개</p>
					</div>
				</div>
						
				<div class="common" onclick="location.href='map.com'">
					<img src="resources/img/banner_icon02.png" width="80px">
					<div class="hov_txt">
						<p>위치</p>
					</div>	
				</div>
				
				<div class="logo" onclick="location.href='main_test'">
					<img src="resources/img/logo.png" >
				</div>
				
				<div class="common" onclick="location.href='life.do'">
					<img src="resources/img/banner_icon04.png" width="80px">
					<div class="hov_txt">
						<p>프레임</p>
					</div>
				</div>
				
				<div class="abm common" onclick="location.href='board.do'">
					<img src="resources/img/banner_icon05.png" width="80px">
					<div class="hov_txt">
						<p>앨범</p>
					</div>
				</div>
			</div>
		</header>
			
		<div class="btn" align="center">
			<button type="button" id="b1" onclick="location.href='life.do'"> <img src="resources/img/frame_img/62c2e9727b583.png" width="150px" height="150px"> </button>
			<button type="button" id="b2" onclick="location.href='ism.do'"> <img src="resources/img/frame_img/9c700cae91a0d.png" width="200px"></button>
			<button type="button" id="b3" onclick="location.href='haru.do'"> <img src="resources/img/frame_img/harufilm.png" width="150px" height="150px"> </button>
			<button type="button" id="b4" onclick="location.href='gray.do'"> <img src="resources/img/frame_img/partners_logo03.png"> </button>
			<button type="button" id="b5" onclick="location.href='matic.do'"> <img src="resources/img/frame_img/9cca6783613b7.png" width="200px"> </button>
		</div>
		
		<section class="content">
			<div class="frame" align="center">
				<div class="image">
					 <img src="resources/img/frame_img/gray_f1.png" width="450px">
					 	<div class="img_txt">
					 		<p align="center">
					 		6000원<br>
					 		2023년 6월 1일~6월 30일
					 		</p>
					 	</div>
				</div>
				
				<div class="image">
					 <img src="resources/img/frame_img/gray_f2.png" height="660px">
					 	<div class="img_txt">
					 		<p align="center">
					 		6000원<br>
					 		2023년 6월 1일~6월 30일
					 		</p>
					 	</div>
				</div>
				
				<div class="image">
					<img src="resources/img/frame_img/gray_f4.png" width="800px">
						<div class="img_txt">
							<p align="center">
							6000원<br>
							2023년 6월 1일~6월 30일</p>
						</div>
				</div>
			
			</div>	
		</section>
	</body>
</html>