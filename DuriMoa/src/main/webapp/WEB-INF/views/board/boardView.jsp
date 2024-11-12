<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두리모아</title>
<style>
.writing-button.close-mode {
	background-color: #ff6b6b;
}

.writing-button.close-mode:hover {
	background-color: #ff5252;
}

.writing-button i {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 100%;
	transition: transform 0.3s ease;
}

.writing-button.close-mode i {
	transform: rotate(45deg);
}

td {
	padding-left: 0px !important;
	padding-right: 0px !important;
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

.writing-button {
	position: fixed;
	bottom: 15%;
	right: 7%;
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

.dropdown-menu {
	min-width: 50px !important;
	/* Adjust this value as needed */
	width: auto;
	white-space: nowrap;
}

.dropdown-menu .dropdown-item {
	padding: 0.25rem 0.5rem;
	/* Reduce padding */
	font-size: 16px;
	/* Reduce font size if needed */
}

#searchAddress {
	opacity: 0.9;
}

#searchAddress:hover {
	opacity: 1.0;
	transition: 0.5s;
}

#boardModal {
	max-width: 650px !important;
}

.boardCard {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/inc/header.jsp"></jsp:include>
	<div style="padding: 0 !important; width: 1420px; margin: 0 auto; position: relative;">
		<div id="writeButton" class="writing-button" data-bs-toggle="modal" data-bs-target="#boardWrite">
			<i class="fa-regular fa-pen-to-square"></i>
		</div>
		<div class="row">
			<div class="d-flex board-header justify-content-between p-0" style="position: relative; margin-top: 6%;">
				<div>
					<h2>포토존</h2>
					<p>다른 커플들의 사진을 보고 다음 여행지를 정해보세요!</p>
				</div>
				<div style="margin-top: 15px; margin-right: 30px;">
					<select class="h-50" id="postSelect">
						<option value="all">전체 게시글</option>
					    <option value="myPosts">내 게시글</option>
					    <option value="likedPosts">좋아요한 게시글</option>
					</select>
				</div>
			</div>
			<div id="boardListContainer" style="margin: 0 auto; padding: 0 !important">
				<table class="table" style="margin-top: 2% !important; margin: 0 auto; border-bottom: #ffffff;">
					<tbody>
						<c:forEach items="${boardList}" var="board" varStatus="status">
							<c:if test="${status.index % 2 == 0}">
								<tr>
							</c:if>
							<td class="ms-5" style="width: 50%;">
								<!-- Added fixed width -->
								<div style="width: 95%; margin: 0 auto">
									<div style="height: 260px; border-radius: 20px; background-color: rgb(248, 248, 248); width: 100%; margin: auto 0" class="d-flex align-items-center">
										<div class="row d-flex align-items-center" style="width: 100%;">
											<div class="col-5" style="text-align: center;">
												<img onclick="location.href='<c:url value='/getBoard?brdId=${board.brdId}'/>'" src="${board.brdImg1}" style="width: 180px; height: 225px; object-fit: cover; border-radius: 10px;" alt="">
											</div>
											<div class="col-7" style="padding: 0;">
												<div>
													<div class="d-flex justify-content-between align-items-center">
														<h4 class="brdTt" style="margin: 0px; font-weight: bold;">
															<span>[${board.trvPlc}]</span> ${board.brdTt}
														</h4>
														<c:if test="${sessionScope.login.memId == board.memId}">
															<div class="dropdown me-4 mb-2">
																<button class="btn" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 20px; appearance: none; -webkit-appearance: none;">&#8942;</button>
																<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
																	<li><a class="dropdown-item edit-board" href="#" data-brd-id="${board.brdId}">수정</a></li>
																	<li><a class="dropdown-item delete-board" href="#" data-brd-id="${board.brdId}">삭제</a></li>
																</ul>
															</div>
														</c:if>
														<c:if test="${sessionScope.login.memId != board.memId}">
															<div class="mb-2" style="font-size: 20px; padding: 6px 12px; height: 44px">
																<button class="btn" style="visibility: hidden; border: none; background: transparent;">&#8942;</button>
															</div>
														</c:if>
													</div>
													<div class="mt-2 d-flex align-items-center">
														<img src="resources/assets/img/board_map.png" width="7%" alt="">
														<p class="trvPc ms-2">${board.trvPc}</p>
													</div>
												</div>
												<div class="me-5 d-flex flex-column align-items-end" style="color: rgb(107, 107, 107); margin-top: 80px;">
													<div class="d-flex align-items-center">
														<c:choose>
															<c:when test="${board.likeYn eq 'Y'}">
																<i class="fa-solid fa-heart" style="font-size: 20px; color: #ff6b81"></i>
															</c:when>
															<c:when test="${board.likeYn eq 'N'}">
																<i class="fa-regular fa-heart" style="font-size: 20px"></i>
															</c:when>
														</c:choose>
														<span class="ms-2">${board.cnt}</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</td>
							<c:if test="${status.index % 2 == 1 || status.last}">
								<c:if test="${status.last && status.index % 2 == 0}">
									<!-- Add empty td to maintain layout when odd number of items -->
									<td style="width: 50%;"></td>
								</c:if>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="boardAddForm" class="container mt-4" style="display: none;">
				<form class="d-flex justify-content-center" action="" style="width: 90%; margin: 0 auto;">
					<section class="col-6">
						<div class="travel-form">
							<div class="mb-3">
								<label for="travelTitle" class="form-label">제목</label> <input name="brdTt" type="text" class="form-control" id="travelTitle" required>
							</div>
							<div class="mb-3">
								<label for="travelDestination" class="form-label">장소</label> <input type="text" class="form-control" id="travelDestination" readonly="readonly">
							</div>
							<div class="mb-3">
								<label for="travelContent" class="form-label">내용</label>
								<textarea name="brdCt" class="form-control" id="travelContent" rows="3" style="resize: none;"></textarea>
							</div>
							<input type="hidden" name="memId" value="${sessionScope.login.memId}"> <input type="hidden" id="trvId" name="trvId" value="">
							<div class="d-flex justify-content-end">
								<button type="submit" class="btn travelBtn">저장하기</button>
							</div>
						</div>
					</section>
					<section class="ms-4 col-4 d-flex flex-column align-items-center">
						<div id="map"></div>
						<input type="hidden" id="coordinateX"> <input type="hidden" id="coordinateY">
						<div class="mt-3" id="photoDiv">
							<label for="travelPhotos" class="form-label">사진(최대 3장)</label> <input type="file" id="trvImgUpload" name="brdImgs" class="form-control" multiple accept="image/*">
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
								<tr class="travel-item" data-title="${travel.trvTt}" data-id="${travel.trvId}" data-place="${travel.trvPc}" data-x="${travel.trvX}" data-y="${travel.trvY}">
									<td class="d-flex">
										<div class="col-5">
											<img class="p-2" alt="" src="${travel.trvImg1}" width='240px' height='300px' style="object-fit: cover;">
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
	window.onload = function() {
	    const selectedValue = sessionStorage.getItem("selectedValue") || "all";
	    document.getElementById("postSelect").value = selectedValue;
	    loadPostsBySelection(selectedValue);
	};
	
	initializeMap();
	
	 $('#postSelect').change(function() {
	        var selectedValue = $(this).val();
        	sessionStorage.setItem("selectedValue", selectedValue);

	        switch (selectedValue) {
	            case 'all':
	                // 전체 게시글을 불러오는 함수 호출
	                loadAllPosts();
	                break;
	            case 'myPosts':
	                // 내 게시글을 불러오는 함수 호출
	                loadMyPosts();
	                break;
	            case 'likedPosts':
	                // 좋아요한 게시글을 불러오는 함수 호출
	                loadLikedPosts();
	                break;
	            default:
	                break;
	        }
	    });
	
	$('#boardListContainer').on('click', '.delete-board', function(e) {
        e.preventDefault();
        const brdId = $(this).data('brd-id');
        if (confirm('정말 삭제하시겠습니까?')) {
            deleteBoard(brdId);
        }
    });
	
	$('#boardListContainer').on('click', '.edit-board', function(e) {
        e.preventDefault();
        const brdId = $(this).data('brd-id');
        editBoard(brdId);
    });
	
	 $('#marker_search').on('keypress', function(e) {
         if (e.keyCode === 13) {  // Enter key pressed
        	 e.preventDefault(); // Prevent form submission
             const keyWord = $('#marker_search').val().trim();
             performSearch(keyWord);
         }
     });
	 
	// Add handler for image removal
	 $(document).on('click', '.remove-img', function() {
	     const imgWrap = $(this).closest('.img-wrap');
	     if (imgWrap.attr('data-existing') === 'true') {
	         imgWrap.hide();  // Hide instead of remove for existing images
	     } else {
	         imgWrap.remove();
	     }
	     
	     if ($('#photoPreview .img-wrap:visible').length === 0) {
	         $('#trvImgUpload').val('');
	         clickOrder = [];
	     }
	 });
	 
	 
	// 검색창에서 엔터키를 눌렀을 때만 검색 실행 모달
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
        
        // Change write button to close button
        $('#writeButton').removeAttr('data-bs-toggle data-bs-target')
            .addClass('close-mode')
            .find('i')
            .removeClass('fa-pen-to-square')
            .addClass('pt-1 fa-plus');
        
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
 
    // Handle write/close button click
    $('#writeButton').on('click', function() {
        if ($(this).hasClass('close-mode')) {
            // Close mode - return to list
            $('#boardAddForm').hide();
            $('#boardListContainer').show();
            $('#boardAddForm form')[0].reset();
            $('#photoPreview').empty();
            $('#map').hide();
            
            // Reset button to write mode
            $(this)
                .removeClass('close-mode')
                .attr({
                    'data-bs-toggle': 'modal',
                    'data-bs-target': '#boardWrite'
                })
                .find('i')
                .removeClass('fa-plus')
                .addClass('fa-pen-to-square');
        }
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

    // Remove only new images, keep existing ones
    $('.img-wrap:not([data-existing="true"])').remove();
    
    // Add clear button if not exists
    if ($('#clearPhotosBtn').length === 0) {
        var clearBtn = $('<button>')
            .attr('id', 'clearPhotosBtn')
            .addClass('btn btn-danger btn-sm mb-2')
            .text('지우기')
            .on('click', function(e) {
                e.preventDefault();
                $('#trvImgUpload').val('');
                photoPreview.empty();
                clickOrder = [];
                $(this).remove();
            });
        
        var labelDiv = $('<div>').addClass('d-flex align-items-center gap-2');
        $('#photoDiv label').wrap(labelDiv);
        $('#photoDiv label').after(clearBtn);
    }

    // Create preview containers for new images
    for (var i = 0; i < files.length; i++) {
        var file = files[i];
        var reader = new FileReader();

        reader.onload = (function(theFile, index) {
            return function(e) {
                var imgWrap = $('<div class="img-wrap" data-index="' + index + '"></div>');
                var img = $('<img>').attr('src', e.target.result).addClass('img-thumbnail');
                
                // Add index label only for new images
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

                // Handle single new image case
                if (files.length === 1) {
                    clickOrder = [index];
                    indexLabel.text('1번째');
                } else {
                    indexLabel.text('클릭하세요');
                    imgWrap.on('click', function() {
                        var currentIndex = $(this).data('index');
                        var existingIndex = clickOrder.indexOf(currentIndex);
                        if (existingIndex !== -1) {
                            clickOrder.splice(existingIndex, 1);
                        }
                        clickOrder.push(currentIndex);
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
        
        const form = e.target;  // or this
        
        if(!$('#travelTitle').val()){
        	alert("제목을 입력하세요.");
        	return;
        }
        
        if(!$('#travelContent').val()){
        	alert("내용을 입력하세요.");
        	return;
        }
        
        const formData = new FormData($('#boardAddForm form')[0]); 

        const files = $('#trvImgUpload')[0].files;
        const isEdit = formData.has('brdId');
        
        // Image validation
        const hasNewImages = files.length > 0;
        const hasExistingImages = $('#photoPreview .img-wrap[data-existing="true"]:visible').length > 0;
        
        // Check if we have either new images or existing images
        if (!hasNewImages && !hasExistingImages) {
            alert("사진은 최소 1장 이상 선택해야 합니다.");
            return;
        }
        
        // Handle images for submission
        if (isEdit) {
            if (hasNewImages) {
                // Remove existing files and add new ones
                formData.delete('brdImgs');
                if (files.length === 1) {
                    formData.append('brdImgs', files[0]);
                } else if (clickOrder.length > 0) {
                    clickOrder.forEach((index) => {
                        formData.append('brdImgs', files[index]);
                    });
                } else {
                    for (let i = 0; i < files.length; i++) {
                        formData.append('brdImgs', files[i]);
                    }
                }
            } else {
                // Only keep existing images if they're still visible
                if (hasExistingImages) {
                    formData.append('preserveImages', 'true');
                } else {
                    alert("사진은 최소 1장 이상 선택해야 합니다.");
                    return;
                }
            }
        } else {
            // New board creation
            if (!hasNewImages) {
                alert("사진은 최소 1장 이상 선택해야 합니다.");
                return;
            }
            formData.delete('brdImgs');
            if (files.length === 1) {
                formData.append('brdImgs', files[0]);
            } else if (clickOrder.length > 0) {
                clickOrder.forEach((index) => {
                    formData.append('brdImgs', files[index]);
                });
            } else {
                for (let i = 0; i < files.length; i++) {
                    formData.append('brdImgs', files[i]);
                }
            }
        }

        $.ajax({
            url: isEdit ? '/boardUpdate' : '/boardAdd',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function(response) {
                alert(isEdit ? '게시글이 성공적으로 수정되었습니다!' : '게시글이 성공적으로 저장되었습니다!');

             // Reset form and return to list view
                $('#boardAddForm').hide();
                $('#boardListContainer').show();
                $('#boardAddForm form')[0].reset();
                $('#photoPreview').empty();
                $('#map').hide();
                
                // Reset write button
                $('#writeButton')
                    .removeClass('close-mode')
                    .attr({
                        'data-bs-toggle': 'modal',
                        'data-bs-target': '#boardWrite'
                    })
                    .find('i')
                    .removeClass('fa-plus')
                    .addClass('fa-pen-to-square');

                // Load appropriate posts based on current selection
                const selectedValue = $('#postSelect').val();
                loadPostsBySelection(selectedValue);
                
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                alert('게시물 저장 중 오류가 발생했습니다.');
            }
        });
    });
});
function loadAllPosts() {
    // AJAX 요청 또는 다른 로직을 추가하세요.
    console.log("전체 게시글 불러오기");
    console.log("전체 보기");
	$.ajax({
		url: '/showBoard',
		type: 'GET',
		success: function(res){
			console.log(res);
			$('#boardListContainer table tbody').empty();
            
			if (res && res.length > 0) {
			    let html = '';
			    for (let i = 0; i < res.length; i += 2) {
			        html += createBoardRow(res, i);
			    }
			    $('#boardListContainer table tbody').html(html);
			}
			
		},
		error: function(e){
			console.log(e);
		}
	})
}

function loadMyPosts() {
    // AJAX 요청 또는 다른 로직을 추가하세요.
    console.log("내 게시글 불러오기");
	let memId = '${sessionScope.login.memId}';
	
	$.ajax({
		url: '/myBoard',
		type: 'GET',
		data: {memId: memId},
		success: function(res){
			$('#boardListContainer table tbody').empty();
            
			if (res && res.length > 0) {
			    let html = '';
			    for (let i = 0; i < res.length; i += 2) {
			        html += createBoardRow(res, i);
			    }
			    $('#boardListContainer table tbody').html(html);
			} else {
                // Show no results message
                $('#boardListContainer table tbody').html(
                    '<tr><td colspan="2" class="text-center p-5">' +
                    '<h4>작성한 게시글이 없습니다.</h4></td></tr>'
                );
            }
			
		},
		error: function(e){
			console.log(e);
		}
	})
}

function loadLikedPosts() {
    // AJAX 요청 또는 다른 로직을 추가하세요.
    console.log("좋아요한 게시글 불러오기");
	let memId = '${sessionScope.login.memId}';
	
	$.ajax({
		url: '/likeBoard',
		type: 'GET',
		data: {memId: memId},
		success: function(res){
			$('#boardListContainer table tbody').empty();
            
			if (res && res.length > 0) {
			    let html = '';
			    for (let i = 0; i < res.length; i += 2) {
			        html += createBoardRow(res, i);
			    }
			    $('#boardListContainer table tbody').html(html);
			} else {
                // Show no results message
                $('#boardListContainer table tbody').html(
                    '<tr><td colspan="2" class="text-center p-5">' +
                    '<h4>좋아요한 게시글이 없습니다.</h4></td></tr>'
                );
            }
			
		},
		error: function(e){
			console.log(e);
		}
	})
}

function editBoard(brdId) {
    $.ajax({
        url: '/getBoardEdit',
        type: 'GET',
        data: { brdId: brdId },
        success: function(board) {
            console.log(board);
            // Switch to edit mode
            $('#boardListContainer').hide();
            $('#boardAddForm').show();
            
            // Change button to close mode
            $('#writeButton')
                .removeAttr('data-bs-toggle data-bs-target')
                .addClass('close-mode')
                .find('i')
                .removeClass('fa-pen-to-square')
                .addClass('pt-1 fa-plus');

            // Populate form with board data
            $('#travelTitle').val(board.brdTt);
            $('#travelDestination').val(board.trvPc);
            $('#travelContent').val(board.brdCt);
            $('#trvId').val(board.trvId);    
            
            // Add hidden input for brdId
            if ($('input[name="brdId"]').length === 0) {
                $('<input>')
                    .attr('type', 'hidden')
                    .attr('name', 'brdId')
                    .val(brdId)
                    .appendTo('#boardAddForm form');
            } else {
                $('input[name="brdId"]').val(brdId);
            }

            // Set form for editing
            $('#boardAddForm form').attr('action', '/boardUpdate');

            // Show map with location
            if (board.trvPc) {
                geocoder.addressSearch(board.trvPc, function(results, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        var result = results[0];
                        var coords = new kakao.maps.LatLng(result.y, result.x);
                        $('#map').show();
                        map.relayout();
                        map.setCenter(coords);
                        marker.setPosition(coords);
                    }
                });
            }

            // Handle existing images
            var photoPreview = $('#photoPreview');
            photoPreview.empty();

            // Add clear button if not exists
            if ($('#clearPhotosBtn').length === 0) {
                var clearBtn = $('<button>')
                    .attr('id', 'clearPhotosBtn')
                    .addClass('btn btn-danger btn-sm mb-2')
                    .text('지우기');
                
                clearBtn.on('click', function(e) {
                    e.preventDefault();
                    $('#trvImgUpload').val('');
                    photoPreview.empty();
                    clickOrder = [];
                    $(this).remove();
                });
                
                var labelDiv = $('<div>').addClass('d-flex align-items-center gap-2');
                $('#photoDiv label').wrap(labelDiv);
                $('#photoDiv label').after(clearBtn);
            }

            // Display existing images
            if (board.brdImg1) addExistingImage(board.brdImg1, 1);
            if (board.brdImg2) addExistingImage(board.brdImg2, 2);
            if (board.brdImg3) addExistingImage(board.brdImg3, 3);
            
            $('#photoDiv').show();
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
            alert('게시물 정보를 불러오는 중 오류가 발생했습니다.');
        }
    });
}

function addExistingImage(imgSrc, index) {
    var imgWrap = $('<div>')
        .addClass('img-wrap')
        .attr({
            'data-existing': 'true',
            'data-index': index
        });
    
    var img = $('<img>')
        .attr('src', imgSrc)
        .addClass('img-thumbnail');
    
    imgWrap.append(img);
    $('#photoPreview').append(imgWrap);
    
    // Only update the clickOrder array if there's only one image
    if ($('#photoPreview .img-wrap').length === 1) {
        clickOrder = [index];
    }
}


//여행 정보 검색
function performSearch(keyWord) {
	let url = '';
    let data = { keyWord: keyWord,
    			 memId: '${sessionScope.login.memId}'};
	
	const selectedValue = $('#postSelect').val();
	
	switch (selectedValue) {
	    case 'all':
	    	url = '/getBoardSearch';
	        break;
	    case 'myPosts':
	    	url = '/getMyBoardSearch';
	        break;
	    case 'likedPosts':
	    	url = '/getLikeBoardSearch';
	        break;
	    default:
	    	url = '/getBoardSearch';
	        break;
		}
   
    $.ajax({
        url: url,  // You'll need to create this endpoint
        type: 'GET',
        data: data,
        success: function(response) {
            // Clear existing content
            $('#boardListContainer table tbody').empty();
            
            if (response && response.length > 0) {
                let html = '';
                for (let i = 0; i < response.length; i += 2) {
                    html += createBoardRow(response, i);
                }
                $('#boardListContainer table tbody').html(html);
            } else {
                // Show no results message
                $('#boardListContainer table tbody').html(
                    '<tr><td colspan="2" class="text-center p-5">' +
                    '<h4>검색 결과가 없습니다.</h4></td></tr>'
                );
            }
        },
        error: function(xhr, status, error) {
            console.error('Search error:', error);
            alert('검색 중 오류가 발생했습니다.');
        }
    });
}

//Helper function to create table row with columns
function createBoardRow(posts, startIndex) {
    let html = '<tr>';
    
    // Always add the first column if there's a post
    if (startIndex < posts.length) {
        html += createBoardColumn(posts[startIndex]);
    }
    
    // Add second column only if there's a second post
    // This ensures single posts stay on the left with empty right column
    if (startIndex + 1 < posts.length) {
        html += createBoardColumn(posts[startIndex + 1]);
    } else {
        // Add empty column to maintain layout when there's only one post
        html += '<td style="width: 50%;"></td>';
    }
    
    html += '</tr>';
    return html;
}


function createBoardColumn(board) {
    var editDeleteButtons = '';
    var sessionMemId = '<c:out value="${sessionScope.login.memId}" />';
    
    // Edit/delete dropdown buttons
    if (sessionMemId === board.memId) {
        editDeleteButtons = 
            '<div class="dropdown me-4 mb-2">' +
            '<button class="btn" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false" ' +
            'style="font-size: 20px; appearance: none; -webkit-appearance: none;">' +
            '&#8942;' +
            '</button>' +
            '<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">' +
            '<li><a class="dropdown-item edit-board" href="#" data-brd-id="' + board.brdId + '">수정</a></li>' +
            '<li><a class="dropdown-item delete-board" href="#" data-brd-id="' + board.brdId + '">삭제</a></li>' +
            '</ul>' +
            '</div>';
    } else {
        editDeleteButtons = 
            '<div class="me-4 mb-2" style="font-size: 20px; padding: 6px 12px; height:44px">' +
            '<button class="btn" style="visibility: hidden; border: none; background: transparent;">' +
            '&#8942;' +
            '</button>' +
            '</div>';
    }

    // Heart icon based on like status
    var heartIcon = board.likeYn === 'Y' ? 
        '<i class="fa-solid fa-heart" style="font-size: 20px; color: #ff6b81"></i>' :
        '<i class="fa-regular fa-heart" style="font-size: 20px"></i>';

    return '<td class="ms-5" style="width: 50%;">' +
           '<div style="width: 95%; margin: 0 auto">' +
           '<div style="height: 260px; border-radius: 20px; background-color: rgb(248, 248, 248); width: 100%; margin: auto 0" ' +
           'class="d-flex align-items-center">' +
           '<div class="row d-flex align-items-center" style="width: 100%;">' +
           '<div class="col-5" style="text-align: center;">' +
           '<img onclick="location.href=\'/getBoard?brdId=' + board.brdId + '\'" ' +
           'src="' + board.brdImg1 + '" ' +
           'style="width: 180px; height: 225px; object-fit: cover; border-radius: 10px;" alt="">' +
           '</div>' +
           '<div class="col-7" style="padding: 0;">' +
           '<div>' +
           '<div class="d-flex justify-content-between align-items-center">' +
           '<h4 class="brdTt" style="margin: 0px; font-weight: bold;">' +
           '<span>[' + board.trvPlc + ']</span> ' + board.brdTt +
           '</h4>' +
           editDeleteButtons +
           '</div>' +
           '<div class="mt-2 d-flex align-items-center">' +
           '<img src="resources/assets/img/board_map.png" width="7%" alt="">' +
           '<p class="trvPc ms-2">' + board.trvPc + '</p>' +
           '</div>' +
           '</div>' +
           '<div class="me-5 d-flex flex-column align-items-end" ' +
           'style="color: rgb(107, 107, 107); margin-top: 80px;">' +
           '<div class="d-flex align-items-center">' +
           heartIcon +
           '<span class="ms-2">' + board.cnt + '</span>' +
           '</div>' +
           '</div>' +
           '</div>' +
           '</div>' +
           '</div>' +
           '</div>' +
           '</td>';
}

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
        imageSize = new kakao.maps.Size(70, 53),
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

function deleteBoard(brdId) {
    $.ajax({
        url: '/boardDel',
        type: 'POST',
        data: { brdId: brdId },
        success: function(response) {
            alert('여행 기록이 성공적으로 삭제되었습니다!');
            const selectedValue = $('#postSelect').val();
            console.log(selectedValue);
            loadPostsBySelection(selectedValue);
        },
        error: function(xhr, status, error) {
            alert('여행 기록 삭제 중 오류가 발생했습니다.');
        }
    });
}

//Helper function to load posts based on selection
function loadPostsBySelection(selectedValue) {
    switch (selectedValue) {
        case 'all':
            loadAllPosts();
            break;
        case 'myPosts':
            loadMyPosts();
            break;
        case 'likedPosts':
            loadLikedPosts();
            break;
        default:
            loadAllPosts();
            break;
    }
}

</script>
</body>
</html>