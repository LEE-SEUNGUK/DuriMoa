<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>두리모아</title>

<style>
#firstMain {
	position: relative;
	overflow: hidden;
	background: url('resources/assets/img/main_slide/silde1.jpg') no-repeat left center;
	background-size: cover;
}

#firstMain::before {
	position: absolute;
	content: "";
	top: 0px;
	left: 0px;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.8);
	z-index: 0;
}

#firstMain > * {
	position: relative;
	z-index: 1;
}

#main_login {
	border-radius: 20px;
	outline: 1px solid;
	color: white;
	font-size: 20px;
}

#main_login:hover {
	outline: none;
	background-color: rgba(255, 255, 255, 0.8);
	color: black;
	transition: 0.3s;
	scale: 1.1;
}

#ad_marker1 {
	width: 70px;
	position: absolute;
	top: 13%;
	right: 40%;
}

#ad_marker2 {
	width: 70px;
	position: absolute;
	top: 60%;
	right: 37%;
}

#ad_marker3 {
	width: 70px;
	position: absolute;
	top: 40%;
	right: 54%;
}

.travelTitle{
	font-family: 'LeeSeoyun';
	font-size: 35px;
}

.carousel-item img {
	height: 780px;
	width: 100%;
	object-fit: cover;
}

.carousel-control-prev, .carousel-control-next {
	width: 5%;
}

.carousel-indicators {
	bottom: 0;
}

.travelModal {
	max-width: 1300px !important;
}

.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 140px;
	height: 50px;
	margin-left: -70px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	bottom: 47px;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 100%;
	height: 38px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
	border-radius: 15px
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	width: 80%;
	font-size: 18px;
	font-weight: bold;
	text-align: center; margin;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

#resetMapBtn {
    bottom: 20px; 
    right: 20px; 
    z-index: 999;
    box-shadow: 0 2px 4px rgba(0,0,0,0.2);
    background: url("resources/assets/img/center.png") no-repeat;
    transition: all 0.3s ease;
    background-position : center;
    background-size: 37px;
    background-color: white;
    width: 50px;
    height: 50px;
}

#resetMapBtn:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}

#map{
	position: relative;
}

#resetMapBtn{
	position: absolute;
}

</style>
</head>

<body>
<jsp:include page="/WEB-INF/inc/header.jsp"></jsp:include>
<c:if test="${empty sessionScope.login}">
	<main id="firstMain" class="d-flex align-items-center bg-dark text-white" style="width: 1920px; height:868px; margin: 0 auto;">
		<div class="d-flex w-100">
			<section class="w-50" style="text-align: center;">
				<div class="position-relative">
					<img src="resources/assets/img/map.png" width="40%" alt=""> 
					<img id="ad_marker1" src="resources/assets/img/marker.png" alt=""> 
					<img id="ad_marker2" src="resources/assets/img/marker.png" alt="">
					<img id="ad_marker3" src="resources/assets/img/marker.png" alt="">
				</div>
			</section>
			<section class="d-flex flex-column align-items-center" style="width: 30%;">
				<h3 style="line-height: 2; margin-top: 90px;">
					<span style="font-size: 45px;">두리모아</span>는 둘이 모아를 귀엽게 표현한 단어로<br>커플이 서로의 여행 기록을 공유하고<br>마음에 드는 여행지를 탐색 할 수 있는 플랫폼입니다.
				</h3>
				<button id="main_login" class="btn w-25" style="margin-top: 200px;" data-bs-toggle="modal" data-bs-target="#loginModal">시작하기</button>
			</section>
		</div>
	</main>
</c:if>
<c:if test="${not empty sessionScope.login}">
	<main style="height:867px; width: 1920px; margin: 0 auto;">
		<div id="map" style="width: 850px; height: 100%; margin: 0 auto;">
			<button id="resetMapBtn" class="btn">
		    </button>
	    </div>
	</main>
