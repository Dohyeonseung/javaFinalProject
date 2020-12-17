<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bxslider/css/jquery.bxslider.min.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bxslider/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bxslider/js/jquery.bxslider.min.js"></script>

<script type="text/javascript">
$(function(){
	$('.slider').bxSlider({
		auto: true,
		autoControls: true,
		stopAutoOnClick: true,
		pager: true,
		slideWidth: 2000
	});
});
</script>




<style type="text/css">

#materialSell_AT {
	width: 100%;
	display: flex;
	align-content: space-around;
}

ul li {
	list-style: none;
}

img {
	width: 100%;
	height: 100%;
}

.thumbnail {
	width: 50%;
	height: 700px;
	float: left;
}

.thumbnail_main {
	border: 1px solid #e4e4e4;
	width: 500px;
	height: 400px;
	background: #3e3e3e;
	margin: auto;
}

.thumbnail_others {
	margin: 50px;
	width: 500px;
	height: 130px;
}

ul.center {
  width:100%;
  margin: 0;
  padding: 0;
  display: flex;
  justify-content: space-around;
  align-items: center;
}

.thumbnail_others > ul > li {
	border: 1px solid #e4e4e4;
	float: left;
	width: 130px;
	height: 130px;
}

.iteminfo {
	width: 500px;
	height: 650px;
	position: relative;
	float: left;
}

.iteminfo_head {
	border-bottom: 1px solid #404040;
	padding-bottom: 10px;
	min-height: 40px;
	font-size: 28px;
	font-weight: 500;
	text-align: center;
}
.iteminfo_content table{
	width: 100%;
	height: 100%;
	border-collapse: 0;
}
.iteminfo_content table td{
	height: 60px;
	text-align: center;
	font-size: 20px;
}
</style>
</head>
<body>




	
	

	
<div id="materialSell_AT">
		<div class="thumbnail">
			<div class="thumbnail_main">
				<img alt="" src="${pageContext.request.contextPath}/uploads/ms/${dto.imageFilename}">
			</div>
			<div class="thumbnail_others">
				<ul class="center">
					<li>
						<img alt="" src="${pageContext.request.contextPath}/resources/bxslider/css/images/퉷.jpg">
					</li>
					<li>
						<img alt="" src="${pageContext.request.contextPath}/resources/bxslider/css/images/퉷.jpg">
					</li>
					<li>
						<img alt="" src="${pageContext.request.contextPath}/resources/bxslider/css/images/퉷.jpg">
					</li>
				</ul>
			</div>
		</div>
		<div class="iteminfo">
			<div class="iteminfo_head"> 
				<span>${dto.productName}</span>
			</div>
			<div class="iteminfo_content">
				<table border="1">
					<tr>
						<td>구분</td>
						
						<td colspan="2">
							<select name="categoryNum" class="selectField">
								<c:forEach var="vo" items="${dto.}">
									<option value="${vo.categoryNum}"
										${dto.categoryNum==vo.categoryNum?"selected='selected'":""}>${vo.categoryName}</option>
								</c:forEach>
						</select>
						</td>
					</tr>
					
					
					<tr>
						<td>재고</td>
						<td colspan="2">${dto.stock}</td>
					</tr>
					
					<tr>
						<td>게시일자</td>
						<td colspan="2">${dto.created_date}</td>
					</tr>
					
					<tr>
						<td>판매가</td>
						<td colspan="2" style="width: 65%;">${dto.price}원</td>
					</tr>
				</table>
			
			</div>
		</div>
</div>
</body>
</html>