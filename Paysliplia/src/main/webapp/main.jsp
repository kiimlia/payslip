<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport"
   content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link
   href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css'
   rel='stylesheet' />
<link href="css_design/header_design.css" rel="stylesheet">
<script
   src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
   src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.min.js'></script>
<link href="css_design/main_design.css" rel="stylesheet">
</head>
<body>

   <header>
      <jsp:include page="include/menu.jsp" />
   </header>
   <!-- calendar 태그 -->
   <div id='calendar-container'>
      <div id='calendar'></div>
   </div>
   <script>
  (function(){
    $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '700px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek',
        },
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
//            var title = prompt('Event Title:');
           var title = location.href='index.jsp#'+allDay;
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            })
          }
          calendar.unselect()
        },
        // 이벤트 
        events: [
           <c:forEach var="schedule" items="${scheduleList}">
             {
                title: "${schedule.name}-" + ("${schedule.work_end_date}".substring(11, 13) - "${schedule.work_start_date}".substring(11, 13)) + "시간",
                start: "${schedule.work_start_date}",
                end: "${schedule.work_end_date}",
                extendedProps: {
                    name: "${schedule.name}",
                    seq: "${schedule.seq}",
                    work_start_date:"${schedule.work_start_date}",
                    work_end_date:"${schedule.work_end_date}"
                  },
             },

           </c:forEach>
        ],

       eventClick:function(info){ 
    	   console.log(info.event.extendedProps);//캘린더에서 제공하는 변수명으로만 값을 넘겨주고 받을 수 있음
    	   var schedule = info.event.extendedProps;
    	   var name = schedule.name;
    	   var seq = schedule.seq;
    	   var work_start_date=schedule.work_start_date;
    	   var work_end_date=schedule.work_end_date;
    	   
    	   console.log(name);
    	   console.log(seq);
          var url = "scheduleUpdate.jsp";
           var option = "width = 600, height = 500, top = 100, left = 200, location = no"
           window.open("", "update", option);
           
          var formPopup = document.formPopup;
          formPopup.action = url;
          formPopup.target = "update";
          formPopup.seq.value = seq;
          formPopup.name.value = name;
          formPopup.work_start_date.value = work_start_date;
          formPopup.work_end_date.value = work_end_date;
          formPopup.submit();
           

      },
      
      });
      // 캘린더 랜더링
      calendar.render();
    });
  })();
  
  
 
</script>

	<form name="formPopup">
		<input type="hidden" name="seq">
		<input type="hidden" name="name">
		<input type="hidden" name="work_start_date">
		<input type="hidden" name="work_end_date">
	</form>
</body>
</html>