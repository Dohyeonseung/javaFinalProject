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
				location.href="${pageContext.request.contextPath}/admin/adminSales/adminProductDetaile";
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function detailedProduct(productCode) {
	var dlg = $("#info_dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 수정 " : function() {
		    	   updateOk(); 
		       },
		       " 삭제 " : function() {
		    	   deleteOk(productCode);
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

	var url = "${pageContext.request.contextPath}/admin/adminSales/adminProductDetaile";
	var query = "productCode="+productCode;
	
	var fn = function(data){
		$('#info_dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", "html", query, fn);
}

function updateOk() {
	var f = document.deteailedProductForm;
	
	if(! f.stateCode.value) {
		f.stateCode.focus();
		return;
	}
	if(! $.trim(f.stateMemo.value)) {
		f.stateMemo.focus();
		return;
	}
	
	var url = "${pageContext.request.contextPath}/admin/adminSales/updateProductState";
	var query=$("#deteailedProductForm").serialize();

	var fn = function(data){
		location.href="${pageContext.request.contextPath}/admin/adminSales/productinfo?productCode=${dto.productCode}&page=${page}";
	};
	ajaxFun(url, "post", "html", query, fn);
		
	$('#info_dialog').dialog("close");
	
}

function selectStateChange() {
	var f = document.deteailedProductForm;
	
	var s = f.stateCode.value;
	var txt = f.stateCode.options[f.stateCode.selectedIndex].text;
	
	f.stateMemo.value = "";	
	if(! s) {
		return;
	}

	if(s!="0" && s!="3") {
		f.stateMemo.value = txt;
	}
	
	f.stateMemo.focus();
}
</script>

<div id="mainContainer">
	<div id="contentContainer">
		<div class="table_box">
			<div class="info_title">
				<h2><i class="fas fa-info-circle"></i> 상품정보</h2>
			</div>
			
			<table class="infoTable">
	    	<tr style="border-bottom: 1px solid #cccccc; border-top: 1px solid #101010;">
	    		<th class="category_name">상품명</th>
	    		<td class="info_value">
	    			<span>${dto.productName}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<th class="category_name">상품코드</th>
	    		<td class="info_value">
					<span>${dto.productCode}</span>
					<input type="hidden" name="productCode" value="${productCode}">
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<th class="category_name">상품분류</th>
	    		<td class="info_value">
					<span>${dto.categoryName}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<th class="category_name">판매가격</th>
	    		<td class="info_value">
					<span>${dto.productPrice}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">상품등록일</th>
	    		<td class="info_value">
					<span>${dto.registrationDate}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">상태분류</th>
	    		<td class="info_value">
					<span>${dto.stateName}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">재고개수</th>
	    		<td class="info_value">
					<span>${dto.productCount}</span>
	    		</td>
	    	</tr>
	    		
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #1e1e1e;">
	    		<th class="category_name">상세정보</th>
	    		<td class="info_value">
					<span>${dto.productInfo}</span>
	    		</td>
	    	</tr>
	    	
	    	</table>
	    	
	    	<div class="table_box">
	    		<div class="info_title">
					<h2><i class="fas fa-sync-alt"></i> 상품정보 변동내역
						<span style="font-size: 12px; float: right; padding-top: 16px;">최대 10건까지 표시됩니다.</span>
					</h2>
				</div>
				
				<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
					  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th width="30" style="color: #787878;">변동날짜</th>
					      <th width="100" style="color: #787878;">변동내용</th>
					      <th width="30" style="color: #787878;">상태</th>
					  </tr>
					 
					  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
					      <td width="30">${dto.stateDate}</td>
					      <td width="100" style="text-align: center;"><a style="color: #1e1e1e;">${dto.stateMemo}</a></td>
					      <td width="30">${dto.stateName}</td>
					  </tr>

				</table>
	    	</div>
	    	
	    	<div class="table_box">
	    		<div class="info_title">
					<h2><i class="fas fa-sync-alt"></i> 발주내역
						<span style="font-size: 12px; float: right; padding-top: 16px;">최대 10건까지 표시됩니다.</span>
					</h2>
				</div>
				
				<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
					  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th width="30" style="color: #787878;">발주날짜</th>
					      <th width="100" style="color: #787878;">발주사유</th>
					      <th width="30" style="color: #787878;">주문개수</th>
					  </tr>
					 
					  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
					      <td width="30">${dto.productOrderDate}</td>
					      <td width="100" style="text-align: center"><a style="color: #1e1e1e;">${dto.productOrderMemo}</a></td>
					      <td width="30">${dto.productOrderCount}개</td>
					  </tr>

				</table>
	    	</div>
	    	
	    	<div class="btn_box">
	    		<form action="">
	    			<button type="button" class="btn_style" id="returnList_btn" style="margin-right: 860px;" onclick="location.href='${pageContext.request.contextPath}/admin/adminSales/productlist'">리스트</button>
	    			<button type="button" class="btn_style" id="stateChange_btn" onclick="detailedProduct('${dto.productCode}');">상태변경</button>
	    			<button type="button" class="btn_style" id="productOrder_btn">상품발주</button>
	    			<button type="button" class="btn_style" id="productDelete_btn">상품삭제</button>
	    		</form>
	    	</div>
	    	
		</div>
	</div>
</div>
<div id="info_dialog" style="display: none;">

</div>
