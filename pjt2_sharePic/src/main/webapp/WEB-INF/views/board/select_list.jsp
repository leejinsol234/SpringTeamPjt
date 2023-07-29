<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/board_css/selectlist.css">
<script src="resources/js/all.min.js"></script>
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
	<h1 id="title" align="center">Album</h1>
		<div>
			<button class="go_to_board" onclick="location.href='board.do'">
				<i class="fa-solid fa-arrow-left"></i>
			</button>
			<div class="brand_btn_box">
				<c:if test="${param.brand_num eq 10}">
					<img src="resources/img/partners_logo01.png" width="150px" > 
				</c:if>
				<c:if test="${param.brand_num eq 20}">
					<img src="resources/img/partners_logo02.png" width="200px">
				</c:if>
				<c:if test="${param.brand_num eq 30}">
					<img src="resources/img/partners_logo03.png" width="200px"> 
				</c:if>
				<c:if test="${param.brand_num eq 40}">
					<img src="resources/img/partners_logo04.png" width="200px">
				</c:if>
				<c:if test="${param.brand_num eq 50}">
					<img src="resources/img/partners_logo05.png" width="200px">
				</c:if>
			</div>
		</div>
	<div class="board_mainbox" align="center">
		<form name="f" id="nickname">
			<input type="hidden" name="nickname" value="${email.nickname}" /> 
			<input type="hidden" name="member_idx" value="${email.member_idx}" />
		</form>
		<div class="board_box" id="board_box">
			<c:forEach var="vo" items="${list}">
				<div class="board" onclick="location.href='board.view?member_idx=${vo.member_idx}&photo_name=${vo.photo_name}'">
					<c:if test="${vo.brand_num eq 10 }">
						<div class="logo_img_box">
							<img src="resources/img/partners_logo01.png" >
						</div>
					</c:if>
					<c:if test="${vo.brand_num eq 20 }">
						<div class="logo_img_box">
							<img src="resources/img/partners_logo02.png">
						</div>
					</c:if>
					<c:if test="${vo.brand_num eq 30 }">
						<div class="logo_img_box">
							<img src="resources/img/partners_logo03.png">
						</div>
					</c:if>
					<c:if test="${vo.brand_num eq 40 }">
						<div class="logo_img_box">
							<img src="resources/img/partners_logo04.png">
						</div>
					</c:if>
					<c:if test="${vo.brand_num eq 50 }">
						<div class="logo_img_box">
							<img src="resources/img/partners_logo05.png">
						</div>
					</c:if>
					<input type="hidden" value="${vo.member_idx}" readonly="readonly">
					
					<div class="img">
						<img src="resources/upload/${vo.photo_name}">
					</div>
					
					<div class="like_wrap">
						<p id="nickname">${vo.nickname}</p>
						<div class="like_main_box">
							<i class="fa-solid fa-heart"></i>
							<input type="text" class="like_b_box" value="${vo.like_b}" readonly="readonly"/>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>