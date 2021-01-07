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
	width: 800px;
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
	justify-content: space-between;
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
	flex-direction: column;
}

.left-box {
	width: 150px;
}

.middle-box {
	width: 450px;
}

.right-box {
	width: 200px;
}

.image-box {
	width: 80px;
	height: 80px;
	margin: 20px;
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

$(function(){
	Number.prototype.format = function(){
	    if(this==0) return 0;

	    var reg = /(^[+-]?\d+)(\d{3})/;
	    var n = (this + '');

	    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

	    return n;
	};

	// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
	String.prototype.format = function(){
	    var num = parseFloat(this);
	    if( isNaN(num) ) return "0";

	    return num.format();
	};
	
	jQuery('.format-money').text(function() {
	    jQuery(this).text(
	        jQuery(this).text().format()
	    );
	});
});

</script>

	<div id="wrap">
		<c:if test="${not empty order }">
		<div class="body-container">
			<div class="body-header">
				<h3>주문내역</h3>
				<h6><span style="color: #b3b3b3; display: none;">장바구니>주문결제>주문완료</span></h6>
			</div>
			<form name="cartForm" method="post">
			<div class="body-content">
				<div class="item-wrapper" style="float: left;">
			<c:forEach var="dto" items="${order}" varStatus="status">
						<div class="item-seller">
							주문번호&nbsp;&nbsp;&nbsp;${dto.orderId}
						</div>
					<div class="info-box" style="background: #e8e8e8;">
							<span style="padding-left: 20px; font-family: 맑은 고딕, Malgun Gothic; font-weight: 600; padding: 10px;">날짜</span>
							<span style="padding-left: 20px; font-family: 맑은 고딕, Malgun Gothic; font-weight: 600; padding: 10px;">상품정보</span>
							<span style="padding-left: 20px; font-family: 맑은 고딕, Malgun Gothic; font-weight: 600; padding: 10px;">판매자</span>
					</div>
					<div class="info-box">
					<div class="left-box">
						<div class="info-body">
							<span style="padding-left: 20px; font-family: 맑은 고딕, Malgun Gothic; font-weight: 600; padding: 10px;">${dto.order_date}</span>
						</div>
						</div>
					<div class="middle-box">
						<div class="info-body">
							<div style="display: flex;">
								<div class="image-box">
									<img src="${pageContext.request.contextPath}/uploads/ms/${dto.imageFilename}">
								</div>
									<div style="margin-top: 20px; display: flex; flex-direction: column;">
										<span>${dto.userName}</span>
										<span>상품명 : ${dto.productName}</span>
										<span>가격 : ${dto.price}</span>
									</div>
								
							</div>
						</div>
					</div>
					<div class="right-box">
						<div class="info-body">
							<div>
								<div style="width: 100px; float: right; text-align: right; margin-right: 10px;">
									${dto.userName}
								</div>
							</div>
						</div>
					</div>
					<div>
					</div>
					</div>
			</c:forEach>
				</div>
			</div>
			</form>
		</div>
			</c:if>
			<c:if test="${empty order }">
				<div class="body-container">
					<div style="display: flex; align-items: center; min-height: 500px;">
					<table style="margin: auto; vertical-align: middle;">
						<tr>
							<td style="font-size: 72px; text-align: center;"><i class="fas fa-shopping-basket"></i></td>
						</tr>
						<tr>
							<td style="font-size: 24px; text-align: center; padding-bottom: 50px;">주문 내역이 없습니다.</td>
						</tr>
						<tr>
							<td><div style="margin: 0px auto; float: center; width: 80%;"><input type="button" value="홈으로 가기" style="width: 100%; height: 50px; font-size: 18px;" onclick="javascript:location.href='${pageContext.request.contextPath}';"></div></td>
						</tr>
					</table>
					</div>
				</div>
			</c:if>
	</div>

