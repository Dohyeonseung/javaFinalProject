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
	width: 15px;
	height: 15px;
	border: 2px solid #bcbcbc;
	cursor: pointer;
	border-radius: 50%;
	position: relative;
	top: 5px;
}

input[id^="item"]:checked + label {
	background: url('${pageContext.request.contextPath}/resources/images/btnchk_kakao.png');
	height: 15px;
	width: 15px;
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
	justify-content: center;
	padding-top: 50px;
}


.image-box {
	width: 100px;
	height: 100px;
	margin: 10px;
}
.image-box img {
	width: 100%;
	height: 100%;
}

.content-box {
	width: 300px;
	margin: 10px 0px;
	font-size: 18px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	
}

.order-left {
	width: 450px;
	float: left;
	margin-right: 100px;
}

.order-right {
	width: 400px;
	float: left;
}

.item-info {
	border: 1px solid #b6b6b6;
	width: 450px;
	height: 197px;
	overflow: auto;
}

.delivery{
	font-size: 16px;
	font-family: "Malgun Gothic", "맑은 고딕";
}


.delivery > table input{
	height: 18px;
	border: 1px solid #d9d9d9;
	width: 100%;
	max-width: 328px;
	padding: 5px;
	margin: 5px;
}

.delivery select:first-child{
	height: 30px;
	border: 1px solid #d9d9d9;
	width: 100%;
	max-width: 328px;
	padding: 5px;
	margin: 5px;
}

.delivery select:nth-child(4){
	height: 30px;
	border: 1px solid #d9d9d9;
	width: 100%;
	max-width: 328px;
	padding: 5px;
	margin: 10px 0px;
}
.delivery th {
	width: 20%;
}

#tel {
	display: flex;
	justify-content: space-around;
}

#tel > input{
	width: 90px;

}

</style>



<script type="text/javascript">
function orderConfirm() {
	var f=document.orderSubmit;

	var str = f.Addr1.value;
    if(!str) {
        alert("주소를 입력해 주세요. ");
        f.Addr1.focus();
        return;
    }

	str = f.Addr2.value;
    if(!str) {
        alert("상세 주소를 입력해 주세요. ");
        f.Addr2.focus();
        return;
    }
	
	f.action="${pageContext.request.contextPath}/buy/orderSubmit";

	f.submit();
}

function message(frm) {

    var content = frm.selectmsg.selectedIndex;

    switch( content ){
	   case 0:
	     frm.content.value = null;
	     $('#content').attr('readonly', true);
		 break;
	   case 1:
	     frm.content.value = '배송 전 연락 바랍니다.';
	     $('#content').attr('readonly', true);
		 break;
	   case 2:
	     frm.content.value = '부재시 경비실에 맡겨주세요.';
	     $('#content').attr('readonly', true);
		 break;
	   case 3:
	     frm.content.value = '부재시 전화 주시거나 문자 남겨 주세요.';
	     $('#content').attr('readonly', true);
		 break;
	   case 4:
	     frm.content.value = '빠른 배송 부탁드립니다.';
	     $('#content').attr('readonly', true);
		 break;
	   case 5:
	     frm.content.value = '';
	     $('#content').attr('readonly', false);
		 break;
    }
	
    return true;
}

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

