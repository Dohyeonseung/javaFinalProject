<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bxslider/js/jquery.min.js"></script>




<style type="text/css">

ul li {
	list-style: none;
}

img{
	width: 100%; height: 100%;
}

.ingredient > ul {
	height: 350px;
}

.ingredient > ul > li {
	float: left;
}


.goodsWrap {
	padding: 20px;
}

.goodsWrap > ul li {
	padding-bottom: 10px;
}

.goodsImage {
	width: 200px;
	height: 200px;
}

#wrap {
	width: 100%;
	display: flex;
}

.ingredient {
	width: 1200px; 
	min-height: 380px; 
	margin: auto;
	margin-top: 50px;
}

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
</script>

<div id="wrap">
	<div class="ingredient">
		<ul>
		<c:forEach var="dto" items="${material}" varStatus="status">
			<li>
				<div>
						<div class="goodsWrap" style="cursor: pointer;" onclick="javascript:article('${dto.productNum}');">
							<div class="goodsImage">
								<img alt="" src="${pageContext.request.contextPath}/uploads/ms/${dto.imageFilename}">
							</div>
							<ul>
								<li>${dto.productName}</li>
								<li><span style="font-weight: bold; color: crimson;" class="format-money">${dto.price}</span> 원</li>
								<li>${dto.userName}</li>
							</ul>
						</div>
				</div>
			</li>
			</c:forEach>
		</ul>
					<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			    ${dataCount==0?"등록된 상품이 없습니다.":paging}
			 </td>
		   </tr>
		</table>
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="center">
		          <form name="searchForm" action="${pageContext.request.contextPath}/buy/material" method="post">
		              <select name="condition" class="selectField">
		                  <option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
		                  <option value="productName" ${condition=="productName"?"selected='selected'":""}>상품 이름</option>
		                  <option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
		                  <option value="userName" ${condition=="userName"?"selected='selected'":""}>판매자</option>
		                  <option value="created_date" ${condition=="created_date"?"selected='selected'":""}>등록일</option>
		            </select>
		            <input type="text" name="keyword" value="${keyword}" class="boxTF">
		            <button type="button" class="btn" onclick="searchList()">검색</button>
		        </form>
		      </td>
		   </tr>
		</table>
	</div>
	
	
	

	
	
</div>
