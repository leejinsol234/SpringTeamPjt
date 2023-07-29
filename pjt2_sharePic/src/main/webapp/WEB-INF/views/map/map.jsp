<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
       <meta charset="utf-8">
       <title>find studio</title>
       <link rel="stylesheet" href="resources/css/map_css/map.css">
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
      
      <div class="map_wrap">
          <div id="map" style="width:80%;height:600px;overflow:hidden;"></div>
      
          <div id="menu_wrap" class="bg_white">
              <ul id="placesList"></ul>
              <div id="pagination"></div>
          </div>
      </div>
      
      
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8d86ec3f2222be57b11c4cad7c716f61&libraries=services"></script> 
      <script>
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
             mapOption = { 
                 center: new kakao.maps.LatLng(${list[0].latitude}, ${list[0].longitude}), // 지도의 중심좌표
                 level: 3 // 지도의 확대 레벨
             };
         
         var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
         
         // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
         var mapTypeControl = new kakao.maps.MapTypeControl();

         // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
         // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
         map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

         // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
         var zoomControl = new kakao.maps.ZoomControl();
         map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
         
         
         // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
         var infowindow = new kakao.maps.InfoWindow({zIndex:1});
         

         // 마커를 표시할 위치와 title 객체 배열입니다 
         var positions = [];
         var jsonData = JSON.parse('${list}');
         
         for(var i = 0; i < jsonData.length; i++) {
            var position = {
                  latlng: new kakao.maps.LatLng(jsonData[i].latitude, jsonData[i].longitude),
                  brand: jsonData[i].brand,
                  region: jsonData[i].region,
                  location: jsonData[i].location,                  
                  address: jsonData[i].address
            };
            
            positions.push(position);
            
         } // for(jsonData.length)
         
         
         
         
         // 마커 이미지의 이미지 주소입니다
         var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
           
         
         // 지도에 마커를 표시합니다
         for (var i = 0; i < positions.length; i ++) {
            var data = positions[i];
            displayMarker(data)
            placesSearchCB(data)
         } // for(positions)
         
            
         // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
         function placesSearchCB(data, pagination) {
            
              // 검색 목록과 마커를 표출합니다
              displayPlaces(data);

              // 페이지 번호를 표출합니다
              //displayPagination(pagination);
         }
         
         
         // 검색 결과 목록을 표출하는 함수입니다
         function displayPlaces(data) {

             var listEl = document.getElementById('placesList'), 
             menuEl = document.getElementById('menu_wrap'),
             fragment = document.createDocumentFragment(), 
             bounds = new kakao.maps.LatLngBounds(), 
             listStr = '';
             
             
             itemEl = getListItem(data);
             
             listEl.appendChild(itemEl);
             
             
         }

         
         // 검색결과 항목을 Element로 반환하는 함수입니다
         function getListItem(data) {
            var el = document.createElement('li');
            el.className = 'item';
            
            var infoDiv = document.createElement('div');
            infoDiv.className = 'info_li';
            el.appendChild(infoDiv);

            var placeNameHeading = document.createElement('h5');
            placeNameHeading.textContent = data.brand; // 브랜드 이름
            infoDiv.appendChild(placeNameHeading);
            
             var roadAddressSpan = document.createElement('span');
             roadAddressSpan.textContent = data.region + ' ' + data.location; // 지역, 지점이름
             infoDiv.appendChild(roadAddressSpan);

             var addressSpan = document.createElement('span');
             addressSpan.className = 'jibun gray';
             addressSpan.textContent = data.address; // 상세주소
             infoDiv.appendChild(addressSpan);
            
             return el;
         } // function getListItem(data)
            
         
         
         function displayMarker(data) {
            
            // 마커 이미지의 이미지 크기 입니다
             var imageSize = new kakao.maps.Size(24, 35);
             
             // 마커 이미지를 생성합니다    
             var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
               
             
             // 마커를 생성합니다
             var marker = new kakao.maps.Marker({
                 map: map, // 마커를 표시할 지도
                 position: data.latlng, // 마커를 표시할 위치
                 image : markerImage // 마커 이미지 
             });
             
             
             
             // 마커 위에 커스텀오버레이를 표시합니다
             // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
             var overlay = new kakao.maps.CustomOverlay({
                map: map,
                yAnchor: 3,
                position: marker.getPosition()       
             });
              
             
             // document.createElement로 HTMLElement 구성
             var wrap = document.createElement('div');
              wrap.className = 'wrap';
              wrap.style.display = 'none'; // wrap 요소를 숨김 처리
            
              var info = document.createElement('div');
              info.className = 'info';

              wrap.appendChild(info);
            
              // 제목
              var title = document.createElement('div');
              title.className = 'title';
              textContent = document.createTextNode(data.brand);
              
              title.appendChild(textContent);
              info.appendChild(title);
            
              // 닫기
              var close = document.createElement('button'); 
              close.className = 'close';
              close.onclick = function () {
               overlay.setMap(null);
            }
              title.appendChild(close);

              var body = document.createElement('div');
              body.className = 'body';
              info.appendChild(body);

              // 이미지
              var imgDiv = document.createElement('div');
              imgDiv.className = 'img';
              body.appendChild(imgDiv);
              
              var img = document.createElement('img');
              img.width = '73';
              img.height = '70';
            
              if (data.brand === '포토이즘') {
                  img.src = 'resources/img/photoism2.png';
              } else if (data.brand === '인생네컷') {
                  img.src = 'resources/img/frame_img/62c2e9727b583.png';
              } else if (data.brand === '포토그레이') {
                  img.src = 'resources/img/photogray2.png';
              } else if (data.brand === '하루필름') {
                  img.src = 'resources/img/frame_img/harufilm.png';
              } else {
                  img.src = '#'; // 기본값으로 설정하거나 다른 처리 방식을 적용할 수 있습니다.
              }

              imgDiv.appendChild(img);

              

              var desc = document.createElement('div');
              desc.className = 'desc';
              body.appendChild(desc);

              var ellipsis = document.createElement('div');
              ellipsis.className = 'ellipsis';

              var text = document.createTextNode(data.region + ' ' + data.location); // 지역, 지점이름

              ellipsis.appendChild(text);

              desc.appendChild(ellipsis);

              var jibun = document.createElement('div');
              jibun.className = 'jibun ellipsis';

              var text2 = document.createTextNode(data.address); // 상세주소

              jibun.appendChild(text2);

              desc.appendChild(jibun);

              var footerDev = document.createElement('div');
              desc.appendChild(footerDev);

              var link = document.createElement('a');
              link.className = 'link';

              var text3 = document.createTextNode(data.brand + " 홈페이지"); // 브랜드명 + 홈페이지

              link.appendChild(text3);
              link.target = '_blank';
              // data.brand 값에 따라 링크를 다르게 설정
              if (data.brand === '포토이즘') {
                  link.href = 'https://photoism.com';
              } else if (data.brand === '인생네컷') {
                  link.href = 'https://lifefourcuts.com';
              } else if (data.brand === '포토그레이') {
                  link.href = 'http://photogray.com';
              } else if (data.brand === '하루필름') {
                  link.href = 'https://harufilm.com';
              } else {
                  link.href = '#'; // 기본값으로 설정 or 다른 처리 방식으로 변경
              }
   
              footerDev.appendChild(link);
            
              overlay.setContent(wrap);
              
             // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
             kakao.maps.event.addListener(marker, 'click', function() {
                // 모든 wrap 요소를 숨김 처리
                 var wraps = document.getElementsByClassName('wrap');
                 for (var i = 0; i < wraps.length; i++) {
                     wraps[i].style.display = 'none';
                 }
                 // 클릭한 마커에 해당하는 wrap 요소만 표시
                 wrap.style.display = 'block';
                 overlay.setMap(map);
                 overlay.setZIndex(9999);
             });
             
         } // function displayMarker(data)

      </script>
   </body>
</html>