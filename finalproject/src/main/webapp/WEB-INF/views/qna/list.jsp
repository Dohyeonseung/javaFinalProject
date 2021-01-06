<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.submit();
	}
	
	function qnaList() {
		var f=document.qnaListForm;
		f.submit();
	}
</script>

<div class="body-container" style="width: 700px;">
	<div style="height: 50px;"></div>
	<div>
		<ul style="list-style: none;">
		 <li style="float: left; margin-right: 8px;">
		 	<a href="${pageContext.request.contextPath}/">홈</a>
		 	<span>></span>
		 </li>
		 <li style="float: left; margin-right: 8px;">
		 	<span>커뮤니티 ></span>
		 </li>
		 <li>
		 	<a href="${pageContext.request.contextPath}/qna/list">묻고 답하기</a>
		 </li>
		
		</ul>
	</div>
    <div class="body-title">
        <h3><i class="far fa-hand-peace"></i> 뭐든 물어봐 </h3>
    </div>
    
	<div>
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          ${dataCount}개(${page}/${total_page} 페이지)
		      </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <th width="60" style="color: #787878;">번호</th>
		      <th style="color: #787878;">제목</th>
		      <th width="100" style="color: #787878;">작성자</th>
		      <th width="80" style="color: #787878;">작성일</th>
		  </tr>
		 
		 <c:forEach var="dto" items="${list}">
		  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
		      <td>${dto.listNum}</td>
		      <td align="left" style="padding-left: 10px;">
			           <c:forEach var="n" begin="1" end="${dto.depth}">
			               &nbsp;
			           </c:forEach>
			           <c:if test="${dto.depth!=0}">└&nbsp;</c:if>
			           <a href="${articleUrl}&boardNum=${dto.boardNum}">${dto.subject}</a>
                      
		      </td>
		      <td>${dto.userName}</td>
		      <td>${dto.created}</td>
		  </tr>
		  </c:forEach>
		  
		</table>
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			        ${dataCount==0?"등록된 게시물이 없습니다.":paging}
			</td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/qna/list';">새로고침</button>
		      </td>
		      <td align="center">
		          <form name="searchForm" action="${pageContext.request.contextPath}/qna/list" method="post">
		              <select name="condition" class="selectField">
		                  <option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
		                  <option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
		                  <option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
		                  <option value="userName" ${condition=="userName"?"selected='selected'":""}>작성자</option>
		            </select>
		            <input type="text" name="keyword" value="${keyword}" class="boxTF">
		            <input type="hidden" name="rows" value="${rows}">
		            <button type="button" class="btn" onclick="searchList()">검색</button>
		        </form>
		      </td>
		      <td align="right" width="100">
		          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/qna/created';">글올리기</button>
		      </td>
		   </tr>
		</table>
    </div>

</div>