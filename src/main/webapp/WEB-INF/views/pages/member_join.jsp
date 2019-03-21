<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://fonts.googleapis.com/css?family= Noto + Sans + KR "
	rel="stylesheet">

<script src="${pageContext.request.contextPath}/static/js/rsa.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jsbn.js"></script>
<script src="${pageContext.request.contextPath}/static/js/prng4.js"></script>
<script src="${pageContext.request.contextPath}/static/js/rng.js"></script>

<style>
body {
	background-color: black;
}

form {
	width: 100%;
	height: 100%;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

button {
	background-color: #DF01D7;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
}

.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
}

img.avatar {
	width: 30%;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

.w3-row-padding img {
	margin-bottom: 12px
}

.w3-sidebar {
	width: 120px;
	background: #222;
}

#join_logo {
	position: relative;
	top: 3%;
	left: 35%;
	width: 40%;
}

#input {
	position: relative;
	top: 80%;
	left: 35%;
	width: 40%;
	height: 30%;
	size: 10;
	font-family: Agency FB;
	color: #FFD966;
	font-size: 21px;
}

.w3-col {
	width: 50px;
}

#join_button {
	position: relative;
	left: 39.5%;
	width: 36%;
	font-size: 20px;
	color: black;
	background-color: #FFD966;
	font-family: Agency FB;
}

#gender {
	position: relative;
	left: 30%;
}

#f_id {
	width: 80%;
}

</style>

<body class="w3-black">
	<div>
		<div class="w3-container w3-card-10  w3-text-purple w3-margin">
			<img src="${pageContext.request.contextPath}/static/img/r_join.png"
				id="join_logo">
			<c:url var="join" value="/member_join" />
			<form action="${join}" method="post" name="frm" id="form_sub">
				<!-- 이름 -->
				<div id="input">
					<div class="w3-row w3-section">
						<div class="w3-col">
							<i class="w3-xxlarge fa fa-user" style="color: #FFD966;"></i>
						</div>
						<div class="w3-rest">
							&nbsp;NAME <input class="w3-input w3-border" name="f_name"
								type="text" placeholder="Lee jun pyo" required="required"
								style="color: black;">
						</div>
					</div>
					<!-- 아이디-->
					<div class="w3-row w3-section">
						<div class="w3-col">
							<i class="w3-xxlarge fa fa-address-card-o"
								style="color: #FFD966;"></i>
						</div>
						<div class="w3-rest">
							&nbsp;ID<br>
							<input class="w3-input w3-border" id="f_id" name="f_id"
								type="text" placeholder="hello" required="required"
								style="color: black;">

							<button onclick="idCheck()" form=""
								style="background-color: #DF01D7;" id="check">Check</button>

							<div id="no" style="display: none;">
								<h5 style="color: #DF0101;">중복된 아이디입니다.</h5>
							</div>
							<div id="yes" style="display: none;">
								<h5 style="color: #FFD966;">사용 가능한 아이디입니다.</h5>
							</div>
						</div>
					</div>

					<!-- PW -->
					<div class="w3-row w3-section">
						<div class="w3-col">
							<i class="w3-xxlarge fa fa-asterisk" style="color: #FFD966;"></i>
						</div>
						<div class="w3-rest">
							&nbsp;PW <input class="w3-input w3-border" name="f_pw"
								type="password" placeholder="passowrd" required="required"
								style="color: black;">
						</div>
					</div>

					<!-- 생년월일 -->
					<div class="w3-row w3-section">
						<div class="w3-col">
							<i class="w3-xxlarge fa fa-birthday-cake" style="color: #FFD966;"></i>
						</div>
						<div class="w3-rest">
							&nbsp;Birth <input class="w3-input w3-border" name="f_age"
								type="text" placeholder="19990930" required="required"
								style="color: black;">
						</div>
					</div>

					<!-- 성별 -->
					<div class="w3-row w3-section">
						<div class="w3-col">
							<i class="w3-xxlarge fa fa-female" style="color: #FFD966;"></i>
						</div>
						<div class="w3-rest">
							&nbsp;Gender <br>
							<div id="gender">
								<input type="radio" name="female" value="0"
									style="font-color: #FFD966;">&nbsp;&nbsp;MALE
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
									name="female" value="1" checked="checked"
									style="color: #FFD966;">&nbsp;&nbsp;FEMALE
							</div>
						</div>

						<!-- PH -->
						<div class="w3-row w3-section">
							<div class="w3-col">
								<i class="w3-xxlarge fa fa-phone" style="color: #FFD966;"></i>
							</div>
							<div class="w3-rest">
								&nbsp;Phone<input class="w3-input w3-border" name="f_ph"
									type="text" placeholder="010-1234-5678" style="color: black;">
							</div>
						</div>
						<!-- 이메일 -->
						<div class="w3-row w3-section">
							<div class="w3-col">
								<i class="w3-xxlarge fa fa-envelope" style="color: #FFD966;"></i>
							</div>
							<div class="w3-rest">
								&nbsp;email <input class="w3-input w3-border" name="f_email"
									type="text" placeholder="hello@naver.com" required="required"
									style="color: black;">
							</div>
						</div>
					</div>
				</div>
				<button id="join_button" form="form_sub" disabled="disabled">
					<b>JOIN</b>
				</button>
			</form>
		</div>
	</div>

	<script type="text/javascript">
		function login() {
			var id = $("#USER_ID_TEXT");
			var pw = $("#USER_PW_TEXT");

			// rsa 암호화
			var rsa = new RSAKey();
			rsa.setPublic($('#RSAModulus').val(), $('#RSAExponent').val());

			$("#USER_ID").val(rsa.encrypt(id.val()));
			$("#USER_PW").val(rsa.encrypt(pw.val()));

			id.val("");
			pw.val("");

			return true;
		}
	</script>

	<script type="text/javascript">
		function idCheck() {
			var id = $("#f_id");

			if (!id.val()) {
				alert("아이디없음");
				id.focus();
				return;
			}
			$.ajax({
				url : "/the_add/id_Check",
				type : 'post', // get / post 방식,
				data : {
					"f_id" : id.val()
				},
				dataType : "json",
				"Content-Type" : "application/json",
				success : function(result, status) { // 성공함수
					var con1 = document.getElementById("no");
					var con2 = document.getElementById("yes");
					
					if(result == 1){
						con1.style.display = "block";
						con2.style.display = "none";
					} else {
						con1.style.display = "none";
						con2.style.display = "block";
						$("#join_button").removeAttr("disabled"); 
					}
				},
				error : function(request, status, error) { // 에러함수
					alert(error);
				}
			});
		}
	</script>
</body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>