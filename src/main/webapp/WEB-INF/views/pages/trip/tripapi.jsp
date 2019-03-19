
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<style type="text/css">
li {
	list-style: none;
}

.photo {
	overflow: hidden;
	width: 150px;
	height: 100px;
	margin-top: 30px;
	margin-left: -40px;
}

#img_main {
	width: 100%;
	height: 100%;
}

.area_txt {
	margin-left: 130px;
	margin-top: -100px;
}

.tit {
	color: black;
	font-weight: bold;
	font-size: 20px;
}

.area_txt>p {
	font-size: 15px;
	color: gray;
	font-weight: bold;
	padding: 5px;
}

.tag {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	margin-top: -17px;
}
</style>
</head>

<body>

	<section style="margin-left: 338px; margin-top: 100px; width: 560px;">
		<form action="http://www.naver.com">
			<table>
				<tr>
					<td><select
						style="width: 120px; height: 46px; border: 2px solid #0B173B; padding: 10px; font-size: 14px; font-weight: bold;">
							<option>테마</option>
							<option>여행지</option>
							<option>축제</option>
					</select></td>
					<td><input placeholder="지역을 입력하세요 "
						style="border: 2px solid #0B173B; width: 400px; height: 40px; font-size: 17px; font-weight: bolder; padding-left: 10px;"></input>
					</td>
					<td><input type="submit" value="검색"
						style="height: 46px; border: 2px solid #0B173B; background: #0B173B; color: white; margin-left: -5px; font-weight: bold;"></td>
				</tr>
			</table>
		</form>
	</section>


	<br>
	<hr style="width: 46%; border: 0.5px solid gray;">
	<br>


	<ul
		style="border: 1px solid white; width: 43%; margin-left: 340px; border-bottom-color: #D8D8D8; border-top-color: #D8D8D8;">
		<li class="bdr_nor">
			<div class="photo">
				<a href="javascript:"
					onclick="goDetail(&quot;304&quot;,&quot;456e69d1-4fa2-413d-bd58-5bf85af50675&quot;)">
					<img src="${pageContext.request.contextPath}/img/bg-showcase-3.jpg"
					id="img_main">
				</a>
			</div>

			<div class="area_txt">
				<div class="tit">경기도어린이식품안전체험관 부천센터</div>
				<p>경기도 부천시</p>

				<p class="tag">
					<span>#부천가볼만한곳</span><span>#경기도어린이식품안전체험관</span><span>#체험</span><span>#농사체험</span><span>#공공누리</span><span>#기후변화체험관</span><span>#똑똑마트</span><span>#불량마트</span><span>#아이와함께</span><span>#겨울방학여행</span>
				</p>
			</div>

		</li>
	</ul>

</body>
</html>