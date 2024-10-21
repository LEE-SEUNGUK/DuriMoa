<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td {
	padding-left: 0px !important;
	padding-right: 0px !important;
}

.accordion-button {
	font-size: 22px !important;
}

.accordion-body {
	padding-left: 2rem;
}

.accordion-body ul {
	list-style-type: none;
	padding-left: 0;
}

.accordion-body li {
	margin-bottom: 0.5rem;
}

.accordion-button.no-toggle::after {
	display: none;
}

.accordion-button.no-toggle:hover {
	cursor: default;
}

.accordion-button














.no-toggle














:not







 







(
.collapsed







 







){
color














:







 







var














(-
-bs-accordion-btn-color














);
background-color














:







 







var














(-
-bs-accordion-btn-bg














);
box-shadow














:







 







none














;
}
.writing-button {
	position: fixed;
	bottom: 15%;
	right: 12%;
	width: 60px;
	height: 60px;
	background-color: #007bff;
	border-radius: 50%;
	color: white;
	font-size: 24px;
	cursor: pointer;
	transition: background-color 0.3s;
	z-index: 1000;
	border: none;
}

.writing-button:hover {
	background-color: #0056b3;
}

/* 작성 폼 */
.travel-form {
	background-color: #f8f9fa;
	padding: 20px;
	border-radius: 10px;
}

#photoDiv {
	display: none;
}

#map {
	width: 300px;
	height: 300px;
	display: none;
}

#writeMode {
	display: none;
}

.writing-button i {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 100%;
	padding-left: 3px;
	padding-bottom: 3px;
}

#travelAddForm {
	max-height: 1200px; /* Adjust this value as needed */
	margin: 0 auto;
}

/* Styles for the photo preview container */
#photoPreview {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
}

/* Base styles for all image wrappers */
.img-wrap {
	position: relative;
	width: 120px;
	height: 150px;
	overflow: hidden;
	border: 1px solid #ddd;
	border-radius: 5px;
}

/* Styles for all images */
.img-wrap img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

/* Styles specific to the thumbnail (first image) */
.img-wrap:first-child {
	width: 120px;
	height: 150px;
	border-color: #007bff;
	box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

/* Label for the thumbnail */
.img-wrap:first-child::after {
	content: '썸네일';
	position: absolute;
	top: 5px;
	left: 5px;
	background-color: rgba(0, 123, 255, 0.7);
	color: white;
	padding: 2px 5px;
	font-size: 12px;
	border-radius: 3px;
}

.img-wrap:hover {
	transform: scale(1.02);
	transition: transform 0.3s ease;
}

#travelListView {
	height: 300px;
	width: 860px;
	border-radius: 20px;
	background-color: #fdf7f7;
}

#trvThum {
	width: 240px;
	height: 300px;
	object-fit: cover;
	border-radius: 20px;
}

#travelViewRight {
	width: 55%;
	height: 95%;
	padding: 0;
	margin-left: 80px;
	margin-top: 30px;
}

.trvTitle {
	font-weight: bold;
	font-size: 30px;
	font-family: LeeSeoyun;
}

.content {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	line-clamp: 2;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}

.compact-menu {
	min-width: 50px !important;
	/* Adjust this value as needed */
	width: auto;
	white-space: nowrap;
}

