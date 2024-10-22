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

/*
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

.accordion-button.no-toggle:not (
.collapsed ){
	color: var(- 
-bs-accordion-btn-color);
	background-color: var(- 
-bs-accordion-btn-bg);
	box-shadow: none;
}
*/
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
					<p>여행기록을 추가하고 관리하세요</p>
				</div>
<!-- 				<div class="accordion w-100" id="regionAccordion"> -->
<!-- 					<div class="accordion-item"> -->
<!-- 						<h2 class="accordion-header"> -->
<!-- 							<button class="accordion-button no-toggle" type="button">서울</button> -->
<!-- 						</h2> -->
<!-- 					</div> -->
<!-- 					<div class="accordion-item"> -->
<!-- 						<h2 class="accordion-header"> -->
<!-- 							<button class="accordion-button no-toggle" type="button">경기도</button> -->
<!-- 						</h2> -->
<!-- 					</div> -->
<!-- 					<div class="accordion-item"> -->
<!-- 						<h2 class="accordion-header"> -->
<!-- 							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseChungcheong">광역시</button> -->
<!-- 						</h2> -->
<!-- 						<div id="collapseChungcheong" class="accordion-collapse collapse"> -->
<!-- 							<div class="accordion-body"> -->
<!-- 								<ul> -->
<!-- 									<li>부산</li> -->
<!-- 									<li>대구</li> -->
<!-- 									<li>인천</li> -->
<!-- 									<li>광주</li> -->
<!-- 									<li>대전</li> -->
<!-- 									<li>울산</li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="accordion-item"> -->
<!-- 						<h2 class="accordion-header"> -->
<!-- 							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseChungcheong">충청도</button> -->
<!-- 						</h2> -->
<!-- 						<div id="collapseChungcheong" class="accordion-collapse collapse"> -->
<!-- 							<div class="accordion-body"> -->
<!-- 								<ul> -->
<!-- 									<li>충북</li> -->
<!-- 									<li>충남</li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="accordion-item"> -->
<!-- 						<h2 class="accordion-header"> -->
<!-- 							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseJeolla">전라도</button> -->
<!-- 						</h2> -->
<!-- 						<div id="collapseJeolla" class="accordion-collapse collapse"> -->
<!-- 							<div class="accordion-body"> -->
<!-- 								<ul> -->
<!-- 									<li>전북</li> -->
<!-- 									<li>전남</li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="accordion-item"> -->
<!-- 						<h2 class="accordion-header"> -->
<!-- 							<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseGyeongsang">경상도</button> -->
<!-- 						</h2> -->
<!-- 						<div id="collapseGyeongsang" class="accordion-collapse collapse"> -->
<!-- 							<div class="accordion-body"> -->
<!-- 								<ul> -->
<!-- 									<li>경북</li> -->
<!-- 									<li>경남</li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="accordion-item"> -->
<!-- 						<h2 class="accordion-header"> -->
<!-- 							<button class="accordion-button no-toggle" type="button">제주도</button> -->
<!-- 						</h2> -->
<!-- 					</div> -->
<!-- 				</div> -->
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
														<img class="p-3" src="${travel.trvImg1 }" style="width: 240px; height: 300px; object-fit: cover; border-radius: 25px;" alt="">
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
																	<li><a class="dropdown-item delete-travel" href="#" data-trv-id="${travel.trvId}">삭제</a></li>
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
														<div class="d-inline-block" style="margin-top: 35px; height: 105px; width: 500px; border-radius: 10px;">
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
$(document).ready(function() {
    initializeMap();
    
    // 여행 정보 검색
     $('.search_btn').click(function(e) {
        e.preventDefault(); // Prevent form submission
        const keyWord = $('#marker_search').val();
        performSearch(keyWord);
    });

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

    $('.delete-travel').click(function(e) {
        e.preventDefault();
        var trvId = $(this).data('trv-id');
        if (confirm('정말 삭제하시겠습니까?')) {
            deleteTravel(trvId);
        }
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
            clickOrder = [];
            return;
        }

        photoPreview.empty();
        clickOrder = []; // Reset click order

        // Add clear button
        if ($('#clearPhotosBtn').length === 0) {
            var clearBtn = $('<button>')
                .attr('id', 'clearPhotosBtn')
                .addClass('btn btn-danger btn-sm mb-2')
                .text('지우기')
                
            clearBtn.on('click', function(e) {
                e.preventDefault();
                $('#trvImgUpload').val('');
                $('#photoPreview').empty();
                clickOrder = [];
                $(this).remove();
            });
            
            var labelDiv = $('<div>').addClass('d-flex align-items-center gap-2');
            $('#photoDiv label').wrap(labelDiv);
            $('#photoDiv label').after(clearBtn);
        }

        // Create preview containers with click handlers
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var reader = new FileReader();

            reader.onload = (function(theFile, index) {
                return function(e) {
                    var imgWrap = $('<div class="img-wrap" data-index="' + index + '"></div>');
                    var img = $('<img>').attr('src', e.target.result).addClass('img-thumbnail');
                    
                    // Add index display
                    var indexLabel = $('<div>')
                        .addClass('index-label')
                        .css({
                            'position': 'absolute',
                            'top': '5px',
                            'left': '5px',
                            'background': 'rgba(0, 0, 0, 0.7)',
                            'color': 'white',
                            'padding': '2px 6px',
                            'border-radius': '3px',
                            'font-size': '12px'
                        });

                    imgWrap.append(img, indexLabel);
                    photoPreview.append(imgWrap);

                    // If only one image, automatically set it as first
                    if (files.length === 1) {
                        clickOrder = [0];
                        indexLabel.text('1번째');
                    } else {
                        // For multiple images, make them clickable
                        indexLabel.text('클릭하세요');
                        
                        // Add click handler only for multiple images
                        imgWrap.on('click', function() {
                            var currentIndex = $(this).data('index');
                            
                            // Remove from clickOrder if already exists
                            var existingIndex = clickOrder.indexOf(currentIndex);
                            if (existingIndex !== -1) {
                                clickOrder.splice(existingIndex, 1);
                            }
                            
                            // Add to clickOrder
                            clickOrder.push(currentIndex);
                            
                            // Update all index labels
                            updateIndexLabels();
                        });
                    }
                };
            })(file, i);

            reader.readAsDataURL(file);
        }

        // If only one image is uploaded, no need for further interaction
        if (files.length === 1) {
            console.log('Single image automatically set as first');
        }
    });

    $('#travelAddForm').submit(function(e) {
        e.preventDefault();
        var formData = new FormData(this);
        var files = $('#trvImgUpload')[0].files;
        
        // Remove existing files
        formData.delete('trvImgs');
        
        if (files.length === 1) {
            // For single image, just append it directly
            formData.append('trvImgs', files[0]);
        } else if (clickOrder.length > 0) {
            // For multiple images, use the click order
            clickOrder.forEach((index, orderIndex) => {
                formData.append('trvImgs', files[index]);
            });
        } else {
            // If no clicks recorded but multiple images, use original order
            for (var i = 0; i < files.length; i++) {
                formData.append('trvImgs', files[i]);
            }
        }

        var url = isEditMode ? '/travelUpdate' : '/travelAdd';

        $.ajax({
            url: url,
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
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

$(document).on('click', '.remove-img', function() {
    var imgWrap = $(this).closest('.img-wrap');
    var isExisting = imgWrap.attr('data-existing') === 'true';
    
    if (isExisting) {
        // If it's an existing image, add a hidden input to mark it for deletion
        var trvId = currentTrvId;
        var imgIndex = imgWrap.attr('data-index');
        $('<input>').attr({
            type: 'hidden',
            name: 'deleteImages',
            value: `${trvId}_${imgIndex}`
        }).appendTo('#travelAddForm');
    }
    
    imgWrap.remove();
    
    // Clear file input if all new images are removed
    if ($('#photoPreview .img-wrap:not([data-existing="true"])').length === 0) {
        $('#trvImgUpload').val('');
        $('#trvImgUpload').removeData('orderedFiles');
    }
});


//Global variables
var map, marker, geocoder;
var isEditMode = false;
var currentTrvId = null;
let clickOrder  = [];


function updateIndexLabels() {
    $('.img-wrap').each(function() {
        var index = $(this).data('index');
        var orderIndex = clickOrder.indexOf(index);
        var indexLabel = $(this).find('.index-label');
        
        if (orderIndex !== -1) {
            indexLabel.text((orderIndex + 1) + '번째');
        } else {
            indexLabel.text('클릭하세요');
        }
    });
}

function clearForm() {
    $('#travelAddForm')[0].reset();
    $('#coordinateX').val('');
    $('#coordinateY').val('');
    $('#photoPreview').empty();
    $('#map').hide();
    $('#photoDiv').hide();
    
    // Remove the clear button and unwrap the label
    if ($('#clearPhotosBtn').length > 0) {
        $('#clearPhotosBtn').remove();
    }
    if ($('#photoDiv label').parent().hasClass('d-flex')) {
        $('#photoDiv label').unwrap();
    }
    
    isEditMode = false;
    currentTrvId = null;
    $('input[name="trvId"]').remove();
    $('#travelAddForm').attr('action', '/travelAdd');
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
        // Clear form when closing
        clearForm();
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
            
            // Add hidden input for trvId if it doesn't exist
            if ($('input[name="trvId"]').length === 0) {
                $('<input>')
                    .attr('type', 'hidden')
                    .attr('name', 'trvId')
                    .val(trvId)
                    .appendTo('#travelAddForm');
            } else {
                $('input[name="trvId"]').val(trvId);
            }
            
            populateForm(response);
            toggleMode();
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
            alert('여행 정보를 불러오는 중 오류가 발생했습니다.');
        }
    });
}

function deleteTravel(trvId) {
    $.ajax({
        url: '/travelDel',
        type: 'POST',
        data: { trvId: trvId },
        success: function(response) {
            console.log('Success:', response);
            alert('여행 기록이 성공적으로 삭제되었습니다!');
            location.reload(); // Reload the page to reflect the changes
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
            alert('여행 기록 삭제 중 오류가 발생했습니다.');
        }
    });
}

// 여행 정보 검색
function performSearch(keyWord) {
	console.log("검색 ㄱㄱ");
    $.ajax({
        url: '/getTravelSearch',  // You'll need to create this endpoint
        type: 'GET',
        data: { 
        	keyWord: keyWord
        },
        success: function(response) {
            if (response.status === "success") {
                const travels = response.data;
                updateTravelList(travels);
            } else {
                console.error('Search failed:', response.message);
            }
        },
        error: function(xhr, status, error) {
            console.error('Search error:', error);
        }
    });
}

function updateTravelList(travels) {
    const tbody = $('table tbody');
    tbody.empty();
    
    if (travels.length === 0) {
        tbody.append(
            '<tr>' +
                '<td class="text-center">' +
                    '<p class="my-5">검색 결과가 없습니다.</p>' +
                '</td>' +
            '</tr>'
        );
        return;
    }
    
    travels.forEach(travel => {
    	console.log(travels);
    	console.log(travel.trvTt);
        tbody.append('<tr>' +
        	    '<td>' +
                '<div class="d-flex">' +
                    '<form action="">' +
                        '<div style="height: 300px; width: 860px; border-radius: 20px; background-color: #fdf7f7;">' +
                            '<div class="row d-flex w-100 h-100">' +
                                '<div class="col-3" style="text-align: center;">' +
                                    '<img class="p-3" src="' + travel.trvImg1 + '" style="width: 240px; height: 300px; object-fit: cover; border-radius: 25px;" alt="">' +
                                '</div>' +
                                '<div class="col-9" style="width: 55%; height: 95%; padding: 0; margin-left: 80px; margin-top: 30px;">' +
                                    '<div class="d-flex flex-column">' +
                                        '<h4 style="font-weight: bold; font-size: 30px; font-family: LeeSeoyun;">' +
                                            '<span style="font-size: 28px;">[' + travel.trvPlc + ']</span>' + travel.trvTt +
                                        '</h4>' +
                                        '<div class="dropdown position-absolute" style="left: 72%;">' +
                                            '<button class="btn" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 20px; appearance: none; -webkit-appearance: none;">&#8942;</button>' +
                                            '<ul class="dropdown-menu compact-menu">' +
                                                '<li><a class="dropdown-item edit-travel" href="#" data-trv-id="' + travel.trvId + '">수정</a></li>' +
                                                '<li><a class="dropdown-item delete-travel" href="#" data-trv-id="' + travel.trvId + '">삭제</a></li>' +
                                            '</ul>' +
                                        '</div>' +
                                        '<div class="d-flex align-items-center" style="font-size: 18px;">' +
                                            '<img src="resources/assets/img/board_map.png" width="22px" alt="">' +
                                            '<p class="ms-2" style="color: #6a6a6a;">' + travel.trvPc + '</p>' +
                                        '</div>' +
                                        '<div class="d-flex align-items-center" style="font-size: 18px;">' +
                                            '<img src="resources/assets/img/date.png" width="23px" alt="">' +
                                            '<p class="ms-2" style="color: #6a6a6a;">' + travel.trvDt + '</p>' +
                                        '</div>' +
                                    '</div>' +
                                    '<div class="d-inline-block" style="margin-top: 35px; height: 105px; width: 500px; border-radius: 10px;">' +
                                        '<div class="content mt-4" style="width: 90%; font-size: 18px; margin: 0 auto; margin-left: 0px;">' + travel.trvCt + '</div>' +
                                    '</div>' +
                                '</div>' +
                            '</div>' +
                        '</div>' +
                    '</form>' +
                '</div>' +
            '</td>' +
        '</tr>');
    });
    
    // Reattach event handlers
    $('.edit-travel').click(function(e) {
        e.preventDefault();
        const trvId = $(this).data('trv-id');
        editTravel(trvId);
    });
    
    $('.delete-travel').click(function(e) {
        e.preventDefault();
        const trvId = $(this).data('trv-id');
        if (confirm('정말 삭제하시겠습니까?')) {
            deleteTravel(trvId);
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
            }
        });
    }

    // Clear existing photos and preview
    var photoPreview = $('#photoPreview');
    photoPreview.empty();

    // Add clear button if images exist
     if (data.trvImg1 || data.trvImg2 || data.trvImg3) {
        if ($('#clearPhotosBtn').length === 0) {
            var clearBtn = $('<button>')
                .attr('id', 'clearPhotosBtn')
                .addClass('btn btn-danger btn-sm mb-2')
                .text('지우기');
            
            clearBtn.on('click', function(e) {
                e.preventDefault();
                $('#trvImgUpload').val('');
                $('#photoPreview').empty();
                $(this).remove();
            });
            
            // Add button after the label in a div wrapper
            var labelDiv = $('<div>').addClass('d-flex align-items-center gap-2');
            $('#photoDiv label').wrap(labelDiv);
            $('#photoDiv label').after(clearBtn);
        }
    }  

    // Display existing images with new preview style
    if (data.trvImg1) {
        var imgWrap = $('<div class="img-wrap"></div>');
        var img = $('<img>').attr('src', data.trvImg1).addClass('img-thumbnail');
        imgWrap.append(img);
        photoPreview.append(imgWrap);
    }
    if (data.trvImg2) {
        var imgWrap = $('<div class="img-wrap"></div>');
        var img = $('<img>').attr('src', data.trvImg2).addClass('img-thumbnail');
        imgWrap.append(img);
        photoPreview.append(imgWrap);
    }
    if (data.trvImg3) {
        var imgWrap = $('<div class="img-wrap"></div>');
        var img = $('<img>').attr('src', data.trvImg3).addClass('img-thumbnail');
        imgWrap.append(img);
        photoPreview.append(imgWrap);
    }

    $('#photoDiv').show();
    
    $('#travelAddForm').attr('action', '/travelUpdate');
    $('input[name="trvId"]').remove();
    $('<input>').attr({
        type: 'hidden',
        name: 'trvId',
        value: currentTrvId
    }).appendTo('#travelAddForm');
}

function addImagePreview(imgSrc, container, index, isExisting) {
    var imgWrap = $('<div class="img-wrap"></div>');
    if (isExisting) {
        imgWrap.attr({
            'data-existing': 'true',
            'data-index': index
        });
    }
    
    var img = $('<img>').attr('src', imgSrc).addClass('img-thumbnail');
    
    // Add remove button for existing images
    var removeBtn = $('<button type="button" class="remove-img">&times;</button>')
        .css({
            'position': 'absolute',
            'top': '5px',
            'right': '5px',
            'background': 'rgba(255, 0, 0, 0.7)',
            'color': 'white',
            'border': 'none',
            'border-radius': '50%',
            'width': '20px',
            'height': '20px',
            'line-height': '1',
            'cursor': 'pointer'
        });
    
    imgWrap.append(img, removeBtn);
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