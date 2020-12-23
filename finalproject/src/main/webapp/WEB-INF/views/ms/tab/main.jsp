<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
   <tr height="35">
      <td align="left" width="50%">
          ${dataCount}개(${pageNo}/${total_page} 페이지)
      </td>
      <td align="right">
          &nbsp;
      </td>
   </tr>
</table>

<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
      <th width="120" style="color: #787878;">주문번호</th>
      <th style="color: #787878;">구매자</th>
      <th width="100" style="color: #787878;">구매개수</th>
      <th width="100" style="color: #787878;">금액</th>
      <th width="100" style="color: #787878;">구매날짜</th>
  </tr>
 

  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
      <td>1111</td>
      <td>홍길동(HONG)</td>
      <td>3</td>
      <td>1000</td>
      <td>2000-10-10</td>
  </tr>

</table>
 
<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
   <tr height="35">
	<td align="center">
       ${dataCount==0?"등록된 게시물이 없습니다.":paging}
	</td>
   </tr>
</table>

