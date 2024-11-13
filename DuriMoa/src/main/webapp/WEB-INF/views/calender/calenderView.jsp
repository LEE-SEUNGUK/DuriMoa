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

#map {
	width: 300px;
	height: 300px;
	display: none;
}

#travelAddForm {
	max-height: 1300px; /* Adjust this value as needed */
	margin: 0 auto;
}

#travelTitle, #travelDestination, #travelDate {
	height: 38px;
	border: none;
	outline: 1px solid #8989896c;
	box-shadow: none !important;
}

#travelDestination {
	cursor: pointer;
}

#travelTitle:hover {
	outline: 1px solid #0000009e;
	transition: outline 0.5s;
}

#travelDestination:hover {
	outline: 1px solid #0000009e;
	transition: outline 0.5s;
}

#travelDate:hover {
	outline: 1px solid #0000009e;
	transition: outline 0.5s;
}

#travelTitle:focus {
	transition: all 0.01s;
	outline: 2px solid #0000009e !important;
}

#travelDestination:focus {
	transition: all 0.01s;
	outline: 2px solid #0000009e !important;
}

#travelDate:focus {
	transition: all 0.01s;
	outline: 2px solid #0000009e !important;
}

#searchAddress {
	background: #c4ddc0;
	border: none;
	outline: 1px solid #8989896c;
	color: black;
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

.travelBtn {
	background-color: #c4ddc0 !important;
	height: 38px !important;
	color: black !important;
	border: none !important;
	opacity: 0.9;
}

.travelBtn:hover {
	opacity: 1.0;
	transition: 0.5s;
}

#searchAddress {
	opacity: 0.9;
}

#searchAddress:hover {
	opacity: 1.0;
	transition: 0.5s;
}

#singleDayTrip {
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

#singleDayTrip:checked+label::before {
	background-color: #c4ddc0;
	color: #000000;
	outline: none;
	border-color: transparent;
}

label:hover::before, #singleDayTrip:hover+label::before {
	border-color: #0000006c;
	transition: all 0.3s;
}

.fc-day-sun .fc-col-header-cell-cushion, .fc-day-sun a {
	color: #ff4a4a !important;
}

.fc-day-sat .fc-col-header-cell-cushion, .fc-day-sat a {
	color: #ff6b6b !important;
}

.fc-today-button {
	background-color: #ff6b6b !important;
}

.fc .fc-button-primary{
	outline: none;
	border: none !important;
}

.fc-event{
	padding-left: 20px;
	border: none;
	outline: none;
	box-shadow: none;
}

.fc .fc-toolbar.fc-header-toolbar {
	padding: 10px 20px;
	font-size: 12px;
	font-weight: 500;
	background-color: #ffdbdb !important;
	border-radius: 20px;
}

.fc-prev-button, .fc-next-button{
	background-color: transparent !important;
	color: #ff6b6b !important;
}

.fc-button:focus{
	box-shadow: none !important;
}

.fc-button-primary:focus{
	box-shadow: none !important;
}

tbody[role="presentation"]{
	cursor: pointer;
}

#save, #edit{
	background-color: #c4ddc0 !important;
	color: black;
	border: none;
	opacity: 0.9;
}

#del{
	opacity: 0.9;
}

#save:hover, #edit:hover, #del:hover{
	opacity: 1;
	transition: 0.5s;
}


