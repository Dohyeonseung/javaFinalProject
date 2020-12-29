<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">

.bigBox{
	display:flex;
	justify-content: center;
}
.imgLayout{
	display:flex;
	flex-direction:column;
	width: 470px;
	height: 600px;
	border: none;
    cursor: pointer;
}

.imgLayout:hover{

  box-shadow: 1px 1px 1px 1px  #e5e5e5 inset;
  padding:0px 0px 2px 2px;
  border-radius: 5px;
  min-height: 2em;
}
.subject {
     width:100%;
     height:25px;
     line-height:25px;
     white-space:nowrap;
     overflow:hidden;
     text-overflow:ellipsis;
     cursor: pointer;
     
     font-size: 18px;
}
</style>
<script type="text/javascript">
function deleteMaterialSell(productNum) {
		var q = "productNum="+productNum+"&page=${page}";
		var url = "${pageContext.request.contextPath}/ms/delete?" + q;

		if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
				location.href=url;
		}
	}
</script>
<div class="bigBox">
<div class="body-container" style="width: 1000px;">
	<div class="body-title">
		<h4>홈 > Sell - 완제품 판매 </h4>
	</div>
	<button type="button" class="btn" style="float: right; margin-bottom: 5px;" onclick="javascript:location.href='${pageContext.request.contextPath}/cp/created';">게시물 추가</button>
		
		<table style="width: 100%; border-spacing: 0px;">
		<c:forEach var="dto" items="${list}" varStatus="status">
			<c:if test="${status.index==0}">
				<tr>
			</c:if>
			<c:if test="${status.index!=0 && status.index%2==0}">
				<c:out value="</tr><tr>" escapeXml="false" />
			</c:if>
			<td width="210" align="center">
				<div class="imgLayout">
					<img
					src="${pageContext.request.contextPath}/uploads/cp/${dto.imageFilename}"
						width="456" height="456" border="0"
						onclick="javascript:article('${dto.productNum}');">
					<span class="subject" onclick="javascript:article('${dto.productNum}');">${dto.productName}</span>
						<!--  src="${pageContext.request.contextPath}/uploads/cp/${dto.imageFilename}"
						width="180" height="180" border="0"
						onclick="javascript:article('${dto.productNum}');"> <span
						class="subject" onclick="javascript:article('${dto.productNum}');">
						제목</span>
						-->
					
					<span style="font-weight: bold;">가격:${dto.price }</span>
					<span>재고:${dto.stock }</span>
					<span>분류:${dto.categoryName }</span>
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