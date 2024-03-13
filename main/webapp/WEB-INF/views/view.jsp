<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Map Details</title>
    <style>
        #map {
            width: 1500px;
            height: 1200px;
        }
        .customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
        .customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
        .customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
        .customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
        .customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    </style>

</head>
<body>
    <div id="map"></div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d11e0bb227b703979f79244fb4d7e70"></script>
  <!-- 문제를 발생시키는 스크립트 -->
<script src="https://t1.daumcdn.net/mapjsapi/js/main/4.4.14/v3.js"></script>
<script>
		var container = document.getElementById('map');
		var options = {
		    center: new kakao.maps.LatLng(${mapInfo.x}, ${mapInfo.y}),
		    level: 3
		};
		var map = new kakao.maps.Map(container, options);
		
		// 마커를 표시할 위치와 title 객체 배열입니다
		var positions = [
		    {
		        title: '${mapInfo.name}',
		        latlng: new kakao.maps.LatLng(${mapInfo.x}, ${mapInfo.y})
		    }
		];
		
		// 마커 이미지의 이미지 주소입니다
		var imageSrc1 = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png",
		    imageSrc2 = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png",
		    imageSrc3 = "https://youip.net/images/marker_kakao.png",
		    imageSize1 = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
		    imageSize2 = new kakao.maps.Size(34, 39), // 마커이미지의 크기입니다
		    imageSize3 = new kakao.maps.Size(34, 39), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(27, 69)};
		
		for (var i = 0; i < positions.length; i++) {
		    // 마커 이미지를 생성합니다
		    var markerImage = new kakao.maps.MarkerImage(imageSrc1, imageSize1);
		
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title: positions[i].title, // 마커에 마우스를 올렸을때 나타나는 title값
		        image: markerImage // 마커 이미지
		    });
		}
		
		// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		var content = `<div class="customoverlay">
		<a href="#" onclick="openKakaoMap(); return false;">
		<span class="title">${mapInfo.name}</span>
		</a>
		</div>`;
		
		var position = new kakao.maps.LatLng(${mapInfo.x}, ${mapInfo.y});
		
		var customOverlay = new kakao.maps.CustomOverlay({
		    map: map,
		    position: position,
		    content: content,
		    yAnchor: 1
		});
		
		// Kakao Map API를 사용하여 새 창을 엽니다
		function openKakaoMap() {
		    // Kakao 맵에서 검색할 주소입니다.
		    var kakaoMapURL = 'https://map.kakao.com/';
		    // 검색할 주소를 URL에 추가합니다.
		    kakaoMapURL += '#local/goto';
		    kakaoMapURL += '?q=' + encodeURIComponent(mapInfo.name);
		    // 새 창을 엽니다.
		    window.open(kakaoMapURL);
		}

    // 주차장에 대한 정보를 가져와서 마커로 표시하는 함수
    function displayParkingMarkers() {
        var surl = "https://dapi.kakao.com/v2/local/search/keyword.json?query=" +
            encodeURI("주차장") + "&y=" + ${mapInfo.x} + "&x=" + ${mapInfo.y} + "&radius=1000&size=15";

        // HttpURLConnection 객체 생성
        var xhr = new XMLHttpRequest();
        xhr.open('GET', surl, true);
        xhr.setRequestHeader("Authorization", "KakaoAK 4c85ed49b7c7e627d99656293e0e073a");
        xhr.onreadystatechange = function () {
            if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
                var response = JSON.parse(xhr.responseText);
                var parkingList = response.documents;
                console.log(parkingList);

                // 주차장 목록을 사용하여 마커를 생성하고 지도에 표시함
                for (var i = 0; i < parkingList.length; i++) {
                    var latlng = new kakao.maps.LatLng(parkingList[i].y, parkingList[i].x);
                    var markerImage = new kakao.maps.MarkerImage(imageSrc2, imageSize2);
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: latlng,
                        title: parkingList[i].place_name,
                        image: markerImage
                    });
                }
            }
        };
        xhr.send();
    }

    // 관광명소에 대한 정보를 가져와서 마커로 표시하는 함수
    function displayAttractionMarkers() {
        // 관광명소에 대한 정보를 가져오는 URL
        var url = "https://dapi.kakao.com/v2/local/search/keyword.json?query=" +
            encodeURI("관광명소") + "&y=" + ${mapInfo.x} + "&x=" + ${mapInfo.y} + "&radius=1000&size=15";

        // HTTP 요청을 생성하고 전송하는 XMLHttpRequest 객체
        var xhr = new XMLHttpRequest();
        xhr.open('GET', url, true); // GET 방식으로 요청 생성
        xhr.setRequestHeader("Authorization", "KakaoAK 4c85ed49b7c7e627d99656293e0e073a"); // 인증 헤더 추가

        xhr.onreadystatechange = function () {
            if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
                // 요청이 성공하면, HTTP 응답을 JSON 형태로 파싱
                var response = JSON.parse(xhr.responseText);
                // JSON 형태로 파싱한 응답의 documents 필드에 관광명소 정보가 있음
                var attractions = response.documents;

                // 관광명소 정보에 따라 마커를 생성하고 지도에 표시
                for (var i = 0; i < attractions.length; i++) {
                    var latlng = new kakao.maps.LatLng(attractions[i].y, attractions[i].x);
                    var markerImage = new kakao.maps.MarkerImage(imageSrc3, imageSize3);
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: latlng,
                        title: attractions[i].place_name,
                        image: markerImage
                    });
                }
            }
        };

        // 요청 전송
        xhr.send();
    }

    // displayParkingMarkers 함수 호출하여 주차장 정보를 가져오고 마커로 표시
    displayParkingMarkers();
    // displayAttractionMarkers 함수 호출하여 관광명소 정보를 가져오고 마커로 표시
    displayAttractionMarkers();
</script>
</body>
</html>