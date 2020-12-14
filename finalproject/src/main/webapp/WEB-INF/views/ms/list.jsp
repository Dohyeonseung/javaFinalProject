<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="body-container" style="width: 700px;">
	<div class="body-title">
		<h3><i class="fas fa-chalkboard"></i> 판매하기 </h3>
	</div>
		
		<table style="width: 100%; border-spacing: 0px; border-collapse: collapse;">
			<tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
				<th width="60" style="color: #787878;">번호</th>
				<th width="100" style="color: #787878;">작성일</th>
				<th style="color: #787878;">제목</th>
				<th width="50" style="color: #787878;">가격</th>
				<th width="80" style="color: #787878;">상태</th>
			</tr>
		 	<c:forEach var="dto" items="${list }">
			<tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
				<td>${dto.productNum}</td>
				<td>${dto.created_date}</td>
				<td align="left" style="padding-left: 10px;">
						<a href="${articleUrl}&num=${dto.productNum}">${dto.productName}</a>
				</td>
				<td>${dto.price}</td>
				<td></td>
				<td>
					<c:if test="${not empty dto.saveFilename}">
						<a href="${pageContext.request.contextPath }/bbs/download?num=${dto.num}"><i class="far fa-file"></i></a>
					</c:if>
				</td>
			</tr>
			</c:forEach>
		</table>

		<table style="width: 100%; border-spacing: 0px;">
			<tr height="35">
				<td align="center">
					${dataCount==0?"등록된 게시물이 없습니다.":paging }
				</td>
			</tr>
		</table>

		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
			<tr height="40">
				<td align="left" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/bbs/list';">새로고침</button>
				</td>
				
				<td align="right" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/bbs/created';">글올리기</button>
				</td>
			</tr>
		</table>
	</div>

</div>