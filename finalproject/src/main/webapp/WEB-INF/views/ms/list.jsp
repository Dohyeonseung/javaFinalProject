<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
function deleteMaterialSell(productNum) {
		var q = "productNum="+productNum+"&page=${page}";
		var url = "${pageContext.request.contextPath}/ms/delete?" + q;

		if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
				location.href=url;
		}
	}
</script>

<div class="body-container" style="width: 700px;">
	<div class="body-title">
		<h4>홈 > Sell - 재료판매 </h4>
		<button type="button" class="btn" style="float: right;" onclick="javascript:location.href='${pageContext.request.contextPath}/ms/created';">게시물 추가</button>
	</div>
		
		<table border="1" style="border-color:#e5e5e5; width: 100%; border-spacing: 0px; border-collapse: collapse; border-radius:50%; " >
			<tr align="center" bgcolor="white" height="35" > 
				<th width="40" style="color: #1e1e1e;">번호 </th>
				<th width="100" style="color:#1e1e1e;">게시일</th>
				<th style="color:#1e1e1e;">분류/제목/가격</th>
				<th width="40" style="color: #1e1e1e;">재고</th>
				<th width="100" style="color:#1e1e1e;">구매자현황</th>
				<th width="70" style="color: #1e1e1e;">수정/삭제</th>
			</tr>
		 <c:forEach var="dto" items="${list}">
			<tr align="center" bgcolor="#ffffff" height="50"> 
				<td >${dto.productNum}</td>
			    <td height="100" >${dto.created_date}</td>
			    <td align="center" height="50" >
			    		
						<a href="${articleUrl}&productNum=${dto.productNum}" style="text-decoration: none;"> <img src="${pageContext.request.contextPath}/uploads/ms/${dto.imageFilename}" width="70"
			                   height="70" border="0" style="margin-right: 70px;" onclick="javascript:article('${dto.productNum}');">${dto.categoryName} / ${dto.productName} / ${dto.price}원 </a>
				</td>
				<td height="50">${dto.stock}</td>
				<td height="50"><button type="button" class="btn" onclick="javascript:location.href='#'">구매자 현황</button></td>
				<td height="50">
					<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/ms/created';">수정</button>
			          <button type="button" class="btn" onclick="deleteMaterialSell('${dto.productNum}');">삭제</button>
			    </td>
		    </tr>
			</c:forEach>
		</table>

		<table style="width: 100%; border-spacing: 0px;">
			<tr height="35">
				<td align="center">
					${dataCount==0?"등록된 게시물이 없습니다.":paging }
				</td>
			</tr>
		</table>
	</div>
