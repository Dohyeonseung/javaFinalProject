<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
#wrap {
	width: 100%;
	display: flex;
}

input[id^="item"] + label {
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid #bcbcbc;
	cursor: pointer;
	border-radius: 50%;
	position: relative;
	top: 5px;
}

input[id^="item"]:checked + label {
	background: url('${pageContext.request.contextPath}/resources/images/btnchk_kakao.png')
}

input[id^="item"] {
	display: none;
}

ul li {
	list-style: none;
}

.body-container {
	width: 100%;
}

.right {
	float: right;
}

.body-header{
	display: flex;
	justify-content: space-around;
	width: 100%;
	font-size: 24px;
	font-family: "Malgun Gothic", "맑은 고딕";
	border-bottom: 1px solid #e6e6e6;
	text-align: center;
	padding-bottom: 10px;
	margin-top: 50px;
}

.body-header, h3, h6{
	float: left;
}

.body-content {
	margin: auto;
	width: 1200px;
	display: flex;
	justify-content: space-between;
	padding-top: 50px;
}

.item-wrapper {
	margin-bottom: 30px;
	float: left;
	margin-right: 50px;
}

.info-box {
	width: 800px;
	border-bottom: 1px solid #e6e6e6;
	display: flex;
}

.item-seller {
	font-size: 24px;
	border-bottom: 1px solid black;
	padding-bottom: 15px;
	margin-top: 20px;
}

.info-body {
	padding: 18px 0px;
	display: flex;
}

.left-box {
	width: 400px;
}

.right-box {
	width: 400px;
}

.image-box {
	width: 150px;
	height: 150px;
	margin: 0px 20px;
}
.image-box img {
	width: 100%;
	height: 100%;
}


</style>

<script type="text/javascript">

$(function() {
    $("#itemAll").click(function() {
	   if($(this).is(":checked")) {
		   $("input[name=cIds]").prop("checked", true);
        } else {
		   $("input[name=cIds]").prop("checked", false);
        }
    });
 
    $("#btnDeleteList").click(function(){
		// var cnt = $("input[name=haks]:checkbox:checked").length;
		var cnt = $("input[name=cIds]:checked").length;

         if (cnt == 0) {
        	 // 버튼이 안 보이게 처리해야 함
        	 alert("삭제할 게시물을 먼저 선택 하세요 !!!");
             return false;
         }
         
         if(confirm("선택한 게시물을 삭제하시겠습니까 ? ")) {
        	 var f=document.cartForm;
        	 f.action="${pageContext.request.contextPath}/buy/deleteCartlist";
        	 f.submit();
     	}
         
    });
});

	  
function deleteCart(cId) {
	if(confirm("선택한 상품을 삭제하시곘습니까?")) {
		var url="${pageContext.request.contextPath}/buy/deleteCart?cId="+cId;
		location.href=url;
	}
}

function orderSubmit() {
	var cnt = $("input[name=cIds]:checked").length;
	if(cnt==0){
		alert("주문할 상품을 선택하세요.");
		return;
	}
	var f=document.cartForm;
	f.action="${pageContext.request.contextPath}/buy/orderCart";
	f.submit();
}

