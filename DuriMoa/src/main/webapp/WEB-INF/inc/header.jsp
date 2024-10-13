<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/assets/css/header.css" rel="stylesheet" />

<header>
	<nav class="d-flex" style="height: 80px; background-color: #ffefef;">
		<div class="d-flex align-items-center justify-content-center"
			style="width: 33%;">
			<img class="" src="resources/assets/img/logo.png" alt=""
				style="width: 20%; margin-right: 20%;">
			<div class="ms-5" id="couple_name" style="font-size: 24px;">
				커플명 입력</div>
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
						<a class="nav_page d-flex flex-column align-items-center" href="#"
							id="mypage" data-bs-toggle="modal" data-bs-target="#loginModal">
							<img src="resources/assets/img/user.png" alt=""
							style="width: 42px;">
							<p class="nav_text">마이 페이지</p>
						</a>
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
			<div class="container-fluid">
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
										autocomplete="off"> <label for="memId"></label> <input
										class="mt-1 form-control userPw" type="password" name="memPw"
										placeholder="비밀번호" autocomplete="off"> <label
										for="memPw"></label>
									<div class="mt-4 d-flex w-100">
										<input type="checkbox" id="auto_login"> <label
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
								<form id="signUpForm"
									class="d-flex flex-column justify-content-center align-items-center w-75"
									method="post">
									<p>프로필 이미지</p>
									<div class="mb-1">
										<img src="resources/assets/img/profile_img.png"
											id="profileImage" class="my-2"
											style="cursor: pointer; border-radius: 50%;"> <img
											src="resources/assets/img/camera.png" id="camera" alt=""
											style="width: 30px; position: absolute; top: 26%; right: 38%; cursor: pointer;">
										<input type="file" id="imageUpload" style="display: none;"
											accept="image/*">
									</div>
									<div class="mb-1 w-100 d-flex justify-content-start">
										<label for="memId">아이디</label>
									</div>
									<input class="form-control userId" type="text" name="memId"
										placeholder="8~12자리의 숫자 또는 영문"
										style="background-image: none; padding-left: 20px;">
									<div class="mt-3 mb-1 w-100 d-flex justify-content-start">
										<label for="memPw">비밀번호</label>
									</div>
									<input class="form-control userPw" type="password"
										name="memPw_ck" style="background-image: none; padding: 20px;"
										placeholder="비밀번호를 입력해주세요" autocomplete="off"> <input
										class="mt-1 form-control userPw" type="password" name="memPw"
										style="background-image: none; padding: 20px"
										placeholder="비밀번호를 다시 입력해주세요" autocomplete="off">
									<div class="mt-3 mb-1 w-100 d-flex justify-content-start">
										<label for="userId">개인정보</label>
									</div>
									<input class="form-control userNm" type="text" name="memNm"
										placeholder="이름을 입력해주세요" autocomplete="off"> <input
										class="mt-1 form-control userNm" type="text" name="memPn"
										placeholder="전화번호를 입력해주세요" autocomplete="off">
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

		$('#signUpForm').submit(function(e) {
			e.preventDefault(); // 폼의 기본 제출 동작을 막음

			var formData = $(this).serialize(); // 폼 데이터를 직렬화하여 서버로 전송

			$.ajax({
				type : 'POST',
				url : '/registDo', // 회원가입 처리 URL
				data : formData,
				success : function(response) {
					if (response === "success") {
						// 회원가입 성공 시 모달 전환
						$('#signUpModal').modal('hide'); // 회원가입 모달 숨기기
						$('#loginModal').modal('show'); // 로그인 모달 띄우기
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