.compact-menu .dropdown-item {
	padding: 0.25rem 0.5rem;
	/* Reduce padding */
	font-size: 16px;
	/* Reduce font size if needed */
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/inc/header.jsp"></jsp:include>
	<div class="container" style="padding: 0 !important;">
		<div class="row">
			<section class="mypage_side col-2 p-0" style="margin-top: 6%;">
				<div class="mb-4">
					<h2>우리의 추억</h2>
					<p>여행기록을 추가하고 관리하세요!</p>
				</div>
				<div class="accordion w-100" id="regionAccordion">
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button no-toggle" type="button">서울</button>
						</h2>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button no-toggle" type="button">경기도</button>
						</h2>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseChungcheong">광역시</button>
						</h2>
						<div id="collapseChungcheong" class="accordion-collapse collapse">
							<div class="accordion-body">
								<ul>
									<li>부산</li>
									<li>대구</li>
									<li>인천</li>
									<li>광주</li>
									<li>대전</li>
									<li>울산</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseChungcheong">충청도</button>
						</h2>
						<div id="collapseChungcheong" class="accordion-collapse collapse">
							<div class="accordion-body">
								<ul>
									<li>충북</li>
									<li>충남</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseJeolla">전라도</button>
						</h2>
						<div id="collapseJeolla" class="accordion-collapse collapse">
							<div class="accordion-body">
								<ul>
									<li>전북</li>
									<li>전남</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseGyeongsang">경상도</button>
						</h2>
						<div id="collapseGyeongsang" class="accordion-collapse collapse">
							<div class="accordion-body">
								<ul>
									<li>경북</li>
									<li>경남</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="accordion-item">
						<h2 class="accordion-header">
							<button class="accordion-button no-toggle" type="button">제주도</button>
						</h2>
					</div>
				</div>
			</section>
			<section class="col-9" style="margin-top: 4%; margin-left: 100px" id="viewMode">
				<table class="table" style="margin-top: 2% !important; margin: 0 auto; border-bottom: #ffffff;">
					<tbody>
						<c:forEach items="${travelList}" var="travel">
							<tr>
								<td>
									<div class="d-flex">
										<form action="">
										<div style="height: 300px; width: 860px; border-radius: 20px; background-color: #fdf7f7;">
											<div class="row d-flex w-100 h-100">
												<div class="col-3" style="text-align: center;">
													<img class="p-3" src=${travel.trvImg1 } style="width: 240px; height: 300px; object-fit: cover; border-radius: 25px;" alt="">
												</div>
												<div class="col-9" style="width: 55%; height: 95%; padding: 0; margin-left: 80px; margin-top: 30px;">
													<div class="d-flex flex-column ">
														<h4 style="font-weight: bold; font-size: 30px; font-family: LeeSeoyun;">
															<span style="font-size: 28px;">[${travel.trvPlc }]</span>${travel.trvTt }
														</h4>
														<div class="dropdown position-absolute" style="left: 72%;">
															<button class="btn" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 20px; appearance: none; -webkit-appearance: none;">&#8942;</button>
															<ul class="dropdown-menu compact-menu">
																<li><a class="dropdown-item edit-travel" href="#" data-trv-id="${travel.trvId}">수정</a></li>
                                                                <li><a class="dropdown-item" href="#">삭제</a></li>
															</ul>
														</div>
														<div class="d-flex align-items-center" style="font-size: 18px;">
															<img src="resources/assets/img/board_map.png" width="22px" alt="">
															<p class="ms-2" style="color: #6a6a6a;">${travel.trvPc }</p>
														</div>
														<div class="d-flex align-items-center" style="font-size: 18px;">
															<img src="resources/assets/img/date.png" width="23px" alt="">
															<p class="ms-2" style="color: #6a6a6a;">${travel.trvDt }</p>
														</div>
													</div>
													<div class="d-inline-block" style=" margin-top: 35px; height: 105px; width: 500px; border-radius: 10px;">
														<div class="content mt-4" style="width: 90%; font-size: 18px; margin: 0 auto; margin-left: 0px;">${travel.trvCt }</div>
													</div>
												</div>
											</div>
										</div>
									</form>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
			<section id="writeMode" class="col-9 ms-5" style="display: none; margin-top: 5%">
				<div class="row">
					<form class="d-flex" id="travelAddForm" action="/travelAdd" method="post" enctype="multipart/form-data">
						<section class="col-7 mt-3">
							<div class="travel-form p-0" style="height: 600px">
								<div class="pt-5" style="width: 90%; margin: 0 auto;">
									<div class="mb-3">
										<label for="travelTitle" class="form-label">여행 제목</label> <input type="text" name="trvTt" class="form-control" id="travelTitle" placeholder="여행 제목을 입력하세요">
									</div>
									<div class="mb-3">
										<label for="travelDestination" class="form-label">여행지</label>
										<div class="input-group">
											<input type="text" name="trvPc" class="form-control" id="travelDestination" placeholder="여행지를 검색하세요" readonly>
											<button class="btn btn-outline-secondary" type="button" id="searchAddress">검색</button>
										</div>
									</div>
									<input type="hidden" id="coordinateX" name="trvX"> <input type="hidden" id="coordinateY" name="trvY">
									<div class="mb-3">
										<label for="travelDate" class="form-label">여행 날짜</label> <input type="date" name="trvDt" class="form-control" id="travelDate" placeholder="여행 날짜를 선택하세요">
									</div>
									<div class="mb-3">
										<label for="travelContent" class="form-label">내용</label>
										<textarea class="form-control" name="trvCt" id="travelContent" rows="6" placeholder="여행 내용을 입력하세요"></textarea>
									</div>
									<div class="mb-3 form-check d-flex justify-content-between">
										<div>
											<input type="checkbox" name="trvOp" class="form-check-input" id="trvOp" checked> <label class="form-check-label" for="isPublic">공개 설정</label>
										</div>
										<input type="hidden" name="memId" value="${sessionScope.login.memId}">
										<c:if test="${sessionScope.couple != null}">
											<input type="hidden" name="copId" value="${sessionScope.couple.copId}">
										</c:if>
										<button type="submit" class="btn btn-primary">저장하기</button>
									</div>
								</div>
							</div>
						</section>
						<section class="col-5 ms-4 d-flex flex-column align-items-center">
							<div class="mt-5" id="map"></div>
							<div class="mt-3" id="photoDiv">
								<label for="travelPhotos" class="form-label">사진(최대 3장)</label> <input type="file" id="trvImgUpload" name="trvImgs" class="form-control" multiple accept="image/*">
								<div id="photoPreview" class="d-flex justify-content-start align-items-center mt-3"></div>
							</div>
						</section>
					</form>
				</div>
			</section>
		</div>
	</div>
	<div id="writeButton" class="writing-button">
		<i class="fa-regular fa-pen-to-square"></i>
	</div>

	<script>


// Document ready function
$(document).ready(function() {
    initializeMap();

    $('#writeButton').click(function() {
        if (isEditMode) {
            // If we're in edit mode, clicking the X should clear the form
            clearForm();
        }
        toggleMode();
    });

    $('.edit-travel').click(function(e) {
        e.preventDefault();
        var trvId = $(this).data('trv-id');
        editTravel(trvId);
    });

    $('.accordion-button.no-toggle').click(function(e) {
        e.preventDefault();
        return false;
    });

    $('#searchAddress').click(execDaumPostcode);

    $('#trvImgUpload').on('change', function(event) {
        var files = event.target.files;
        var photoPreview = $('#photoPreview');

        if (files.length > 3) {
            alert('최대 3장의 사진만 업로드할 수 있습니다.');
            $(this).val('');
            photoPreview.empty();
            return;
        }

        photoPreview.empty();

        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var reader = new FileReader();

            reader.onload = (function(theFile) {
                return function(e) {
                    var imgWrap = $('<div class="img-wrap"></div>');
                    var img = $('<img>').attr('src', e.target.result).addClass('img-thumbnail');
                    imgWrap.append(img);
                    photoPreview.append(imgWrap);
                };
            })(file);

            reader.readAsDataURL(file);
        }
    });

    $('#travelAddForm').submit(function(e) {
        e.preventDefault();
        var formData = new FormData(this);

        var url = isEditMode ? '/travelUpdate' : '/travelAdd';

        $.ajax({
            url: url,
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                console.log('Success:', response);
                alert(isEditMode ? '여행 기록이 성공적으로 수정되었습니다!' : '여행 기록이 성공적으로 저장되었습니다!');
                location.href = 'travelView';
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                alert('여행 기록 저장 중 오류가 발생했습니다.');
            }
        });
    });
});

