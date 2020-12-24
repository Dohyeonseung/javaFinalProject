<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<table style="width: 100%; margin: 15px auto 10px; table-layout:fixed; word-break:break-all; border-spacing: 0; border-collapse: collapse;">

	<tbody id="listReviewBody">
	<c:forEach var="dto" items="${list}">	
		  <tr>
		    <td colspan="3">${dto.starScore}</td>
		  </tr>
		  <tr style="border-bottom: 1px solid #e5e5e5; ">
		    <td>${dto.userName}</td>
		    <td colspan="2">${dto.created}</td>
		    
		  </tr>
		  <tr>
		    <td colspan="2">${dto.content}</td>
		    
		  </tr>
 	</c:forEach>
	<tr height='40'>
		<td colspan='2' align='center'>
			${dataCount==0?"":paging}
		</td>
	</tr>    
	</tbody>
</table>
