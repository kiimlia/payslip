<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근무자 등록</title>
<link href="css_design/header_design.css" rel="stylesheet">
<link href="css_design/insert_design.css" rel="stylesheet">
</head>
<body>
   <form action="insertWorker.do" method="post">
   <table>
   	  <tr>
         <td>아이디</td>
         <td><input type="text" id="worker_id" name="worker_id"></td>
      </tr>
      <tr>
         <td>이름</td>
         <td><input type="text" id="name"></td>
      </tr>
      <tr>
         <td>핸드폰번호</td>
         <td><input type="text" id="phone" placeholder="숫자만 입력해주세요">
         </td>
      </tr>
      <tr>
         <td>성별</td>
         <td><input type="radio" name="gender" value="0">남 <input
            type="radio" name="gender" value="1">여</td>
      </tr>
      <tr>
         <td>나이</td>
         <td><input type="text" id="age"></td>
      </tr>
      
      <tr>
         <td colspan="2"><input type="submit" value="등록"></td>
      </tr>

   </table>
   </form>
</body>
</html>