/* $(function() {
 
    $("#btnDeleteList").click(function(){

        	 var f=document.cartForm;
        	 f.action="${pageContext.request.contextPath}/buy/deleteCartlist";
        	 f.submit();
         
    });
}); */
</script>
	<div id="wrap">
		<div class="body-container">
			<div class="body-header">
				<h3>주문결제</h3>
				<h6><span style="color: #b3b3b3;">장바구니></span>주문결제<span style="color: #b3b3b3;">>주문완료</span></h6>
			</div>
			<form name="orderSubmit" method="post">
			<div class="body-content">
			<div class="order-left">
				<div class="customer-info">
					<p style="font-size: 24px;">배송지 정보 입력 (kakao 계정 제공)</p>
					<div class="delivery">
					<table>
						<tr>
							<th>수령인&nbsp;<span style="color: red;">*</span> </th> <td><input type="text" name="customer"></td>
						</tr>
						<tr>
							<th>배송지&nbsp;<span style="color: red;">*</span> </th> <td><input type="text" name="zip" id="zip""
			                       class="boxTF" style="width: 60%;" readonly="readonly">
			            <button type="button" class="btn" onclick="daumPostcode();">우편번호</button></td>
						</tr>
						<tr>
							<th><td><input type="text" name="Addr1" id="Addr1" maxlength="50" 
			                       class="boxTF" placeholder="기본 주소" readonly="readonly"></td>
						</tr>
						<tr>
							<th><td><input type="text" name="Addr2" id="Addr2" placeholder="상세주소를 입력하세요" ></td>
						</tr>
						<tr>
							<th>연락처1&nbsp;<span style="color: red;">*</span> </th>
							<td><p id="tel">
								<select class="selectField" id="tel1" name="tel1" style="line-height: 20px;" >
					                <option value="">선 택</option>
					                <option value="010">010</option>
					                <option value="011">011</option>
					                <option value="016">016</option>
					                <option value="017">017</option>
					                <option value="018">018</option>
					                <option value="019">019</option>
				           		 </select>_<input type="text" name="tel2" maxlength="4">_<input type="text" name="tel3" maxlength="4"> </p>
				           	</td>
						</tr>
						<tr>
							<th>연락처2</th> <td><p id="tel">
								<select class="selectField" id="otehrtel1" name="othertel1" style="line-height: 20px;" >
					                <option value="">선 택</option>
					                <option value="010">010</option>
					                <option value="011">011</option>
					                <option value="016">016</option>
					                <option value="017">017</option>
					                <option value="018">018</option>
					                <option value="019">019</option>
				           		 </select>_<input type="text" name="othertel2" maxlength="4">_<input type="text" name="othertel3" maxlength="4"> </p></td>
						</tr>
					</table>
					<input type="checkbox" style="zoom:1.5; position: relative; top: 2px;"> <span style="color: #b3b3b3;">배송지 목록에 추가하기</span>
					<select name="selectmsg" onchange="message(this.form)">
						<option value="0">배송시 요청사항을 선택해 주세요.</option>
						<option value="1">배송 전 연락 바랍니다.</option>
						<option value="2">부재시 경비실에 맡겨주세요.</option>
						<option value="3">부재시 전화 주시거나 문자 남겨 주세요.</option>
						<option value="4">빠른 배송 부탁드립니다.</option>
						<option value="5">직접 입력</option>
					</select>
					<textarea name="content" placeholder="배송시 요청사항을 입력해 주세요." id="content" rows="8" cols="56" style="resize: none; border: 1px solid #d9d9d9;"></textarea>
					</div>
				</div>
			</div>
			<div class="order-right">
			
			    <c:if test="${not empty dto }">
					<div class="item-info">
						<div>
							<div style="padding: 10px;">
								<span style="font-size: 24px;">주문상품 정보</span>
							</div>
							
							<div style="display: flex;">
								<div class="image-box">
									<img alt="" src="${pageContext.request.contextPath}/resources/img/slider1.jpg">
								</div>
								<div class="content-box">
									<div><span style="font-size: 20px; font-weight: bold;">${dto.productName}</span></div>
									<div>
										<span style="font-size: 18px;">수량</span><span style="font-size: 18px; margin-left: 40px;"> ${dto.count} 개</span>
										<input type="hidden" name="counts" value="${dto.count}">
									</div>
									<input type="hidden" name="productNames" value="${dto.productName}">
									<input type="hidden" name="productNums" value="${dto.productNum}">
									<input type="hidden" name="prices" value="${dto.price}">
									<div><span style="font-size: 24px; font-weight: bold; font-family: Malgun Gothic, 맑은 고딕;" class="format-money">${dto.price}</span>원</div>
								</div>
							</div>
							<div style="background: #e5e5e5; height: 25px;">
							<span style="float: right; font-size: 18px;">롯데쇼핑(주) 미아점</span>
							</div>	
						</div>
					</div>
					<div style="margin: 20px 0px;">
						<span style="font-size: 24px;">최종 결제금액</span>
						<div>
							<table style="width: 100%; border-spacing: 5px;">
								<tr>
									<th>총 상품금액</th><td style="float: right;"><span class="format-money">${total}</span>원<input type="hidden" name="total_price" value="${total}"></td>
								</tr>
								<tr>
									<th>배송비</th><td style="float: right;">2500원</td>
								</tr>
								<tr>
									<th>적립금</th><td style="float: right;"><span class="format-money">${reserves}</span></td>
								</tr>
							</table>
						</div>
					</div>
				  </c:if>
				  
				  <c:if test="${not empty listCart }">
						<div class="item-info">
							<div>
								<div style="padding: 10px;">
									<span style="font-size: 24px;">주문상품 정보</span>
								</div>
								
				  				<c:forEach var="vo" items="${listCart}">
									<div style="display: flex; width: 400px;">
										<div class="image-box">
											<img alt="" src="${pageContext.request.contextPath}/resources/img/slider1.jpg">
										</div>
										<div class="content-box">
											<div><span style="font-size: 20px; font-weight: bold;">${vo.cName}</span></div>
										<div>
											<span style="font-size: 18px;">수량</span><span style="font-size: 18px; margin-left: 40px;"> ${vo.count} 개</span>
											<input type="hidden" name="counts" value="${vo.count}">
										</div>
											<input type="hidden" name="cIds" value="${vo.cId}">
											<input type="hidden" name="productNames" value="${vo.cName}">
											<input type="hidden" name="productNums" value="${vo.productNum}">
											<input type="hidden" name="prices" value="${vo.cPrice}">
											<div><span style="font-size: 24px; font-weight: bold; font-family: Malgun Gothic, 맑은 고딕;" class="format-money">${vo.cPrice}</span> 원</div>
										</div>
									</div>
									<div style="background: #e5e5e5; height: 25px;">
									<span style="float: right; font-size: 18px;">${vo.seller}</span>
									</div>	
				  				</c:forEach>
							</div>
						</div>
				  	
						<div style="margin: 20px 0px;">
							<span style="font-size: 24px;">최종 결제금액</span>
							<div>
								<table style="width: 100%; border-spacing: 5px;">
									<tr>
										<th>총 상품금액</th><td style="float: right;"><span class="format-money">${total}</span>원<input type="hidden" name="total_price" value="${total}"></td>
									</tr>
									<tr>
										<th>배송비</th><td style="float: right;">2,500원</td>
									</tr>
									<tr>
										<th>적립금</th><td style="float: right;"><span class="format-money">${reserves}</span>원</td>
									</tr>
								</table>
							</div>
						</div>
				  	
				  </c:if>
					
					<div style="padding: 10px 0px; ">
						<button type="button" id="btnDeleteList" onclick="orderConfirm();" style="background: #FAE500; width: 100%; border: none; font-size: 24px;">결제하기</button>
					</div>
				</div>
		</div>
				</form>
		</div>
	</div>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('Addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('Addr2').focus();
            }
        }).open();
    }
</script>