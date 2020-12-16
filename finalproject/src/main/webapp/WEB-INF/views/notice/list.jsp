<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.submit();
	}
</script>

<div class="body-container" style="width: 800px;">
	<div>
		<ul style="list-style: none;">
		 <li style="float: left; margin-right: 8px;">
		 	<a href="${pageContext.request.contextPath}/">홈</a>
		 	<span>></span>
		 </li>
		 <li style="float: left; margin-right: 8px;">
		 	<span>고객센터 ></span>
		 </li>
		 <li>
		 	<a href="${pageContext.request.contextPath}/notice/list">공지사항</a>
		 </li>
		
		</ul>
	</div>
    <div class="body-title" align="center">
        <h3><i class="far fa-question-circle"></i> 공지사항 </h3>
    </div>
    
    <div>
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          ${dataCount}개(${page}/${total_page} 페이지)
		      </td>
		      <td align="right">
		          &nbsp;
		      </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="center" height="35" style="border-top: 2px solid black; border-bottom: 1px solid #cccccc;"> 
		      <th style="color: #787878;">내용</th>
		      <th width="100" style="color: #787878;">작성자</th>
		      <th width="100" style="color: #787878;">작성일</th>
		      <th width="80" style="color: #787878;">조회수</th>
		  </tr>
		<c:forEach var="dto" items="${noticeList}">
  			<tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
      			<td align="left" style="padding-left: 10px;"><span style="display: inline-block; padding:1px 3px; background: #ED4C00;color: #FFFFFF">공지</span>
           			<a href="${articleUrl}&listNum=${dto.listNum}">${dto.subject}</a>
     			 </td>
      			<td>${dto.userName}</td>
      			<td>${dto.created}</td>
      			<td>${dto.hitCount}</td>
  			</tr>
		</c:forEach> 
		 
		<c:forEach var="dto" items="${list}">
		  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
		      <td align="left" style="padding-left: 30px; padding: 15px 20px 14px;">
		           <a href="${articleUrl}&listNum=${dto.listNum}">${dto.subject}</a>
		      </td>
		      <td>${dto.userName}</td>
		      <td>${dto.created}</td>
		      <td>${dto.hitCount}</td>
		  </tr>
		  </c:forEach>
		</table>
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			    ${dataCount==0 ? "등록된 게시물이 없습니다.":paging}
			 </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/notice/list';">새로고침</button>
		      </td>

		      <td align="right" width="100">
		        <c:if test="${sessionScope.member.userId=='admin'}">
		          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/notice/created';">글올리기</button>
		         </c:if>
		      </td>
		   </tr>
		</table>
    </div>

</div>