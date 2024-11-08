<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#map {
	width: 100%;
	height: 300px;
}

.carousel-item img {
    width: 649px;
    height: 780px;
    object-fit: cover;
}

.carousel-control-prev,
.carousel-control-next {
    width: 5% !important;
}

.carousel-control-prev{
	margin-left: 49px;
}


.carousel-control-next {
    margin-right: 49px;
}

.carousel-indicators {
    bottom: 0;
}

/* Hide carousel controls by default */
.carousel-control-prev,
.carousel-control-next,
.carousel-indicators {
    display: none;
}

/* Show carousel controls when multiple images exist */
.carousel.multi-images .carousel-control-prev,
.carousel.multi-images .carousel-control-next,
.carousel.multi-images .carousel-indicators {
    display: flex;
}

.rpyDel{
	color: #2424246c !important;
	cursor: pointer;
}

.rpyHr{
	color: #2424246c;
}


#replyInput:focus{
	outline: 1px solid #0000009e;	
}

svg{
    width: 40px;
    /*상대포지션*/
    position: relative;
    /*z-index: 10;*/
}

body{
	--c: #ff6b81;
}

#heart{
    /*색 보충*/
    fill: #eee;

    /*stroke속성은 선, 문자, 원소등의 테두리에대해서 디자인 가능*/
    stroke: var(--c);
    /*선의 넓이*/
    stroke-width: 40px;
    /*선을 점선으로 설정, 점선의 길이 설정*/
    stroke-dasharray: 3000;
    /*displacement of line*/
    stroke-dashoffset: 3000;
    /*끝점은 둥글게*/
    stroke-linecap: round;

    
}

/*checkbox를 클릭할 경우 애니메이션 실행*/
#checkbox:checked + svg #heart{
    /*애니메이션실행: 애니메이션이름, 실행시간, 선형 마지막 정지한 프레임*/
    animation: drawHeart 0.7s linear forwards;
}


#checkbox:checked + svg{
     /*애니메이션실행: 애니메이션이름, 실행시간, 선형 마지막 정지한 프레임*/
    animation: beat 1s linear forwards;;
}
label{
    /*마우스 heart로 이동시 마우스 커서변동*/
    cursor: pointer;
}

/*애니메이션 효과 설정*/
/*heart 애니메이션*/
@keyframes drawHeart{
    0%{
        stroke-dashoffset: 2600;
    }
    80%{
        fill: #eee;
        stroke-dashoffset: 0;
    }
    100%{
        fill: var(--c);
        stroke-dashoffset: 0;
    }

}
/*점 애니메이션*/
@keyframes blink{
    0%{
        transform: translate(-50%, -50%) scale(0.5);
        opacity: 0.8;
    }
    80%{
        transform: translate(-50%, -50%) scale(1);
        opacity: 1;
    }
    100%{
        transform: translate(-50%, -50%) scale(1.1);
        opacity: 0;
    }
}

