<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#map {
	width: 100%;
	height: 300px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/inc/header.jsp"></jsp:include>
	<div class="container" style="margin-top: 4%;">
        <h3>[충남]${board.brdTt}</h3>
        <hr>
        <div class="row">
            <section class="col-6 p-0">
                <div style="text-align: center;">
                    <img class="p-5 ps-0" src="${board.brdImg1}" width="649px" height="780px" style="object-fit: cover;"
                        alt="">
                </div>
            </section>
            <section class="col-6 p-0 ps-3">
                <div class="d-flex justify-content-center align-items-center mt-5">
                    <img src="resources/assets/img/board_map.png" width="30px" alt="">
                    <h4 class="m-0 ms-3">${board.trvPc}</h4>
                </div>
                <div class="mt-3" style="text-align: center;">
                    <div id="map"></div>
                </div>
                <div class="mt-5 p-3" style="height: 340px;">
                    ${board.brdCt}
                </div>
            </section>
        </div>
    </div>
    <div class="container my-5">
        전체 댓글 0개
        <hr>
        <div class="d-flex align-items-center">
            <div class="col-2" style="text-align: center;">
                <img src="${sessionScope.login.memImg}" width="50px" height="50px"
                    style="border-radius: 50%;" alt="">
                <p>${sessionScope.login.memNm}</p>
            </div>
            <div class="col-10" style="height: 80px;">
                <input class="w-100 h-100 ps-3"  type="text" style="background-color: rgb(233, 233, 233); border: none; border-radius: 10px;"
                placeholder="댓글을 입력하세요">
            </div>
        </div>
    </div>
<script>
$(document).ready(function(){
	initializeMap();
	
	var trvX = ${board.trvX}; // JavaScript 변수에 board.trvX 값 할당
	var trvY = ${board.trvY}; // JavaScript 변수에 board.trvY 값 할당
	
    var coords = new kakao.maps.LatLng(trvY, trvX);
    map.relayout();
    map.setCenter(coords);
    marker.setPosition(coords);  
})

//Initialize the map
function initializeMap() {
    var mapContainer = document.getElementById('map');
    var mapOption = {
        center: new kakao.maps.LatLng(37.537187, 127.005476),
        level: 4
    };

    map = new kakao.maps.Map(mapContainer, mapOption);
    geocoder = new kakao.maps.services.Geocoder();

    var imageSrc = 'resources/assets/img/marker.png',
        imageSize = new kakao.maps.Size(66, 55),
        imageOption = { offset: new kakao.maps.Point(33, 45) };

    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

    marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(37.537187, 127.005476),
        map: map,
        image: markerImage
    });
}
</script>    
</body>

</html>