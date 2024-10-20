<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 주소 관련 -->
</head>
<body>
	<section class="col-5 ms-5 mt-5">
		<div class="travel-form p-0">
			<h4 class="mb-4">여행 기록 추가</h4>
			<form>
				<div class="mb-3">
					<label for="travelTitle" class="form-label">여행 제목</label> <input
						type="text" class="form-control" id="travelTitle"
						placeholder="여행 제목을 입력하세요">
				</div>
				<div class="mb-3">
					<label for="travelDestination" class="form-label">여행지</label>
					<div class="input-group">
						<input type="text" class="form-control" id="travelDestination"
							placeholder="여행지를 검색하세요" readonly>
						<button class="btn btn-outline-secondary" type="button"
							id="searchAddress">검색</button>
					</div>
				</div>
				<input type="hidden" id="coordinateX"> <input type="hidden"
					id="coordinateY">
				<div class="mb-3">
					<label for="travelDate" class="form-label">여행 날짜</label> <input
						type="text" class="form-control" id="travelDate"
						placeholder="여행 날짜를 선택하세요" readonly>
				</div>
				<div class="mb-3">
					<label for="travelContent" class="form-label">내용</label>
					<textarea class="form-control" id="travelContent" rows="5"
						placeholder="여행 내용을 입력하세요"></textarea>
				</div>
				<div class="mb-3">
					<label for="hashtagInput" class="form-label">해시태그</label>
					<div class="input-group">
						<input type="text" class="form-control" id="hashtagInput"
							placeholder="해시태그 입력">
						<button class="btn btn-outline-secondary" type="button"
							id="addHashtag">추가</button>
					</div>
					<div id="hashtags" class="mt-2"></div>
				</div>

				<div class="mb-3 form-check">
					<input type="checkbox" class="form-check-input" id="isPublic"
						checked> <label class="form-check-label" for="isPublic">공개
						설정</label>
				</div>
				<button type="submit" class="btn btn-primary">저장하기</button>
			</form>
		</div>
	</section>
	<section class="col-4 d-flex flex-column  align-items-center">
		<div class="mt-5" id="map"></div>
		<div class="mt-3" id="photoDiv">
			<label for="travelPhotos" class="form-label">사진 (최대 3장)</label> <input
				type="file" class="form-control" id="travelPhotos" multiple
				accept="image/*">
			<div id="photoPreview" class="photo-preview justify-content-between"></div>
		</div>
	</section>
</body>