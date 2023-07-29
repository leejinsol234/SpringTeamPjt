<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="resources/css/board_css/insert_form.css">
<script src="resources/js/httpRequest.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/all.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
    	/* brand_btn이라는 클래스를 가진 버튼들을 누르면 그 버튼에 해당하는
    	   value 값을 input brand_num의 변수에 저장한다.
    	   여기서 이 함수를 #uploadbtn 함수 안에 집어넣었더니 계속해서
    	   brand_btn 변수가 null에서 변하지 않았다.
    	   그래서 이 함수를 밖에서 먼저 사용하여 변수의 값을 고정시킨 후 upload 함수에
    	   던져 주었다.*/
    	   
        var brand_num = document.getElementById("brand_num").value;
        $(".brand_btn").on("click", function(e) {
        brand_num = $(this).val();
        console.log(brand_num);
		})
        $("#uploadbtn").on("click", function(e){
        	e.preventDefault();
            if(!confirm("등록하시겠습니까?")) {
            	return;
            }
            var formData = new FormData();
            
            var formDataContent = new FormData();
            
            var inputFile = $("input[name='photo_name']");
            
            var files = inputFile[0].files;
            
            var content = document.getElementById("content").value.trim();
            var member_idx = document.getElementById("member_idx").value;
           
            
			/* console.log(brand_num);    
		    console.log(nickname);
            console.log(files);
            console.log(content); */
            
            //add fileData to formData
            for (var i = 0; i < files.length; i++) {
                formData.append("photo_name", files[i]);
            }
                        
            formData.append("content", content);
            
            formData.append("member_idx", member_idx);
            
            formData.append("brand_num", brand_num);
            
            /* console.log(formData.get("photo_name"));
            console.log(formData.get("content")); */
    	
            
            $.ajax({
                url: 'upload.do',
                processData: false,
                contentType: false,
                data: formData,
                type: "POST",
                success: function(result) {
                    alert("uploaded");
                    location.href = "board.do";
                }
            })
        })
    });
</script>
<!-- 이미지 미리보기 기능을 구현을 위한 javascript문 -->
<script type="text/javascript">
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById("uploadImage").src = e.target.result;
            }
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById("uploadImage").src = "";
        }
    }
</script>
<!-- input[type=file]의 기능 구현을 위한 jQuery -->
<script type="text/javascript">
	$(document).ready(function() {
		var fileTarget = $('.upload_box .upload_hidden');

		fileTarget.on('change', function() { //값이 변경되면
			if(window.FileReader) {
				var filename = $(this)[0].files[0].name;
			} else {
				// 파일명만 추출
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			
			//추출한 파일명 삽입
			$(this).siblings('.upload_name').val(filename);
		})
	})
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
	<h1 align="center">후기</h1>
	<div class="board_mainbox">
		<div class="insert_form">
			<input type="text" id="nickname" value="${email.nickname}님" readonly="readonly">
			<div class="img_box">
				<img id="uploadImage">
			</div>
			<div class="upload_box">
				<input class="upload_name" value="사진 선택!" disabled="disabled">
				<label for="file_upload">
					<i class="fa-solid fa-upload" style="width: 50px"></i>
				</label> 
				<input 
					type="file"
					id="file_upload" 
					name="photo_name" 
					onchange="readURL(this);"
					class="upload_hidden"
				>
			</div>
		</div>
		<div class="insert_form2">
			<div class="content_box">
				<input type="hidden" id="member_idx" value="${email.member_idx}">
				<textarea rows="5" cols="10" name="content" id="content" placeholder="여러분의 후기를 들려주세요!"></textarea>
			</div>
			<h2 align="center">어디서 추억을 남기셨나요?</h2>
			<div class="brand_box">
				<button type="button" id="b1" class="brand_btn" value="${brand[0].brand_num}"> 
					<img src="resources/img/partners_logo01.png" width="70px" > 
				</button>
				<button type="button" id="b2" class="brand_btn" value="${brand[1].brand_num}"> 
					<img src="resources/img/partners_logo02.png" width="70px" >
				</button>
				<button type="button" id="b3" class="brand_btn" value="${brand[2].brand_num}"> 
					<img src="resources/img/partners_logo03.png" width="70px" >
				</button> 
				</div>
			<div class="brand_box">
				<button type="button" id="b4" class="brand_btn" value="${brand[3].brand_num}"> 
					<img src="resources/img/partners_logo04.png" width="70px" >
				</button>
				<button type="button" id="b5" class="brand_btn" value="${brand[4].brand_num}"> 
					<img src="resources/img/partners_logo05.png" width="70px" >
				</button>
			</div>
			<input type="hidden" id="brand_num" value="null">
			<div class="btn_box">
				<button id="uploadbtn">
					<i class="fa-solid fa-pen"></i>
				</button>
				<button onclick="location.href='board.do'" class="cancle_btn">
					<i class="fa-solid fa-xmark"></i>
				</button>
			</div>
		</div>
	</div>
</body>
</html>