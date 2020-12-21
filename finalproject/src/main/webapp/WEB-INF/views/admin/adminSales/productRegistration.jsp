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

#agree_button {
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
function sendQNA() {
    var f = document.consumerQnaForm;

	var str = f.f_subject.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.f_subject.focus();
        return;
    }

	str = f.f_content.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.f_content.focus();
        return;
    }

	f.action="${pageContext.request.contextPath}/consumer/faq/created";

    f.submit();
}
</script>

<form name="consumerQnaForm" method="post" enctype="multipart/form-data">
<div id="mContainor">
	<div id="subContainor">
	    <div id="title_box">
			<h1><i class="fas fa-archive"></i> 상품등록</h1>
	    </div>
	    <table class="helpTable">
	    	<tr style="border-bottom: 1px solid #cccccc; border-top: 1px solid #101010;">
	    		<td class="category_id">상품분류</td>
	    		<td>
					<select style="width: 760px; height: 30px; border-radius: 5px;">
						<option>==선택하세요==</option>
						<option>DIY 제작키트</option>
						<option>재료</option>
						<option>공구</option>
						<option>기타</option>
					</select>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-bottom: 1px solid #cccccc;">
	    		<td class="category_id">상품코드</td>
	    		<td>
	    			<input class="short_input" type="text" name="f_subject" value="${dto.q_subject}">
	    			<button type="button" class="btn_created_code">코드생성</button>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-bottom: 1px solid #cccccc;">
	    		<td class="category_id">상품가격</td>
	    		<td>
	    			<input class="short_input" type="text" name="f_subject" value="${dto.q_subject}">
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-bottom: 1px solid #cccccc;">
	    		<td class="category_id">상품명</td>
	    		<td>
	    			<input class="short_input" type="text" name="f_subject" value="${dto.q_subject}">
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-bottom: 1px solid #101010;">
	    		<td class="category_id">상세정보</td>
	    		<td valign="top" style="padding:18px 0 18px 0;">
	    			<textarea class="hp_content" style="width: 760px; height: 300px; overflow: auto; resize: none;" name="f_content" id="f_content"></textarea>
	    		</td>
	    	</tr>
			
	    </table>
	    
		<div id="agree_button">
            	<button class="btn_style" type="button" onclick="sendQNA()">상품등록</button>
            	<button class="btn_style" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/adminSales/productlist'">등록 취소</button>
        </div>
	</div>
</div>
</form>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "f_content",
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
	oEditors.getById["f_content"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["f_content"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["f_content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
	
	try {
		// elClickedObj.form.submit();
		return check();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '돋움';
	var nFontSize = 24;
	oEditors.getById["f_content"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
