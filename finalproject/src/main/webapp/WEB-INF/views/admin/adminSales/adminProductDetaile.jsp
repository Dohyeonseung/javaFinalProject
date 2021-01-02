<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table style="margin: 10px auto 20px; width: 100%; border-spacing: 1px; background: #cccccc">
<tr height="37" style="background: #ffffff;">
    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">상품명</label></td>
    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.productName}</span></td>
    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">상품코드</label></td>
    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.productCode}</span></td>
</tr>
<tr height="37" style="background: #ffffff;">
    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">상품가격</label></td>
    <td align="left" style="padding-left: 5px;"><span>${dto.productPrice}</span></td>
    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">상품수량</label></td>
    <td align="left" style="padding-left: 5px;"><span>${dto.productCount}</span></td>
</tr>
<tr height="37" style="background: #ffffff;">
    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">상품등록일</label></td>
    <td align="left" style="padding-left: 5px;"><span>${dto.registrationDate}</span></td>
    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">상태분류</label></td>
    <td align="left" style="padding-left: 5px;"><span>${dto.stateName}</span></td>
</tr>


</table>

<form id="deteailedProductForm" name="deteailedProductForm" method="post">
<h3 style="font-size: 15px;">상품 상태 변경</h3>
<table style="margin: 5px auto 0px; width: 100%; border-spacing: 1px; background: #cccccc">
<tr height="37" style="background: #ffffff;">
   <td align="right" width="15%" style="padding-right: 9px;"><label style="font-weight: 900;">계정상태</label></td>
   <td style="padding-left: 5px;">
       <select class="selectField" id="stateCode" name="stateCode" onchange="selectStateChange()">
       	  <option value="">::상태코드::</option>
       	  <c:if test="${dto.stateCode==0}">
       	      <option value="0">판매대기</option>
       	  </c:if>
       	  <option value="1">판매</option>
       	  <option value="2">판매중단</option>
       	  <option value="3">판매종료</option>
       </select>
   </td>
</tr>
<tr height="37" style="background: #ffffff;">
   <td align="right" width="15%" style="padding-right: 9px;"><label style="font-weight: 900;">메모</label></td>
   <td style="padding-left: 5px;">
       <input type="text" id="stateMemo" name="stateMemo" class="boxTF" style="width: 90%;">
   </td>
</tr>
</table>
<input type="hidden" name="memberIdx" value="${dto.memberIdx}">
<input type="hidden" name="productCode" value="${dto.productCode}">

</form>

