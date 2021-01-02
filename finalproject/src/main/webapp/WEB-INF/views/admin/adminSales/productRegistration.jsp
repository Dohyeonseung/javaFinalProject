<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
div, body {
	margin: 0;
}

#mContainor {
	width: 100%;
	height: auto;
	overflow: hidden;
}

#subContainor {
	width: 1280px;
	height: 1400px;
	margin: auto;
}


.helpTable {
	width: 100%;
	border-collapse: collapse;
}
.category_id {
	text-align: center;
	font-family: "맑은 고딕";
	font-size: 16px;
	font-weight: bold;
	width: 260px;
	height: 100px;
}
.short_input {
	border-radius: 5px;
	width: 760px;
	height: 30px;
}

.hp_content {
	border-radius: 5px;
}

#agree_table {
	font-size: 16px;
	font-weight: bold;
	font-family: "맑은 고딕";
	border-collapse: collapse;
}

a {
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}

#table_button {
	margin-top: 75px;
	float: right;
}


.btn_style {
	width: 150px;
	height: 50px;
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
    box-shadow: 0 120px 0 0 rgba(0, 0, 0, 0.25) inset, 
                0 -120px 0 0 rgba(0, 0, 0, 0.25) inset;
}

.btn_created_code {
	width: 100px;
	height: 30px;
	border-radius: 0;
	border-top: 0;
	border-bottom: 0;
	border-left: 0;
	border-right: 0;
	font-family: "맑은 고딕";
	font-weight: bolder;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">

function check() {
    var f = document.RegistrationProductForm;

	var str = f.product_Price.value;
	if(!str) {
        alert("가격을 입력하세요. ");
        f.product_Price.focus();
        return false;
    }
	
	str = f.productName.value;
    if(!str) {
        alert("상품명을 입력하세요. ");
        f.productName.focus();
        return false;
    }
    
	f.action="${pageContext.request.contextPath}/admin/adminSales/registration";

	return true;
}

</script>

<form name="RegistrationProductForm" method="post" enctype="multipart/form-data" onsubmit="return submitContents(this);">
<div id="mContainor">
	<div id="subContainor">
	    <div id="title_box">
			<h1><i class="fas fa-archive"></i> 상품등록</h1>
	    </div>
	    <table class="helpTable">
	    	<tr style="border-bottom: 1px solid #cccccc; border-top: 1px solid #101010;">
	    		<td class="category_id">상품분류</td>
	    		<td>
					<select name="categoryNum" style="width: 760px; height: 30px; border-radius: 5px;">
						<option value="0" ${categoryNum=="0" ? "selected='selected'":""}>==선택하세요==</option>
						<option value="1" ${categoryNum=="1" ? "selected='selected'":""}>DIY 제작키트</option>
						<option value="2" ${categoryNum=="2" ? "selected='selected'":""}>재료</option>
						<option value="3" ${categoryNum=="3" ? "selected='selected'":""}>공구</option>
						<option value="4" ${categoryNum=="4" ? "selected='selected'":""}>기타</option>
					</select>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-bottom: 1px solid #cccccc;">
	    		<td class="category_id">상품코드</td>
	    		<td>
	    			<input class="short_input" type="text" name="productCode" value="${dto.productCode}">
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-bottom: 1px solid #cccccc;">
	    		<td class="category_id">상품가격</td>
	    		<td>
	    			<input class="short_input" type="text" name="productPrice" value="${dto.productPrice}">
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-bottom: 1px solid #cccccc;">
	    		<td class="category_id">상품명</td>
	    		<td>
	    			<input class="short_input" type="text" name="productName" value="${dto.productName}">
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-bottom: 1px solid #101010;">
	    		<td class="category_id">상세정보</td>
	    		<td valign="top" style="padding:18px 0 18px 0;">
	    			<textarea class="hp_content" style="width: 760px; height: 300px; overflow: auto; resize: none;" name="productInfo" id="productInfo">${dto.productInfo}</textarea>
	    			<input type="hidden" name="productInfo" value="${dto.productInfo}">
	    			<input type="hidden" name="userId" value="${dto.userId}">
	    		</td>
	    	</tr>
			
	    </table>
	    
		<div id="table_button">
            	<button class="btn_style" type="submit" >상품등록</button>
            	<button class="btn_style" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/adminSales/productlist'">등록 취소</button>
        </div>
	</div>
</div>
</form>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "productInfo",
	sSkinURI: "${pageContext.request.contextPath}/resources/se/SmartEditor2Skin.html",	
	htParams : {bUseToolbar : true,
		fOnBeforeUnload : function(){
			//alert("아싸!");
		}
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["productInfo"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["productInfo"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["productInfo"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	
	try {
		// elClickedObj.form.submit();
		return check();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["productInfo"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
