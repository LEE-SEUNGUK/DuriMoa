<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

.accordion-button.no-toggle:not (.collapsed ){
	color: var(- 
-bs-accordion-btn-color);
	background-color: var(- 
-bs-accordion-btn-bg);
	box-shadow: none;
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
	width: 250px;
	height: 250px;
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
							<button class="accordion-button no-toggle" type="button">인천</button>
						</h2>
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
			<section class="col-9 ms-5" style="margin-top: 4%" id="viewMode">
				<table class="table" style="margin-top: 2% !important; margin: 0 auto; border-bottom: #ffffff;">
					<tbody>
						<tr>
							<td>
								<div class="d-flex">
									<div class="d-flex align-items-center" style="height: 300px; border-radius: 20px; margin: 0 auto; background-color: rgb(248, 248, 248);">
										<div class="row d-flex align-items-center">
											<div class="col-3" style="text-align: center;">
												<img src="resources/assets/img/login_slide/2.jpg" style="width: 216px; height: 270px; object-fit: cover; border-radius: 10px;" alt="">
											</div>
											<div class="col-8" style="width: 65%; height: 95%; padding: 0;">
												<div class="d-flex justify-content-between align-items-center">
													<h4 style="margin: 0px; font-weight: bold;">바닷바람 맞기 좋은곳♥</h4>
												</div>
												<div class="mt-1" style="color: rgb(107, 107, 107);"># 제주도 # 바다 # 커플룩</div>
												<div class="d-flex mt-5 align-items-center">
													<img src="resources/assets/img/board_map.png" width="3%" alt="">
													<p class="ms-2">제주시 맛도리 라면집</p>
												</div>
												<div class="mt-3" style="width: 90%;">그 앞에 맛있는게 있었는데 라면이 지렸다. 그리고 앞에가 바로 바다여서 너무 좋았어. 그래서 그냥 찍어봤느데 키키 개좋다 그 앞에 맛있는게 있었는데 라면이 지렸다. 그리고 앞에가 바로 바다여서 너무 좋았어. 그래서 그냥 찍어봤느데 키키 개좋다</div>
											</div>
											<div class="col-1" style="margin-bottom: 18%;"></div>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="d-flex">
									<div class="d-flex align-items-center" style="height: 300px; border-radius: 20px; margin: 0 auto; background-color: rgb(248, 248, 248);">
										<div class="row d-flex align-items-center">
											<div class="col-3" style="text-align: center;">
												<img src="resources/assets/img/login_slide/2.jpg" style="width: 216px; height: 270px; object-fit: cover; border-radius: 10px;" alt="">
											</div>
											<div class="col-8" style="width: 65%; height: 95%; padding: 0;">
												<div class="d-flex justify-content-between align-items-center">
													<h4 style="margin: 0px; font-weight: bold;">바닷바람 맞기 좋은곳♥</h4>
												</div>
												<div class="mt-1" style="color: rgb(107, 107, 107);"># 제주도 # 바다 # 커플룩</div>
												<div class="d-flex mt-5 align-items-center">
													<img src="resources/assets/img/board_map.png" width="3%" alt="">
													<p class="ms-2">제주시 맛도리 라면집</p>
												</div>
												<div class="mt-3" style="width: 90%;">그 앞에 맛있는게 있었는데 라면이 지렸다. 그리고 앞에가 바로 바다여서 너무 좋았어. 그래서 그냥 찍어봤느데 키키 개좋다 그 앞에 맛있는게 있었는데 라면이 지렸다. 그리고 앞에가 바로 바다여서 너무 좋았어. 그래서 그냥 찍어봤느데 키키 개좋다</div>
											</div>
											<div class="col-1" style="margin-bottom: 18%;"></div>
										</div>
									</div>
								</div>
							</td>
						</tr>
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
										<button type="submit" class="btn btn-primary">저장하기</button>
									</div>
								</div>
							</div>
						</section>
						<section class="col-5 ms-4 d-flex flex-column align-items-center">
							<div class="mt-5" id="map"></div>
							<div class="mt-3" id="photoDiv">
								<label for="travelPhotos" class="form-label">사진</label> 
								<input type="file" id="trvImgUpload" name="trvThumbnail" class="form-control" id="travelPhotos" multiple accept="image/*">
								<div>
									<img id="trvThumbnail" src="" style="width: 120px; height: 150px">
									</div>
								<%-- <input type="hidden" id="memId" name="memId" value="${sessionScope.loing.memId}"> --%>
								<div id="photoPreview" class="photo-preview justify-content-between"></div>
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
		function sample5_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address; // 최종 주소 변수

					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("sample5_address").value = addr;
					// 주소로 상세 정보를 검색
					geocoder.addressSearch(data.address, function(results,
							status) {
						// 정상적으로 검색이 완료됐으면
						if (status === daum.maps.services.Status.OK) {

							var result = results[0]; //첫번째 결과의 값을 활용

							// 해당 주소에 대한 좌표를 받아서
							var coords = new daum.maps.LatLng(result.y,
									result.x);
							// 지도를 보여준다.
							mapContainer.style.display = "block";

							map.relayout();

							// 지도 중심을 변경한다.
							map.setCenter(coords);
							// 마커를 결과값으로 받은 위치로 옮긴다.
							marker.setPosition(coords)
						}
					});
				}
			}).open();

		}
		
		$(document).ready(function () {
			
			$('#writeButton').click(function() {
				toggleMode();
			});

			function toggleMode() {
				$('#viewMode').toggle();
				$('#writeMode').toggle();

				if ($('#writeMode').is(':visible')) {
					$('#writeButton').html('<i class="fa-solid fa-xmark" style="padding: 0px;"></i>');
				} else {
					$('#writeButton').html('<i class="fa-regular fa-pen-to-square"></i>');
				}
			};
		
			$('#trvImgUpload').change(function(){
				const file = this.files[0];
				if (file) {
					const reader = new FileReader();
					reader.onload = function(e) {
						$('#trvThumbnail').attr('src', e.target.result); // 선택된 이미지로 변경
					};
					reader.readAsDataURL(file);
				}
			})
			

			var mapContainer = document.getElementById('map');
			var mapOption = {
				center: new kakao.maps.LatLng(37.537187, 127.005476),
				level: 4
			};

			var imageSrc = 'resources/assets/img/marker.png',
				imageSize = new kakao.maps.Size(66, 55),
				imageOption = { offset: new kakao.maps.Point(33, 45) };

			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
				markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다	

			var map = new kakao.maps.Map(mapContainer, mapOption);
			var geocoder = new kakao.maps.services.Geocoder();
			var marker = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(37.537187, 127.005476),
				map: map,
				image: markerImage
			});

			$('.accordion-button.no-toggle').click(function (e) {
				e.preventDefault();
				return false;
			});

