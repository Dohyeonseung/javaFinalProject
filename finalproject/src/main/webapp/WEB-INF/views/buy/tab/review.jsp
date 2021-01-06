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
	margin-left: 3px;
	color: #ccc;
	text-decoration: none;
}
.star a:first-child{
	margin-left: 0;
}
</style>

<script type="text/javascript">
$(function(){
	$(".btnSendReply").click(function(){
		var num="${dto.productNum}";
		var $tb = $(this).closest("table");
		var content=$tb.find("textarea").val().trim();
		if(! content) {
			$tb.find("textarea").focus();
			return false;
		}
		content = encodeURIComponent(content);
		
		var url="${pageContext.request.contextPath}/buytab/information/insertReview";
		var query="num="+num+"&content="+content+"&answer=0";
		
		var fn = function(data){
			$tb.find("textarea").val("");
			
			var state=data.state;
			if(state==="true") {
				listPage(1);
			} else if(state==="false") {
				alert("댓글을 추가 하지 못했습니다.");
			}
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});
</script>


	<div style="display: flex;">
		<span>별점주기</span>
		<p class="star">
			<a href="#">★</a>
			<a href="#">★</a>
			<a href="#">★</a>
			<a href="#">★</a>
			<a href="#">★</a>
		</p>
	</div>
	
	<div style="margin: 10px;">
		<input type="text" name="score" value="0" readonly="readonly">
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
