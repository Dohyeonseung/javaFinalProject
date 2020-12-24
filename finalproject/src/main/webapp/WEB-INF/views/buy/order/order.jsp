<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<style type="text/css">
#wrap {
	width: 100%;
	display: flex;
}

ul li {
	list-style: none;
}



</style>

<script type="text/javascript">
function orderConfirm() {
	var f=document.orderSubmit;

	f.action="${pageContext.request.contextPath}/buy/orderSubmit";

	f.submit();
}
</script>

<div id="wrap">
	<div style="width: 1000px; margin: auto;">
	<form name="orderSubmit" method="post">
		<div style="width: 100%; border-bottom: 1px solid #6e6e6e; margin-bottom: 30px; ">
			<h1>주문 결제</h1>
		</div>
		
		<div style="width: 600px; float: left">
			<h3>배송지 선택</h3>
			<ul>
				<li>이름 <input type="text" name="" value="${sessionScope.member.userName}"></li>
				<li>기본 주소 <input type="text" name="Addr1"></li>
				<li>나머지 주소 <input type="text" name="Addr2"> </li>
				<li>전화번호<input type="text"> </li>
				<li>${sessionScope.member.userName}, ${sessionScope.member.memberIdx}, ${sessionScope.member.userId}</li>
			</ul>
			</div>

		
		<div style="width: 400px; float: left">
			<h3>주문 상품 정보</h3>
			<div style="width: 100%; border: 1px solid black; min-height: 100px;">
				<div style="width: 30%; float: left;">
					<img alt="" src="${pageContext.request.contextPath}/uploads/ms/${dto.imageFilename}" style="width: 80px; height: 70px; margin: auto; padding: 15px;">
				</div>
				<div style="width: 70%; padding-top: 20px;">
					<ul>
						<li>${dto.productName}</li>
						<li> ${dto.productNum}/${dto.price} <input type="hidden" name="total_price" value="${dto.price}"> <input type="hidden" name="reservs"> </li>
						<li><button type="button" onclick="orderConfirm()">결제</button></li>
					</ul>
				</div>
			</div>
		</div>
		</form>
	</div>	
		</div>
