<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/board_css/board.css">
<script src="resources/js/HttpRequest.js"></script>
<script src="resources/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function send(f) {
		var f = document.getElementById("nickname");
		var nickname = f.nickname.value.trim();
		
		if (nickname == '') {
			alert("로그인 후 사용하세요");
			location.href = "login_join";
			return;
		} 
		
		f.action = "insert_form.do";
		f.method = "POST";
		f.submit();
	}
</script>

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
		<div class="brand_btn_box">
			<button type="button" id="b1" class="brand_btn" onclick="location.href='select_list?brand_num=${brand[0].brand_num}'"> 
				<img src="resources/img/partners_logo01.png" width="150px" > 
			</button>
			<button type="button" id="b2" class="brand_btn" onclick="location.href='select_list?brand_num=${brand[1].brand_num}'"> 
				<img src="resources/img/partners_logo02.png" width="200px">
			</button>
			<button type="button" id="b3" class="brand_btn" onclick="location.href='select_list?brand_num=${brand[2].brand_num}'"> 
				<img src="resources/img/partners_logo03.png" width="200px"> 
			</button>
			<button type="button" id="b4" class="brand_btn" onclick="location.href='select_list?brand_num=${brand[3].brand_num}'"> 
				<img src="resources/img/partners_logo04.png" width="200px">
			</button>
			<button type="button" id="b5" class="brand_btn" onclick="location.href='select_list?brand_num=${brand[4].brand_num}'"> 
				<img src="resources/img/partners_logo05.png" width="200px">
			</button>
		</div>
	<div class="send_box">
		<input type="button" class="send_btn" onclick="send();" value="작성">
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
						<input type="hidden" value="${vo.brand_num}">
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