</c:if>
<!-- 	여행 정보 모달 -->
<div class="modal fade" id="markerModal" tabindex="-1" aria-labelledby="markerModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered travelModal">
		<div class="modal-content" style="height: 780px">
			<div class="modal-body">
				<div class="row h-100" style="width: 100%; margin: 0;">
					<div class="col-md-6 p-0 h-100">
						<!-- Carousel -->
						<div id="travelCarousel" class="carousel slide h-100" data-bs-ride="carousel">
							<div class="carousel-indicators">
								<button type="button" data-bs-target="#travelCarousel" data-bs-slide-to="0" class="active"></button>
								<button type="button" data-bs-target="#travelCarousel" data-bs-slide-to="1"></button>
								<button type="button" data-bs-target="#travelCarousel" data-bs-slide-to="2"></button>
							</div>
							<div class="carousel-inner h-100">
								<div class="carousel-item active">
									<img src="" id="trvImg1" class="d-block w-100" alt="Travel Image 1">
								</div>
								<div class="carousel-item">
									<img src="" id="trvImg2" class="d-block w-100" alt="Travel Image 2">
								</div>
								<div class="carousel-item">
									<img src="" id="trvImg3" class="d-block w-100" alt="Travel Image 3">
								</div>
							</div>

							<!-- Navigation Arrows -->
							<button class="carousel-control-prev" type="button" data-bs-target="#travelCarousel" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#travelCarousel" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
					<div class="col-md-6 p-0">
						<h3 class="travelTitle" id="modalTitle" style="text-align: center; margin-top: 12%;"></h3>
						<div class="d-flex align-items-center mt-5 ms-4">
							<img src="resources/assets/img/board_map.png" width="30px" alt="">
							<p class="ms-4" id="modalPlace" style="font-size: 20px;"></p>
						</div>
						<div class="d-flex align-items-center mt-3 ms-4">
							<img src="resources/assets/img/date.png" width="30px" alt="">
							<p class="ms-4" id="modalDates" style="font-size: 20px;"></p>
						</div>
						<textarea class="travelContet ms-4 p-3" id="modalContent" style="font-size: 18px; height: 40%; 
						background-color: #f8f9fa; font-family: 'Pretendard-Regular';
						border-radius: 15px; margin-top: 20%; width: 92%; resize: none; border: none;" readonly="readonly"></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
  	const initialCenter = new kakao.maps.LatLng(36.2432627785657, 127.84846467555381);
    const initialLevel = 12;
    
 	// Add click event listener to reset button
    document.getElementById('resetMapBtn').addEventListener('click', function() {
        // Animate the map movement to the initial position
        map.setLevel(initialLevel, {animate: true});
        map.panTo(initialCenter);
        
        // Show all markers if they were filtered
        markers.forEach(marker => {
            marker.setMap(map);
        });
        
        // Clear and re-add all markers to clusterer
        clusterer.clear();
        clusterer.addMarkers(markers);
        
        // Clear search input if it exists
        if (document.getElementById('marker_search')) {
            document.getElementById('marker_search').value = '';
        }
    });

 	
	var positions = [
	    <c:forEach items="${markerList}" var="marker">
	    {
	        title: '${marker.trvTt}',
	        place: '${marker.trvPc}',
	        Thumnail: '${marker.trvImg1}',
	        trvImg2: '${marker.trvImg2}',
	        trvImg3: '${marker.trvImg3}',
	        trvSdt: '${marker.trvSdt}',
	        trvEdt: '${marker.trvEdt}',
	        trvCt: `${marker.trvCt}`,
	        latlng: new kakao.maps.LatLng(
	        		parseFloat('${marker.trvY}'), // 위도 (Y)
	                parseFloat('${marker.trvX}')  // 경도 (X)
	        )
	    },
	    </c:forEach>
	];
	
	// Initialize modal
       const $markerModal = $('#markerModal');
       const markerModal = new bootstrap.Modal($markerModal[0]);


	var mapContainer = document.getElementById('map'), mapOptions = {
		center : new kakao.maps.LatLng(36.2432627785657, 127.84846467555381),
		level : 12
	};

	var map = new kakao.maps.Map(mapContainer, mapOptions);
	
	// Initialize MarkerClusterer
       var clusterer = new kakao.maps.MarkerClusterer({
           map: map,
           averageCenter: true,
           minLevel: 6,
           styles: [{
               width: '91px',
               height: '69px',
               background: 'url("resources/assets/img/cluster.png") no-repeat',
               backgroundSize: 'contain',
               textAlign: 'center',
               fontWeight: 'bold',
               lineHeight: '52px',
               color: '#d94844'
           }]
       });
	
       // Array to store all markers
       var markers = [];
	
	for (var i = 0; i < positions.length; i ++) {
		console.log(positions[i].trvCt);
	    
	    var imageSrc = 'resources/assets/img/marker.png', // 마커이미지의 주소입니다    
           imageSize = new kakao.maps.Size(70, 53), // 마커이미지의 크기입니다
           imageOption = { offset: new kakao.maps.Point(34, 50) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
           
   
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
  		        image : markerImage // 마커 이미지 
	    });
           
    
           markers.push(marker);

           
     // 각 마커에 대한 커스텀 오버레이 생성
        var customOverlay = new kakao.maps.CustomOverlay({
            content: '<div class="wrap">' + 
            '    <div class="info d-flex align-items-center justify-content-center">' + 
            '        <div class="title">' + 
            		 positions[i].title   + 
            '        </div>' + 
            '        <div class="body">' +    
            '    </div>' +    
            '</div>',
            position: marker.getPosition(),
            zIndex: 1
        });

        // 마커에 이벤트 리스너 추가
        kakao.maps.event.addListener(marker, 'mouseover', (function(overlay) {
            return function() {
                overlay.setMap(map); // 오버레이 보이기
            };
        })(customOverlay)); // 클로저를 사용하여 현재 오버레이를 전달
        
        kakao.maps.event.addListener(marker, 'mouseout', (function(overlay) {
            return function() {
                overlay.setMap(null); // 오버레이 숨기기
            };
        })(customOverlay)); // 클로저를 사용하여 현재 오버레이를 전달

        (function(marker, position) {
            kakao.maps.event.addListener(marker, 'click', function() {
            	// Set basic modal content
                $('#modalTitle').text(position.title);
                $('#modalPlace').text(position.place);

                // Sdt와 Edt가 같은지 확인하고 표시
                var modalDates;
                if (position.trvSdt === position.trvEdt) {
                    modalDates = position.trvSdt; // 같으면 Sdt만 표시
                } else {
                    modalDates = position.trvSdt + ' ~ ' + position.trvEdt; // 다르면 Sdt ~ Edt
                }
                $('#modalDates').text(modalDates);
                $('#modalContent').text(position.trvCt);

                // Get the carousel inner container
                const carouselInner = document.querySelector('.carousel-inner');
                
                // Clear existing slides
                carouselInner.innerHTML = '';

                // Add first slide (thumbnail)
                const firstSlide = document.createElement('div');
                firstSlide.className = 'carousel-item active';
                firstSlide.innerHTML = '<img src="' + position.Thumnail + '" class="d-block w-100" alt="Travel Image 1">';
                carouselInner.appendChild(firstSlide);

                let slideCount = 1; // Track the number of slides

                // Add second slide if exists
                if (position.trvImg2) {
                    const secondSlide = document.createElement('div');
                    secondSlide.className = 'carousel-item';
                    secondSlide.innerHTML = '<img src="' + position.trvImg2 + '" class="d-block w-100" alt="Travel Image 2">';
                    carouselInner.appendChild(secondSlide);
                    slideCount++;
                }

                // Add third slide if exists
                if (position.trvImg3) {
                    const thirdSlide = document.createElement('div');
                    thirdSlide.className = 'carousel-item';
                    thirdSlide.innerHTML = '<img src="' + position.trvImg3 + '" class="d-block w-100" alt="Travel Image 3">';
                    carouselInner.appendChild(thirdSlide);
                    slideCount++;
                }

                // Show or hide carousel controls based on the number of slides
                const prevControl = document.querySelector('.carousel-control-prev');
                const nextControl = document.querySelector('.carousel-control-next');

                if (slideCount > 1) {
                    // Show controls if there are multiple slides
                    prevControl.style.display = 'block';
                    nextControl.style.display = 'block';
                } else {
                    // Hide controls if there is only one slide
                    prevControl.style.display = 'none';
                    nextControl.style.display = 'none';
                }

                // Show modal
                $('#markerModal').modal('show');
            });
        })(marker, positions[i]); // 클로저 사용하여 각 마커의 정보를 전달
	}
	
	clusterer.addMarkers(markers);
	
	// ADD THE NEW SEARCH CODE HERE
    // Add event listener for search input
    const searchInput = document.getElementById('marker_search');
    searchInput.addEventListener('input', filterMarkers);

    function filterMarkers() {
        const searchTerm = searchInput.value.toLowerCase().trim();
        
     	// Clear existing clusters
        clusterer.clear();
        // Hide all markers initially
        markers.forEach(marker => {
            marker.setMap(null);
        });
        
        // If search term is empty, restore all markers with clustering
        if (searchTerm === '') {
            markers.forEach(marker => {
                marker.setMap(map);
            });
            clusterer.addMarkers(markers);
            return;
        }
        
        // Filter markers based on search term
        const filteredMarkers = positions.reduce((acc, position, index) => {
            const titleMatch = position.title.toLowerCase().includes(searchTerm);
            const placeMatch = position.place.toLowerCase().includes(searchTerm);
            
            if (titleMatch || placeMatch) {
                markers[index].setMap(map);
                acc.push(markers[index]);
            }
            
            return acc;
        }, []);
        
        // Add filtered markers to clusterer
        if (filteredMarkers.length > 0) {
            clusterer.addMarkers(filteredMarkers);
        }
    }

    // Add submit prevention to the search form
    const searchForm = document.querySelector('form[role="search"]');
	if (searchForm) {
	    searchForm.addEventListener('submit', (e) => {
	        e.preventDefault();
	        filterMarkers();
	    });
	}
</script>
</body>
</html>