// 			$('#travelPhotos').on('change', function (event) {
// 				var files = event.target.files;
// 				var photoPreview = $('#photoPreview');
// 				photoPreview.empty();

// 				if (files.length > 3) {
// 					alert('최대 3장의 사진만 업로드할 수 있습니다.');
// 					$(this).val('');
// 					return;
// 				}

// 				for (var i = 0; i < files.length; i++) {
// 					var file = files[i];
// 					var reader = new FileReader();

// 					reader.onload = (function (theFile, index) {
// 						return function (e) {
// 							var imgWrap = $('<div class="img-wrap" data-index="' + index + '"></div>');
// 							var img = $('<img>').attr('src', e.target.result);
// 							var overlay = $('<div class="overlay"></div>');

// 							imgWrap.append(img).append(overlay);
// 							photoPreview.append(imgWrap);

// 							if (index === 0) {
// 								imgWrap.addClass('selected');
// 								console.log('Initial thumbnail index:', index);
// 							}
// 						};
// 					})(file, i);

// 					reader.readAsDataURL(file);
// 				}
// 			});

			$('#searchAddress').click(function () {
				new daum.Postcode({
					oncomplete: function (data) {
						var addr = data.address;
						$('#travelDestination').val(addr);

						geocoder.addressSearch(data.address, function (results, status) {
							if (status === kakao.maps.services.Status.OK) {
								var result = results[0];
								var coords = new kakao.maps.LatLng(result.y, result.x);

								$('#coordinateX').val(result.x);
								$('#coordinateY').val(result.y);

								console.log('Destination:', $('#travelDestination').val());
								console.log('Coordinates:', $('#coordinateX').val(), $('#coordinateY').val());

								$('#map').show();
								$('#photoDiv').show();
								map.relayout();
								map.setCenter(coords);
								marker.setPosition(coords);
							}
						});
					}
				}).open();
			});

			$('#travelAddForm').submit(function (e) {
				e.preventDefault();
				
			    var formData = new FormData(this);
	 
			    $.ajax({
			    	url : '/travelAdd',
		            type: 'POST',
		            data: formData,
		            processData: false,
		            contentType: false,
		            success: function(response) {
		                console.log('Success:', response);
		                alert('여행 기록이 성공적으로 저장되었습니다!');
		                // Redirect to the travel list page or handle the response as needed
		                // window.location.href = '/travelList';
		            },
		            error: function(xhr, status, error) {
		                console.error('Error:', error);
		                alert('여행 기록 저장 중 오류가 발생했습니다.');
		            }
		        });
			});

		});

		function sample5_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function (data) {
					var addr = data.address; // 최종 주소 변수

					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("sample5_address").value = addr;
					// 주소로 상세 정보를 검색
					geocoder.addressSearch(data.address, function (results, status) {
						// 정상적으로 검색이 완료됐으면
						if (status === daum.maps.services.Status.OK) {

							var result = results[0]; //첫번째 결과의 값을 활용

							// 해당 주소에 대한 좌표를 받아서
							var coords = new daum.maps.LatLng(result.y, result.x);
							// 지도를 보여준다.
							mapContainer.style.display = "block";

							map.relayout();

							// 지도 중심을 변경한다.
							map.setCenter(coords);
							// 마커를 결과값으로 받은 위치로 옮긴다.
							marker.setPosition(coords)
						}
					});
				}
			}).open();
		}
	</script>
</body>
</html>