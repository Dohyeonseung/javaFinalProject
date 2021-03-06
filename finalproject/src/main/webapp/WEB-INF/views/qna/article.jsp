<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
function deleteQna() {
<c:if test="${dto.userId == sessionScope.member.userId || sessionScope.member.userId == 'admin' }">
	if(confirm("게시물을 삭제 하시겠습니까 ?")) {
		var q = "boardNum=${dto.boardNum}&page=${page}&rows=${rows}";
		  var url = "${pageContext.request.contextPath}/qna/delete?" + q;
		location.href=url;
</c:if>
	}
}

function updateQna() {
	<c:if test="${sessionScope.member.userId==dto.userId}">
	  var q = "boardNum=${dto.boardNum}&page=${page}&rows=${rows}";
	  var url = "${pageContext.request.contextPath}/qna/update?" + q;

	  location.href=url;
	</c:if>

	<c:if test="${sessionScope.member.userId!=dto.userId}">
	 alert("게시물을 수정할 수  없습니다.");
	</c:if>
}

function qnaReply() {
	 var q = "boardNum=${dto.boardNum}&page=${page}&rows=${rows}";
	  var url = "${pageContext.request.contextPath}/qna/reply?" + q;

	  location.href=url;
}
</script>
</head>

<div class="body-container" style="width: 700px;">
	<div style="height: 50px;"></div>
    <div style="font-size: 20px;">
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
    
    <div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="center">
				   <c:if test="${dto.depth!=0}">[Re]</c:if>
				   ${dto.subject}
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td width="50%" align="left" style="padding-left: 5px;">
			       이름 : ${dto.userName}
			    </td>
			    <td width="50%" align="right" style="padding-right: 5px;">
			        ${dto.created}
			    </td>
			</tr>
			
			<tr style="border-bottom: 1px solid #cccccc;">
			  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
			      ${dto.content}
			   </td>
			</tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			          <button type="button" class="btn" onclick="qnaReply();">답변</button>
			          <c:if test="${dto.userId == sessionScope.member.userId}">
			          		<button type="button" class="btn" onclick="updateQna();">수정</button>
			          </c:if>
			          <c:if test="${dto.userId == sessionScope.member.userId || sessionScope.member.userId == 'admin' }">
			          		<button type="button" class="btn" onclick="deleteQna();">삭제</button>
			          </c:if>
			    </td>
			
			    <td align="right">
			        <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/qna/list?${query}';">리스트</button>
			    </td>
			</tr>
			</table>
			
			<table style="width: 100%; margin: 25px auto; border-spacing: 0px; border-collapse: collapse;">
			  <tr><td height="1" colspan="5" bgcolor="#cccccc"></td></tr>
			  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <th width="60" style="color: #787878;">번호</th>
			      <th style="color: #787878;">제목</th>
			      <th width="100" style="color: #787878;">작성자</th>
			      <th width="80" style="color: #787878;">작성일</th>
			  </tr>
			 
			 <c:forEach var="vo" items="${listArticle}">
			  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
			      <td>${vo.listNum}</td>
			      <td align="left" style="padding-left: 10px;">
				           <c:forEach var="n" begin="1" end="${vo.depth}">
				               &nbsp;
				           </c:forEach>
				           <c:if test="${vo.depth!=0}">└&nbsp;</c:if>
				           <c:if test="${dto.boardNum == vo.boardNum}">
				                ${vo.subject}
				           </c:if>
				           <c:if test="${dto.boardNum != vo.boardNum}">
				                <a href="${pageContext.request.contextPath}/qna/article?${query}&boardNum=${vo.boardNum}">${vo.subject}</a>
				           </c:if>
			      </td>
			      <td>${vo.userName}</td>
			      <td>${vo.created}</td>
			  </tr>
			  </c:forEach>
			  
			</table>
    </div>
</div>