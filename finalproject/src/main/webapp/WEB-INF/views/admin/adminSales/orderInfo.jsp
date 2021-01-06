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
	height: 2580px;
	margin: auto;
}

.table_box {
	width: 100%;
	height: auto;
	margin-top: 150px;
}
.info_title {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #e5e5e5;
}

.infoTable {
	width: 100%;
	border-collapse: collapse;
	font-family: "맑은 고딕", "맑은 고딕", sans-serif;
	font-size: 18px;
	font-weight: bold;
}
.category_name {
	text-align: center;
	width: 260px;
	height: 100px;
}

.info_value {
	margin: 0;
	padding: 0;
	width: auto;
}

.btn_box {
	margin-top: 100px;
	float: right;
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
}


</style>

<script type="text/javascript">
function ajaxFun(url, method, dataType, query, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status == 403) {
				location.href="${pageContext.request.contextPath}/admin/adminSales/controll";
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function orderStateControll(orderNum) {
	var dlg = $("#info_dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 수정 " : function() {
		    	   updateOk(); 
		       },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		       }
		  },
		  height: 520,
		  width: 800,
		  title: "회원상세정보",
		  close: function(event, ui) {
		  }
	});

	var url = "${pageContext.request.contextPath}/admin/adminSales/controll";
	var query = "orderNum="+orderNum;
	
	var fn = function(data){
		$('#info_dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", "html", query, fn);
}

function updateOk() {
	var f = document.orderControllForm;
	
	if(! f.orderCode.value) {
		f.orderCode.focus();
		return;
	}
	if(! $.trim(f.o_memo.value)) {
		f.o_memo.focus();
		return;
	}
	
	var url = "${pageContext.request.contextPath}/admin/adminSales/updateOrderProcessing";
	var query=$("#orderControllForm").serialize();
	
	
	var fn = function(data){
		location.href="${pageContext.request.contextPath}/admin/adminSales/infoOrder?orderNum=${dto.orderNum}&page=${page}";
	};
	ajaxFun(url, "post", "html", query, fn);
		
	$('#info_dialog').dialog("close");
	
}

function selectOrderCodeChange() {
	var f = document.orderControllForm;
	
	var s = f.orderCode.value;
	var txt = f.orderCode.options[f.orderCode.selectedIndex].text;
	
	f.o_memo.value = "";	
	if(! s) {
		return;
	}

	if(s!="0" && s!="3") {
		f.o_memo.value = txt;
	}
	
	f.o_memo.focus();
}
</script>

<div id="mainContainer">
	<div id="contentContainer">
		<div class="table_box">
			<div class="info_title">
				<h2><i class="fas fa-info-circle"></i> 주문정보</h2>
			</div>
			
			<table class="infoTable">
	    	<tr style="border-bottom: 1px solid #cccccc; border-top: 1px solid #101010;">
	    		<th class="category_name">주문번호</th>
	    		<td class="info_value">
	    			<span>${dto.orderNum}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<th class="category_name">주문일자</th>
	    		<td class="info_value">
					<span>${dto.orderDate}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<th class="category_name">주문자</th>
	    		<td class="info_value">
					<span>${dto.orderer}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<th class="category_name">주문상품</th>
	    		<td class="info_value">
					<span>${dto.productName}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">주문수량</th>
	    		<td class="info_value">
					<span>${dto.buyCount}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">결제금액</th>
	    		<td class="info_value">
					<span>${dto.amountPrice}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">배송지</th>
	    		<td class="info_value">
					<span>${dto.orderAddress}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">연락처</th>
	    		<td class="info_value">
					<span>${dto.orderTel}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">처리상태</th>
	    		<td class="info_value">
					<c:choose>
				    	<c:when test="${dto.orderState == 0}">
				    		<span>발송대기</span>
				    	</c:when>
				    	<c:when test="${dto.orderState == 1}">
				    		<span>발송완료</span>
				    	</c:when>
				    	<c:when test="${dto.orderState == 2}">
				    		<span>발송지연</span>
				    	</c:when>
				    	<c:when test="${dto.orderState == 3}">
				    		<span>주문취소</span>
				    	</c:when>
				    </c:choose>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #1e1e1e;">
	    		<th class="category_name">요청사항</th>
	    		<td class="info_value">
					<span>${dto.reqMessage}</span>
	    		</td>
	    	</tr>
	    		
	    	
	    	</table>
	    	
	    	<div class="table_box">
	    		<div class="info_title">
					<h2><i class="fas fa-sync-alt"></i> 상품처리상태
						<span style="font-size: 12px; float: right; padding-top: 16px;">최대 10건까지 표시됩니다.</span>
					</h2>
				</div>
				
				<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
					  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th width="30" style="color: #787878;">처리번호</th>
					      <th width="30" style="color: #787878;">처리날짜</th>
					      <th width="100" style="color: #787878;">처리내용</th>
					      <th width="30" style="color: #787878;">상태</th>
					  </tr>
					 
					 <c:forEach var="dto" items="${olistState}">
					  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
					      <td width="30">${dto.p_num}</td>
					      <td width="30">${dto.orderSendDate}</td>
					      <td width="100" style="text-align: center;"><a style="color: #1e1e1e;">${dto.o_memo}</a></td>
					      <td width="30">
					      <c:choose>
					    	<c:when test="${dto.orderCode == 0}">
					    		<span>발송대기</span>
					    	</c:when>
					    	<c:when test="${dto.orderCode == 1}">
					    		<span>발송완료</span>
					    	</c:when>
					    	<c:when test="${dto.orderCode == 2}">
					    		<span>발송지연</span>
					    	</c:when>
					    	<c:when test="${dto.orderCode == 3}">
					    		<span>주문취소</span>
					    	</c:when>
					    </c:choose>
					      </td>
					  </tr>
					 </c:forEach>

				</table>
	    	</div>
	    	
	    	
	    	<div class="btn_box">
	    		<form action="">
	    			<button type="button" class="btn_style" id="returnList_btn" style="margin-right: 1070px;" onclick="location.href='${pageContext.request.contextPath}/admin/adminSales/orderlist'">리스트</button>
	    			<button type="button" class="btn_style" id="stateChange_btn" onclick="orderStateControll('${dto.orderNum}');">주문관리</button>
	    		</form>
	    	</div>
	    	
		</div>
	</div>
</div>
<div id="info_dialog" style="display: none;">

</div>
