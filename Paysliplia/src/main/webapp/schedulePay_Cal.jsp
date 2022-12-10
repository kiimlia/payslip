<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여관리</title>
<link href="css_design/header_design.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<script type="text/javascript">
function pay_Cal(worker_no, name){
	 var url = "workerPay_Cal.jsp";
      var option = "width = 600, height = 500, top = 100, left = 200, location = no"
      window.open("", "popup", option);
      
      var formPopup = document.formPopup;
      formPopup.action = url;
      formPopup.target = "popup";
      formPopup.worker_no.value = worker_no;
      formPopup.name.value = name;
      formPopup.submit();
}
</script>
<body>

	<header>
		<jsp:include page="include/menu.jsp" />
	</header>
	 <div align="center">
   <table class="table text-center" style="width: 85%;">
		<tr style="vertical-align:middle;">
			<th class="text-center">번호</th>
			<th class="text-center">이름</th>
			<th class="text-center">총 근무시간(당월)</th>
			<th class="text-center">시급</th>
			<th class="text-center">총 급여</th>
			<th class="text-center">비고</th>
		</tr>
		<c:choose>
			<c:when test="${empty workerList}">
			</c:when>
			<c:otherwise>
			<c:forEach items="${workerList }" var="worker" varStatus="status">
			
		<tr>
					<td>${worker.worker_no }</td>
					<td>${worker.name }</td>
					<td>60시간</td>
					<td>10,000</td>
					<td>1,000,000</td>
					<td>
					<button class="btn btn-outline-dark" onclick="pay_Cal(${worker.worker_no},'${worker.name}')">자세히보기</button>
					</td>
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