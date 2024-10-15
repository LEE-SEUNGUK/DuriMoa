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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<header>
	<nav class="d-flex" style="height: 80px; background-color: #ffefef;">
		<div class="d-flex align-items-center justify-content-center" style="width: 33%;">
			<div style="width: 80%; text-align: center;">
				<img src="resources/assets/img/logo.png" style="width: 35%;">
			</div>
			<c:if test="${sessionScope.login == null}">
				<div id="couple_name" style="width: 60%; font-size: 24px;">
				둘이모아 나가는 커플 지도♥</div>
			</c:if>
			<c:if test="${sessionScope.login != null}">
				<div id="couple_name" style="width: 60%; font-size: 24px;">
					${sessionScope.login.memNm}님 환영합니다</div>
			</c:if>
		</div>
		<div class="d-flex align-items-center justify-content-center" style="width: 34%;">
			<form class="position-relative" role="search">
				<input class="form-control rounded-pill ps-3" type="search"
					placeholder="검색어를 입력하세요" id="marker_search"
					style="line-height: 1.5;">
				<button class="search_btn"></button>
			</form>
		</div>
		<div class="d-flex align-items-center justify-content-center" style="width: 33%;">
			<ul class="h-100 d-flex justify-content-between" id="header_menu"
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
								data-bs-target="#loginModal"> 
								<img src="resources/assets/img/user.png" alt="" style="width: 42px;">
								<p class="nav_text">마이 페이지</p>
							</a>
						</c:if>
						<c:if test="${sessionScope.login != null}">
							<a class="nav_page d-flex flex-column align-items-center"
								href="${pageContext.request.contextPath}/myPageView" id="mypage">
								<img
								src="${pageContext.request.contextPath}${sessionScope.login.memImg}"
								style="width: 41px; height: 41px; object-fit: cover; border-radius: 50%;">
								<p class="nav_text" style="padding-top: 3px !important">마이페이지</p>
							</a>
						</c:if>
					</div>
				</li>
			</ul>
		</div>
	</nav>
</header>

<div class="modal fade" id="loginModal" tabindex="-1"
	aria-labelledby="loginModalLabel" aria-hidden="true">
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
									action="/loginDo" method="post" id="loginForm">
									<div class="w-100" style="height: 45px">
									<input class="form-control h-100 memId" type="text" id="memId" name="memId"
										placeholder="아이디" value="${cookie.rememberId.value}"
										autocomplete="off"> 
									<label for="memId"></label> 
									</div>
									<div class="mt-1 w-100 position-relative" style="height: 45px">
									<input class="form-control h-100 memPw" type="password" id="memPw" name="memPw"
										placeholder="비밀번호" autocomplete="off"> 
									<label for="memPw"></label>
									<i class="fa fa-eye-slash"></i>
									</div>
									<div class="mt-4 d-flex w-100">
										<input ${cookie.rememberId.value == null ? "" : "checked"}
											type="checkbox" id="auto_login" id="remember" name="remember"> <label
											for="auto_login">자동 로그인</label> 
											<a
											style="margin-left: 140px; cursor: pointer;"
											data-bs-target="#signUpModal" data-bs-toggle="modal">회원가입</a>
									</div>
									<button type="button" id="login"
										class="mt-5 btn btn-primary rounded-pill w-75" onclick="submitLogin()">로그인</button>
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
	aria-labelledby="signUpModalLabel" aria-hidden="true">
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
									<input class="form-control memId" type="text" name="memId"
										oninput="checkId()" id="memNid"
										placeholder="이메일로 입력해주세요" style="background-image: none;">
									<span class="mt-1" id="good" style="margin-right:42%; display: none;">사용 가능한 아이디 입니다.</span>
									<span class="mt-1" id="bad" style="margin-right:36%; display: none;">이미 사용중인 이메일 입니다.</span>
									<div class="mt-3 mb-1 w-100 d-flex justify-content-start">
										<label for="memPw">비밀번호</label>
									</div>
									<input class="form-control memPw" type="password"
										name="memPw" style="background-image: none;"
										placeholder="비밀번호를 입력해주세요" autocomplete="off"> 
									<input class="mt-1 form-control memPw" type="password" name="memPw_ck"
										style="background-image: none;" placeholder="비밀번호를 다시 입력해주세요"
										autocomplete="off">
									<div class="mt-3 mb-1 w-100 d-flex justify-content-start">
										<label for="">이름</label>
									</div>
									<input class="form-control memNm" type="text" name="memNm"
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
		// 기존의 jQuery 코드들
		$('#profileImage, #camera, #my_profile').click(function() {
			$('#imageUpload').click();
		});
	
		$('#imageUpload').change(function() {
			const file = this.files[0];
			if (file) {
				const reader = new FileReader();
				reader.onload = function(e) {
					$('#profileImage').attr('src', e.target.result); // 선택된 이미지로 변경
					$('#my_profile').attr('src', e.target.result); // 선택된 이미지로 변경
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
					alert("회원가입에 실패했습니다. 다시 시도해주세요.");
				}
			});
		});
		
		$('i.fa').on('click', function() {
		    const passwordInput = $(this).siblings('.memPw');
		    passwordInput.toggleClass('active');
		    if (passwordInput.attr('type') === 'password') {
		        passwordInput.attr('type', 'text');
		        $(this).removeClass('fa-eye-slash').addClass('fa-eye');
		    } else {
		        passwordInput.attr('type', 'password');
		        $(this).removeClass('fa-eye').addClass('fa-eye-slash');
		    }
		});
	});
	
	function submitLogin() {
	    const formData = {
	        memId: $("#memId").val(),
	        memPw: $("#memPw").val(),
	        remember: $("#remember").is(":checked")
	    };
	
	    $.ajax({
	        url: "/loginDo",
	        type: "POST",
	        contentType: "application/json",
	        data: JSON.stringify(formData),
	        success: function(response) {
	            if (response.status === "success") {
	                alert("로그인 성공!");
	                window.location.href = '/';  
	            } else {
	                alert(response.message);
	                $('#loginForm')[0].reset();  
	            }
	        },
	        error: function() {
	            alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
	            $('#loginForm')[0].reset();  
	        }
	    });
	}
	
	// 추가된 checkId 함수
	function checkId() {
		let id = $('#memNid').val(); // id값이 "memNid"인 입력란의 값을 저장
		
		// 입력란의 값이 없으면 모든 span 태그 숨김
	    if (id == "") {
	        $('#good').css("display", "none");
	        $('#bad').css("display", "none");
	        return;  // 이후 코드 실행하지 않도록 종료
	    }
		
		$.ajax({
			url: '/idCheck', // Controller에서 요청 받을 주소
			type: 'post', // POST 방식으로 전달
			data: { id: id },
			success: function(cnt) { // Controller에서 넘어온 cnt값을 받는다 
				if (cnt == 0) { // cnt가 0일 경우 -> 사용 가능한 아이디 
					$('#good').css("display","block")
					$('#bad').css("display","none")
				} else { // cnt가 1일 경우 -> 이미 존재하는 아이디
					$('#bad').css("display","block")
					$('#good').css("display","none")
					$('#bad').val('');
				}
			},
			error: function() {
				alert("아이디 확인 중 오류가 발생했습니다.");
			}
		});
	}
</script>