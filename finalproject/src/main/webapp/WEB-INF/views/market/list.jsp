<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.imgLayout{
	width: 190px;
	height: 205px;
	padding: 10px 5px 10px;
	margin: 5px;
	margin-bottom: 50px;
	border: none;
	cursor: pointer;
}
.subject {
     width:180px;
     height:25px;
     line-height:25px;
     margin:5px auto;
     border-top: 1px solid #cccccc;
     display: inline-block;
     white-space:nowrap;
     overflow:hidden;
     text-overflow:ellipsis;
     cursor: pointer;
}

.price {
     width:180px;
     height:25px;
     line-height:25px;
     margin:5px auto;
     display: inline-block;
     white-space:nowrap;
     overflow:hidden;
     text-overflow:ellipsis;
     cursor: pointer;
}

.base-container {
	width: 1980px;
	height: 1480px;
	margin: 0;
	padding: 0;
}

.market-container {
	width: 1280px;
	height: auto;
	margin: auto;
}
</style>

<script type="text/javascript">
function searchList() {
		var f=document.searchForm;
		f.submit();
}

function soldOut() {
	alert("매진된 상품입니다!!");
	return false;
}

</script>
<div class="base-container">

<div class="market-container">
    <div class="body-title">
        <h3><i class="fas fa-shopping-cart"></i> D-Market </h3>
    </div>
    
    <div>
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          ${dataCount}개(${page}/${total_page} 페이지)
		      </td>
		      <td align="right">
		          &nbsp;
		      </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
<c:forEach var="dto" items="${list}" varStatus="status">
                 <c:if test="${status.index==0}">
                       <tr>
                 </c:if>
                 <c:if test="${status.index!=0 && status.index%3==0}">
                        <c:out value="</tr><tr>" escapeXml="false"/>
                 </c:if>
				<c:if test="${dto.statement==1}">
			     <td width="210" align="center">
			        <div class="imgLayout">
			        <c:choose>
			        	<c:when test="${dto.productCount == 0}">
			        		<img src="${pageContext.request.contextPath}/resources/images/soldout.png" width="180"
			                   	height="180" border="0" onclick="soldOut();">
			        	</c:when>
			        	<c:when test="${dto.productCount != 0}">
			        		<img src="${pageContext.request.contextPath}/uploads/product/${dto.imageFileName}" width="180"
			                   	height="180" border="0" onclick="location.href='${pageContext.request.contextPath}/market/product?productCode=${dto.productCode}&page=${page}';">
			        	</c:when>
			        </c:choose>
			             <span class="subject" onclick="location.href='${pageContext.request.contextPath}/market/product?productCode=${dto.productCode}&page=${page}';">
			                   ${dto.productName}
			             </span>
			             <span class="price" onclick="location.href='${pageContext.request.contextPath}/market/product?productCode=${dto.productCode}&page=${page}';">
			                   ${dto.salesPrice}원
			             </span>
			             <input type="hidden" name="productCode" value="${dto.productCode}">
			         </div>
			     </td>
				</c:if>
</c:forEach>

		</table>           
		 
		<table style="width: 100%; margin: 0px auto; margin-top: 30px; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			    ${dataCount==0?"등록된 게시물이 없습니다.":paging}
			 </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="center">
		          <form name="searchForm" action="${pageContext.request.contextPath}/market/list" method="post">
		              <select name="condition" class="selectField">
		                  <option value="all" ${condition=="all"?"selected='selected'":""}>상품명</option>
		            </select>
		            <input type="text" name="keyword" value="${keyword}" class="boxTF">
		            <button type="button" class="btn" onclick="searchList()">검색</button>
		        </form>
		      </td>
		   </tr>
		</table>
    </div>
	</div>
</div>