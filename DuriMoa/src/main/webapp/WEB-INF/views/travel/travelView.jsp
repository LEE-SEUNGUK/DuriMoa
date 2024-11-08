<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두리모아</title>
<style>
td {
	padding-left: 0px !important;
	padding-right: 0px !important;
}

.writing-button {
	position: fixed;
	bottom: 15%;
	right: 12%;
	width: 60px;
	height: 60px;
	background-color: #c4ddc0;
	border-radius: 50%;
	color: black;
	font-size: 24px;
	cursor: pointer;
	transition: all 0.3s;
	z-index: 1000;
	border: none;
}

.writing-button:hover {
	background-color: #a7cfa1;
	transform: scale(1.05);
}

.writing-button.close-mode {
	background-color: #ff6b6b;
}

.writing-button.close-mode:hover {
	background-color: #ff5252;
	transform: scale(1.05);
}

.writing-button i {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 100%;
	transition: all 0.3s;
}

.writing-button.close-mode i {
	transform: rotate(45deg);
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

#travelAddForm {
	max-height: 1300px; /* Adjust this value as needed */
	margin: 0 auto;
}

#travelTitle, #travelDestination, #travelDate {
	height: 38px;
	border: none;
	outline: 1px solid #8989896c;
	box-shadow: none !important;
}

#travelDestination {
	cursor: pointer;
}

#travelTitle:hover {
	outline: 1px solid #0000009e;
	transition: outline 0.5s;
}

#travelDestination:hover {
	outline: 1px solid #0000009e;
	transition: outline 0.5s;
}

#travelDate:hover {
	outline: 1px solid #0000009e;
	transition: outline 0.5s;
}

#travelTitle:focus {
	transition: all 0.01s;
	outline: 2px solid #0000009e !important;
}

#travelDestination:focus {
	transition: all 0.01s;
	outline: 2px solid #0000009e !important;
}

#travelDate:focus {
	transition: all 0.01s;
	outline: 2px solid #0000009e !important;
}

#trvImgUpload:focus {
	box-shadow: none !important;
	border: 1px solid #8989896c;
}

#trvImgUpload:active {
	box-shadow: none !important;
	border: 1px solid #8989896c;
}

#travelContent {
	height: 180px;
	border: none;
	outline: 1px solid #8989896c;
	box-shadow: none !important;
}

#travelContent:hover {
	outline: 1px solid #0000009e;
	transition: outline 0.5s;
}

#travelContent:focus {
	transition: all 0.01s;
	outline: 2px solid #0000009e !important;
}

#searchAddress {
	background: #c4ddc0;
	border: none;
	outline: 1px solid #8989896c;
	color: black;
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

.speech-bubb {
	width: 14%;
	left: 76%;
	margin-top: 18%;
	position: relative;
	background: #c4ddc0;
	border-radius: .4em;
}

.travelBtn {
	background-color: #c4ddc0 !important;
	height: 38px !important;
	color: black !important;
	border: none !important;
	opacity: 0.9;
}

.travelBtn:hover {
	opacity: 1.0;
	transition: 0.5s;
}

.speech-bubb:after {
	content: '';
	position: absolute;
	bottom: 0;
	left: 60%;
	width: 0;
	height: 0;
	border: 39px solid transparent;
	border-top-color: #c4ddc0;
	border-bottom: 0;
	border-right: 0;
	margin-left: -12px;
	margin-bottom: -24px;
}

#searchAddress {
	opacity: 0.9;
}

#searchAddress:hover {
	opacity: 1.0;
	transition: 0.5s;
}

#singleDayTrip {
	display: none;
}

#trvOp {
	display: none;
}

#singleDayTrip ~label:before {
	/* display: inline-block; */
	content: "✔";
	display: inline-block;
	vertical-align: middle;
	text-align: center;
	width: 18px;
	height: 18px;
	line-height: 18px;
	border-radius: 5px;
	border: 1px solid #ccc;
	color: transparent;
	transition: 0.2s;
	font-size: 14px !important;
	margin-right: 8px;
	margin-bottom: 2px;
}

#trvOp ~label:before {
	/* display: inline-block; */
	content: "✔";
	display: inline-block;
	vertical-align: middle;
	text-align: center;
	width: 18px;
	height: 18px;
	line-height: 18px;
	border-radius: 5px;
	border: 1px solid #ccc;
	color: transparent;
	transition: 0.2s;
	font-size: 14px !important;
	margin-right: 8px;
	margin-bottom: 2px;
}

#singleDayTrip:checked+label::before {
	background-color: #c4ddc0;
	color: #000000;
	outline: none;
	border-color: transparent;
}

#trvOp:checked+label::before {
	background-color: #c4ddc0;
	color: #000000;
	outline: none;
	border-color: transparent;
}

