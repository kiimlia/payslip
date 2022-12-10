<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근무자관리</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="css_design/header_design.css" rel="stylesheet">
<script type="text/javascript">
	//급여정산
// 	function pay_Cal(){
// 		 var url = "schedulePay_Cal.jsp";
// 	       var option = "width = 600, height = 500, top = 100, left = 200, location = no"
// 	       window.open("", "update", option);
	       
// 	       var formPopup = document.formPopup;
// 	       formPopup.action = url;
// 	       formPopup.target = "update";
// 	       //
// 	       formPopup.worker_no.value = worker_no;
// 	       formPopup.name.value = name;
// 	       formPopup.submit();
// 	}

   //스케줄 수정 팝업
   function scheduleUpdate(seq,worker_no, name){
	                       //매개변수 seq추가
          var url = "scheduleUpdate.jsp";
           var option = "width = 600, height = 500, top = 100, left = 200, location = no"
           window.open("", "popup", option);
           
          var formPopup = document.formPopup;
          formPopup.action = url;
          formPopup.target = "popup";
          formPopup.seq.value = seq;
          formPopup.name.value = name;
          formPopup.work_start_date.value = work_start_date;
          formPopup.work_end_date.value = work_end_date;
          formPopup.submit();
   }
   //스케줄등록 팝업
   function addSchedule(worker_no, name){
	                   //매개변수 seq추가
	   console.log(worker_no, name);
	   var url = "scheduleAdd.jsp";
       var option = "width = 600, height = 500, top = 100, left = 200, location = no"
       window.open("", "popup", option);
       
       var formPopup = document.formPopup;
       formPopup.action = url;
       formPopup.target = "popup";
       //
       formPopup.worker_no.value = worker_no;
       formPopup.name.value = name;
       formPopup.submit();
   }
</script>
</head>
<body>
   <header>
      <jsp:include page="include/menu.jsp" />
   </header>
   <div align="center">
   <table class="table text-center" style="width: 85%;">
		<tr style="vertical-align:middle;">
			<th class="text-center">번호</th>
			<th class="text-center">아이디</th>
			<th class="text-center">이름</th>
			<th class="text-center">휴대폰번호</th>
			<th class="text-center">성별</th>
			<th class="text-center">나이</th>
			<th class="text-center">근무시작일</th>
			<th class="text-center">계약서관리</th>
			<th class="text-center">스케줄</th>
			<th class="text-center">급여</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty workerList}">
			<tr>
				<td align="center" colspan="9">등록된 근무자가 없습니다.</td>
			</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${workerList }" var="worker" varStatus="status">
				<tr>
					<td>${worker.worker_no }</td>
					<td>${worker.worker_id}</td>
					<td>${worker.name }</td>
					<td>${worker.phone }</td>
					<td>
						<c:if test="${worker.gender==0}">남자</c:if>
						<c:if test="${worker.gender==1}">여자</c:if>
					</td>
					<td>${worker.age }</td>
					<td>${worker.join_date }</td>
					<td>O</td>
<%-- 					<td><button class="btn btn-outline-dark" onclick="scheduleList">스케줄 수정</button></td> --%>
<!-- 							스케줄 수정 누르면 리스트 나오고 해당 스케줄 누르면 수정창나오게 추후에 하기(+페이지처리도) -->
					<td><button class="btn btn-outline-dark" onclick="addSchedule(${worker.worker_no}, '${worker.name}')">스케줄 등록</button></td>
					<td><button class="btn btn-outline-dark" onclick="location.href='schedulePay_Cal.do'">급여관리</button></td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		
	</div>	
	<form name="formPopup">
		<input type="hidden" name="worker_no">
		<input type="hidden" name="name">
	</form>

	
</body>
</html>