<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	width: 250px;
	height: 200px;
}

#wrap {
	width: 100%;
	display: flex;
}

.ingredient {
	width: 1160px; 
	min-height: 380px; 
	margin: auto;
}

</style>

<script type="text/javascript">
function article(productNum) {
	var url="${articleUrl}&productNum="+productNum;
	location.href=url;
}
</script>

</head>
<body>
	
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
								<li><span style="font-weight: bold; color: crimson;">${dto.price}</span> 원</li>
								<li>${dto.userId}</li>
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
		          <form name="searchForm" action="${pageContext.request.contextPath}/photo/list" method="post">
		              <select name="condition" class="selectField">
		                  <option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
		                  <option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
		                  <option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
		                  <option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
		                  <option value="created" ${condition=="created"?"selected='selected'":""}>등록일</option>
		            </select>
		            <input type="text" name="keyword" value="${keyword}" class="boxTF">
		            <button type="button" class="btn" onclick="searchList()">검색</button>
		        </form>
		      </td>
		   </tr>
		</table>
	</div>
	
	
	

	
	
</div>
</body>
</html>