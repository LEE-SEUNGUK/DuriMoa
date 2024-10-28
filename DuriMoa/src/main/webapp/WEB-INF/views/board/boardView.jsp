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
	max-height: 1300px; /* Adjust this value as needed */
	margin: 0 auto;
}

#travelTitle,  #travelDestination, #travelDate{
	height: 38px;
	border: none;
	outline: 1px solid #8989896c;
	box-shadow: none !important;
}

#travelDestination{
	cursor: pointer;
}

#travelTitle:hover{
	outline: 1px solid #0000009e;
	transition: outline 0.5s;
}


#travelDestination:hover{
	outline: 1px solid #0000009e;
	transition: outline 0.5s;
}
#travelDate:hover{
	outline: 1px solid #0000009e;
	transition: outline 0.5s;
}

#travelTitle:focus{
	transition: all 0.01s;
    outline: 2px solid #0000009e !important;
}

#travelDestination:focus{
	transition: all 0.01s;
    outline: 2px solid #0000009e !important;
}

#travelDate:focus{
	transition: all 0.01s;
    outline: 2px solid #0000009e !important;
}

#trvImgUpload:focus{
	box-shadow: none !important;
	border: 1px solid #8989896c;
}

#trvImgUpload:active{
	box-shadow: none !important;
	border: 1px solid #8989896c;
}

#travelContent{
	height: 180px;
	border: none;
	outline: 1px solid #8989896c;
	box-shadow: none !important;
}

#travelContent:hover{
	outline: 1px solid #0000009e;
	transition: outline 0.5s;
}

#travelContent:focus{
	transition: all 0.01s;
    outline: 2px solid #0000009e !important;
}

#searchAddress{
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

.travelBtn{
	background-color: #c4ddc0 !important;
    height: 38px !important;
    color: black !important;
    border: none !important;
    opacity: 0.9;
}

.travelBtn:hover{
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

#searchAddress{
	opacity: 0.9;
}

#searchAddress:hover{
	opacity: 1.0;
	transition: 0.5s;
}

#singleDayTrip{
	display: none;
}

#trvOp{
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
															<c:if test="${travel.trvSdt == travel.trvEdt}">
																	<p class="ms-2" style="color: #6a6a6a;">${travel.trvSdt }</p>	
															</c:if>
															<c:if test="${travel.trvSdt != travel.trvEdt}">
																 <p class="ms-2" style="color: #6a6a6a;">${travel.trvSdt }</p>
																 <p class="ms-1">~</p> <p class="ms-1" style="color: #6a6a6a;">${travel.trvEdt }</p>
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
								    <label for="travelDate" class="form-label">날짜</label>
								    <input type="text" name="trvDt" class="form-control" id="travelDate" placeholder="여행 날짜를 선택하세요">
								    <div class="form-check mt-2" style="padding-left: 0px">
								        <input class="form-check-input" type="checkbox" id="singleDayTrip" checked>
								        <label class="form-check-label" for="singleDayTrip">
								            당일 여행
								        </label>
								    </div>
								</div>
								<div class="mb-3">
									<label for="travelContent" class="form-label">내용</label>
									<textarea class="form-control" name="trvCt" id="travelContent" rows="6" placeholder="내용을 입력하세요" style="resize: none;"></textarea>
								</div>
								<div class="mb-3 form-check d-flex justify-content-between" style="padding-left: 0px">
									<div>
										<input type="checkbox" name="trvOp" class="form-check-input" id="trvOp"> <label class="form-check-label" for="trvOp">공개</label>
									</div>
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

<script>

</script>
</body>
</html>