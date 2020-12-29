<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
div, body {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
}

.productList_a:hover {
	text-decoration: none;
	color: #4374D9;
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
	function searchList() {
		var f=document.searchForm;
		f.categoryNum.value=$("#selectEnabled").val();
		f.submit();
	}
</script>

<div id="mainContainer">
	<div id="contentContainer">
		<div id="table_box">
		<div class="member_title">
				<h2><i class="fas fa-boxes"></i> 물류리스트</h2>
		</div>
		
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
		          ${dataCount}개(${page}/${total_page} 페이지)
		      </td>
		      <td align="right">
			          <select id="selectEnabled" class="selectField" onchange="searchList();">
			          		<option value="0" ${categoryNum=="0" ? "selected='selected'":""}>==선택하세요==</option>
							<option value="1" ${categoryNum=="1" ? "selected='selected'":""}>DIY 제작키트</option>
							<option value="2" ${categoryNum=="2" ? "selected='selected'":""}>재료</option>
							<option value="3" ${categoryNum=="3" ? "selected='selected'":""}>공구</option>
							<option value="4" ${categoryNum=="4" ? "selected='selected'":""}>기타</option>
			          </select>
			   </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
		  <tr align="center" bgcolor="#FFFFFF" height="35" style="border-top: 2px solid #1e1e1e; border-bottom: 1px solid #1e1e1e;"> 
		      <th width="50" style="color: #1e1e1e;">상품등록일</th>
		      <th width="50" style="color: #1e1e1e;">상품분류</th>
		      <th width="50" style="color: #1e1e1e;">상품코드</th>
		      <th width="100" style="color: #1e1e1e;">상품명</th>
		      <th width="50" style="color: #1e1e1e;">가격</th>
		      <th width="50" style="color: #1e1e1e;">수량</th>
		      <th width="30" style="color: #1e1e1e;">상태</th>
		      <th width="20" style="color: #1e1e1e;"></th>
		  </tr>
		 <c:forEach var="dto" items="${list}">
		  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
		      <td width="50">${dto.registrationDate}</td>
		      <td width="50">${dto.categoryName}</td>
		      <td width="50">${dto.productCode}</td>
		      <td width="100">${dto.productName}</td>
		      <td width="50">${dto.productPrice}원</td>
		      <td width="50">${dto.productCount}</td>
		      <td width="50">${dto.productState == 0?'판매':'미판매'}</td>
		      <td width="30">
		      <a href="${pageContext.request.contextPath}/admin/adminSales/productinfo?productCode=${dto.productCode}&page=${page}" style="float: center" class="productList_a"><i class="fas fa-cog" style="color: #1e1e1e;"></i></a>
		      </td>
		  </tr>
		 </c:forEach>

		</table>
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			       ${dataCount==0?"등록된 상품이 없습니다.":paging}
			 </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn_style" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/adminSales/productlist';">새로고침</button>
		      </td>
		      <td align="center">
		      <form name="searchForm" action="${pageContext.request.contextPath}/admin/adminSales/productlist" method="post">
		              <select name="condition" class="selectField" style="width: 100px; height: 30px;">
		                  <option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
		                  <option value="productCode" ${condition=="subject"?"selected='selected'":""}>물류코드</option>
		                  <option value="productName" ${condition=="content"?"selected='selected'":""}>상품명</option>
		                  <option value="registrationDate" ${condition=="userName"?"selected='selected'":""}>입고일</option>
		            </select>
		            <input type="text" name="keyword" value="${keyword}" class="boxTF" style="width: 300px; height: 26px;">
		            <button type="button" class="btn_style" style="vertical-align: bottom;" onclick="searchList()">검색</button>
		            <input type="hidden" name="categoryNum" value="${categoryNum}">
		      </form>
		      </td>
		      <td align="right" width="100">
		          <button type="button" class="btn_style" onclick="javascript:location.href='${pageContext.request.contextPath}/admin/adminSales/registration';">상품등록</button>
		      </td>
		   </tr>
		</table>
		
		</div>
	</div>
</div>