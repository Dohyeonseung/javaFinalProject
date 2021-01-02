<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.countBox {
	background: none;
	border: 1px solid #ccc;
	border-radius: 20px;
}
</style>

<table style="margin: 10px auto 20px; width: 100%; border-spacing: 1px; background: #cccccc">
<tr height="37" style="background: #ffffff;">
    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">상품명</label></td>
    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.productName}</span></td>
    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">상품코드</label></td>
    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.productCode}</span></td>
</tr>
<tr height="37" style="background: #ffffff;">
    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">최근발주일</label></td>
    <td align="left" style="padding-left: 5px;"><span>${dto.productOrderDate}</span></td>
    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">상품수량</label></td>
    <td align="left" style="padding-left: 5px;"><span>${dto.productCount}EA</span></td>
</tr>
</table>

<form id="productOrderForm" name="productOrderForm" method="post">
<h3 style="font-size: 15px;">상품발주</h3>
<table style="margin: 5px auto 0px; width: 100%; border-spacing: 1px; background: #cccccc">
<tr height="37" style="background: #ffffff;">
   <td align="right" width="15%" style="padding-right: 9px;"><label style="font-weight: 900;">발주수량</label></td>
   <td style="padding-left: 5px;">
		<input type="button" class="countBox" value="+" id="plusCount" name="plusCount" onclick="plusCount();">
		<input type="text" class="boxTF" style="width: 20%;" id="productOrderCount" name="productOrderCount" value="1">
		<input type="button" class="countBox" value="─" id="minusCount" name="plusCount" onclick="minusCount();">
   </td>
</tr>
<tr height="37" style="background: #ffffff;">
   <td align="right" width="15%" style="padding-right: 9px;"><label style="font-weight: 900;">메모</label></td>
   <td style="padding-left: 5px;">
       <input type="text" id="productOrderMemo" name="productOrderMemo" class="boxTF" style="width: 90%;">
   </td>
</tr>
</table>
<input type="hidden" name="productCode" value="${dto.productCode}">

</form>

<script type="text/javascript">
$(function(){
	$("#plusCount").click(function(){
		var productOrderCount = $("#productOrderCount").val();
		productOrderCount++;
		$("#productOrderCount").val(productOrderCount);
	});
	$("#minusCount").click(function(){
		var productOrderCount = $("#productOrderCount").val();
		if(productOrderCount <= 1){
			return false;
		}
		productOrderCount--;
		$("#productOrderCount").val(productOrderCount);
	});
});
</script>

