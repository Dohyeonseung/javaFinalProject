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
<div id="mainContainer">
	<div id="contentContainer">
		<div id="table_box">
		<div class="member_title">
				<h2><i class="fas fa-user-cog"></i> 승인관리</h2>
		</div>
		
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          <strong><i class="fas fa-exclamation"></i> 판매자 신청 검토 완료된 회원만 등재됩니다.</strong>
		      </td>
		      <td align="right" width="50%">
		          <strong>14명</strong>
		      </td>
		      <td align="right">
		          &nbsp;
		      </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <th width="50" style="color: #787878;">신청날짜</th>
		      <th width="50" style="color: #787878;">아이디</th>
		      <th width="50" style="color: #787878;">이름</th>
		      <th width="50" style="color: #787878;">검토결과</th>
		      <th width="50" style="color: #787878;">권한부여</th>
		  </tr>
		 
		  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
		      <td width="50">2020-12-16</td>
		      <td width="50">admin77</td>
		      <td width="50">관리자</td>
		      <td width="50">승인</td>
		      <td width="50">
		      <a href="#" style="float: center"><i class="fas fa-check" style="color: #1e1e1e;"></i></a>
		      <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
		      <a href="#" style="float: center"><i class="fas fa-times" style="color: #1e1e1e;"></i></a>
		      <!-- <a style="float: center"><i class="fas fa-lock-open" style="color: #1e1e1e;"></i></a> -->
		      </td>
		  </tr>

		</table>
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			       ${dataCount==0?"신청한 회원이 없습니다.":paging}
			 </td>
		   </tr>
		</table>
		
		<div class="btn_box">
	    		<form action="">
	    			<button type="button" class="btn_style" id="returnList_btn" style="margin-right: 750px;" onclick="location.href='${pageContext.request.contextPath}/admin/authority/list'">새로고침</button>
	    		</form>
	    	</div>
		</div>
	</div>
</div>