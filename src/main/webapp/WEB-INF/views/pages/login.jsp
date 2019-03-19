<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
body {background-color:black;}
form { width:100%; height:100%;}
.imgcontainer { text-align:center; margin-top:170px; }
img.avatar { width:30%; }
input[type=text], input[type=password] { width: 100%; padding: 12px 20px; margin: 8px 0;
  display: inline-block; border: 1px solid #ccc; box-sizing: border-box; }
button { background-color: #4CAF50; color: white; padding: 14px 20px; margin: 8px 0; border: none; cursor: pointer; width: 100%; }
#login{width:35%; height:30%; position:relative; top:40%; left:2%; }
#form{width: 30%; height: 30%; color: #9933FF; position:relative; left:3%;}
</style>

<script src="${pageContext.request.contextPath}/static/js/rsa.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jsbn.js"></script>
<script src="${pageContext.request.contextPath}/static/js/prng4.js"></script>
<script src="${pageContext.request.contextPath}/static/js/rng.js"></script>

<!-- 외부 로그인 script -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/hellojs/2.0.0-4/hello.all.js"></script>
<script>
// 인증 초기화
hello.init({
   google: '602467592765-5d3i1jad60fvt8hfk3u9k9t0es1drflq.apps.googleusercontent.com',
   facebook: '415398439209729'
}, {redirect_uri: 'http://localhost:8080/the_add/login'});  // 구글 콘솔에서 승인된 리디렉션 URL의 부분을 입력.

// 구글 로그인
function authGoogle(){
   hello('google').login({scope: 'email', force: true}).then(function(auth) {
      hello(auth.network).api('/me').then(function(r) {
         accessToken = auth.authResponse.access_token;
         getGoogleMe(); // 로그인 한 후에 바로 내 정보를 호출
      });
   });
}

function authFacebook(){
   hello('facebook').login({scope: 'email', force: true}).then(function(auth) {
      hello(auth.network).api('/me').then(function(r) {
         accessToken = auth.authResponse.access_token;
         getFacebookMe(); // 로그인 한 후에 바로 내 정보를 호출
      });
   });
}
// 구글에서 내 정보 로드
function getGoogleMe(){
   hello('google').api('me').then(
         function(json) {
            console.log(JSON.stringify(json));
            var names = JSON.stringify(json.name);
             var emails = JSON.stringify(json.email);             
             var ids = JSON.stringify(json.id);             
            console.log('name   : ' + names);
            console.log('id   : ' + ids);
             console.log('email  : ' + emails);          
             $.ajax({
                url :"${pageContext.request.contextPath}/gf_login",
                type:"post",
                data :{"name" : names, "id" : ids, "email" : emails},
                success:function(data){
                   location.href=("${pageContext.request.contextPath}/home");
                },
                 error:function(jqXHR, textStatus, errorThrown, error){
                        alert("다시 로그인 해주세요");
                        location.href=("${pageContext.request.contextPath}/login");
                    }
             });
         }, 
         function(e) {
             console.log('me error : ' + e.error.message);
          });
}
//face에서 내 정보 로드
function getFacebookMe(){
   hello('facebook').api('me').then(
         function(json) {
            console.log(JSON.stringify(json));
            name = json.name;
             email = json.email;
             domain = json.domain;
             id = json.id;
             thumbnail = json.thumbnail;
            console.log('name   : ' + name);
            console.log('id   : ' + id);
             console.log('email  : ' + email);
             console.log('domain : ' + domain);
             console.log('thumbnail : ' + thumbnail);
             $("#logininfo").empty();
             $("#logininfo").append("<li>아이디 : "+id+"</li><li>이름 : "+name+"</li><li>이메일 : "+email+"</li><li>도메인 : "+domain+"</li><");
         }, 
         function(e) {
             console.log('me error : ' + e.error.message);
          });
}
//로그아웃
function logout(){
   hello('google').logout({force:true}).then(
         function() {
            console.log('logout');
            $("#logininfo").empty();            
            alert("로그아웃됨");
         },
         function(e) {
            console.log('Signed out error: ' + e.error.message);
          });   
}
function flogout(){   
   hello('facebook').logout().then(
         function() {
            console.log('logout');            
            $("#logininfo").empty();
            alert("로그아웃됨");
         },
         function(e) {
            console.log('Signed out error: ' + e.error.message);
          });
}
</script>



<body class="w3-black">
	
		<div class="imgcontainer">
			<img src="${pageContext.request.contextPath}/static/img/r_login.png" id="login">
			<div class="container" id="form">
				<c:url var="login" value="/member/login" />
				<form action="${login}" method="post" onsubmit="return login();">
				<input type="hidden" id="RSAModulus" value="${RSAModulus}" /> 
				<input type="hidden" id="RSAExponent" value="${RSAExponent}" />
				<label for="f_id"></label> 
				<input type="text" placeholder="ID" name="USER_ID_TEXT" id="USER_ID_TEXT" required> 
				<label for="f_pw"></label> 
				<input type="password" placeholder="PW" name="USER_PW_TEXT" id="USER_PW_TEXT" required> 
				<input type="hidden" id="USER_ID" name="USER_ID"> 
				<input type="hidden" id="USER_PW" name="USER_PW">
				<br><br>
				<button style="background-color: #9933FF; border-radius: 12px; font-size: 25px; color: white; font-family: Agency FB;">LOGIN</button>
			</form>	
			<button onclick="authGoogle()" style="background-color: black;">
				<img src="${pageContext.request.contextPath}/static/img/google_login.png" style="width: 100%;">
			</button>
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
			</div>
		</div>
</body>