label:hover::before, #singleDayTrip:hover+label::before {
	border-color: #0000006c;
	transition: all 0.3s;
}

label:hover::before, #trvOp:hover+label::before {
	border-color: #0000006c;
	transition: all 0.3s;
}

.dropdown-item:hover{
	background-color: #f8f9fa !important;
}

.dropdown-item:active{
	background-color: #f8f9fa !important;
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
			</section>
			<section class="col-9" style="margin-top: 4%; margin-left: 100px" id="viewMode">
				<table class="table" style="margin-top: 2% !important; margin: 0 auto; border-bottom: #ffffff;">
					<tbody>
						<c:forEach items="${travelList}" var="travel">
							<tr>
								<td>
									<div class="d-flex">
										<form action="">
											<div style="height: 300px; width: 860px; border-radius: 20px; background-color: #f8f9fa;">
												<div class="row d-flex w-100 h-100">
													<div class="col-3" style="text-align: center;">
														<img class="p-3" src="${travel.trvImg1 }" style="width: 240px; height: 300px; object-fit: cover; border-radius: 25px;" alt="">
													</div>
													<div class="col-9" style="width: 55%; height: 95%; padding: 0; margin-left: 80px; margin-top: 30px;">
														<div class="d-flex flex-column ">
															<h4 style="font-weight: bold; font-size: 30px; font-family: LeeSeoyun; position: relative;">
																<span style="font-size: 28px;">[${travel.trvPlc }]</span>${travel.trvTt } <span class="dropdown" style="position: absolute; right: -20px; top: 0;">
																	<button class="btn" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 20px; appearance: none; -webkit-appearance: none;">&#8942;</button>
																	<ul class="dropdown-menu compact-menu">
																		<li><a class="dropdown-item edit-travel" href="#" data-trv-id="${travel.trvId}">수정</a></li>
																		<li><a class="dropdown-item delete-travel" href="#" data-trv-id="${travel.trvId}">삭제</a></li>
																	</ul>
																</span>
															</h4>

															<div class="d-flex align-items-center" style="font-size: 18px;">
																<img src="resources/assets/img/board_map.png" width="22px" alt="">
																<p class="ms-2" style="color: #6a6a6a;">${travel.trvPc }</p>
															</div>
															<div class="d-flex align-items-center" style="font-size: 18px;">
																<img src="resources/assets/img/date.png" width="23px" alt="">
																<c:if test="${travel.trvSdt == travel.trvEdt}">
																	<p class="ms-2" style="color: #6a6a6a;">${travel.trvSdt }</p>
																</c:if>
																<c:if test="${travel.trvSdt != travel.trvEdt}">
																	<p class="ms-2" style="color: #6a6a6a;">${travel.trvSdt }</p>
																	<p class="ms-1">~</p>
																	<p class="ms-1" style="color: #6a6a6a;">${travel.trvEdt }</p>
																</c:if>
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
								<div class="pt-3" style="width: 90%; margin: 0 auto;">
									<div class="mb-3">
										<label for="travelTitle" class="form-label">제목</label> <input type="text" name="trvTt" class="form-control" id="travelTitle" placeholder="여행 제목을 입력하세요">
									</div>
									<div class="mb-3">
										<label for="travelDestination" class="form-label">장소</label>
										<div class="input-group">
											<input type="text" name="trvPc" class="form-control" id="travelDestination" placeholder="여행지를 검색하세요" readonly>
											<button class="btn btn-outline-secondary" type="button" id="searchAddress" style="margin-left: 1px">검색</button>
										</div>
									</div>
									<input type="hidden" id="coordinateX" name="trvX"> <input type="hidden" id="coordinateY" name="trvY">
									<div class="mb-3">
										<label for="travelDate" class="form-label">날짜</label> <input type="text" name="trvDt" class="form-control" id="travelDate" placeholder="여행 날짜를 선택하세요">
										<div class="form-check mt-2" style="padding-left: 0px">
											<input class="form-check-input" type="checkbox" id="singleDayTrip" checked> <label class="form-check-label" for="singleDayTrip"> 당일 여행 </label>
										</div>
									</div>
									<div class="mb-3">
										<label for="travelContent" class="form-label">내용</label>
										<textarea class="form-control" name="trvCt" id="travelContent" rows="6" placeholder="내용을 입력하세요" style="resize: none;"></textarea>
									</div>
									<div class="mb-3 form-check d-flex justify-content-between" style="padding-left: 0px">
										<input type="hidden" name="memId" value="${sessionScope.login.memId}">
										<button type="submit" class="btn travelBtn">저장하기</button>
									</div>
								</div>
							</div>
						</section>
						<section class="col-5 ms-4 mb-5 d-flex flex-column align-items-center">
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
	<c:if test="${empty travelList}">
		<div class="speech-bubb" id="speechBubble">
			<h5 class="p-3">버튼을 클릭하여 여행 기록을 작성해보세요!</h5>
		</div>
	</c:if>
	<div id="writeButton" class="writing-button">
		<i class="fa-regular fa-pen-to-square" style="padding-left: 3px; padding-bottom: 3px;"></i>
	</div>

	<script>
$(document).ready(function() {
    initializeMap();
    
    $('#travelDestination').click(function(){
    	$('#searchAddress').click();
    })
    
    $('#travelDate').daterangepicker({
    	singleDatePicker: true, // Start with single date picker
        autoApply: true,
        showDropdowns: true,
        locale: {
            format: 'YYYY-MM-DD',
            separator: ' ~ ',
            daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        },
        showCustomRangeLabel: false,
        linkedCalendars: false, 
        startDate: moment()
    });
    
 // 체크박스 변경 이벤트
    $('#singleDayTrip').change(function() {
        let isSingleDay = $(this).is(':checked');
        let picker = $('#travelDate').data('daterangepicker');

        if (isSingleDay) {
            // 당일 여행 모드일 때
            picker.setStartDate(moment());  // 오늘 날짜로 설정
            picker.setEndDate(moment());    // 오늘 날짜로 종료일 설정
            picker.singleDatePicker = true; // 단일 날짜 선택 모드
        } else {
            picker.singleDatePicker = false;
        }

        // 기존 달력 다시 보여주기
        picker.updateView();
        picker.showCalendars();
    });

    
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
        
        if(!$('#travelTitle').val()){
        	alert("제목을 입력하세요.");
        	return;
        }
        
        if(!$('#travelDestination').val()){
        	alert("장소를 입력하세요.");
        	return;
        }
        
        if(!$('#travelDate').val()){
        	alert("날짜를 선택하세요.");
        	return;
        }
        
        if(!$('#travelContent').val()){
        	alert("내용을 입력하세요.");
        	return;
        }
        
     	// New image validation logic
        var hasNewImages = $('#trvImgUpload').val() !== '';
        var existingImagesCount = $('#photoPreview .img-wrap[data-existing="true"]').length;
        
        // Only check for new images if there are no existing images
        if (!isEditMode && !hasNewImages) {
            alert("사진은 최소 1장 이상 선택해야 합니다.");
            return;
        }
        
        if (isEditMode && !hasNewImages && existingImagesCount === 0) {
            alert("사진은 최소 1장 이상 선택해야 합니다.");
            return;
        }
        
        var formData = new FormData(this);
        var files = $('#trvImgUpload')[0].files;
        var dateValue = $('#travelDate').val();
        
        if (!$('#singleDayTrip').is(':checked') && dateValue.includes('~')) {
            var dates = dateValue.split('~').map(date => date.trim());
            formData.set('trvSdt', dates[0]);
            formData.set('trvEdt', dates[1]);
        } else {
            // Single date
            formData.set('trvSdt', dateValue);
            formData.set('trvEdt', dateValue);
        }
        
        // If we're in edit mode and no new files were selected, preserve existing images
        if (isEditMode) {
            if (!files || files.length === 0) {
                formData.append('preserveImages', 'true');
                formData.delete('trvImgs'); // Remove any empty file input data
            } else {
                // Remove existing files
                formData.delete('trvImgs');
                
                // Handle new files
                if (files.length === 1) {
                    formData.append('trvImgs', files[0]);
                } else if (clickOrder.length > 0) {
                    clickOrder.forEach((index, orderIndex) => {
                        formData.append('trvImgs', files[index]);
                    });
                } else {
                    for (var i = 0; i < files.length; i++) {
                        formData.append('trvImgs', files[i]);
                    }
                }
            }
        } else {
            // Handle new travel creation
            if (files && files.length > 0) {
                formData.delete('trvImgs');
                if (files.length === 1) {
                    formData.append('trvImgs', files[0]);
                } else if (clickOrder.length > 0) {
                    clickOrder.forEach((index, orderIndex) => {
                        formData.append('trvImgs', files[index]);
                    });
                } else {
                    for (var i = 0; i < files.length; i++) {
                        formData.append('trvImgs', files[i]);
                    }
                }
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
        imageSize = new kakao.maps.Size(70, 53),
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
    $('#speechBubble').hide(); // Hide speech bubble when toggling modes

    const writeButton = $('#writeButton');
    const buttonIcon = writeButton.find('i');

    if ($('#writeMode').is(':visible')) {
        buttonIcon
            .removeClass('fa-pen-to-square')
            .addClass('pt-1 fa-plus');
        writeButton
            .addClass('close-mode')
            .removeAttr('data-bs-toggle data-bs-target');
    } else {
        buttonIcon
            .removeClass('fa-plus')
            .addClass('fa-pen-to-square');
        writeButton
            .removeClass('close-mode')
            .attr({
                'data-bs-toggle': 'modal',
                'data-bs-target': '#boardWrite'
            });
        
        // Clear form when closing
        clearForm();
        
        // Show speech bubble again only if there are no travel records
        if ($('.table tbody tr').length === 0) {
            $('#speechBubble').show();
        }
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
    	let dateHtml = '';
    	if (travel.trvSdt === travel.trvEdt) {
    	    dateHtml = '<p class="ms-2" style="color: #6a6a6a;">' + travel.trvSdt + '</p>';
    	} else {
    	    dateHtml = '<p class="ms-2" style="color: #6a6a6a;">' + travel.trvSdt + '</p>' +
    	               '<p class="ms-1">~</p>' +
    	               '<p class="ms-1" style="color: #6a6a6a;">' + travel.trvEdt + '</p>';
    	}
    	
    	console.log(travels);
    	console.log(travel.trvTt);
    	tbody.append('<tr>' +
    		    '<td>' +
    		        '<div class="d-flex">' +
    		            '<form action="">' +
    		                '<div style="height: 300px; width: 860px; border-radius: 20px; background-color: #f8f9fa;">' +
    		                    '<div class="row d-flex w-100 h-100">' +
    		                        '<div class="col-3" style="text-align: center;">' +
    		                            '<img class="p-3" src="' + travel.trvImg1 + '" style="width: 240px; height: 300px; object-fit: cover; border-radius: 25px;" alt="">' +
    		                        '</div>' +
    		                        '<div class="col-9" style="width: 55%; height: 95%; padding: 0; margin-left: 80px; margin-top: 30px;">' +
    		                            '<div class="d-flex flex-column">' +
    		                            '<h4 style="font-weight: bold; font-size: 30px; font-family: LeeSeoyun; position: relative;">' +
    		                            '<span style="font-size: 28px;">[' + travel.trvPlc + ']</span>' + travel.trvTt +
    		                            '<span class="dropdown" style="position: absolute; right: -20px; top: 0;">' +
    		                            '<button class="btn" type="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 20px; appearance: none; -webkit-appearance: none;">⋮</button>' +
    		                            '<ul class="dropdown-menu compact-menu">' +
    		                            '<li><a class="dropdown-item edit-travel" href="#" data-trv-id="' + travel.trvId + '">수정</a></li>' +
    		                            '<li><a class="dropdown-item delete-travel" href="#" data-trv-id="' + travel.trvId + '">삭제</a></li>' +
    		                            '</ul>' +
    		                            '</span>' +
    		                            '</h4>' +
    		                                '<div class="d-flex align-items-center" style="font-size: 18px;">' +
    		                                    '<img src="resources/assets/img/board_map.png" width="22px" alt="">' +
    		                                    '<p class="ms-2" style="color: #6a6a6a;">' + travel.trvPc + '</p>' +
    		                                '</div>' +
    		                                '<div class="d-flex align-items-center" style="font-size: 18px;">' +
    		                                    '<img src="resources/assets/img/date.png" width="23px" alt="">' +
    		                                    ((travel.trvSdt == travel.trvEdt) ? 
    		                                        '<p class="ms-2" style="color: #6a6a6a;">' + travel.trvSdt + '</p>' :
    		                                        '<p class="ms-2" style="color: #6a6a6a;">' + travel.trvSdt + '</p>' +
    		                                        '<p class="ms-1">~</p>' +
    		                                        '<p class="ms-1" style="color: #6a6a6a;">' + travel.trvEdt + '</p>') +
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
    
    if (data.trvSdt && data.trvEdt) {
        if (data.trvSdt === data.trvEdt) {
            // Single day trip
            $('#singleDayTrip').prop('checked', true);
            $('#travelDate').data('daterangepicker').singleDatePicker = true;
            $('#travelDate').val(data.trvSdt);
        } else {
            // Multi-day trip
            $('#singleDayTrip').prop('checked', false);
            $('#travelDate').data('daterangepicker').singleDatePicker = false;
            $('#travelDate').val(data.trvSdt + ' ~ ' + data.trvEdt);
        }
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

     if (data.trvImg1) {
         var imgWrap = $('<div class="img-wrap" data-existing="true" data-index="1"></div>');
         var img = $('<img>').attr('src', data.trvImg1).addClass('img-thumbnail');
         imgWrap.append(img);
         photoPreview.append(imgWrap);
     }
     if (data.trvImg2) {
         var imgWrap = $('<div class="img-wrap" data-existing="true" data-index="2"></div>');
         var img = $('<img>').attr('src', data.trvImg2).addClass('img-thumbnail');
         imgWrap.append(img);
         photoPreview.append(imgWrap);
     }
     if (data.trvImg3) {
         var imgWrap = $('<div class="img-wrap" data-existing="true" data-index="3"></div>');
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