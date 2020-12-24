<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table style="margin: 10px auto 20px; width: 100%; border-spacing: 1px; background: #cccccc">
<tr height="37" style="background: #ffffff;">
    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">상품명</label></td>
    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.userId}</span></td>
    <td align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">상품코드</label></td>
    <td align="left" width="35%" style="padding-left: 5px;"><span>${dto.memberIdx}</span></td>
</tr>
<tr height="37" style="background: #ffffff;">
    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">가격</label></td>
    <td align="left" style="padding-left: 5px;"><span>${dto.userName}</span></td>
    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">재고</label></td>
    <td align="left" style="padding-left: 5px;"><span>${dto.birth}</span></td>
</tr>
<tr height="37" style="background: #ffffff;">
    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">등록일</label></td>
    <td align="left" style="padding-left: 5px;"><span>${dto.tel}</span></td>
    <td align="right" style="padding-right: 9px;"><label style="font-weight: 900;">카테고리</label></td>
    <td align="left" style="padding-left: 5px;"><span>${dto.email}</span></td>
</tr>

<tr height="37" style="background: #ffffff;">
    <td align="right" width="15%" style="padding-right: 9px;"><label style="font-weight: 900;">판매상태</label></td>
    <td align="left" colspan="3" style="padding-left: 5px;">
		  ${dto.enabled==1?"판매중":"미판매중"}
		  <c:if test="${dto.enabled==0 && not empty memberState}">, ${memberState.memo}</c:if>
    </td>
</tr>
</table>

<form id="deteailedMemberForm" name="deteailedMemberForm" method="post">
<h3 style="font-size: 15px;">상품 상태 변경</h3>
<table style="margin: 5px auto 0px; width: 100%; border-spacing: 1px; background: #cccccc">
<tr height="37" style="background: #ffffff;">
   <td align="right" width="15%" style="padding-right: 9px;"><label style="font-weight: 900;">계정상태</label></td>
   <td style="padding-left: 5px;">
       <select class="selectField" id="stateCode" name="stateCode" onchange="selectStateChange()">
       	  <option value="">::상태코드::</option>
       	  <!-- 
       	  <c:if test="${dto.enabled==0}">
       	      <option value="0">잠금 해제</option>
       	  </c:if>
       	   -->
       	  <option value="2">판매</option>
       	  <option value="3">미판매</option>
       </select>
   </td>
</tr>
<tr height="37" style="background: #ffffff;">
   <td align="right" width="15%" style="padding-right: 9px;"><label style="font-weight: 900;">메모</label></td>
   <td style="padding-left: 5px;">
       <input type="text" id="memo" name="memo" class="boxTF" style="width: 90%;">
   </td>
</tr>
</table>
<input type="hidden" name="memberIdx" value="${dto.memberIdx}">
<input type="hidden" name="userId" value="${dto.userId}">
<input type="hidden" name="registerId" value="${sessionScope.member.userId}">
</form>
