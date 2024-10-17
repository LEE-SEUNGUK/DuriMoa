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
						<form action="" style="border: none;"
							enctype="multipart/form-data">
							<div style="width: 46%; margin: 0 auto;">
								<div class="my-4 d-flex flex-column align-items-center">
									<label class="mb-3" for="my_profile">프로필 이미지</label> <img
										src="${sessionScope.login.memImg}" id="my_profile" alt="">
									<input type="file" id="imageUpload" name="profileImage"
										accept="image/*" style="display: none;">
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
										class="form-control memPw_ck" type="password" id="memPw_ck"
										name="memPw_ck">
								</div>
								<div class="d-flex justify-content-between align-items-center"
									style="margin-bottom: 24px;">
									<label for="">이름</label> <input class="form-control" id="memNm"
										name="memNm" type="text" value="${sessionScope.login.memNm}">
								</div>
							</div>
							<div class="w-75" style="margin: 0 auto; text-align: center;">
								<hr class="bg-black">
								<button type="button" class="mt-4 btn btn-danger"
									onclick="fn_write()" id="update_user"
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
								<form id="coupleForm" action="">
									<!-- margin: 0 auto는 자기 자신을 중앙정렬 -->
									<div style="width: 100%; margin: 0 auto;">
										<div
											class="mt-3 d-inline-flex justify-content-center align-items-center"
											style="font-size: 20px; width: 100%;">
											<span>커플정보</span>를 등록해주세요
										</div>
										<div class="mt-4 d-flex justify-content-center">
											<img src="${sessionScope.login.memImg}" id="couple_profile_my"
												alt=""> <img class="ms-3"
												src="resources/assets/img/couple_add.png" alt=""
												id="couple_profile"
												style="object-fit: cover; padding: 45px;">
										</div>
										<div class="mt-5" style="width: 92%; margin-left: 6%;"
											id="couple_div">
											<div class="d-flex align-items-center">
												<div
													class="ps-2 d-inline-flex justify-content-between align-items-center w-75">
													<label for="">커플 아이디</label> <input
														class="form-control couple-input" name="userId"
														type="text" placeholder="커플 유저의 아이디를 입력하세요">
												</div>
												<button type="button" class="ms-2 btn email_check"
													onclick="coupleCk()">검색</button>
											</div>
											<div id="couple_search">
												<input type='text' id='memId1' name='memId1'
													value="${sessionScope.login.memId}" style='display: none;'>
											</div>
											<div
												class="ps-2 d-flex justify-content-between align-items-center mt-4 w-75">
												<label for="">커플 이름</label> <input
													class="form-control couple-input" type="text" id="copNm"
													name="copNm" placeholder="커플 닉네임을 설정해주세요">
											</div>
											<div
												class="ps-2 d-flex justify-content-between align-items-center mt-4 mb-5 w-75">
												<label for="">디데이 설정</label> <input
													class="form-control couple-input" type="date" id="copDt"
													name="copNm">
											</div>
										</div>
										<div class="w-100" style="margin: 0 auto; text-align: center;">
											<hr class="bg-black">
											<button type="submit" class="mt-4 btn btn-danger"
												style="background-color: #c4ddc0; height: 45px; color: black; border: none;">커플
												등록</button>
										</div>
									</div>
								</form>
								
