<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
num1 : <input type="text" name="num1" id="num1"> + 
num2 : <input type="text" name="num2" id="num2"> = 
<div id="result"></div><br>
<button onclick="calc()">계산</button>
<script>
function calc(){
	var num1 = document.querySelector('#num1').value;
	var num2 = document.querySelector('#num2').value;
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '/views/cal_ok?num1=' + num1 + '&num2=' + num2);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				//var res = JSON.parse(xhr.response);
				document.querySelector('#result').innerHTML = xhr.response;
			}
		}
	}
	xhr.send();
}
</script>
</body>
</html> 