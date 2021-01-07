<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bxslider/js/jquery.min.js"></script>




<style type="text/css">

.bigBox {
	display: flex;
	justify-content: center;
}

.imgLayout {
	display: flex;
	flex-direction: column;
	width: 470px;
	height: 600px;
	border: none;
	cursor: pointer;
}

.imgLayout:hover {
	box-shadow: 1px 1px 1px 1px #e5e5e5 inset;
	padding: 0px 0px 2px 2px;
	border-radius: 5px;
	min-height: 2em;
}

.imageContentBox {
	font-weight: none;
	font-size: 16px;
}

.btnSet {
	border: none;
	background: none;
	cursor: pointer;
	font-weight: bold;
}

.buttonbox button:hover {
	text-shadow: -1px 0 #FAE500, 0 1px #FAE500, 1px 0 #FAE500, 0 -1px
		#FAE500;
}

.btnSet:hover {
	font-weight: bold;
	text-shadow: 4px 4px 0px #e5e5e5;
}

.btn2 {
	background: white;
	height: 25px;
	width: 30px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-family: inherit;
}

input:focus {
	box-shadow: -1px 0 #FAE500, 0 1px #FAE500, 1px 0 #FAE500, 0 -1px #FAE500;
}

.gradient-border { --borderWidth: 6px; background: white; position: relative; border-radius: var(--borderWidth); } .gradient-border:after { content: ''; position: absolute; top: calc(-1 * var(--borderWidth)); left: calc(-1 * var(--borderWidth)); height: calc(100% + var(--borderWidth) * 2); width: calc(100% + var(--borderWidth) * 2); background: linear-gradient(60deg, #f79533, #f37055, #ef4e7b, #a166ab, #5073b8, #1098ad, #07b39b, #6fba82); border-radius: calc(1.5 * var(--borderWidth)); z-index: -1; animation: animatedgradient 2s ease alternate infinite; background-size: 300% 300%; } @keyframes animatedgradient { 0% { background-position: 0% 50%; } 50% { background-position: 100% 50%; } 100% { background-position: 0% 50%; } }
</style>

<script type="text/javascript">
function article(productNum) {
	var url="${articleUrl}&productNum="+productNum;
	location.href=url;
}
function searchList() {
	var f=document.searchForm;
	f.submit();
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

	$(function(){	
	
	var date1 = "${dto.created_date}";
	var date2 = "${dto.countDate}";

	function diffDayTime(date1, date2){
		var sy = parseInt(date1.substr(0, 4));
	    var sm = parseInt(date1.substr(5, 2));
	    var sd = parseInt(date1.substr(8, 2));
	    
	    var cy = parseInt(date2.substr(0, 4));
	    var cm = parseInt(date2.substr(5, 2));
	    var cd = parseInt(date2.substr(8, 2));
		

	   var calculDate1 = new Date(sy, sm-1, sd, 24, 0, 0, 0);
	   var calculDate2 = new Date(cy, cm-1, cd, 24, 0, 0, 0);
	   
	   var elapsedMSec = calculDate1.getTime()-calculDate2.getTime();
	   var elapsedDay = Math.floor((elapsedMSec)/1000/60/60/24);
	   
	   
	   
		   alet(elapsedMSec);

	  
	   
	   $("#demo").html(elapsedDay);
}
});
	
</script>

<div class="bigBox">
<div class="body-container" style="width: 1000px;">
	<div class="body-title" style="border: none;">
		<h4>홈 > buy > 예약 구매 </h4>
	</div>
	<div style="display: flex; justify-content: center; margin-bottom: 30px;">
		<form name="searchForm" action="${pageContext.request.contextPath}/buy/rsv" method="post">
		              <select name="condition" class="selectField">
		                  <option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
		                  <option value="productName" ${condition=="productName"?"selected='selected'":""}>상품 이름</option>
		                  <option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
		                  <option value="userName" ${condition=="userName"?"selected='selected'":""}>판매자</option>
		            </select>
		            <input type="text" name="keyword" value="${keyword}" class="boxTF">
		            <button type="button" class="btn" onclick="searchList()">검색</button>
		        </form>
	</div>
		<table style="width: 100%; border-spacing: 0px;">
		<c:forEach var="dto" items="${rsv}" varStatus="status">
			<c:if test="${status.index==0}">
				<tr>
			</c:if>
			<c:if test="${status.index!=0 && status.index%2==0}">
				<c:out value="</tr><tr>" escapeXml="false" />
			</c:if>
			<td>
				<div class="imgLayout" style="display:flex; align-items:center; flex-direction:column;" >
				<div style="height: 465px; ">
					<a href="${articleUrl}&productNum=${dto.productNum}" style="text-decoration: none;height: 100%; "> <img
					src="${pageContext.request.contextPath}/uploads/rv/${dto.imageFilename}"
						width="456" height="456" border="0"
						onclick="javascript:article('${dto.productNum}');"></a>
				</div>	
				<div class="imageContentBox" style="width:100%; display: flex; justify-content: space-around;">	
					<a href="${articleUrl}&productNum=${dto.productNum}" style="display: flex; flex-direction: column;"><span onclick="javascript:article('${dto.productNum}');">${dto.productName}</span>
						<br>
						
						<span style="font-weight: bold;">가격 : <span class="format-money">${dto.price}</span>원 </span>
						<span>재고 : ${dto.stock }</span>
						<span>분류 : ${dto.categoryName }</span> <span>등록일 : ${dto.created_date}</span>
						</a>
						
					<br>
					
					<div class="gradient-border" id="box" style="margin: 50px; margin-right: 0px;"><p style="font-size: 20px; font-weight: bold;">D-Day 7일</p></div>
					
				</div>	
			</div>
			</td>
		</c:forEach>

		<c:set var="n" value="${list.size()}" />
		<c:if test="${n>0&&n%2!=0}">
			<c:forEach var="i" begin="${n%3+1}" end="2" step="1">
				<td width="210">
					<div class="imgLayout">&nbsp;</div>
				</td>
			</c:forEach>
		</c:if>

		<c:if test="${n!=0 }">
			<c:out value="</tr>" escapeXml="false" />
		</c:if>
	</table>

		<table style="width: 100%; border-spacing: 0px;">
			<tr height="35">
				<td align="center">
					${dataCount==0?"등록된 게시물이 없습니다.":paging }
				</td>
			</tr>
		</table>
	</div>
</div>