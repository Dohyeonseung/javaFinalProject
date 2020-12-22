<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<table style="width: 100%; margin: 15px auto 10px; table-layout:fixed; word-break:break-all; border-spacing: 0; border-collapse: collapse;">

	<tbody id="listGuestBody">

		<tr height='35' bgcolor='#eeeeee'>
			<td width='50%' style='padding-left: 5px; border:1px solid #cccccc; border-right:none;'>
				<span style='font-weight: 600;'>홍길동</span>
    		</td>
			<td width='50%' align='right' style='padding-right: 5px; border:1px solid #cccccc; border-left:none;'>
				2000-10-10
			</td>
		</tr>
		<tr height='50'>
			<td colspan='2' style='padding: 5px;' valign='top'>
				안녕
			</td>
		</tr>


	<tr height='40'>
		<td colspan='2' align='center'>
			${dataCount==0?"등록된 게시물이 없습니다.":paging}
		</td>
	</tr>    
	</tbody>
</table>
