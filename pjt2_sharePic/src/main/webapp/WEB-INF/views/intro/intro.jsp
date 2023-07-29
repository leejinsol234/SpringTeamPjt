<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>소개</title>
		<link rel="stylesheet" href="resources/css/intro_css/intro.css">
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
		
		<h1 id="title" align="center">About</h1>
		<br>
		<br>
		<h3 align="center" style="line-height:160%">
			SHARE PIC(쉐어픽)은 셀프 스튜디오 촬영 문화를 <br>
			보다 편리하게 즐기기 위한 목적으로 만들어졌습니다.<br>
			사용자 근처의 셀프 스튜디오를 검색하고<br>
			셀프 스튜디오 브랜드별로 다양한 프레임과 가격을 비교할 수 있으며,<br>
			촬영한 사진을 공유함으로써 트렌드를 한 눈에 볼 수 있습니다.</h3>
		
		
		<div class="about_section"> <!-- 기존 클래스명 "container"가 해더 클래스명과 겹쳐서 "about_section"으로 클래스명 변경 -->
		<!-- <div class="container"> -->
			<div class="c1">
				<img id="icon" src="resources/img/intro_img/map.png" width="100px" height="100px">
				<h4 id="text">나와 가장 가까운<br>셀프 스튜디오는 어디 있을까?</h4>
				<div class="hov_c1" align="center">
					<h4>현재 위치에서 가까운<br>셀프 스튜디오들을 찾을 수 있습니다.</h4>
				</div>
			</div>
			
			<div class="c2">
				<img id="icon" src="resources/img/intro_img/photo_frame.png" width="100px">
				<h4 id="text">어떤 프레임으로<br>찍을 수 있을까?</h4>
				<div class="hov_c2" align="center">
					<h4>브랜드별로 프레임을<br>비교하고 내가 원하는 프레임을<br>찾을 수 있습니다.</h4>
				</div>
			</div>
			
			<div class="c3">
				<img id="icon" src="resources/img/intro_img/share.png" width="100px">
				<h4 id="text">다른 사람들은<br>어떻게 찍었을까?</h4>
				<div class="hov_c3" align="center">
					<h4>회원가입 후 게시판에서 사진을<br>공유하며 트렌드와 이용 후기 등을<br>나눌 수 있습니다.</h4>
				</div>
			</div>
			
			
		</div>
				
		
					
			

				
				
			
	

	</body>
</html>
