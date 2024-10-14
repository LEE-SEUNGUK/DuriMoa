<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="/resources/assets/css/header.css" rel="stylesheet" />
<link href="/resources/assets/css/mypage.css" rel="stylesheet" />
<link
	rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<header>
	<nav class="d-flex" style="height: 80px; background-color: #ffefef;">
		<div class="d-flex align-items-center justify-content-center"
			style="width: 33%;">
			<div style="width: 80%; text-align: center;">
				<img src="resources/assets/img/logo.png" alt="" style="width: 35%;">
			</div>
			<c:if test="${sessionScope.login == null}">
				<div id="couple_name" style="width: 60%; font-size: 24px;">둘이
					모아 나가는 커플 지도♥</div>
			</c:if>
			<c:if test="${sessionScope.login != null}">
				<div id="couple_name" style="width: 60%; font-size: 24px;">
					${sessionScope.login.memNm}님 환영합니다</div>
			</c:if>
		</div>
		<div class="d-flex align-items-center justify-content-center"
			style="width: 34%;">
			<form class="position-relative" role="search">
				<input class="form-control rounded-pill ps-3" type="search"
					placeholder="검색어를 입력하세요" id="marker_search"
					style="line-height: 1.5;">
				<button class="search_btn"></button>
			</form>
		</div>
		<div class="d-flex align-items-center" style="width: 33%;">
			<ul class="h-100 d-flex justify-content-between" id="menu_bar"
				style="width: 60%;">
				<li class="menu_option h-100">
					<div>
						<a class="nav_page d-flex flex-column align-items-center" href="#"><img
							src="resources/assets/img/photo.png" alt="" style="width: 40px;">
							<p class="nav_text" style="padding-top: 3px !important">포토존</p> </a>
					</div>
				</li>
				<li class="menu_option h-100">
					<div class="ms-3">
						<a class="nav_page d-flex flex-column align-items-center" href="#"><img
							src="resources/assets/img/diary.png" alt=""
							style="width: 36px; padding-top: 2px;">
							<p class="pt-1 nav_text">우리의 추억</p> </a>
					</div>
				</li>
				<li class="menu_option h-100">
					<div>
						<c:if test="${sessionScope.login == null}">
							<a class="nav_page d-flex flex-column align-items-center"
								href="#" id="mypage" data-bs-toggle="modal"
								data-bs-target="#loginModal"> <img
								src="resources/assets/img/user.png" alt="" style="width: 42px;">
								<p class="nav_text">마이 페이지</p>
							</a>
						</c:if>
						<c:if test="${sessionScope.login != null}">
							<a class="nav_page d-flex flex-column align-items-center"
								href="${pageContext.request.contextPath}/myPageView" id="mypage">
								<img
								src="${pageContext.request.contextPath}${sessionScope.login.memImg}"
								alt=""
								style="width: 41px; height: 41px; border-radius: 70%; object-fit: cover">
								<p class="nav_text" style="padding-top: 3px !important" ]>마이페이지</p>
							</a>
						</c:if>
					</div>
				</li>
			</ul>
		</div>
	</nav>
</header>

