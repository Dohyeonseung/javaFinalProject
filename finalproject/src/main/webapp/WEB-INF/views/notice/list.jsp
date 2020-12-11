﻿<%@ page contentType="text/html; charset=UTF-8" %>
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
		      <th width="50" style="color: #787878;">첨부</th>
		  </tr>
		 
		<c:forEach var="dto" items="${list}">
		  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
		      <td align="left" style="padding-left: 30px; padding: 15px 20px 14px;">
		           <a href="${articleUrl}&num=${dto.num}">${dto.subject}</a>
		           <c:if test="${dto.gap < 1}">
		               <img src='${pageContext.request.contextPath}/resources/images/new.gif'>
		           </c:if>
		      </td>
		      <td>${dto.userName}</td>
		      <td>${dto.created}</td>
		      <td>${dto.hitCount}</td>
		      <td>
                   <c:if test="${dto.fileCount != 0}">
                        <a href="${pageContext.request.contextPath}/notice/zipdownload?num=${dto.num}"><i class="far fa-file"></i></a>
                   </c:if>		      
		      </td>
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
		      <td align="center">
		          <form name="searchForm" action="${pageContext.request.contextPath}/notice/list" method="post">
		              <select name="condition" class="selectField">
		                  <option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
		                  <option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
		                  <option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
		                  <option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
		                  <option value="created" ${condition=="created"?"selected='selected'":""}>등록일</option>
		            </select>
		            <input type="text" name="keyword" value="${keyword}" class="boxTF">
		            <button type="button" class="btn" onclick="searchList()">검색</button>
		        </form>
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