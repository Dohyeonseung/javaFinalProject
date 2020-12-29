<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
