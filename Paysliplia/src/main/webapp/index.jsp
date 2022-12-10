<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index(LoginPage)</title>
 <link href="css_design/index_design.css" rel="stylesheet">
</head>
<body>
<div class="index_container">
<form name="replyForm">
<h1>PAYSLIP</h1>
	<ul>
		<li>ID&nbsp;&nbsp;<input type="text" name="worker_id" class="inputBox" id="id" autofocus="autofocus"></li>
		<li>PW <input type="password" name="pwd" class="inputBox" id="pwd"> </li>
		<li><input type="submit" value="로그인" class="inputBtn" onclick="check(); return false;">
		<input type="button" value="회원가입" onclick="location.href='workerSignUp.jsp'" class="inputBtn"></li>
	</ul>	
</form>
</div>
<div class="bottom_container">
<a onclick="findid()" class="findid_Btn"> 아이디 찾기</a>
<a onclick="findpassword()" class="findpwd_Btn"> 비밀번호 찾기</a>
</div>
<script type="text/javascript">
  function findid(){
		var url="workerGetId.jsp";
		
		window.open(url, "_blank_1",  "width = 350px, height = 250px, top = 100, left = 585, location = no");
	}
  
  function findpassword(){
	  var url="workerGetPwd.jsp";
	  
	  window.open(url, "_blank_1",  "width = 350px, height = 250px, top = 100, left = 585, location = no");
  }
  
  function check() {
      var id = document.getElementById("id").value;
      var pwd = document.getElementById("pwd").value;
      if (id.length == 0 || id == "") {
          alert("아이디를 입력해 주세요.");
          return false;
      }
      if (pwd.length == 0 || pwd == "") {
          alert("비밀번호를 입력해 주세요.");
          return false;
      }else{
    		
    	  document.replyForm.action="login.do";
    	  document.replyForm.method="post";
    	  document.replyForm.submit();
      }
     
      
  } 
  
  
  </script>
</body>
</html>