</style>
</head>
<body>
	<jsp:include page="/WEB-INF/inc/header.jsp"></jsp:include>
	<div style="padding: 0 !important; width: 1920px; margin: 0 auto;">
		<div style="width: 1420px; margin: 0 auto; position: relative;">
			<div class="row">
				<section class="mypage_side col-2 p-0" style="margin-top: 6%;">
					<div class="mb-4">
						<h2>여행 일정</h2>
						<p>여행 일정을 관리해보세요</p>
					</div>
				</section>
				<section class="col-9" style="margin-top: 4%; margin-left: 100px;" id="viewMode">
					<div id='calendar' style="width: 90%; height: 90%;"></div>
				</section>
			</div>
		</div>
	</div>
	<!-- 모달 -->
	<div class="modal fade" id="addEventModal" tabindex="-1" aria-labelledby="addEventModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content p-4">
				<div class="modal-header pt-0">
					<h5 class="modal-title" id="addEventModalLabel" style="padding-top: 0px !important;">일정 추가</h5>
				</div>
				<div class="modal-body p-1">
					<form id="scheduleAdd">
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
						<div class="my-4" id="map" style="margin: 0 auto;"></div>
						<input type="hidden" id="coordinateX" name="trvX"> <input type="hidden" id="coordinateY" name="trvY">
						<div class="mb-3">
							<label for="travelDate" class="form-label">날짜</label> <input type="text" name="trvDt" class="form-control" id="travelDate" placeholder="여행 날짜를 선택하세요">
							<div class="form-check mt-2" style="padding-left: 0px">
								<input class="form-check-input" type="checkbox" id="singleDayTrip" checked> <label class="form-check-label" for="singleDayTrip"> 당일 여행 </label>
							</div>
						</div>
						<div class="d-flex justify-content-end">
							<input type="hidden" name="memId" id="memId">
							<button type="submit" class="btn btn-primary" id="save">저장</button>
							<button type="button" class="btn btn-secondary" id="edit" data-cal-id="" style="display:none;">수정</button>
							<button type="button" class="btn btn-danger ms-2" id="del" data-cal-id="" style="display:none;">삭제</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		let calendar, map, marker, geocoder, selectedDate;
		
		$(document).ready(function(){
	
			initializeMap();
				
			$('#travelDestination').click(function(){
			    $('#searchAddress').click();
			})
			
			$('#searchAddress').click(execDaumPostcode);
			
			// 모달이 닫힐 때 폼 초기화
		    $('#addEventModal').on('hidden.bs.modal', function () {
		        // 폼 초기화
		        $('#scheduleAdd')[0].reset(); // 폼 필드 초기화
		        $('#map').hide();
		    });
			
		    $('#scheduleAdd').submit(function(e) {
		        e.preventDefault();
		        var datevalue = $('#travelDate').val();
		       
		        if (!$('#singleDayTrip').is(':checked') && datevalue.includes('~')) {
		            var dates = datevalue.split('~').map(date => date.trim());
		            calSdt = dates[0];
		            calEdt = dates[1];
		        } else {
		            // Single date
		            calSdt = datevalue;
		            calEdt = datevalue;
		        }
		        
		        var data = {
		        		calTt: $('#travelTitle').val(),
		        		calPc: $('#travelDestination').val(),
		        		calX: $('#coordinateX').val(),
		        		calY: $('#coordinateY').val(),
		                memId: '${sessionScope.login.memId}',
		                calSdt: calSdt,
		                calEdt: calEdt
		            };
		        
		        console.log(data);
		        
		        $.ajax({
		            url: '/calenderAdd',
		            type: 'POST',
		            contentType: 'application/json', // JSON 형식으로 전송
		            data: JSON.stringify(data), // 객체를 JSON 문자열로 변환
		            dataType: 'json',
		            success: function(response) {
		            	console.log('Success:', response);
		                alert('일정이 성공적으로 저장되었습니다!');
		                addEventToCalendar(response);
		                $('#addEventModal').modal('hide'); // 모달 닫기
		                
		            },
		            error: function(xhr, status, error) {
		                console.error('Error:', error);
		                alert('일정 저장 중 오류가 발생했습니다.');
		            }
		        });
		    });
		    
		    $('#travelDate').daterangepicker({
		    	singleDatePicker: true, // Start with single date picker
		        autoApply: true,
		        showDropdowns: true,
		        locale: {
		            format: 'YYYY-MM-DD',
		            separator: ' ~ ',
		            daysOfWeek: ['일', '월', '화', '수', '목', '금', '토'],
		            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        },
		        showCustomRangeLabel: false,
		        linkedCalendars: false, 
		    });
		    
		 	// 체크박스 변경 이벤트
		    $('#singleDayTrip').change(function() {
		    	let isSingleDay = $(this).is(':checked');
		        let picker = $('#travelDate').data('daterangepicker');
		        let currentStartDate = picker.startDate;
		        let currentEndDate = picker.endDate;
		        
		        if (isSingleDay) {
		            // Single day trip mode - keep the start date only
		            picker.singleDatePicker = true;
		            picker.minDate = moment(currentStartDate);
		            picker.maxDate = moment(currentStartDate);
		            picker.setStartDate(currentStartDate);
		            picker.setEndDate(currentStartDate);
		            $('#travelDate').val(currentStartDate.format('YYYY-MM-DD'));
		        } else {
		            // Multi-day trip mode - restore the date range if existed, otherwise use start date
		            picker.singleDatePicker = false;
		            picker.minDate = moment(currentStartDate);
		            picker.maxDate = null;
		            
		            // If we already had a date range, restore it
		            if (currentStartDate.format('YYYY-MM-DD') !== currentEndDate.format('YYYY-MM-DD')) {
		                picker.setStartDate(currentStartDate);
		                picker.setEndDate(currentEndDate);
		                $('#travelDate').val(currentStartDate.format('YYYY-MM-DD') + ' ~ ' + currentEndDate.format('YYYY-MM-DD'));
		            } else {
		                // If it was a single day, keep that date as the start date
		                picker.setStartDate(currentStartDate);
		                picker.setEndDate(currentStartDate);
		                $('#travelDate').val(currentStartDate.format('YYYY-MM-DD') + ' ~ ' + currentStartDate.format('YYYY-MM-DD'));
		            }
		        }
		        // 기존 달력 다시 보여주기
		        picker.updateView();
		        picker.showCalendars();
		    });
		 	
		    $('#travelDate').data('daterangepicker').setStartDate(selectedDate);
		});
		
		
		document.addEventListener('DOMContentLoaded', function () {
			
			// JSON 문자열을 JavaScript 객체로 파싱
		    const calendarData = ${calendarList};
		    const calendarEvents = calendarData.map(event => {
		        // 날짜 형식 변환 (2024-11-12 00:00:00 -> 2024-11-12)
		        const startDate = event.calSdt.split(' ')[0];
		        const endDate = event.calEdt.split(' ')[0];
		        
		        const duration = moment(endDate).diff(moment(startDate), 'days'); // 지속 시간 계산
		        
		        let backgroundColor;
		        if (duration < 1) {
		            backgroundColor = '#ff9f9f'; // 1일 미만
		        } else {
		            backgroundColor = '#fc8888'; // 1일 이상 2일 미만
		        }
		        
		        return {
		            title: event.calTt,
		            start: startDate,
		            end: moment(endDate).add(1, 'days').format('YYYY-MM-DD'), // 종료일을 하루 더해서 표시
		            backgroundColor: backgroundColor, // 색상 추가
		            extendedProps: {
		            	calId: event.calId,
		                location: event.calPc,
		                coordinateX: event.calX,
		                coordinateY: event.calY
			            }
			        };
			    });
		    		    
				var calendarEl = document.getElementById('calendar');
					calendar = new FullCalendar.Calendar(calendarEl, {
					initialView: 'dayGridMonth',
					selectable: true,
					select: function (info) {
						clearModal();
				        $('#travelDate').val(info.startStr);
				        selectedDate = info.startStr;
				        var picker = $('#travelDate').data('daterangepicker');
				        picker.singleDatePicker = true;
				        picker.minDate = moment(info.startStr);
				        picker.maxDate = moment(info.startStr);
				        picker.setStartDate(moment(info.startStr));
				        picker.setEndDate(moment(info.startStr));
				        $('#addEventModalLabel').text('일정 추가');
				        $('#save').show();
				        $('#edit').hide();
				        $('#del').hide();
				        $('#searchAddress').show();
				        $('#addEventModal').modal('show');
					},
					eventClick: function(info){
						clearModal();
				        const event = info.event;
				        
				        // Update modal title
				        $('#addEventModalLabel').text('일정 상세');
				        
				        $('#save').hide();
				        $('#edit').show(); // 수정 버튼 보이기
				        $('#del').show(); // 삭제 버튼 보이기
				        
				        $('#edit').attr('data-cal-id', event.extendedProps.calId);
				        $('#del').attr('data-cal-id', event.extendedProps.calId);

				     	// Get date range picker instance
				        var picker = $('#travelDate').data('daterangepicker');
				     	
				     	// Format date range
				        const startDate = moment(event.start).format('YYYY-MM-DD');
				        const endDate = moment(event.end).subtract(1, 'days').format('YYYY-MM-DD');
				        console.log(startDate);
				        
				     // Check if it's a single day event
				        if (startDate === endDate) {
				            // Single day event
				            $('#singleDayTrip').prop('checked', true);
				            picker.singleDatePicker = true;
				            picker.minDate = moment(startDate);
				            picker.maxDate = moment(startDate);
				            picker.setStartDate(moment(startDate));
				            picker.setEndDate(moment(startDate));
				            $('#travelDate').val(startDate);
				        } else {
				            // Multi-day event
				            $('#singleDayTrip').prop('checked', false);
				            picker.singleDatePicker = false;
				            picker.minDate = moment(startDate);
				            picker.maxDate = null;
				            picker.setStartDate(moment(startDate));
				            picker.setEndDate(moment(startDate));
				            $('#travelDate').val(startDate + ' ~ ' + endDate);
				        }
				        
				        // Fill in event details
				        $('#travelTitle').val(event.title);
				        $('#travelDestination').val(event.extendedProps.location);
				        
				        
				        if (startDate === endDate) {
				            $('#travelDate').val(startDate);
				            $('#singleDayTrip').prop('checked', true);
				        } else {
				            $('#travelDate').val(startDate + ' ~ ' + endDate);
				            $('#singleDayTrip').prop('checked', false);
				        }
				        
				        // Update map if coordinates exist
				        if (event.extendedProps.coordinateX && event.extendedProps.coordinateY) {
				            $('#coordinateX').val(event.extendedProps.coordinateX);
				            $('#coordinateY').val(event.extendedProps.coordinateY);
				            
				            const coords = new kakao.maps.LatLng(
				                event.extendedProps.coordinateY, 
				                event.extendedProps.coordinateX
				            );
				            
				            setTimeout(function(){ map.relayout();}, 200);
				            setTimeout(function(){ map.setCenter(coords);}, 200);
				            setTimeout(function(){ marker.setPosition(coords);}, 200);
				            $('#map').show();
				        }
				        
				        $('#addEventModal').modal('show');
					},
					events: calendarEvents,
					locale: 'ko',
					dayCellContent: function (arg) {
						return arg.date.getDate();
					},
				});
			calendar.render();
		});
		
		// 새 일정 추가
		function addEventToCalendar(eventData) {
		    const startDate = eventData.calSdt.split(' ')[0];
		    const endDate = eventData.calEdt.split(' ')[0];
		    
		    const duration = moment(endDate).diff(moment(startDate), 'days'); // 지속 시간 계산
	        
		    let backgroundColor;
	        if (duration < 1) {
	            backgroundColor = '#ff9f9f'; // 1일 미만
	        } else {
	            backgroundColor = '#fc8888'; // 1일 이상 2일 미만
	        }
		    
		    const newEvent = {
		        title: eventData.calTt,
		        start: startDate,
		        end: moment(endDate).add(1, 'days').format('YYYY-MM-DD'),
	            backgroundColor: backgroundColor, // 색상 추가
		        extendedProps: {
		        	calId: eventData.calId,
		            location: eventData.calPc,
		            coordinateX: eventData.calX,
		            coordinateY: eventData.calY
		        }
		    };
		    
		    calendar.addEvent(newEvent);
		}
		
				// Execute Daum Postcode function
		function execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            var addr = data.address;
		            $('#travelDestination').val(addr);
		
		            geocoder.addressSearch(data.address, function(results, status) {
		                if (status === kakao.maps.services.Status.OK) {
		                    var result = results[0];
		                    var coords = new kakao.maps.LatLng(result.y, result.x);
		
		                    $('#coordinateX').val(result.x);
		                    $('#coordinateY').val(result.y);
		
		                    $('#map').show();
		                    $('#photoDiv').show();
		                    map.relayout();
		                    map.setCenter(coords);
		                    marker.setPosition(coords);
		                }
		            });
		        }
		    }).open();
		}
				
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
		
		function clearModal() {
		    $('#scheduleAdd')[0].reset();
		    $('#map').hide();
		    $('#coordinateX').val('');
		    $('#coordinateY').val('');
		}
		
		$('#edit').click(function(){
			var calId = $(this).data('cal-id');
			editEvent(calId);
		})
		
		$('#del').click(function(){
			var calId = $(this).data('cal-id');
			deleteEvent(calId);
		})
		
		function editEvent(calId) {
		    var datevalue = $('#travelDate').val();
		    var calSdt, calEdt;
		    
		    if (!$('#singleDayTrip').is(':checked') && datevalue.includes('~')) {
		        var dates = datevalue.split('~').map(date => date.trim());
		        calSdt = dates[0];
		        calEdt = dates[1];
		    } else {
		        calSdt = datevalue;
		        calEdt = datevalue;
		    }
		    
		    var data = {
		        calId: calId,
		        calTt: $('#travelTitle').val(),
		        calPc: $('#travelDestination').val(),
		        calX: $('#coordinateX').val(),
		        calY: $('#coordinateY').val(),
		        calSdt: calSdt,
		        calEdt: calEdt
		    };
		    
		    $.ajax({
		        url: '/calenderUpdate',
		        type: 'POST',
		        contentType: 'application/json',
		        data: JSON.stringify(data),
		        dataType: 'json',
		        success: function(response) {
		            alert('일정이 성공적으로 수정되었습니다!');
		            calendar.getEvents().forEach(event => {
	                if (event.extendedProps.calId == calId) {
	                    event.remove();
		                }
		            });
		            addEventToCalendar(response);
		            $('#addEventModal').modal('hide');
		        },
		        error: function(xhr, status, error) {
		            console.error('Error:', error);
		            alert('일정 수정 중 오류가 발생했습니다.');
		        }
		    });
		}

		function deleteEvent(calId) {
		    if (confirm('일정을 삭제하시겠습니까?')) {
		        $.ajax({
		            url: '/calenderDel',
		            type: 'POST',
		            contentType: 'application/json',
		            data: JSON.stringify({ calId: calId }),
		            dataType: 'json',
		            success: function(response) {
		                alert('일정이 성공적으로 삭제되었습니다!');
		                calendar.getEvents().forEach(event => {
		                if (event.extendedProps.calId == calId) {
		                    event.remove();
			                }
			            });
			            $('#addEventModal').modal('hide');
		            },
		            error: function(xhr, status, error) {
		                console.error('Error:', error);
		                alert('일정 삭제 중 오류가 발생했습니다.');
		            }
		        });
		    }
		}
	</script>
</body>
</html>