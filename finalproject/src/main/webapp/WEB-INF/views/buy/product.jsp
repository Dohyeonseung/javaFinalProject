<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bxslider/css/jquery.bxslider.min.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bxslider/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bxslider/js/jquery.bxslider.min.js"></script>

<script type="text/javascript">
$(function(){
	$('.slider').bxSlider({
		auto: true,
		autoControls: true,
		stopAutoOnClick: true,
		pager: true,
		slideWidth: 2000
	});
});
</script>




<style type="text/css">

#wrap {
	width: 100%;
	display: flex;
}

ul li {
	list-style: none;
}

img {
	width: 100%;
	height: 100%;
}

.simple_infowrap {
	width: 1200px;
	margin: auto;
}

.thumbnail {
	width: 50%;
	height: 700px;
	float: left;
}

.thumbnail_main {
	border: 1px solid #e4e4e4;
	width: 500px;
	height: 400px;
	background: #3e3e3e;
	margin: auto;
}

.thumbnail_others {
	margin: 50px;
	width: 500px;
	height: 130px;
}

ul.center {
  width:100%;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: space-around;
  align-items: center;
}

.thumbnail_others > ul > li {
	border: 1px solid #e4e4e4;
	float: left;
	width: 130px;
	height: 130px;
}

.iteminfo {
	width: 50%;
	height: 650px;
	position: relative;
	float: left;
}

.iteminfo_head {
	border-bottom: 1px solid #404040;
	padding-bottom: 10px;
	min-height: 40px;
}

.itemname{
	font-size: 28px;
	font-weight: 500;
}

.itemprice{
	font-size: 34px;
	font-weight: bold;
	color: tomato;
}

.iteminfo_body {
	border-bottom: 1px solid #d9d9d9;
}

.info_title {
	width: 30%;
	float: left;
	padding-bottom: 10px;
}

.info_content {
	width: 70%;
	float: left;
	padding-bottom: 10px;
}

.cart_purchase {
	display: flex;
	justify-content: space-around;
	height: 50px;
	width: 50%;
	float: left;
	margin: auto;
}

.add {
	width: 180px;
	height: 50px;
	background: #e5e5e5;
	border: 1px solid #e4e4e4;
	font-size: 18px;
	font-weight: bold;
}

.purchase {
	width: 180px;
	height: 50px;
	background: #FAE500;
	border: 1px solid #e4e4e4;
	font-size: 18px;
	font-weight: bold;
}

.cart {
	width: 180px;
	height: 50px;
	background: #1e1e1e;
	color: white;
	border: 1px solid #e4e4e4;
	font-size: 18px;
	font-weight: bold;
}


</style>
</head>
<body>




	
	

	
<div id="wrap">
	<div class="simple_infowrap">
		<div class="thumbnail">
			<div class="thumbnail_main">
				<img alt="" src="${pageContext.request.contextPath}/resources/bxslider/css/images/퉷.jpg">
			</div>
			<div class="thumbnail_others">
				<ul class="center">
					<li>
						<img alt="" src="${pageContext.request.contextPath}/resources/bxslider/css/images/퉷.jpg">
					</li>
					<li>
						<img alt="" src="${pageContext.request.contextPath}/resources/bxslider/css/images/퉷.jpg">
					</li>
					<li>
						<img alt="" src="${pageContext.request.contextPath}/resources/bxslider/css/images/퉷.jpg">
					</li>
				</ul>
			</div>
		</div>
		<div class="iteminfo">
			<div class="iteminfo_head"> 
				<span class="itemname">${dto.productName}</span>
			</div>
			<div class="iteminfo_body">
			<div class="info_title" style="line-height: 45px;">
				<span style="margin: auto;">판매가</span>
			</div>
			<div class="info_content">
				<span class="itemprice"> ${dto.price}</span><span style="font-size: 34px">원</span>
			</div>
				<div class="info_title">적립금</div>
			</div>
			<div class="info_content">
			<span style="color: #4d94ff;">
				${dto.reserves}
			</span>
			</div>
			<div class="info_title">판매자</div>
			<div class="info_content">
				${dto.userId}
			</div>
		</div>
		<div class="cart_purchase">
			<button type="button" class="add">장바구니</button>
			<button type="button" class="cart">찜하기</button>
			<button type="button" class="purchase">구매하기</button>
		</div>
	</div>
</div>
</body>
</html>