/*두근두근 애니메이션*/
@keyframes beat {
    0%{
        transform: scale(1);
    }
    70%{
        transform: scale(1);
    }
    80%{
        transform: scale(1.2);
    }
    100%{
        transform: scale(1);
    }
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/inc/header.jsp"></jsp:include>
	<div class="container" style="margin-top: 4%;">
        <h3>[충남]${board.brdTt}</h3>
        <hr>
        <div class="row">
        	<header>
        		<div class="d-flex align-items-center" style="gap: 1rem;">
        		    <img alt="" src="${writer.memImg}" width="50px" height="50px" style="border-radius: 50%;">
       				<div style="display: flex; flex-direction: column;">
					    <span>${writer.memNm}</span>
					    <span>${board.brdDt}</span>
					</div>
        		</div>
        	</header>
            <section class="col-6 p-0">
                 <div id="imageCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#imageCarousel" data-bs-slide-to="0" class="active"></button>
                        <c:if test="${not empty board.brdImg2}">
                            <button type="button" data-bs-target="#imageCarousel" data-bs-slide-to="1"></button>
                        </c:if>
                        <c:if test="${not empty board.brdImg3}">
                            <button type="button" data-bs-target="#imageCarousel" data-bs-slide-to="2"></button>
                        </c:if>
                    </div>
                    
                    <div class="mt-5 carousel-inner">
                        <div class="carousel-item active">
                            <img class="p-5" src="${board.brdImg1}" alt="Image 1">
                        </div>
                        <c:if test="${not empty board.brdImg2}">
                            <div class="carousel-item">
                                <img class="p-5" src="${board.brdImg2}" alt="Image 2">
                            </div>
                        </c:if>
                        <c:if test="${not empty board.brdImg3}">
                            <div class="carousel-item">
                                <img class="p-5" src="${board.brdImg3}" alt="Image 3">
                            </div>
                        </c:if>
                    </div>
                    
                    <button class="carousel-control-prev" type="button" data-bs-target="#imageCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#imageCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </section>
            <section class="col-6 p-0 ps-3">
                <div class="d-flex justify-content-center align-items-center mt-5">
                    <img src="resources/assets/img/board_map.png" width="30px" alt="">
                    <h4 class="m-0 ms-3">${board.trvPc}</h4>
                </div>
                <div class="mt-3" style="text-align: center;">
                    <div id="map"></div>
                </div>
                <textarea class="mt-5 p-3" style="background-color: #f8f9fa; border: 1px #f8f9fa; width: 100%;
				border-radius: 15px;   height: 340px; font-size: 18px; font-family: 'Pretendard-Regular'; resize: none;" readonly="readonly">${board.brdCt}</textarea>
            </section>
            <section>
            	<div style="margin: 0 auto; width:5%;">
            		 <label for="checkbox">
				        <input type="checkbox" id="checkbox" hidden>
				        <svg t="1689815540548" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2271"><path d="M742.4 101.12A249.6 249.6 0 0 0 512 256a249.6 249.6 0 0 0-230.72-154.88C143.68 101.12 32 238.4 32 376.32c0 301.44 416 546.56 480 546.56s480-245.12 480-546.56c0-137.92-111.68-275.2-249.6-275.2z" fill="#231F20" p-id="2272" id="heart"></path></svg>
				        <span>${cnt }</span>
				    </label>
            	</div>
            </section>
        </div>
    </div>
    <div class="container my-5">
        <hr>
        <div>
            <table style="width: 90%; margin: 0 auto;">
                 <tbody id="replyBody">
			        <c:forEach items="${replyList}" var="reply">
			            <tr id="${reply.rpyId}">
			                <td class="col-2" style="text-align: center;"> 
			                    <img src="${reply.memImg}" width="50px" height="50px" style="border-radius: 50%;" alt="">
			                    <p>${reply.memNm}</p>
			                </td>
			                <td class="col-7">
			                    ${reply.rpyCt}
			                </td>
			                <td class="col-2">
			                    ${reply.rpyDt}
			                </td>
			                <c:if test="${sessionScope.login.memId == reply.memId}">
			                    <td class="col-1">
			                        <a class="rpyDel" onclick="replyDel('${reply.rpyId}')">X</a>
			                    </td>
			                </c:if>
			                <c:if test="${sessionScope.login.memId != reply.memId}">
			                    <td class="col-1">
			                    </td>
			                </c:if>
			            </tr>
			            <tr>
			                <td colspan="4">
			                    <hr class="rpyHr my-3" style="width: 88%; margin: 0 auto;">
			                </td>
			            </tr>
			        </c:forEach>
			    </tbody>
            </table>
        </div>
        <table style="width: 90%; margin: 0 auto;">
            <tbody>
                <tr>
                    <td class="col-2" style="text-align: center;"> 
                        <img src="${sessionScope.login.memImg}" width="50px" height="50px"
                            style="border-radius: 50%;" alt="">
                        <p>${sessionScope.login.memNm}</p>
                    </td>
                    <td class="col-10">
                        <input class="ps-4" id="replyInput"  type="text" style="width: 80%; height: 70px; 
                        background-color: #f8f9fa; border: none; border-radius: 10px;"
                        placeholder="댓글을 입력하세요" onkeypress="replyWrite(event)">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
<script>
$(document).ready(function(){
	const $carousel = $('#imageCarousel');
    const $slides = $carousel.find('.carousel-item');
    
    const initialCk = ${ck};
    $('#checkbox').prop('checked', initialCk === 1);
    $('#checkbox').on('change', toggleLike);
    
    // Add 'multi-images' class if there are multiple images
    if ($slides.length > 1) {
        $carousel.addClass('multi-images');
        
        // Initialize Bootstrap carousel with auto-sliding
        $carousel.carousel({
            interval: 3000,  // Slide every 3 seconds
            ride: 'carousel'
        });
    } else {
        // Disable carousel functionality for single image
        $carousel.carousel({
            interval: false,
            ride: false
        });
        
        // Optional: Remove all carousel related classes/attributes for single image
        $carousel
            .removeClass('carousel slide')
            .removeAttr('data-bs-ride');
    }
	
	initializeMap();
	
	var trvX = ${board.trvX}; // JavaScript 변수에 board.trvX 값 할당
	var trvY = ${board.trvY}; // JavaScript 변수에 board.trvY 값 할당
	
    var coords = new kakao.maps.LatLng(trvY, trvX);
    map.relayout();
    map.setCenter(coords);
    marker.setPosition(coords);  
})

function toggleLike() {
    const checkbox = document.getElementById('checkbox');
    const countSpan = checkbox.parentElement.querySelector('span');
    const brdId = '${board.brdId}';
    const memId = '${sessionScope.login.memId}';
    
    let url;
    if (checkbox.checked) {
        // If checkbox is now checked, we need to increase
        url = '<c:url value="/increaseLike" />';
    } else {
        // If checkbox is now unchecked, we need to decrease
        url = '<c:url value="/decreaseLike" />';
    }
    
    $.ajax({
        url: url,
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({
            brdId: brdId,
            memId: memId
        }),
        success: function(response) {
            // Update the count display
            const currentCount = parseInt(countSpan.textContent);
            if (checkbox.checked) {
                countSpan.textContent = currentCount + 1;
            } else {
                countSpan.textContent = currentCount - 1;
            }
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
            // Revert checkbox state on error
            checkbox.checked = !checkbox.checked;
        }
    });
}

function replyWrite(e){
	if(e.keyCode == 13){
		
		let memId = '${sessionScope.login.memId}';
		let brdId = '${board.brdId}';
		let rpyCt = $("#replyInput").val();
		if(rpyCt == ''){
			alert("내용을 작성해주세요.");
			return ;
		}
			
		let sendData = JSON.stringify({
			memId : memId,
			brdId : brdId,
			rpyCt : rpyCt
		});
		
		console.log(sendData);
		
		$.ajax({
			url : '<c:url value = "/writeReply" />',
			type : 'POST',
			contentType : 'application/json',
			dataType : 'json',
			data : sendData,
			success : function(res) {
				console.log('응답');
				console.log(res);
				let str = "";			
				str += "<tr id='" + res.rpyId + "'>";
				str += "    <td class='col-2' style='text-align: center;'>"; 
				str += "        <img src='" + res.memImg + "' width='50px' height='50px' style='border-radius: 50%;' alt=''>";
				str += "        <p>" + res.memNm + "</p>";
				str += "    </td>";
				str += "    <td class='col-7'>";
				str += "        " + res.rpyCt;
				str += "    </td>";
				str += "    <td class='col-2'>";
				str += "        " + res.rpyDt;
				str += "    </td>";
				str += "    <td class='col-1'>";
				str += "        <a class='rpyDel' onclick='replyDel(" + res.rpyId + ")' style='cursor: pointer;'>X</a>";
				str += "    </td>";
				str += "</tr>";
				str += "<tr><td colspan='4'><hr class='rpyHr my-3' style='width: 88%; margin: 0 auto;'></td></tr>";				
				$("#replyBody").append(str);
				$("#replyInput").val('');
			},
			error : function(e) {
				console.log(e);
			}
		});
	}
}

function replyDel(rpyId) {
	$.ajax({
		url: '<c:url value = "/delReply" />',
		type: 'POST',
		data: JSON.stringify({"rpyId": rpyId}),
		contentType: 'application/json',
		dataType: "text",
		success: function(res){
			if(res == 'success'){
				$('#' + rpyId).next('tr').remove();  // Remove hr row
                $('#' + rpyId).remove();             // Remove comment row
   
			}
		}, error: function(e){
			console.log(e);
		} 
	})
}

function replyCount(rpyId){
	$.ajax({
		url: '<c:url value = "/delReply" />',
		type: 'POST',
		data: JSON.stringify({"rpyId": rpyId}),
		contentType: 'application/json',
		dataType: "text",
		success: function(res){
			if(res == 'success'){
				$('#' + rpyId).next('tr').remove();  // Remove hr row
                $('#' + rpyId).remove();             // Remove comment row
			}
		}, error: function(e){
			console.log(e);
		} 
	})
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
</script>    
</body>

</html>