//Global variables
var map, marker, geocoder;
var isEditMode = false;
var currentTrvId = null;

function clearForm() {
    $('#travelAddForm')[0].reset();
    $('#coordinateX').val('');
    $('#coordinateY').val('');
    $('#photoPreview').empty();
    $('#map').hide();
    $('#photoDiv').hide();
    $('#travelAddForm').attr('action', '/travelAdd');
    $('input[name="trvId"]').remove();
    isEditMode = false;
    currentTrvId = null;
}

// Initialize the map
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

// Toggle between view and write modes
function toggleMode() {
    $('#viewMode').toggle();
    $('#writeMode').toggle();

    if ($('#writeMode').is(':visible')) {
        $('#writeButton').html('<i class="fa-solid fa-xmark" style="padding: 0px;"></i>');
    } else {
        $('#writeButton').html('<i class="fa-regular fa-pen-to-square"></i>');
    }
}

// Edit travel function
function editTravel(trvId) {
    $.ajax({
        url: '/getTravel',
        type: 'GET',
        data: { trvId: trvId },
        success: function(response) {
            isEditMode = true;
            currentTrvId = trvId;
            populateForm(response);
            toggleMode();
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
            alert('여행 정보를 불러오는 중 오류가 발생했습니다.');
        }
    });
}