$(function() {
	  $(".plus").click(function(){
		   var num = $(this).parent().find("input").val();
		   var plusNum = Number(num) + 1;
		   
		   if(plusNum >= 99) {
			   $(this).parent().find("input").val(num);
		   } else {
			   $(this).parent().find("input").val(plusNum);          
		   }
	  });
		  
	  $(".minus").click(function(){
		   var num = $(this).parent().find("input").val();
		   var minusNum = Number(num) - 1;
		   
		   if(minusNum <= 0) {
			   $(this).parent().find("input").val(num);
		   } else {
			   $(this).parent().find("input").val(minusNum);          
		   }
	  });
})
</script>

	<div id="wrap">
		<c:if test="${not empty cart }">
		<div class="body-container">
			<div class="body-header">
				<h3>장바구니</h3>
				<h6>장바구니<span style="color: #b3b3b3;">>주문결제>주문완료</span></h6>
			</div>
			<form name="cartForm" method="post">
			<div class="body-content">
				<div class="item-wrapper" style="float: left;">
			<div>
				<input type="checkbox" class="itemAll" id="itemAll">
				<label for="itemAll"></label>
				<span style="font-size: 18px; font-family: 맑은 고딕, Malgun Gothic; font-weight: bold; padding-left: 8px;">전체선택</span>
			</div>
			<c:forEach var="dto" items="${cart}" varStatus="status">
						<div class="item-seller">
							&nbsp;&nbsp;&nbsp;${dto.seller}
						</div>
					<div class="info-box">
					<div class="left-box">
								<div class="info-body">
									<div style="line-height: 150px;">
										<input type="checkbox" name="cIds" id="item${dto.cId}" value="${dto.cId}">
    									<label for="item${dto.cId}"></label>
									</div>
									<div class="image-box">
										<img alt=""
											src="${pageContext.request.contextPath}/resources/img/slider1.jpg">
									</div>
									<span
										style="padding-left: 20px; font-family: 맑은 고딕, Malgun Gothic; font-weight: 600;">
										${dto.cName} </span>
								</div>
							</div>
					<div class="right-box">
						<div class="info-body" style="flex-direction: column;">
						<div class="option">
						<span>02)[WOOL]빅포켓버튼울코트/브릭/66</span>
						</div>
						<div class="item-price">
						<div style="display: flex; justify-content: space-between;">
							<div>
								<button type="button" class="minus" style="width: 30px; height: 30px; background: white; border: 1px solid #a6a6a6;">-</button>
								<input type="text" class="count" name="count" min="1" max="${dto.stock}" style="width: 50px; height: 28px; text-align: center; border: 1px solid #a6a6a6;" value="${dto.count}">
								<button type="button" class="plus"  style="width: 30px; height: 30px; background: white; border: 1px solid #a6a6a6;">+</button>
							</div>
							<div style="font-size: 24px; font-weight: bold;">
								${dto.cPrice} 원
							</div>
							</div>
							<div style="margin-top: 20px; border: 1px solid #e4e4e4; padding: 10px;">
								상품금액 : ${dto.cPrice} 원 <br>
								적립금 : ${dto.reserves} 원
							</div>
						</div>
						</div>
					</div>
					<div>
						<div class="info-body">
						<i class="fas fa-times" style="font-size: 24px; padding-left: 10px; cursor: pointer;"  onclick="deleteCart('${dto.cId}');"></i>
						</div>
					</div>
					</div>
			</c:forEach>
				</div>
				<div style="float: left; margin-top: 95px;">
			<div style="border-top: 1px solid #d9d9d9; width: 400px; padding: 20px; font-size: 20px;">
				<ul>
					<li><span>상품 금액</span><span class="right">120,000원</span></li>
					<li><span>적립금</span><span class="right">6000원</span></li>
					<li>&nbsp;</li>
					<li><span>총 주문금액</span><span class="right">120,000원</span></li>
				</ul>
			</div>
			<div style="width: 442px;">
				<button id="btnDeleteList" style="width: 60px; height: 60px; border: none; background: #1e1e1e; float: left;"><i class="far fa-trash-alt" style="color: white; font-size: 28px;"></i></button>
				<button type="button" onclick="orderSubmit();" style="width: 382px; height: 60px; border: none; background: #FAE500; float: left; font-size: 22px;">주문하기</button>
			</div>
			</div>
			</div>
			</form>
		</div>
			</c:if>
			<c:if test="${empty cart }">
				<div class="body-container">
					<div style="display: flex; align-items: center; min-height: 500px;">
					<table style="margin: auto; vertical-align: middle;">
						<tr>
							<td style="font-size: 72px; text-align: center;"><i class="fas fa-cart-plus"></i></td>
						</tr>
						<tr>
							<td style="font-size: 24px; text-align: center; padding-bottom: 50px;">장바구니에 담긴 상품이 없습니다.</td>
						</tr>
						<tr>
							<td><div style="margin: 0px auto; float: center; width: 80%;"><input type="button" value="홈으로 가기" style="width: 100%; height: 50px; font-size: 18px;" onclick="javascript:location.href='${pageContext.request.contextPath}';"></div></td>
						</tr>
					</table>
					</div>
				</div>
			</c:if>
	</div>