<div class="modal fade" id="loginModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="login modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="container-fluid" style="padding: 0 !important;">
				<div class="row w-100">
					<div class="col-6 login-left">
						<div class="modal-body">
							<div class="mt-5 d-flex justify-content-center">
								<img src="resources/assets/img/logo.png" alt="" width="150px">
							</div>
							<div class=" mt-4 d-flex justify-content-center">
								<form
									class="d-flex flex-column justify-content-center align-items-center w-75"
									action="/loginDo" method="post">
									<input class="form-control userId" type="text" name="memId"
										placeholder="아이디" value="${cookie.rememberId.value}"
										autocomplete="off"> 
									<label for="memId"></label> 
									<input class="mt-1 form-control userPw" type="password" name="memPw"
										placeholder="비밀번호" autocomplete="off"> 
									<label for="memPw"></label>
									<div class="eyes">
										<i class="fa fa-eye fa-lg"></i>
									</div>
									<div class="mt-4 d-flex w-100">
										<input ${cookie.rememberId.value == null ? "" : "checked"}
											type="checkbox" id="auto_login" name="remember"> <label
											for="auto_login">자동 로그인</label> <a
											style="margin-left: 140px; cursor: pointer;"
											data-bs-target="#signUpModal" data-bs-toggle="modal">회원가입</a>
									</div>
									<button type="submit" id="login"
										class="mt-5 btn btn-primary rounded-pill w-75">로그인</button>
								</form>
							</div>
							<div class="mt-5 d-flex flex-column align-items-center">
								<div class="social-login w-75">
									<p class="mb-4 hr-sect ">or</p>
								</div>
								<button class="mt-3 mb-5 btn btn-primary w-75 ps-4"
									id="kakao_login" type="button">카카오 로그인</button>
							</div>
						</div>
					</div>
					<div class="col-6 login-right">
						<img class="login-image"
							src="resources/assets/img/login_slide/1.jpg" alt="">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="signUpModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered"
		style="max-width: 450px;">
		<div class="modal-content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12 signUp">
						<div class="modal-body">
							<div class="mt-4 d-flex justify-content-center">
								<h3>
									<span>회원정보</span>를 입력해주세요
								</h3>
							</div>
							<div class=" mt-3 d-flex justify-content-center">
								<form id="signUpForm" enctype="multipart/form-data"
									class="d-flex flex-column justify-content-center align-items-center w-75"
									method="post">
									<p>프로필 이미지</p>
									<div class="mb-1">
										<img src="resources/assets/img/profile_img.png"
											id="profileImage" class="my-2"
											style="cursor: pointer; border-radius: 50%;"> <img
											src="resources/assets/img/camera.png" id="camera" alt=""
											style="width: 30px; position: absolute; top: 26%; right: 38%; cursor: pointer;">
										<input type="file" id="imageUpload" name="profileImage"
											style="display: none;" accept="image/*">
									</div>
									<div class="mb-1 w-100 d-flex justify-content-start">
										<label for="memId">아이디</label>
									</div>
									<input class="form-control userId" type="text" name="memId"
										placeholder="8~12자리의 숫자 또는 영문" style="background-image: none;">
									<div class="mt-3 mb-1 w-100 d-flex justify-content-start">
										<label for="memPw">비밀번호</label>
									</div>
									<input class="form-control userPw" type="password"
										name="memPw_ck" style="background-image: none;"
										placeholder="비밀번호를 입력해주세요" autocomplete="off"> <input
										class="mt-1 form-control userPw" type="password" name="memPw"
										style="background-image: none;" placeholder="비밀번호를 다시 입력해주세요"
										autocomplete="off">
									<div class="mt-3 mb-1 w-100 d-flex justify-content-start">
										<label for="userId">개인정보</label>
									</div>
									<input class="form-control userNm" type="text" name="memNm"
										placeholder="이름을 입력해주세요" autocomplete="off">
									<button type="submit" id="signUp"
										class="my-4 btn btn-primary rounded-pill w-50">완료</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		$('#profileImage, #camera').click(function() {
			$('#imageUpload').click();
		});

		// 이미지 미리보기
		$('#imageUpload').change(function() {
			const file = this.files[0];
			if (file) {
				const reader = new FileReader();
				reader.onload = function(e) {
					console.log("안옴?");
					$('#profileImage').attr('src', e.target.result); // 선택된 이미지로 변경
				};
				reader.readAsDataURL(file);
			}
		});

		$('#signUpForm').submit(function(e) {
			e.preventDefault();

			var formData = new FormData(this); // 이미지 파일 포함된 폼 데이터 생성

			$.ajax({
				type : 'POST',
				url : '/registDo',
				data : formData,
				processData : false,
				contentType : false,
				success : function(response) {
					if (response === "success") {
						$('#signUpModal').modal('hide');
						$('#loginModal').modal('show');
					} else {
						alert('회원가입 처리 중 오류가 발생했습니다.');
					}
				},
				error : function(xhr, status, error) {
					console.log("회원가입 중 오류가 발생했습니다: " + error);
					alert("회원가입에 실패했습니다. 다시 시도해주세요.");
				}
			});
		});
	});
</script>