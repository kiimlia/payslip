<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css_design/pop_design.css" rel="stylesheet">
<title>아이디 찾기</title>
</head>
<body>

	<form method="post" class="popContainer" action="find_id.do"
		name="findform">
		<ul>
			<li><h4>아이디 찾기</h4></li>
			<li>이름&nbsp;<input type="text" id="name" name="name" class="inputBox" /></li>
			<li>휴대폰 번호&nbsp;<input type="text" id="phone" name="phone" class="inputBox" /></li>
			<li><input type="submit" value="확인" class="inputBtn"></li>
		</ul>
		<!-- 이름과 전화번호가 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<script>
				opener.document.findform.name.value = "";
				opener.document.findform.phone.value = "";
			</script>
			<label>일치하는 정보가 존재하지 않습니다.</label>
		</c:if>

		<!-- 이름과 비밀번호가 일치 -->
		<c:if test="${check == 0 }">
			<label>찾으시는 아이디는' ${id}' 입니다.</label>
			<div>
				<input type="button" value="OK" onclick="closethewindow()">
			</div>
		</c:if>

	</form>

	<script type="text/javascript">
		function closethewindow() {
			self.close();
		}
	</script>
</body>
</html>
