<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
div, body {
	margin: 0;
	padding: 0;
}

#mainContainer {
	width: 100%;
	height: auto;
	overflow: hidden;
}

#contentContainer {
	width: 1280px;
	height: 1980px;
	margin: auto;
}

#table_box {
	width: 100%;
	height: 70%;
	margin-top: 100px;
}
.member_title {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #1e1e1e;
}

.btn_style {
	width: 100px;
	height: 30px;
	border-radius: 0;
	border-top: 0;
	border-bottom: 0;
	border-left: 0;
	border-right: 0;
	font-family: "맑은 고딕", sans-serif;
	font-weight: bold;
	transition: all 0.9s, color 0.3s;
}

.btn_style:hover {
    box-shadow: 0 50px 0 0 rgba(0, 0, 0, 0.1) inset, 
                0 -50px 0 0 rgba(0, 0, 0, 0.1) inset;
    
}

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
	margin: 20px 0px;
	font-size: 18px;
	display: flex;
	flex-direction: column;
	justify-content: space-around;
	
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
function orderSend() {
	var f = document.orderForm;
	
	var str = f.addr2.value;
    if(!str) {
        alert("상세 주소를 입력해주세요. ");
        f.addr2.focus();
        return;
    }

	str = f.tel1.value;
    if(!str) {
        alert("연락처를 입력해주세요. ");
        f.tel1.focus();
        return;
    }
    
    str = f.tel2.value;
    if(!str) {
        alert("연락처를 입력해주세요. ");
        f.tel2.focus();
        return;
    }
    
    str = f.tel3.value;
    if(!str) {
        alert("연락처를 입력해주세요. ");
        f.tel3.focus();
        return;
    }

	f.action="${pageContext.request.contextPath}/market/order";
	
	f.submit();
}

function messageSelect(rm) {

    var reqMessage = rm.selectReqMessage.selectedIndex;

    switch( reqMessage ){
	   case 0:
	     rm.reqMessage.value = null;
	     $('#reqMessage').attr('readonly', true);
		 break;
	   case 1:
	     rm.reqMessage.value = '배송 전 연락 바랍니다.';
	     $('#reqMessage').attr('readonly', true);
		 break;
	   case 2:
	     rm.reqMessage.value = '부재시 경비실에 맡겨주세요.';
	     $('#reqMessage').attr('readonly', true);
		 break;
	   case 3:
	     rm.reqMessage.value = '부재시 전화 주시거나 문자 남겨 주세요.';
	     $('#reqMessage').attr('readonly', true);
		 break;
	   case 4:
	     rm.reqMessage.value = '빠른 배송 부탁드립니다.';
	     $('#reqMessage').attr('readonly', true);
		 break;
	   case 5:
	     rm.reqMessage.value = '';
	     $('#reqMessage').attr('readonly', false);
		 break;
    }
	
    return true;
}
</script>
<div id="mainContainer">
	<div id="contentContainer">
		<div id="table_box">
		<div class="member_title">
				<h2><i class="far fa-address-card"></i> 주문정보 입력</h2>
		</div>
		
		<form name="orderForm" method="post">
			<div class="body-content">
			<div class="order-left">
				<div class="customer-info">
					<p style="font-size: 24px;">배송지 정보 입력</p>
					<div class="delivery">
					<table>
						<tr>
							<th>수령인&nbsp;<span style="color: red;">*</span> </th> <td><input type="text" name="orderer"></td>
						</tr>
						<tr>
							<th>배송지&nbsp;<span style="color: red;">*</span> </th> <td><input type="text" name="zip" id="zip"
			                       class="boxTF" style="width: 60%;" readonly="readonly">
			            <button type="button" class="btn" onclick="daumPostcode();">우편번호</button></td>
						</tr>
						<tr>
							<th><td><input type="text" name="addr1" id="addr1" maxlength="50" 
			                       class="boxTF" placeholder="기본 주소" readonly="readonly"></td>
						</tr>
						<tr>
							<th><td><input type="text" name="addr2" id="addr2" placeholder="상세주소를 입력하세요" ></td>
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
								<select class="selectField" id="sTel1" name="sTel1" style="line-height: 20px;" >
					                <option value="">선 택</option>
					                <option value="010">010</option>
					                <option value="011">011</option>
					                <option value="016">016</option>
					                <option value="017">017</option>
					                <option value="018">018</option>
					                <option value="019">019</option>
				           		 </select>_<input type="text" name="sTel2" maxlength="4">_<input type="text" name="sTel3" maxlength="4"> </p></td>
						</tr>
					</table>
					<select name="selectReqMessage" onchange="messageSelect(this.form);">
						<option value="0">배송시 요청사항을 선택해 주세요.</option>
						<option value="1">배송 전 연락 바랍니다.</option>
						<option value="2">부재시 경비실에 맡겨주세요.</option>
						<option value="3">부재시 전화 주시거나 문자 남겨 주세요.</option>
						<option value="4">빠른 배송 부탁드립니다.</option>
						<option value="5">직접 입력</option>
					</select>
					<textarea name="reqMessage" placeholder="배송시 요청사항을 입력해 주세요." id="reqMessage" rows="8" cols="56" style="resize: none; border: 1px solid #d9d9d9;"></textarea>
					</div>
				</div>
			</div>
			<div class="order-right">
			    <c:if test="${not empty dto}">
					<div class="item-info">
						<div>
							<div style="padding: 10px;">
								<span style="font-size: 24px;">주문상품 정보</span>
							</div>
							
							<div style="display: flex;">
								<div class="image-box">
									<img alt="" src="${pageContext.request.contextPath}/uploads/product/${dto.imageFileName}">
								</div>
								<div class="content-box">
									<div><span>${dto.productName}</span></div>
									<input type="hidden" name="productName" value="${dto.productName}">
									<input type="hidden" name="salesPrice" value="${dto.salesPrice}">
									<input type="hidden" name="buyCount" value="${dto.buyCount}">
									<input type="hidden" name="productCode" value="${dto.productCode}">
									<div><span>상품가격 : ${dto.salesPrice} </span></div>
									<div><span>구매수량 : ${dto.buyCount}EA </span></div>
								</div>
							</div>
							<div style="background: #e5e5e5; height: 25px;">
							<span style="float: right; font-size: 18px;">(주)핸드메이드.</span>
							</div>	
						</div>
					</div>
					<div style="margin: 20px 0px;">
						<span style="font-size: 24px;">최종 결제금액</span>
						<div>
							<table style="width: 100%; border-spacing: 5px;">
								<tr>
									<th>총 상품금액</th>
									<td style="float: right;">
										${dto.totalPrice}원
										<input type="hidden" name="totalPrice" value="${dto.totalPrice}">
									</td>
								</tr>
								<tr>
									<th>배송비</th><td style="float: right;">${dto.cost}원</td>
								</tr>
								<tr>
									<th>결제금액</th><td style="float: right;">${dto.amountPrice}원</td>
								</tr>
							</table>
						</div>
					</div>
				  </c:if>
				  
					<c:if test="${not empty dto }">
					<div style="padding: 10px 0px; ">
						<button type="button" onclick="orderSend();" id="btnDeleteList" style="background: #FAE500; width: 100%; border: none; font-size: 24px;">결제하기</button>
					</div>
					</c:if>
					<div style="padding: 10px 0px; ">
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/market/product?productCode=${dto.productCode}&page=${page}';" style="background: #cccccc; width: 100%; border: none; font-size: 24px;">주문취소</button>
					</div>
				</div>
		</div>
				</form>
		
		</div>
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
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script>