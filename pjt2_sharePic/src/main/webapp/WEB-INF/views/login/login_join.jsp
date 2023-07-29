<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인&#38;회원가입</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login_css/login_join.css">
		<script src="resources/js/httpRequest.js"></script>
		<script src="resources/js/phone.js"></script> <!-- 핸드폰 정규식 적용(000-000-0000 or 000-0000-0000)-->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 카카오 주소 api -->
		<script type="text/javascript">
			
			/* sign in */
			function login() {
				
				var l = document.l;
				var email = l.email.value.trim();
				var pw = l.pw.value.trim();
				
				// 유효성 체크
				if (email == "") {
					alert("이메일을 입력해주세요");
					return;
				}
				
				if (pw == "") {
					alert("비밀번호를 입력해주세요");
					return;
				}
				
				
				var url = "login.do";
				var param = "email="+email+"&pw="+pw;
				
				sendRequest(url, param, myCheck, "POST");
			}
			
			function myCheck() {
				
				if(xhr.readyState == 4 && xhr.status == 200) {
					
					var data = xhr.responseText;
					var json = (new Function('return'+data))();
					
					// 로그인 하기 전에 복수의 로그인 페이지가 열려 있을 때(두 개 이상의 페이지가 있을 때)
					// 한 개의 로그인페이지에서 로그인이 된 상태가 되면 다른 한쪽에 로그인 시도 시
					// 로그인 하지 못하도록 처리
					if(json[0].result == 'session_conn') {
						
						alert("로그아웃 하시고 다시 시도해 주세요");
						// 기존페이지를 새로운 페이지로 변경
						location.replace("login_join");
						
					} else if(json[0].result == 'no_email') {
						
						alert("이메일이 존재하지 않습니다");
						
					} else if(json[0].result == 'no_pw') {
						
						alert("비밀번호가 일치하지 않습니다");
						
					} else {
						
						location.replace("main_test"); // 이전페이지로 돌아가지 못하게 replace를 사용
						// href는 페이지를 이동하는 것이기 때문에 뒤로가기 버튼을 누른경우 이전 페이지로 이동이 가능하지만(주소 히스토리를 기록함),
						// replace(주소 히스토리를 기록하지 않는다)는 현재 페이지를 새로운 페이지로 덮어 씌우기 때문에 이전 페이지로 이동이 불가능하다
					}
				}
			}
			
			/* sign up */
			
			// 이메일 중복체크
			function check_email() {
				
				var email = document.getElementById("email").value.trim();
				var email_f = document.getElementById("email_f");
				
				/* 이메일 정규식 */
				// ex) abc123@defgh456.ijk
				// " -" ," _"," ." 세개의 문자 입력을 허용하며 
				// 도메인 주소 " ."  이전에 "@" 가 나와야 하고
				// 도메인 주소 "."   이후에 2-3 문자는 와야된다
				var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				
				// 유효성 체크
				// 이메일이 값이 비어있거나 이메일형식이 아닐 때 빨간색으로 텍스트 출력
				if (email == "") {
					
					email_f.innerHTML="이메일을 입력해주세요";
					email_f.style.color = '#DF0000';
					return;
					
				} else if (!pattern.test(email)) {
					
					email_f.innerHTML="이메일 형식으로 입력해주세요";
					email_f.style.color = '#DF0000';
					return;
				}
				
				var url = "check_email";
				var param = "email="+encodeURIComponent(email);
				
				sendRequest(url, param, resultFn, "POST");	
			}
			
			function resultFn() {
				
				if(xhr.readyState == 4 && xhr.status == 200) {
					
					var data = xhr.responseText;
					var json = (new Function('return'+data))();
										
					if(json[0].result == "no") {
						
						email_f.innerHTML="이미 사용중인 이메일 입니다";
						email_f.style.color = '#DF0000';
						document.getElementById("signup").disabled = true;
						
					} else {
						
						email_f.innerHTML="사용가능한 이메일 입니다";
						email_f.style.color = 'green';
						document.getElementById("signup").disabled = false;
					}										
				}				
			}
			
			// 별명 중복체크
			function check_nick() {
				
				var nickname = document.getElementById("nickname").value.trim();
				var nick_f = document.getElementById("nick_f");
				
				// 유효성 체크
				// 별명 값이 비어있을 때 빨간색(#DF0000)으로 텍스트 출력
				if (nickname == "") {
					
					nick_f.innerHTML="별명을 입력해주세요";
					nick_f.style.color = '#DF0000';
					return;
				}
				
				var url = "check_nickname";
				var param = "nickname="+encodeURIComponent(nickname);
				
				sendRequest(url, param, resultFnn, "POST");	
			}
			
			function resultFnn() {
				
				if(xhr.readyState == 4 && xhr.status == 200) {
					
					var data = xhr.responseText;
					var json = (new Function('return'+data))();
										
					if(json[0].result == "no") {
						
						nick_f.innerHTML="이미 사용중인 별명 입니다";
						nick_f.style.color = '#DF0000';
						document.getElementById("signup").disabled = true;
						
					} else {
						
						nick_f.innerHTML="사용가능한 별명 입니다";
						nick_f.style.color = 'green';
						document.getElementById("signup").disabled = false;
					}										
				}				
			}
			
			// 주소 api
		    function findAddr() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		            	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

		                var addr = ''; // 주소 변수
		                		                
		              	//사용자가 선택한 주소 타입(도로명, 지번)에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		                
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("postcode").value = data.zonecode;		                
		                document.getElementById("address").value = addr;
		                
		             	// 커서를 상세주소 필드로 이동한다.
		                document.getElementById("detailAddress").focus();
						
		            }
		        }).open();
			}
		    
			
			function send() {
				
				var m = document.m;
				var email = m.email.value.trim();
				var pw = m.pw.value.trim();
				var name = m.name.value.trim();
				var nickname = m.nickname.value.trim();
				var address_postcode = m.address_postcode.value;
				
				// 유효성 검사
				// 500에러 방지
				if (email == "") {
					
					return;
				}
								
				if (pw == "") {
					
					document.getElementById("pw_f").innerHTML="비밀번호를 입력해주세요";
					document.getElementById("pw_f").style.color = '#DF0000';				
					return;
				}
				
				if (name == "") {
					
					document.getElementById("name_f").innerHTML="이름을 입력해주세요";
					document.getElementById("name_f").style.color = '#DF0000';
					return;
					
				}
				
				if (nickname == "") {
					
					return;
				}				
				
				
				m.action = "member_insert";
				m.method = "POST";
				m.submit();
			}
		</script>
	</head>
		
	<body>
		<div class="header">
			<div class="logo">
				<img src="resources/img/logo.png" alt=""
					onclick="location.href='main_test'">
			</div>
		</div>
		<div class="login-wrap">
		  <div class="login-html">
		    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">로그인</label>
		    <input id="tab-2" type="radio" name="tab" class="sign-up" ><label for="tab-2" class="tab">회원가입</label>
		    <div class="login-form">
		    <form name="l">
		      <div class="sign-in-htm">
		        <div class="group">
		          <label for="user" class="label">이메일</label>
		          <input type="text" class="input" name="email" maxlength="35">
		        </div>
		        <div class="group">
		          <label for="pass" class="label">비밀번호</label>
		          <input type="password" class="input" data-type="password" name="pw" maxlength="30">
		        </div>
		        <div class="hr"></div>
		        <div class="group">
		          <input class="button" id="signin" value="로그인" onclick="login()" readonly>
		        </div>
		      </div>
		     </form>
		     <form name="m">
		      <div class="sign-up-htm">
		        <div class="group">
		          <label for="email" class="label">이메일 &#42;</label>
		          <input id="email" type="text" class="input" name="email" maxlength="35" oninput="check_email()" placeholder="이메일을 입력하세요">
		          <div class="check_form" id="email_f"></div>	
		        </div>
		        <div class="group" id="pass">
		          <label for="pass" class="label">비밀번호 &#42;</label>
		          <input type="password" class="input" data-type="password" name="pw" maxlength="30" placeholder="비밀번호를 입력하세요">
		          <div class="check_form" id="pw_f"></div>	
		        </div>
		        <div class="group">
		          <label for="name" class="label">이름 &#42;</label>
		          <input type="text" class="input" name="name" maxlength="20" placeholder="이름을 입력하세요">
		          <div class="check_form" id="name_f"></div>	
		        </div>
		        <div class="group">
		          <label for="nick" class="label">별명 &#42;</label>
		          <input id="nickname" type="text" class="input" name="nickname" maxlength="20" oninput="check_nick()" placeholder="별명을 입력하세요">
		          <div class="check_form" id="nick_f"></div>				<!-- oninput: input에 값이 변경될 때마다 oninput 이벤트가 발생 -->
		        </div>
		        <div class="group">
		          <label for="addr" class="label">주소</label>
		          <input type="text" class="input" id="postcode" name="address_postcode" placeholder="우편번호" readonly onclick="findAddr()">		          		          
		        </div>
		        <div class="group">
		        	<input type="text" class="input" id="address" class="input" name="address" placeholder="주소" readonly onclick="findAddr()">
		        </div>
		        <div class="group">
		        	<input type="text" class="input" id="detailAddress" name="address_detail" placeholder="상세주소">
		        </div>
		        <div class="group">
		          <label for="phone" class="label">핸드폰</label>
		          <input type="text" class="input" name="phone" maxlength="13" oninput="autoHyphen(this)" placeholder="핸드폰번호" autofocus>
		        </div>
		        <div class="hr"></div>
		        <div class="group">
		          <input class="button" id="signup" value="회원가입" onclick="send()" readonly>
		        </div>
		      </div>
		      </form>
		    </div>
		  </div>
		</div>
	</body>
</html>