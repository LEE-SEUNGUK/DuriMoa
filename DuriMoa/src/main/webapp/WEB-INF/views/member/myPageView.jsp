<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<jsp:include page="/WEB-INF/inc/header.jsp"></jsp:include>
	<div class="container" style="padding: 0 !important;">
		<div class="row">
			<section class="mypage_side col-3" style="margin-top: 8%;">
				<h2 class="mb-5">마이 페이지</h2>
				<ul class="w-75" style="font-size: 20px;">
					<li class="my-page-item" data-target="userUpdate"><a href="#">개인정보
							수정</a></li>
					<hr>
					<li class="my-page-item" data-target="couple"><a href="#">커플
							설정</a></li>
					<hr>
					<li class="my-page-item" data-target="#"><a
						href="${pageContext.request.contextPath}/logoutDo"> 로그아웃</a></li>
					<hr>
					<li class="my-page-item" data-target="exit"><a href="#">회원
							탈퇴</a></li>
					<hr>
				</ul>
			</section>
			<section class="userUpdate col-9" style="margin-top: 5%">
				<div class="content-section" id="userUpdate">
					<h4>개인정보 수정</h4>
					<hr class="bg-dark mypage_hr">
					<div class="container">
						<form action="" style="border: none;">
							<div style="width: 46%; margin: 0 auto;">
								<div
									class="my-4 d-flex flex-column align-items-center">
									<label class="mb-3" for="my_profile">프로필 이미지</label> 
									<img src="${sessionScope.login.memImg}" id="my_profile" alt="">
									<input type="file" id="imageUpload" name="profileImage"
										style="display: none;" accept="image/*">
								</div>
								<div
									class="mb-4 d-flex justify-content-between align-items-center">
									<label for="">아이디</label> <input class="form-control"
										name="memId" type="text" value="${sessionScope.login.memId}"
										disabled>
								</div>
								<div
									class="mb-4 d-flex justify-content-between align-items-center position-relative">
									<label for="">비밀번호</label> <input class="form-control memPw"
										name="memPw" type="password"
										value="${sessionScope.login.memPw}" disabled> <i
										class="ms-3 fa fa-eye-slash"></i>
								</div>
								<div
									class="my-4 d-flex justify-content-between align-items-center position-relative">
									<label for="">새 비밀번호</label> <input class="form-control memNpw"
										id="memNpw" name="memPw" type="password">
								</div>
								<div
									class="mb-4 d-flex justify-content-between align-items-center position-relative">
									<label for="">새 비밀번호 확인</label> <input
										class="form-control memPw_ck" type="password" 
										id="memPw_ck" name="memPw_ck">
								</div>
								<div class="d-flex justify-content-between align-items-center"
									style="margin-bottom: 24px;">
									<label for="">이름</label> <input class="form-control"
										id="memNm" name="memNm" type="text"
										value="${sessionScope.login.memNm}">
								</div>
							</div>
							<div class="w-75" style="margin: 0 auto; text-align: center;">
								<hr class="bg-black">
								<button type="button" class="mt-4 btn btn-danger"  onclick="fn_write()"
									id="update_user"
									style="background-color: #c4ddc0; height: 45px; color: black; border: none;">회원정보
									수정</button>
							</div>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col-4"></div>
					<div class="col-8"></div>
				</div>
				<div class="content-section" id="couple" style="display: none;">
					<h4>커플 설정</h4>
					<hr class="bg-dark mypage_hr">
					<div class="row">
						<div class="col-2"></div>
						<div class="col-8">
							<div class="container">
								<form action="">
									<!-- margin: 0 auto는 자기 자신을 중앙정렬 -->
									<div style="width: 100%; margin: 0 auto;">
										<div
											class="mt-3 d-inline-flex justify-content-center align-items-center"
											style="font-size: 20px; width: 100%;">
											<span>커플정보</span>를 등록해주세요
										</div>
										<div class="mt-4 d-flex justify-content-center">
											<img src="${sessionScope.login.memImg}" id="my_profile"
												alt=""> <img class="ms-3"
												src="resources/assets/img/couple_add.png" alt=""
												id="couple_profile" data-bs-target="#couple_search"
												data-bs-toggle="modal"
												style="object-fit: cover; padding: 45px;">
										</div>
										<div class="mt-5" style="width: 92%; margin-left: 6%;">
											<div class="d-flex align-items-center">
												<div
													class="ps-2 d-inline-flex justify-content-between align-items-center w-75">
													<label for="">커플 아이디</label> <input
														class="form-control couple-input" name="userId"
														type="text" placeholder="커플 유저의 아이디를 입력하세요">
												</div>
												<button type="submit" class="ms-2 btn email_check">검색</button>
											</div>

											<div
												class="ps-2 d-flex justify-content-between align-items-center mt-4 w-75">
												<label for="">커플 이름</label> <input
													class="form-control couple-input" type="text"
													placeholder="커플 닉네임을 설정해주세요">
											</div>

											<div
												class="ps-2 d-flex justify-content-between align-items-center mt-4 w-75">
												<label for="">디데이 설정</label> <input
													class="form-control couple-input" type="date"
													id="couple_dday">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="col-2">
							<div>
								<img class="mb-3" src="resources/assets/img/question.png" alt=""
									width="40px" id="couple_info">
								<div class="speech-bubble">
									<h5>
										커플은 왜 설정하나요?
										</h1>
										<p>커플을 설정하게 되면 여행기록을 함께 관리할 수 있습니다</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="content-section" id="exit" style="display: none;">
					<h4>회원 탈퇴</h4>
					<hr class="bg-dark mypage_hr">
					<div class="container">
						<form action="" style="border: none;">
							<div style="width: 41%; margin: 0 auto;">
								<div
									class="mt-5 mb-4 d-flex justify-content-between align-items-xl-center">
									<label for="">아이디</label> <input class="form-control"
										name="userId" type="text" value="${sessionScope.login.memId}"
										disabled>
								</div>
								<div
									class="mb-5 d-flex justify-content-between align-items-center">
									<label for="">비밀번호</label> <input class="form-control"
										type="password">
								</div>
							</div>
							<div class="w-75" style="margin: 0 auto; text-align: center;">
								<hr class="bg-black">
								<button type="button" class="mt-4 btn btn-danger"
									id="update_user"
									style="background-color: #c4ddc0; height: 45px; color: black; border: none;">회원
									탈퇴</button>
							</div>
						</form>
					</div>
				</div>
			</section>
		</div>
	</div>
	<script>
	$(document).ready(function() {
	$(".my-page-item").click(function() {
		let target = $(this).data('target');

		$('.content-section').hide();

		$('#' + target).show();

		$('#couple_info').hover(function() {
			$('.speech-bubble').addClass('show');
		}, function() {
			$('.speech-bubble').removeClass('show');
		});
	});
	
	
	});
	function fn_write() {
		console.log("ㄱㄱ");
		let memId = '${sessionScope.login.memId}';
		let newPw = $('#memNpw').val();
		let newNm = $('#memNm').val();
		let memImg = '${sessionScope.login.memImg}';
		
		let memPw;
	    if (newPw === null || newPw === '') {
	        memPw = '${sessionScope.login.memPw}';  // 기존 비밀번호를 유지
	    } else {
	        memPw = newPw;  // 새로운 비밀번호로 변경
	    }
		
		let sendData = JSON.stringify({
			memId: memId,
			memPw: memPw,
			memNm: newNm,
			memImg: memImg
		})
		
		$.ajax({
			url : '<c:url value = "/updateDo" />',
			type : 'POST',
			contentType : 'application/json',
			dataType : 'json',
			data : sendData,
			success : function(res) {
				console.log('응답');
				console.log(res);
				location.href="/myPageView"
			},
			error : function(e) {
				console.log(e);
			}
		});
	};
</script>
</body>
</html>
