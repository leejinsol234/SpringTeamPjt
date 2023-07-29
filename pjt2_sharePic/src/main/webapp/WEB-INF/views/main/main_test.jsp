<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<title>index</title>
<link rel="stylesheet" href="resources/css/main_css/swiper-bundle.min.css" />
<link rel="stylesheet" href="resources/css/main_css/main_test.css">
<script src="resources/js/all.min.js"></script>
<script type="text/javascript">
	function send(f) {
		var f = document.getElementById("nickname");
		
		f.method = "POST";
		f.action = "board.do";
		f.submit();
	}
</script>
</head>
<body>
	<div id="fullpage">
		<div class='quick'>
			<ul></ul>
		</div>
		<div class="fullsection full1 section01" pageNum="1">
			<div class="header">
				<div class="logo">
					<img src="resources/img/logo.png" alt=""
						onclick="location.href='main_test'">
				</div>
			</div>

			<div class="banner_con section_top">
				<div class="floor_box">
					<div class="bc_floor floor1">
						<button class="bn_icon" onclick="location.href='intro.do'">
							<img src="resources/img/banner_icon01.png" alt="소개 아이콘">
							<div class="bn_txt" onclick="location.href='intro.do'">
								<p>소개</p>
							</div>
						</button>
					</div>
				</div>
				<div class="floor_box">
					<div class="bc_floor floor2">
						<button class="bn_icon" onclick="location.href='map.com'">
							<img src="resources/img/banner_icon02.png" alt="위치 아이콘">
							<div class="bn_txt">
								<p>위치</p>
							</div>
						</button>
						
						<div class="user">
						<button class="bn_icon" onclick="location.href='login_join'">
							<img src="resources/img/banner_icon03.png" alt="회원 아이콘">
							<c:if test="${email.nickname ne null}"> <!-- 로그인이 됐을 떄 -->
								<div class="bn_txt">
									<p>My page</p> <!-- 로그인이 됐을 때 -->
								</div>
								<button class="mypage" onclick="location.href='logout.do'"><span></span> Sign out</button>
							</c:if>
							<c:if test="${email.nickname eq null}"> <!--  로그인이 안됐을 때 -->
								<div class="bn_txt">
									<p>Sign in</p>
								</div>
							</c:if>
						</button>
				</div>
			</div>
		</div>	
			
				<div class="floor_box">
					<div class="bc_floor floor3">
						<button class="bn_icon" onclick="location.href='life.do'">
							<img src="resources/img/banner_icon04.png" alt="프레임 아이콘">
							<div class="bn_txt">
								<p>프레임</p>
							</div>
						</button>
						<form name="f" id="nickname">
							<input type="hidden" name="nickname" value="${email.nickname}">
							<input type="hidden" name="member_idx" value="${email.member_idx}">
						</form>
						<button class="bn_icon" onclick="send()">
							<img src="resources/img/banner_icon05.png" alt="게시판 아이콘">
							<div class="bn_txt">
								<p>게시판</p>
							</div>
						</button>
					</div>
				</div>
			</div>
		</div>
		<div class="fullsection full2" pageNum="2">
			<div class="section">
				<div class="contents">
					<div class="con_l">
						<div class="swiper eventSwiper">
							<div class="swiper-wrapper">
								<div class="swiper-slide slide01">
									<a href="https://lifefourcuts.com/Event01/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&bmode=view&idx=15353460&t=board"><img src="resources/img/event_img01.png" alt="인생네컷 이벤트"></a>
								</div>
								<div class="swiper-slide slide02">
									<a href="https://lifefourcuts.com/Event01/?q=YToxOntzOjEyOiJrZXl3b3JkX3R5cGUiO3M6MzoiYWxsIjt9&bmode=view&idx=15353460&t=board"><img src="resources/img/event_img02.png" alt="포토그레이 이벤트"></a>
								</div>
							</div>
							<div class="swiper-pagination"></div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
					</div>
					<div class="con_r">
						<div class="swiper reviewSwiper">
							<div class="swiper-wrapper">
								<c:forEach var="board_photo" items="${list}">
									<div class="swiper-slide">
									<div class="board" onclick="location.href='board.view?member_idx=${board_photo.member_idx}&photo_name=${board_photo.photo_name}'">
										<p>${board_photo.nickname}</p>
										<div class="img" style="width: 180px; height: 250px;">
											<img src="resources/upload/${board_photo.photo_name}" style="width: 180px; height: 250px;">
										</div>
										<div class="like_main_box">
											<i class="fa-solid fa-heart"></i>
											<input type="text" class="like_b_box" value="${board_photo.like_b}" readonly="readonly"/>
										</div>
									</div>
									</div>
								</c:forEach>
							</div>
							<div class="swiper-pagination"></div>
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
						</div>
					</div>
				</div>
				<div class="partners">
					<h2>제휴사 로고</h2>
					<ul class="partners_list">
						<li><a href="https://lifefourcuts.com/"><img src="resources/img/partners_logo01.png" width="200px"
							alt="인생네컷 로고"></a></li>
						<li><a href="https://photoism.co.kr/"><img src="resources/img/partners_logo02.png"
							alt="포토이즘 로고"></a></li>
						<li><a href="http://photogray.com/"><img src="resources/img/partners_logo03.png"
							alt="포토그래이 로고"></a></li>
						<li><a href="http://harufilm.com/"><img src="resources/img/partners_logo04.png"
							alt="하루필름 로고"></a></li>
						<li><a href="https://www.photomatic.co.kr/"><img src="resources/img/partners_logo05.png"
							alt="포토매틱 로고"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>

<script src="resources/js/jquery-1.12.4.js"></script>
<script src="resources/js/swiper-bundle.min.js"></script>
<script src="resources/js/main.js"></script>

</html>