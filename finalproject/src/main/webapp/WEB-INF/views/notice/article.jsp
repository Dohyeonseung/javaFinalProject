<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
function deleteBoard() {
	<c:if test="${sessionScope.member.userId=='admin'}">
	  var q = "listNum=${dto.listNum}&${query}";
	  var url = "${pageContext.request.contextPath}/notice/delete?" + q;

	  if(confirm("위 자료를 삭제 하시 겠습니까 ? "))
	  	location.href=url;
	</c:if>    
	<c:if test="${sessionScope.member.userId!='admin'}">
	  alert("게시물을 삭제할 수  없습니다.");
	</c:if>
	}

	function updateBoard() {
	<c:if test="${sessionScope.member.userId=='admin'}">
	  var q = "listNum=${dto.listNum}&page=${page}";
	  var url = "${pageContext.request.contextPath}/notice/update?" + q;

	  location.href=url;
	</c:if>

	<c:if test="${sessionScope.member.userId!='admin'}">
	 alert("게시물을 수정할 수  없습니다.");
	</c:if>
	}
</script>

<div class="body-container" style="width: 800px;">
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
		 	<a href="${pageContext.request.contextPath}/notice/list">공지사항</a>
		 </li>
		
		</ul>
	</div>
    
    <div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35" style="border-top: 1px solid #cccccc; margin-top: 20px;">
			    <td colspan="2" align="center">
				   ${dto.subject}
			    </td>
			</tr>
			
			
			<tr style="border-bottom: 1px solid #cccccc;">
			  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
			      ${dto.content}
			   </td>
			</tr>
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td width="50%" align="left" style="padding-left: 5px;">
			       올린 사람 : ${dto.userName}
			    </td>
			    <td width="50%" align="right" style="padding-right: 5px;">
			        ${dto.created} | 조회 ${dto.hitCount}
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       이전글 :
			         <c:if test="${not empty preReadDto}">
			              <a href="${pageContext.request.contextPath}/notice/article?${query}&listNum=${preReadDto.listNum}">${preReadDto.subject}</a>
			        </c:if>
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       다음글 :
			
			              <a href="${pageContext.request.contextPath}/notice/article?${query}&listNum=${nextReadDto.listNum}">${nextReadDto.subject}</a>
			        
			    </td>
			</tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			       <c:if test="${sessionScope.member.userId=='admin'}">				    
			          <button type="button" class="btn" onclick="updateBoard();">수정</button>
			       </c:if>
			       <c:if test="${sessionScope.member.userId=='admin'}">				    
			          <button type="button" class="btn" onclick="deleteBoard();">삭제</button>
			       </c:if>
			    </td>
			
			    <td align="right">
			        <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/notice/list?${query}';">목록</button>
			    </td>
			</tr>
			</table>
    </div>
    
</div>