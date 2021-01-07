<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.gradient-border { --borderWidth: 3px; background: white; position: relative; border-radius: var(--borderWidth); } .gradient-border:after { content: ''; position: absolute; top: calc(-1 * var(--borderWidth)); left: calc(-1 * var(--borderWidth)); height: calc(100% + var(--borderWidth) * 2); width: calc(100% + var(--borderWidth) * 2); background: linear-gradient(60deg, #f79533, #f37055, #ef4e7b, #a166ab, #5073b8, #1098ad, #07b39b, #6fba82); border-radius: calc(1.5 * var(--borderWidth)); z-index: -1; animation: animatedgradient 2s ease alternate infinite; background-size: 300% 300%; } @keyframes animatedgradient { 0% { background-position: 0% 50%; } 50% { background-position: 100% 50%; } 100% { background-position: 0% 50%; } }
</style>
<script type="text/javascript">
function deleteCompleteSell(productNum) {
	var q = "productNum="+productNum+"&page=${page}";
	var url = "${pageContext.request.contextPath}/rv/delete?" + q;

	if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
			location.href=url;
	}
}

function updateCompleteSell(productNum) {
	var q = "productNum="+productNum+"&page=${page}";
	var url = "${pageContext.request.contextPath}/rv/update?" + q;

	location.href=url;
}
	function searchList() {
	var f=document.searchForm;
	f.sortCol.value=$("#sortColumn").val();
	f.submit();
}
	
</script>
<div class="bigBox">
<div class="body-container" style="width: 1000px;">
	<div class="body-title">
		<h4>홈 > Sell > 예약판매 </h4>
	</div>
	<div style="float: left;">
		<form name="searchForm" action="${pageContext.request.contextPath}/rv/list" method="post"><!-- 서치폼을 만들고 모든정보를 ms action주소로 보낸다. -->
			<input type="text" name="keyword" value="${keyword}" class="boxTF" style="margin-left: 10px;">
			<input type="hidden" name="sortCol" value="new">
		    <button type="button" class="btn2" onclick="searchList()">검색</button>
		 </form>
	</div>
	<button type="button" class="btn" style="float: right; margin-bottom: 5px; margin-right:60px;" onclick="javascript:location.href='${pageContext.request.contextPath}/rv/created';">게시물 추가</button>
		<select style="float: right; margin-right: 5px;" id="sortColumn" class="selectField" onchange="searchList()">
                  <option value="new" ${sortCol=="new"?"selected='selected'":""}>등록일순</option>
                  <option value="stock" ${sortCol=="stock"?"selected='selected'":""}>재고순</option>
                  <option value="popularity" ${sortCol=="popularity"?"selected='selected'":""}>판매인기순</option>
                  <option value="highPrice" ${sortCol=="highPrice"?"selected='selected'":""}>높은가격순</option>
                  <option value="rowPrice" ${sortCol=="rowPrice"?"selected='selected'":""}>낮은가격순</option>
            </select>
		<table style="width: 100%; border-spacing: 0px;">
		<c:forEach var="dto" items="${list}" varStatus="status">
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
						
						<span style="font-weight: bold;">가격 : ${dto.price}</span>
						<span>재고 :${dto.stock }</span>
						<span>분류 : ${dto.categoryName }</span> <span>등록일 : ${dto.created_date}</span>
						</a>
						
						
					<br>
					<div style="display: flex; flex-direction: column;">
					<div class="buttonbox">
						<button type="button" class="btnSet" onclick="updateCompleteSell('${dto.productNum}');" style="margin: 2px;">수정</button>
						 <button type="button" class="btnSet" onclick="deleteCompleteSell('${dto.productNum}');" style="margin: 2px;">삭제</button>
					</div>
				
						<div class="gradient-border" id="box" style="margin-top: 50px;"><p style="font-size: 20px; font-weight: bold;">D-Day 7일</p></div>
						
		
					</div>
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