// Populate form with travel data
function populateForm(data) {
    $('#travelTitle').val(data.trvTt);
    $('#travelDestination').val(data.trvPc);
    $('#coordinateX').val(data.trvX);
    $('#coordinateY').val(data.trvY);
    
    if (data.trvDt) {
        var date = new Date(data.trvDt);
        var formattedDate = date.getFullYear() + '-' + 
                            String(date.getMonth() + 1).padStart(2, '0') + '-' + 
                            String(date.getDate()).padStart(2, '0');
        $('#travelDate').val(formattedDate);
    }
    
    $('#travelContent').val(data.trvCt);
    $('#trvOp').prop('checked', data.trvOp === 'Y');

    // Display the map based on the address
    if (data.trvPc) {
        geocoder.addressSearch(data.trvPc, function(results, status) {
            if (status === kakao.maps.services.Status.OK) {
                var result = results[0];
                var coords = new kakao.maps.LatLng(result.y, result.x);

                $('#coordinateX').val(result.x);
                $('#coordinateY').val(result.y);

                $('#map').show();
                map.relayout();
                map.setCenter(coords);
                marker.setPosition(coords);
            } else {
                console.error('Geocoding failed:', status);
                alert('주소를 지도에 표시하는 데 실패했습니다.');
            }
        });
    }

    // Display existing images
    var photoPreview = $('#photoPreview');
    photoPreview.empty();
    if (data.trvImg1) addImagePreview(data.trvImg1, photoPreview);
    if (data.trvImg2) addImagePreview(data.trvImg2, photoPreview);
    if (data.trvImg3) addImagePreview(data.trvImg3, photoPreview);
    $('#photoDiv').show();

    $('#travelAddForm').attr('action', '/travelUpdate');
    $('input[name="trvId"]').remove(); // Remove any existing trvId input
    $('<input>').attr({
        type: 'hidden',
        name: 'trvId',
        value: currentTrvId
    }).appendTo('#travelAddForm');
}

// Add image preview
function addImagePreview(imgSrc, container) {
    var imgWrap = $('<div class="img-wrap"></div>');
    var img = $('<img>').attr('src', imgSrc).addClass('img-thumbnail');
    imgWrap.append(img);
    container.append(imgWrap);
}

// Execute Daum Postcode function
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = data.address;
            $('#travelDestination').val(addr);

            geocoder.addressSearch(data.address, function(results, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var result = results[0];
                    var coords = new kakao.maps.LatLng(result.y, result.x);

                    $('#coordinateX').val(result.x);
                    $('#coordinateY').val(result.y);

                    $('#map').show();
                    $('#photoDiv').show();
                    map.relayout();
                    map.setCenter(coords);
                    marker.setPosition(coords);
                }
            });
        }
    }).open();
}
</script>
</body>
</html>