<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="css_design/table_design.css" rel="stylesheet">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

$.fn.serializeObject = function()

{
   var o = {};
   var a = this.serializeArray();
   $.each(a, function() {
       if (o[this.name]) {
           if (!o[this.name].push) {
               o[this.name] = [o[this.name]];
           }
           o[this.name].push(this.value || '');
       } else {
           o[this.name] = this.value || '';
       }
   });
   return o;
};

   function addWorker(){
      if($("#worker_id").val()==""){
         alert('아이디를 입력하세요.');
         $("#worker_id").focus();
         return;
      }else if($("#pwd").val()==""){
         alert('비밀번호를 입력하세요.');
         $("#pwd").focus();
         return;
      }else if($("#name").val()==""){
          alert('이름을 입력하세요.');
          $("#name").focus();
          return;
       }else if($("#phone").val()==""){
           alert('휴대폰번호를 입력하세요.');
           $("#phone").focus();
           return;
        }else if($("input[name=gender]:checked").val()==undefined){
            alert('성별을 선택하세요.');
            $("#gender").focus();
            return;
         }else if($("#age").val()==""){
             alert('나이를 입력하세요.');
             $("#age").focus();
             return;
          }
      
      var formData = $("#form1").serializeObject();
      $.ajax({
          url:"http://localhost:8090/biz/addWorkerAjax.do",
          type:"post",
          data: JSON.stringify(formData),
          dataType: "json",
          contentType: "application/json",
          success(data){
             alert("회원가입이 완료되었습니다.");
             location.href = "index.jsp";
          },
          error:function(){
             alert('전송 실패');
          }
       });
      
   }
</script>
</head>
<body>
<div class="index_container">
<form id="form1" onSubmit="return false;">
<table>
<h3>근무자 등록 회원가입</h3>
<tr>
	<td>아이디</td>
	<td> <input type="text" id="worker_id" name="worker_id" class="inputBox"> </td>
</tr>
<tr>
	<td>비밀번호</td>
	<td> <input type="password" id="pwd" name="pwd" class="inputBox"> </td>
</tr>
<tr>
	<td>이름</td>
	<td> <input type="text" id="name" name="name" class="inputBox"> </td>
</tr>
<tr>
	<td>핸드폰번호</td>
	<td>  <input type="text" id="phone" name="phone" placeholder="-하이푼 없이 입력해주세요" class="inputBox"> </td>
</tr>
<tr>
	<td>성별</td>
	<td> <input type="radio" id="gender" name="gender" value="0">남
		<input type="radio" id="gender" name="gender" value="1">여
	 </td>
</tr>
<tr>
	<td>나이</td>
	<td>  <input type="number" id="age" name="age"> </td>
</tr>
<tr>
	<td colspan="2"><button onclick="addWorker()" class="inputBtn">회원가입</button></td>
</tr>
</table>
</form>

</div>

<br>

</body>
</html>