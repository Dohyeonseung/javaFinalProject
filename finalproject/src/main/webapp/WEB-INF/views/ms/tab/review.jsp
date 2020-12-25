<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<table style="width: 100%; margin: 15px auto 5px; table-layout:fixed; word-break:break-all; border-spacing: 0; border-collapse: collapse;">

	<tbody id="listReviewBody">
	<c:forEach var="dto" items="${list}">	
		  <tr>
		    <td colspan="3">${dto.starScore}</td>
		  </tr>
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
