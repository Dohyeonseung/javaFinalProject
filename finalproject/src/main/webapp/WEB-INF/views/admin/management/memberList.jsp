<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
div, body {
	margin: 0;
	padding: 0;
}


#mainContainer {
	width: 100%;
	height: auto;
	overflow: hidden;
}

#contentContainer {
	width: 1280px;
	height: 1980px;
	margin: auto;
}

#table_box {
	width: 100%;
	height: 70%;
	margin-top: 150px;
}
.member_title {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #e5e5e5;
}

.btn_style {
	width: 100px;
	height: 30px;
	border-radius: 0;
	border-top: 0;
	border-bottom: 0;
	border-left: 0;
	border-right: 0;
	font-family: "맑은 고딕", sans-serif;
	font-weight: bold;
	transition: all 0.9s, color 0.3s;
}

.btn_style:hover {
    box-shadow: 0 50px 0 0 rgba(0, 0, 0, 0.1) inset, 
                0 -50px 0 0 rgba(0, 0, 0, 0.1) inset;
    
}
</style>
<script type="text/javascript">
function ajaxFun(url, method, dataType, query, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status == 403) {
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function searchList() {
	var f=document.searchForm;
	f.enabled.value=$("#selectEnabled").val();
	f.action="${pageContext.request.contextPath}/admin/management/list";
	f.submit();
}

</script>
<div id="mainContainer">
	<div id="contentContainer">
		<div id="table_box">
		<div class="member_title">
				<h2><i class="fas fa-user-cog"></i> 회원관리</h2>
		</div>
		
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          ${dataCount}개(${page}/${total_page} 페이지)
		      </td>
		      <td align="right">
			          <select id="selectEnabled" class="selectField" onchange="searchList();">
			          		<option value="" ${enabled=="" ? "selected='selected'":""}>::계정상태::</option>
			          		<option value="0" ${enabled=="0" ? "selected='selected'":""}>잠금 계정</option>
			          		<option value="1" ${enabled=="1" ? "selected='selected'":""}>활성 계정</option>
			          </select>
			   </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="center" bgcolor="FFFFFF" height="35" style="border-top: 2px solid #1e1e1e; border-bottom: 1px solid #1e1e1e;"> 
		      <th width="30" style="color: #1e1e1e;">번호</th>
		      <th width="50" style="color: #1e1e1e;">아이디</th>
		      <th width="50" style="color: #1e1e1e;">이름</th>
		      <th width="100" style="color: #1e1e1e;">사용자이메일</th>
		      <th width="50" style="color: #1e1e1e;">가입일</th>
		      <th width="50" style="color: #1e1e1e;">상태</th>
		      <th width="10" style="color: #1e1e1e;"></th>
		  </tr>
		 <c:forEach var="dto" items="${list}">
		  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
		      <td width="30">${dto.listNum}</td>
		      <td width="50">
		           ${dto.userId}
		      </td>
		      <td width="50">${dto.userName}</td>
		      <td width="100">${dto.email}</td>
		      <td width="50">${dto.created_date}</td>
		      <td width="50">${dto.enabled==1?"활성화":"비활성화"}</td>
		      <td width="10">
		      <a href="${pageContext.request.contextPath}/admin/management/info?userId=${dto.userId}" style="float: center; color: #1e1e1e;"><i class="fas fa-cog"></i></a>
		      </td>
		  </tr>
		 </c:forEach>

		</table>
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			       ${dataCount==0?"등록된 회원이 없습니다.":paging}
			 </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn_style" onclick="location.href='${pageContext.request.contextPath}/admin/management/list'">새로고침</button>
		      </td>
		      <td align="center" style="padding-right: 20px;">
		          <form name="searchForm" action="${pageContext.request.contextPath}/admin/management/list" method="post">
		              <select name="condition" class="selectField" style="width: 100px; height: 30px;">
		                  <option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
		                  <option value="userId" ${condition=="userId"?"selected='selected'":""}>아이디</option>
		                  <option value="userName" ${condition=="userName"?"selected='selected'":""}>이름</option>
		                  <option value="signUpdate" ${condition=="created_date"?"selected='selected'":""}>가입일</option>
		            </select>
		            <input type="text" name="keyword" value="${keyword}" class="boxTF" style="width: 300px; height: 24px;">
		            <input type="hidden" name="enabled" value="${enabled}">
		            <input type="hidden" name="page" value="1">
		            <button type="button" class="btn_style" style="vertical-align: bottom;" onclick="searchList();">검색</button>
		        </form>
		      </td>
		   </tr>
		</table>
		</div>
	</div>
</div>