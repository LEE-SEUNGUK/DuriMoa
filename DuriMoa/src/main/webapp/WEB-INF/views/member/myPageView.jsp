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
		<section class="mypage_side col-3" style="margin-top: 6%;">
			<h2 class="mb-5">마이 페이지</h2>
			<ul class="w-75" style="font-size: 20px;">
				<li class="my-page-item" data-target="couple"><a href="#">커플
						설정</a></li>
				<hr>
				<li class="my-page-item" data-target="userUpdate"><a href="#">개인정보
						수정</a></li>
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
			<div class="content-section" id="userUpdate" style="display: none;">
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
									name="memPw" type="password" id="memPw_up"
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
			<div class="content-section" id="couple">
				<h4>커플 설정</h4>
				<hr class="bg-dark mypage_hr">
				<div class="row">
					<div class="col-2"></div>
					<div class="col-8">
						<div class="container">
							<!-- 등록된 커플이 없고 커플 등록도 안했으면 -->
							<!-- 커플 세션이 없는 경우 -->
							<c:if test="${sessionScope.couple == null}">
							    <!-- req와 res가 모두 없는 경우 -->
							    <c:if test="${sessionScope.req == null && sessionScope.res == null}">
							        <!-- coupleForm을 전체적으로 보여줌 -->
							        <form id="coupleForm" action="">
							            <!-- margin: 0 auto는 자기 자신을 중앙정렬 -->
							            <div style="width: 100%; margin: 0 auto;">
							                <div class="mt-3 d-inline-flex justify-content-center align-items-center" style="font-size: 20px; width: 100%;">
							                    <span>커플정보</span>를 등록해주세요
							                </div>
							                <div class="mt-4 d-flex justify-content-center">
							                    <img src="${sessionScope.login.memImg}" id="couple_profile_my" alt=""> 
							                    <img class="ms-3" src="resources/assets/img/couple_add.png" alt="" id="couple_profile_insert" style="object-fit: cover; padding: 45px;">
							                </div>
							                <div class="mt-5" style="width: 92%; margin-left: 6%;" id="couple_div">
							                    <div class="d-flex align-items-center" id="a">
							                        <div class="ps-2 d-inline-flex justify-content-between align-items-center w-75">
							                            <label for="">커플 아이디</label> 
							                            <input class="form-control couple-input" name="userId" type="text" placeholder="커플 유저의 아이디를 입력하세요">
							                        </div>
							                        <button type="button" class="ms-2 btn email_check" onclick="coupleCk()">검색</button>
							                    </div>
							                    <div id="couple_search" id="b">
							                        <input type='text' id='memId1' name='memId1' value="${sessionScope.login.memId}" style='display: none;'>
							                    </div>
							                    <div class="ps-2 d-flex justify-content-between align-items-center mt-4 w-75">
							                        <label for="">커플 이름</label> 
							                        <input class="form-control couple-input" type="text" id="copNmAdd" name="copNm" placeholder="커플 닉네임을 설정해주세요">
							                    </div>
							                    <div class="ps-2 d-flex justify-content-between align-items-center mt-4 mb-5 w-75">
							                        <label for="">디데이 설정</label> 
							                        <input class="form-control couple-input" type="date" id="copDtAdd" name="copNm">
							                    </div>
							                </div>
							                <div class="w-100" style="margin: 0 auto; text-align: center;">
							                    <hr class="bg-black">
							                    <button type="button" class="mt-4 btn btn-danger" onclick="coupleAdd()" style="background-color: #c4ddc0; height: 45px; color: black; border: none;">
							                        커플 등록
							                    </button>
							                </div>
							            </div>
							        </form>
							    </c:if>
							    
							    <!-- req만 있는 경우 (수락 대기중) -->
							    <c:if test="${sessionScope.req != null && sessionScope.res == null}">
							        <form id="coupleForm" action="">
							            <div style="width: 100%; margin: 0 auto;">
							                <div class="mt-3 d-inline-flex justify-content-center align-items-center" style="font-size: 20px; width: 100%;">
							                    <span>${sessionScope.req.reqNm}</span>님이 수락 대기중입니다
							                </div>
							                <div class="mt-4 mb-5 d-flex justify-content-center">
							                    <img src="${sessionScope.login.memImg}" id="couple_profile_my" alt=""> 
							                    <img class="ms-3" src="${sessionScope.req.reqImg}" alt="" id="couple_profile_insert" style="object-fit: cover;">
							                </div>
							                <div class="w-100" style="margin: 0 auto; text-align: center;">
							                    <hr class="bg-black">
							                    <button type="submit" class="mt-4 btn btn-danger"
												onclick="document.getElementById('coupleForm').action='delReqCop';"
							                    style="background-color: #c4ddc0; height: 45px; color: black; border: none;">
							                        신청 취소
							                    </button>
							                </div>
							            </div>
							        </form>
							    </c:if>
							
							    <!-- res만 있는 경우 (수락 요청 보낸 상태) -->
							    <c:if test="${sessionScope.req == null && sessionScope.res != null}">
							        <form id="coupleForm">
							            <div style="width: 100%; margin: 0 auto;">
							                <div class="mt-3 d-inline-flex justify-content-center align-items-center" style="font-size: 20px; width: 100%;">
							                    <span>${sessionScope.res.reqNm}</span>님이 커플 요청을 보냈습니다
							                </div>
							                <div class="mt-4 mb-5  d-flex justify-content-center">
							                    <img src="${sessionScope.login.memImg}" id="couple_profile_my" alt=""> 
							                    <img class="ms-3" src="${sessionScope.res.reqImg}" alt="" id="couple_profile_insert" style="object-fit: cover;">
							                </div>
							                <div class="w-100" style="margin: 0 auto; text-align: center;">
							                    <hr class="bg-black">
							                     <!-- 수락 버튼 -->
							                     <div class="d-flex justify-content-between" style="width: 20%; margin: 0 auto;">
											    <button type="submit" class="mt-4 btn btn-danger"
											            onclick="document.getElementById('coupleForm').action='allowReq';"
											            style="background-color: #c4ddc0; height: 45px; color: black; border: none;">
											        수락
											    </button>
											    
											    <!-- 거절 버튼 -->
											    <button type="submit" class="mt-4 btn btn-danger"
											            onclick="document.getElementById('coupleForm').action='opposeReq';"
											            style="height: 45px; color: black; border: none;">
											        거절
											    </button>
											    </div>
							                </div>
							            </div>
							        </form>
							    </c:if>
							</c:if>
							
							<!-- 커플 세션이 있는 경우 -->
							<c:if test="${sessionScope.couple != null}">
							    <form id="coupleUpdate" action="">
							        <div style="width: 100%; margin: 0 auto;">
							            <div class="mt-3 d-inline-flex justify-content-center align-items-center" style="font-size: 20px; width: 100%;">
							                <h3 id="dDay">
							                    <span id="copNmInfo">${sessionScope.couple.copNm}</span> D+<span id="dayText">0</span><span style="color: #dc143c;">♥</span>
							                </h3>
							            </div>
							            <div class="mt-4 d-flex justify-content-center">
							                <img src="${sessionScope.login.memImg}" id="couple_profile_my" alt=""> 
							                <img class="ms-3" src="${sessionScope.couple.memImg}" alt="" id="couple_profile" style="object-fit: cover;">
							            </div>
							            <div class="mt-5" style="width: 92%; margin-left: 6%;" id="couple_div">
							                <div class="ps-2 d-flex justify-content-between align-items-center mt-4 w-75">
							                    <label for="">커플 이름</label> 
							                    <input class="form-control couple-input" type="text" id="copNnm" name="copNm" placeholder="수정할 커플 닉네임을 입력하세요">
							                </div>
							                <div class="ps-2 d-flex justify-content-between align-items-center mt-4 mb-5 w-75">
							                    <label for="">디데이 수정</label> 
							                    <input class="form-control couple-input" type="date" id="copDt" name="copNm">
							                </div>
							            </div>
							            <div class="w-100" style="margin: 0 auto; text-align: center;">
							                <hr class="bg-black">
							                <div class="d-flex justify-content-between" style="width: 30%; margin: 0 auto;">
							                <button type="button" class="mt-4 btn btn-danger" onclick="fn_copUpdate()" style="background-color: #c4ddc0; height: 45px; color: black; border: none;">
							                    커플정보 수정
							                </button>
							                <button type="submit" class="mt-4 btn btn-danger"
							                onclick="document.getElementById('coupleUpdate').action='coupleDelete';"
							                style="height: 45px; color: black; border: none;">
							                   삭제
							                </button>
							                </div>
							            </div>
							        </div>
							    </form>
							</c:if>

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
					<form action ="/exit" style="border: none;">
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
							<button type="submit" class="mt-4 btn btn-danger"
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
$(document).ready(
		function() {
			var now = new Date();
			// '-'를 '/'로 변경
			var copDt = new Date("${sessionScope.couple.copDt}"
					.replace(/-/g, '/'));
			var timeDiff = now.getTime() - copDt.getTime();
			var day = Math.floor(timeDiff / (1000 * 60 * 60 * 24) + 1);
			// '0' 부분만 변경
			$('#dayText').text(day);

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

function coupleAdd() {
	var coupleData = {
		copNm : $('#copNmAdd').val(),
		copDt : $('#copDtAdd').val()
	};

	var memId = $('.couple-input[name="userId"]').val();

	// JSON으로 변환하여 AJAX 요청
	$.ajax({
		type : 'POST',
		url : '/coupleAdd?memId=' + encodeURIComponent(memId),
		contentType : 'application/json', // JSON 형식으로 데이터 전송
		data : JSON.stringify(coupleData), // JSON 문자열로 변환
		success : function(res) {
			console.log("응답: ", res);
			location.href = "myPageView";
		},
		error : function(xhr, status, error) {
			alert("서버 오류: " + "여기야");
		}
	});

}

function fn_copUpdate() {
	var coupleData = {
		copNm : $('#copNnm').val() || '${sessionScope.couple.copNm}',
		copDt : $('#copDt').val(),
		copId : '${sessionScope.couple.copId}'
	};
	$.ajax({
		type : 'POST',
		url : '/coupleUpdate',
		contentType : 'application/json', // JSON 형식으로 데이터 전송
		data : JSON.stringify(coupleData), // JSON 문자열로 변환
		success : function(res) {
			console.log("응답:", res);
			var now = new Date();
			// '-'를 '/'로 변경
			var copDt = new Date((res.copDt).replace(/-/g, '/'));
			console.log(copDt);
			var timeDiff = now.getTime() - copDt.getTime();
			var day = Math.floor(timeDiff / (1000 * 60 * 60 * 24) + 1);
			$('#headNm').text(res.copNm);
			$('#dayText').text(day);
			$('#copNmInfo').text(res.copNm);
		},
		error : function(xhr, status, error) {
			alert("서버 오류: " + error);
		}
	})
}

function fn_write() {
	let formData = new FormData();
	formData.append('memId', '${sessionScope.login.memId}');

	if ('${sessionScope.couple}' != null) {
		formData.append('copId', '${sessionScope.couple.copId}')
		formData.append('copYn', "Y")
	}

	let newPw = $('#memNpw').val();
	let newNm = $('#memNm').val();
	formData.append('memPw',
			newPw === '' ? '${sessionScope.login.memPw}' : newPw);
	formData.append('memNm',
			newNm === '' ? '${sessionScope.login.memNm}' : newNm);
	let copId = 0, copYn = null

	let imageFile = $('#imageUpload')[0].files[0];
	if (imageFile) {
		formData.append('profileImage', imageFile);
	} else {
		formData.append('memImg', '${sessionScope.login.memImg}');
	}

	$.ajax({
		url : '<c:url value="/updateDo" />',
		type : 'POST',
		data : formData,
		processData : false,
		contentType : false,
		success : function(res) {
			console.log('응답');
			console.log(res);
			$('#memPw_up').val(res.memPw);
			$('#memNpw').val("");
			$('#memPw_ck').val("");
			$('#memNm').val(res.memNm);
			$('#headNm').text(res.memNm);
			$('#headImg').attr('src', res.memImg);
			$('#couple_profile_my').attr('src', res.memImg);
		},
		error : function(e) {
			console.log(e);
		}
	});
}

function coupleCk() {
	let id = $('.couple-input').val();
		$.ajax({
			url : '/coupleCk',
			type : 'post',
			data : {
				id : id
			},
			success : function(res) {
				console.log("정상 응답");
				console.log(res);
				coupleInfo = res;

				let str = "";
				str += "<div id='couple_result' class='mt-3 d-flex couple-input align-items-center' style='height: 50px; width: 55%; margin: 0 auto; margin-right: 136px; border-radius: 10px;'>";
				str += "<img class='ms-4' src='"
						+ res.memImg
						+ "' style='width: 41px; height: 41px; border-radius: 20%;'>";
				str += "<a style='margin-left: 70px;'>" + res.memNm
						+ "님" + "</a></div>";
				str += "<input type='text' id='memId2' name='memId2' value='" + res.memId + "' style='display: none;'>";
				$('#couple_search').append(str);

				$(document).on(
						'click',
						'#couple_result',
						function() {
							if (coupleInfo.memImg) {
								$("#couple_profile_insert").attr(
										"src", res.memImg);
								$("#couple_profile_insert").css(
										"padding", '0px');

							} else {
								console.log("커플 프로필");
							}
						});
			},
			error : function() {
				console.log("서버 오류");
			}
		});
	}
	

</script>
</body>
</html>