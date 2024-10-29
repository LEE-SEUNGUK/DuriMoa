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
	transition: background-color 0.3s;
	z-index: 1000;
	border: none;
}

.writing-button:hover {
	background-color: #a7cfa1;
}

/* 작성 폼 */
.travel-form {
	background-color: #f8f9fa;
	padding: 20px;
	border-radius: 10px;
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

#boardAddForm {
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
	margin-top: 20%;
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

#singleDayTrip:checked+label::before {
	background-color: #c4ddc0;
	color: #000000;
	outline: none;
	border-color: transparent;
}

#boardModal {
	max-width: 650px !important;
}

.boardCard{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/inc/header.jsp"></jsp:include>
	<div class="container" style="padding: 0 !important;">
		<div class="row">
			<div class="d-flex board-header justify-content-between" style="margin-top: 6%;">
				<div>
					<h2>포토존</h2>
					<p>다른 커플들의 사진을 보고 다음 여행지를 정해보세요!</p>
				</div>
				<div id="writeButton" class="writing-button" data-bs-toggle="modal" data-bs-target="#boardWrite">
					<i class="fa-regular fa-pen-to-square"></i>
				</div>
			</div>
			<div id="boardListContainer">
				<table class="table" style="margin-top: 2% !important; margin: 0 auto; border-bottom: #ffffff;">
	            <tbody>
			    <c:forEach items="${boardList}" var="board" varStatus="status">
			        <c:if test="${status.index % 2 == 0}">
			            <tr>
			        </c:if>
			        <td class="ms-5">
			            <div style="width: 95%; margin: 0 auto">
			                <div onclick="location.href='<c:url value='/getBoard?brdId=${board.brdId}'/>'" style="height: 260px; border-radius: 20px; background-color: rgb(248, 248, 248); width: 100%; margin: auto 0" class="d-flex align-items-center">
			                    <div class="row d-flex align-items-center" style="width: 100%;">
			                        <div class="col-5" style="text-align: center;">
			                            <img src="${board.brdImg1}" style="width: 180px; height: 225px; object-fit: cover; border-radius: 10px;" alt="">
			                        </div>
			                        <div class="col-7" style="padding: 0;">
			                            <div>
			                                <div class="d-flex justify-content-between align-items-center">
			                                    <h4 style="margin: 0px; font-weight: bold;">
			                                    <span>[${board.trvPlc}]</span> ${board.brdTt}</h4>
			                                </div>
			                                <div class="mt-2 d-flex align-items-center">
			                                    <img src="resources/assets/img/board_map.png"  width="7%" alt="">
			                                    <p class="ms-2">${board.trvPc}</p>
			                                </div>
			                            </div>
			                            <div class="me-5 d-flex flex-column align-items-end" style="color: rgb(107, 107, 107); margin-top: 80px;">
			                                <i class="fa-regular fa-heart" style="font-size: 20px"></i>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </td>
			        <c:if test="${status.index % 2 == 1 || status.last}">
			        </c:if>
			    </c:forEach>
			</tbody>
	        </table>
        </div>
			<div id="boardAddForm" class="container mt-4" style="display: none;">
				<div class="d-flex justify-content-between mb-4">
	                <button type="button" class="btn btn-secondary" id="backToList">목록으로 돌아가기</button>
	            </div>
				<form class="d-flex justify-content-center" action="">
					<section class="col-6">
						<div class="travel-form">
							<div class="mb-3">
								<label for="travelTitle" class="form-label">제목</label> <input name="brdTt" type="text" class="form-control" id="travelTitle" required>
							</div>
							<div class="mb-3">
								<label for="travelDestination" class="form-label">장소</label> <input type="text" class="form-control" id="travelDestination" required>
							</div>
							<div class="mb-3">
								<label for="travelContent" class="form-label">내용</label>
								<textarea name="brdCt" class="form-control" id="travelContent" rows="3"></textarea>
							</div>
							<div class="mb-3">
								<label for="travelContent" class="form-label">해시태그</label>
								<input type="text" id="travelTag">
							</div>
							<input type="hidden" name="memId" value="${sessionScope.login.memId}">
							<input type="hidden" name="trvId" value="">							
							<button type="submit" class="btn travelBtn">등록하기</button>
						</div>
					</section>
					<section class="ms-4 col-4 d-flex flex-column align-items-center">
						<div id="map"></div>
						<input type="hidden" id="coordinateX">
            			<input type="hidden" id="coordinateY">
						<div class="mt-3" id="photoDiv">
							<label for="travelPhotos" class="form-label">사진(최대 3장)</label> 
							<input type="file" id="trvImgUpload" name="brdImgs" class="form-control" multiple accept="image/*">
							<div id="photoPreview" class="d-flex justify-content-start align-items-center mt-3"></div>
						</div>
					</section>
				</form>
			</div>
		</div>
	</div>

	<!-- Modal -->
<div class="modal fade" id="boardWrite" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" id="boardModal">
		<div class="modal-content">
			<div class="modal-header">
				<input class="form-control w-75" id="searchKeyword" type="text" placeholder="검색어를 입력하세요." style="margin: 0 auto;">
			</div>
			<div class="modal-body">
				<table class="w-100">
					<tbody id="travelList">
						<c:forEach items="${travelList}" var="travel">
							<tr class="travel-item" data-title="${travel.trvTt}" data-id="${travel.trvId}" 
							data-place="${travel.trvPc}" data-x="${travel.trvX}" data-y="${travel.trvY}">
								<td class="d-flex">
									<div class="col-5">
										<img class="p-2" alt="" src="${travel.trvImg1}" width='240px' height='300px'>
									</div>
									<div class="col-7 d-flex flex-column justify-content-center">
										<h5>제목: ${travel.trvTt}</h5>
										<h5>장소: ${travel.trvPc}</h5>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	initializeMap();
	
	
    // 검색창에서 엔터키를 눌렀을 때만 검색 실행
    $('#searchKeyword').on('keypress', function(e) {
        if (e.keyCode === 13) {  // Enter 키 감지
            const keyword = $(this).val().toLowerCase(); // 입력한 검색어를 소문자로 변환

            // 각 항목을 순회하면서 제목 또는 장소가 검색어를 포함하는지 확인
            $('.travel-item').each(function() {
                const title = $(this).data('title').toLowerCase();
                const place = $(this).data('place').toLowerCase();

                // 검색어가 제목이나 장소에 포함되어 있으면 표시, 아니면 숨기기
                if (title.includes(keyword) || place.includes(keyword)) {
                    $(this).show(); // 일치하는 항목 표시
                } else {
                    $(this).hide(); // 일치하지 않는 항목 숨기기
                }
            });
        }
    });
    
 // Add click handler for travel items
    $('.travel-item').on('click', function() {
        // Get data from the clicked item
        const data = {
        	trvId: $(this).data('id'),
            trvTt: $(this).data('title'),
            trvPc: $(this).data('place'),
            trvX: $(this).data('x'),
            trvY: $(this).data('y')
        };
        
        // Close the modal
        $('#boardWrite').modal('hide');
        
		// Hide the board list and show the form
        $('#boardListContainer').hide();
        $('#boardAddForm').show();
        
        // Display location on map
        geocoder.addressSearch(data.trvPc, function(results, status) {
            if (status === kakao.maps.services.Status.OK) {
                var result = results[0];
                var coords = new kakao.maps.LatLng(result.y, result.x);
                $('#map').show();
                map.relayout();
                map.setCenter(coords);
                marker.setPosition(coords);
            }
        });
        
        // Fill the form with selected data
        $('input[name="trvId"]').val(data.trvId);
        $('#travelTitle').val(data.trvTt);
        $('#travelDestination').val(data.trvPc);
        
        // Scroll to top of form
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });

    // Make travel items appear clickable
    $('.travel-item').css('cursor', 'pointer');
    
    // Add hover effect for better UX
    $('.travel-item').hover(
        function() {
            $(this).css('background-color', '#f8f9fa');
        },
        function() {
            $(this).css('background-color', '');
        }
    );
    
 	// Add back button handler
    $('#backToList').click(function() {
        $('#boardAddForm').hide();
        $('#boardListContainer').show();
        // Clear form inputs if needed
        $('#boardAddForm form')[0].reset();
        $('#photoPreview').empty();
        $('#map').hide();
    });
    
	// 이미지 추가    
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
	
	// 보드 저장
    $('#boardAddForm').submit(function(e) {
        e.preventDefault();
        
        if(!$('#travelTitle').val()){
        	alert("제목을 입력하세요.");
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
        if (!hasNewImages) {
            alert("사진은 최소 1장 이상 선택해야 합니다.");
            return;
        }
        
        if (!hasNewImages && existingImagesCount === 0) {
            alert("사진은 최소 1장 이상 선택해야 합니다.");
            return;
        }
        
        var formData = new FormData(e.target);
        var files = $('#trvImgUpload')[0].files;

        if (files && files.length > 0) {
            formData.delete('brdImgs');
            
            if (files.length === 1) {
                formData.append('brdImgs', files[0]);
            } else if (clickOrder.length > 0) {
                clickOrder.forEach((index, orderIndex) => {
                    formData.append('brdImgs', files[index]);
                });
            } else {
                for (var i = 0; i < files.length; i++) {
                    formData.append('brdImgs', files[i]);
                }
            }
        }

        $.ajax({
            url: "/boardAdd",
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                alert('여행 기록이 성공적으로 저장되었습니다!');
                location.reload();
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                alert('여행 기록 저장 중 오류가 발생했습니다.');
            }
        });
    });
});

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

// 인덱스 업데이트
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

</script>
</body>
</html>