<!-- 								<form id="coupleForm" action=""> -->
<!-- 									margin: 0 auto는 자기 자신을 중앙정렬 -->
<!-- 									<div style="width: 100%; margin: 0 auto;"> -->
<!-- 										<div -->
<!-- 											class="mt-3 d-inline-flex justify-content-center align-items-center" -->
<!-- 											style="font-size: 20px; width: 100%;"> -->
<!-- 											<span>너 커플이자나</span>를 등록해주세요 -->
<!-- 										</div> -->
<!-- 										<div class="mt-4 d-flex justify-content-center"> -->
<%-- 											<img src="${sessionScope.login.memImg}" id="couple_profile_my" --%>
<!-- 												alt=""> <img class="ms-3" -->
<!-- 												src="resources/assets/img/couple_add.png" alt="" -->
<!-- 												id="couple_profile" -->
<!-- 												style="object-fit: cover; padding: 45px;"> -->
<!-- 										</div> -->
<!-- 										<div class="mt-5" style="width: 92%; margin-left: 6%;" -->
<!-- 											id="couple_div"> -->
<!-- 											<div class="d-flex align-items-center"> -->
<!-- 												<div -->
<!-- 													class="ps-2 d-inline-flex justify-content-between align-items-center w-75"> -->
<!-- 													<label for="">커플 아이디</label> <input -->
<!-- 														class="form-control couple-input" name="userId" -->
<!-- 														type="text" placeholder="커플 유저의 아이디를 입력하세요"> -->
<!-- 												</div> -->
<!-- 												<button type="button" class="ms-2 btn email_check" -->
<!-- 													onclick="coupleCk()">검색</button> -->
<!-- 											</div> -->
<!-- 											<div id="couple_search"> -->
<!-- 												<input type='text' id='memId1' name='memId1' -->
<%-- 													value="${sessionScope.login.memId}" style='display: none;'> --%>
<!-- 											</div> -->
<!-- 											<div -->
<!-- 												class="ps-2 d-flex justify-content-between align-items-center mt-4 w-75"> -->
<!-- 												<label for="">커플 이름</label> <input -->
<!-- 													class="form-control couple-input" type="text" id="copNm" -->
<!-- 													name="copNm" placeholder="커플 닉네임을 설정해주세요"> -->
<!-- 											</div> -->
<!-- 											<div -->
<!-- 												class="ps-2 d-flex justify-content-between align-items-center mt-4 mb-5 w-75"> -->
<!-- 												<label for="">디데이 설정</label> <input -->
<!-- 													class="form-control couple-input" type="date" id="copDt" -->
<!-- 													name="copNm"> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<div class="w-100" style="margin: 0 auto; text-align: center;"> -->
<!-- 											<hr class="bg-black"> -->
<!-- 											<button type="submit" class="mt-4 btn btn-danger" -->
<!-- 												style="background-color: #c4ddc0; height: 45px; color: black; border: none;">커플 -->
<!-- 												등록</button> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</form> -->
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
		
		$('#coupleForm').submit(function(e) {
		    e.preventDefault(); // 기본 폼 제출 방지
		    
		    // 입력 값 가져오기
		    var coupleData = {
		        memId: $('.couple-input[name="userId"]').val(),
		        copNm: $('#copNm').val(),
		        copDt: $('#copDt').val()
		    };

		    // JSON으로 변환하여 AJAX 요청
		    $.ajax({
		        type: 'POST',
		        url: '/coupleAdd',
		        contentType: 'application/json', // JSON 형식으로 데이터 전송
		        data: JSON.stringify(coupleData), // JSON 문자열로 변환
		        success: function(response) {
		            console.log("응답:", response);
		            if (response === "success") {
		                alert("커플이 성공적으로 추가되었습니다.");
		                // 추가 작업 (예: 페이지 리로드 등)
		            } else {
		                alert("커플 추가 오류");
		            }
		        },
		        error: function(xhr, status, error) {
		            alert("서버 오류: " + error);
		        }
		    });
		});

 	});
	
	function fn_write() {
	    let formData = new FormData();
	    formData.append('memId', '${sessionScope.login.memId}');
	    
	    let newPw = $('#memNpw').val();
	    formData.append('memPw', newPw === '' ? '${sessionScope.login.memPw}' : newPw);
	    
	    formData.append('memNm', $('#memNm').val());
	    
	    let imageFile = $('#imageUpload')[0].files[0];
	    if (imageFile) {
	        formData.append('profileImage', imageFile);
	    } else {
	        formData.append('memImg', '${sessionScope.login.memImg}');
	    }
	    
	    $.ajax({
	        url: '<c:url value="/updateDo" />',
	        type: 'POST',
	        data: formData,
	        processData: false,
	        contentType: false,
	        success: function(res) {
	            console.log('응답');
	            console.log(res);
	            location.href="/myPageView"
	        },
	        error: function(e) {
	            console.log(e);
	        }
	    });
	}
	
	function coupleCk(){
		let id = $('.couple-input').val();
		
		$.ajax({
			url: '/coupleCk',
			type: 'post',
			data: {id: id},
			success: function(res) {
				console.log("정상 응답");
				console.log(res);
				coupleInfo = res;
				
				let str = "";
				str += "<div id='couple_result' class='mt-3 d-flex couple-input align-items-center' style='height: 50px; width: 55%; margin: 0 auto; margin-right: 136px; border-radius: 10px;'>";
				str += "<img class='ms-4' src='" + res.memImg + "' style='width: 41px; height: 41px; border-radius: 20%;'>";
                str += "<a style='margin-left: 70px;'>" + res.memNm + "님" + "</a></div>";
                str += "<input type='text' id='memId2' name='memId2' value='" + res.memId + "' style='display: none;'>";
                $('#couple_search').append(str);
                console.log("왜 안돼");
                
                $(document).on('click', '#couple_result', function() {
                    if (coupleInfo.memImg) {
                        $("#couple_profile").attr("src", res.memImg); // img 태그 src 변경
                        $("#couple_profile").css("padding", '0px'); // img 태그 src 변경
             
                    } else {
                        console.log("커플 프로필");
                    }
                });
			},
			error: function() {
				console.log("서버 오류");
			}
		});
	}
</script>
</body>
</html>