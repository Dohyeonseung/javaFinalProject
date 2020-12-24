<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="dto" items="${cart}" varStatus="status">
<div style="width: 900px; margin: auto;">
	<div style="height: 70px;">
		<div style="float: left; width: 100px;">상품 : ${dto.cName}</div>
		<div style="float: left; width: 50px;">개수 : ${dto.count}</div>
		<div style="float: left; width: 300px;">판매자 : ${dto.seller}</div>
		<div style="float: left; width: 100px;">${dto.cPrice}원</div>
	</div>
</div>
</c:forEach>