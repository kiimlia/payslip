<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스케줄 수정 </title>
<link href="css_design/header_design.css" rel="stylesheet">
<link href="css_design/pop_design.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
<%
	String start_date = request.getParameter("work_start_date");
	String[] sd_split = start_date.split("T");
	String end_date = request.getParameter("work_end_date");
	String[] ed_split = end_date.split("T");
%>
   function scheduleUpdate(){
	   if ($("#start_date").val() == '') {
		   alert("시작일을 선택하세요.");
		   return;
	   } else if ($("#start_time").val() == '') {
		   alert("시작시간을 선택하세요.");
		   return;
	   } else if ($("#end_date").val() == '') {
		   alert("종료일을 선택하세요.");
		   return;
	   } else if ($("#end_time").val() == '') {
		   alert("종료시간을 선택하세요.");
		   return;
	   }
	   
	   var seq="<%=request.getParameter("seq")%>";
	   var name = $("#name").val();
	   var work_start_date = $("#start_date").val() + "T" + $("#start_time").val();
	   var work_end_date = $("#end_date").val() + "T" + $("#end_time").val();
	   
	   var data = {"seq":seq,"name" : name, "work_start_date" : work_start_date, "work_end_date" : work_end_date};
	   
	   
	  
	   
		   $.ajax({
		          url:"http://localhost:8090/biz/scheduleUpdateAjax.do",
		          type:"post",
		          data: JSON.stringify(data),
		          dataType: "json",
		          contentType: "application/json",
		          async: false,//동기식으로 한다.
		          success(data){
		        		  alert("스케줄 수정이 완료되었습니다.");
		        		  opener.window.location.reload();
				          window.close();
		          },
		          error:function(){
		             alert('전송 실패');
		          }
		       });
	   
   }
</script>
</head>
<body>
   <table>
      <tr>
         <td>이름</td>
         <td><input type="text" id="name" value="<%=request.getParameter("name")%>" disabled></td>
      </tr>
      <tr>
         <td>근무시작일</td>
         <td><input type="date" id="start_date" value="<%=sd_split[0]%>"><input type="time" id="start_time" value="<%=sd_split[1]%>"></td>
      </tr>
      <tr>
         <td>근무종료일</td>
         <td><input type="date" id="end_date" value="<%=ed_split[0]%>"><input type="time" id="end_time" value="<%=ed_split[1]%>"></td>
      </tr>
      
      
      <tr>
         <td colspan="2"><input type="submit" value="등록" onclick="scheduleUpdate()"></td>
      </tr>
   </table>
</body>
</html>