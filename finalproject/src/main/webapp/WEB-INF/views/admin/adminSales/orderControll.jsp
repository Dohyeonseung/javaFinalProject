<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table style="margin: 10px auto 20px; width: 100%; border-spacing: 1px; background: #cccccc">
<tr height="37" style="background: #ffffff;">
    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">주문상품</label></td>
    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.productName}</span></td>
    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">상품코드</label></td>
    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.productCode}</span></td>
</tr>
<tr height="37" style="background: #ffffff;">
    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">결제금액</label></td>
    <td align="left" style="padding-left: 5px;"><span>${dto.amountPrice}</span></td>
    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">주문수량</label></td>
    <td align="left" style="padding-left: 5px;"><span>${dto.buyCount}</span></td>
</tr>
<tr height="37" style="background: #ffffff;">
    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">주문일자</label></td>
    <td align="left" style="padding-left: 5px;"><span>${dto.orderDate}</span></td>
    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">처리상태</label></td>
    <td align="left" style="padding-left: 5px;">
    <c:choose>
    	<c:when test="${dto.orderState == 0}">
    		<span>발송대기</span>
    	</c:when>
    	<c:when test="${dto.orderState == 1}">
    		<span>발송완료</span>
    	</c:when>
    	<c:when test="${dto.orderState == 2}">
    		<span>발송지연</span>
    	</c:when>
    	<c:when test="${dto.orderState == 3}">
    		<span>주문취소</span>
    	</c:when>
    </c:choose>
    </td>
</tr>


</table>

<form id="orderControllForm" name="orderControllForm" method="post">
<h3 style="font-size: 15px;">상품 상태 변경</h3>
<table style="margin: 5px auto 0px; width: 100%; border-spacing: 1px; background: #cccccc">
<tr height="37" style="background: #ffffff;">
   <td align="right" width="15%" style="padding-right: 9px;"><label style="font-weight: 900;">상품상태</label></td>
   <td style="padding-left: 5px;">
       <select class="selectField" id="orderCode" name="orderCode" onchange="selectOrderCodeChange()">
       	  <option value="">::상태코드::</option>
       	  <option value="0">발송대기</option>
       	  <option value="1">발송완료</option>
       	  <option value="2">발송지연</option>
       	  <option value="3">주문취소</option>
       </select>
   </td>
</tr>
<tr height="37" style="background: #ffffff;">
   <td align="right" width="15%" style="padding-right: 9px;"><label style="font-weight: 900;">메모</label></td>
   <td style="padding-left: 5px;">
       <input type="text" id="o_memo" name="o_memo" class="boxTF" style="width: 90%;">
   </td>
</tr>
</table>
<input type="hidden" name="productCode" value="${dto.productCode}">
<input type="hidden" name="orderNum" value="${dto.orderNum}">

</form>

