<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">

</script>




<style type="text/css">
#wrap {
	width: 100%;
	display: flex;
}

ul li {
	list-style: none;
}

.market_img {
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
	margin-top: 48px;
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
	width: 100%;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.thumbnail_others>ul>li {
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

.itemname {
	font-size: 28px;
	font-weight: 500;
}

.itemprice {
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
	padding-bottom: 30px;
	height: 29px;
}

.info_content {
	width: 70%;
	float: left;
	padding-bottom: 30px;
	height: 29px;
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

.exFont{
	font-size: 14px;
	font-weight: bolder;
}

.content-container {
	width: 1200px;
	margin-top: 50px;
	margin: auto;
	height: auto;
	min-height: auto;
}

.content-title {
	width: 100%;
	border-bottom: 1px solid #cccccc;
	padding-bottom: 5px;
	margin-bottom: 30px;
	font-size: 28px;
	font-family: "맑은 고딕", "나눔 고딕", sans-serif;
	font-weight: bolder;
}

.info-container {
	width: 80%;
	margin: auto;
}
</style>
<script type="text/javascript">
function test() {
	var buyCount = $("#buyCount").val();
	
	location.href="${pageContext.request.contextPath}/market/order?productCode=${dto.productCode}&memberIdx=${dto.memberIdx}&page=${page}&buyCount="+buyCount;
}
</script>

<div id="wrap">
	<div class="simple_infowrap">
		<form name="orderForm" method="post">
			<div class="thumbnail">
				<div class="thumbnail_main">
					<img class="market_img" src="${pageContext.request.contextPath}/uploads/product/${dto.imageFileName}">
				</div>
			</div>
			<div class="iteminfo">
				<div class="iteminfo_head">
					<span class="itemname">${dto.productName}</span>
				</div>
				<div class="iteminfo_body">
					<div class="info_title" style="line-height: 45px;">
						<span style="margin: auto;">가격</span>
					</div>
					<div class="info_content">
						<span class="itemprice"> ${dto.salesPrice}</span><span
							style="font-size: 34px">원</span>
					</div>
					<div class="info_title">재고수량</div>
					<div class="info_content">
						<span class="exFont"> ${dto.productCount}EA</span>
					</div>
					
					<div class="info_title">구매수량</div>
					<div class="info_content">
						<input type="number" id="buyCount" name="buyCount" min="1" max="${dto.productCount}" value="1">
					</div>
				</div>
			</div>
			<div class="cart_purchase">
				<button type="button" class="cart" style="float: right" onclick="location.href='${pageContext.request.contextPath}/market/list';">리스트</button>
				<button type="button" class="cart">장바구니</button>
				<button type="button" class="purchase" onclick="test();">구매하기</button>
			</div>
		</form>

	</div>
</div>

	<div class="content-container">
		<div class="content-title">
			<span>제품정보</span>
		</div>
		<div class="info-container">
		${dto.productInfo}
		</div>
	</div>
</body>