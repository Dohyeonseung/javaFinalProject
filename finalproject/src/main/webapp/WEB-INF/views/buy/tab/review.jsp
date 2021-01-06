<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.star{
	font-size:0; letter-spacing: -4px;
}

.star a{
	font-size: 22px;
	letter-spacing: 0;
	display: inline-block;
	margin: 3px 0px;
	color: #ccc;
	text-decoration: none;
}

.star a:first-child{
	margin-left: 0;
}
</style>


	<div style="display: flex;">
		<span style="padding-top: 8px;">별점주기</span>
		<p class="star">
			<a class="on">★</a>
			<a>★</a>
			<a>★</a>
			<a>★</a>
			<a>★</a>
		</p>
	</div>
	
	<div style="margin: 10px;">
		<input type="hidden" name="starScore" value="0" readonly="readonly">
	</div>

<table style='width: 100%; margin: 15px auto 0px; border-spacing: 0px;'>
			<tr height='30'> 
				 <td align='left' >
				 	<span style='font-weight: bold;' >리뷰작성</span>
				 </td>
			</tr>
			<tr>
			   	<td style='padding:5px 5px 0px;'>
					<textarea class='boxTA' style='width:99%; height: 70px;'></textarea>
			    </td>
			</tr>
			<tr>
			   <td align='right'>
			        <button type='button' class='btn btnSendReply' style='padding:10px 20px;'>등록</button>
			    </td>
			 </tr>
		</table>

<div style="width: 100%; border: 1px solid #e5e5e5; margin: 20px 0px;"></div>

<table style="width: 100%; margin: 15px auto 5px; table-layout:fixed; word-break:break-all; border-spacing: 0; border-collapse: collapse;">

	<tbody id="listReviewBody">
	<c:forEach var="dto" items="${list}">	
		  <tr>
		  	<c:choose>
			    <c:when test="${dto.starScore eq 1}">
			        <td colspan="3" style="color: #FAE500;">★</td>
			    </c:when>
			    <c:when test="${dto.starScore eq 2}">
			        <td colspan="3" style="color: #FAE500;">★★</td>
			    </c:when>
			    <c:when test="${dto.starScore eq 3}">
			        <td colspan="3" style="color: #FAE500;">★★★</td>
			    </c:when>
			    <c:when test="${dto.starScore eq 4}">
			        <td colspan="3" style="color: #FAE500;">★★★★</td>
			    </c:when>
			    <c:when test="${dto.starScore eq 5}">
			        <td colspan="3" style="color: #FAE500;">★★★★★</td>
			    </c:when>
		  </c:choose>
		  <tr>
		    <td style="width:20%;">${dto.userName} &nbsp;&nbsp;&nbsp;  ${dto.created}</td>
		
		  </tr>
		  <tr>
		    <td colspan="2" style="height: 60px;">${dto.content}</td>
		  </tr>
 	</c:forEach>
	<tr height='40'>
		<td colspan='2' align='center'>
			${dataCount==0?"":paging}
		</td>
	</tr>    
	</tbody>
</table>
