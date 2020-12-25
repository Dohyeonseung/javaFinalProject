<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>

.inforTab{
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
}

.infoTable{
	margin: 0 auto;
	border-bottom: 1px solid #e5e5e5;
	width: 100%;
	text-align: center;
	 padding: 20px 0px 20px 0px;
	font-size: 16px;
}

.infoTable:hover {
	background: #e5e5e5;
	box-shadow: 0 1px 1px #e5e5e5 inset;
	  border-radius: 5px;
	  min-height: 2em;
	  border-bottom: 1px solid #e5e5e5;
	  padding: 20px 0px 20px 0px;
}
</style>



<div class=infoTab>
<c:forEach var="dto" items="${list}">
	<table class="infoTable">
	
	  <tr>
	    <td style="color:#bbb; font-weight: bold;">주문번호</td>
	    <td>${dto.orderId}</td>
	  </tr>
	  <tr>
	    <td style="color:#bbb; font-weight: bold;" >구매자</td>
	    <td>${dto.userId}/${dto.userName}</td>
	  </tr>
	   <tr>
	    <td style="color:#bbb; font-weight: bold;" >주문수량</td>
	    <td>${dto.count}개<span style="font-weight: bold;">(${dto.orderId}원)</span></td>
	  </tr>
	 
	</table>
 </c:forEach>
 
<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
   <tr height="35">
	<td align="center">
       ${dataCount==0?"등록된 게시물이 없습니다.":paging}
	</td>
   </tr>
</table>

</div>