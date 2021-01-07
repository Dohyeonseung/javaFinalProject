<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.shoplistbox:hover{
	background: #e5e5e5;
}

.btn2{
background: white; 
height:25px;
width:30px;
border:none;
border-radius: 6px;
}
.btn2:hover{
box-shadow: -1px 0 #FAE500, 0 1px #FAE500, 1px 0 #FAE500, 0 -1px #FAE500;
}

.shoplistbox td button{
	background: none;
	font-family: inherit;
}
.shoplistbox td button:hover{
	background: #666;
}
</style>


<script type="text/javascript">
function deleteMaterialSell(productNum) {
		var q = "productNum="+productNum+"&page=${page}";
		var url = "${pageContext.request.contextPath}/ms/delete?" + q;

		if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
				location.href=url;
		}
	}
	
function updateMaterialSell(productNum) {
		var q = "productNum="+productNum+"&page=${page}";
		var url = "${pageContext.request.contextPath}/ms/update?" + q;

		location.href=url;
	}
function searchList() {
	var f=document.searchForm;
	f.sortCol.value=$("#sortColumn").val();
	f.submit();
}
	
</script>

<div class="body-container" style="width: 700px;">
	<div class="body-title">
		<h4>홈 > Sell - 재료판매 </h4>
	</div>
	<div style="float: left;">
		<form name="searchForm" action="${pageContext.request.contextPath}/ms/list" method="post"><!-- 서치폼을 만들고 모든정보를 ms action주소로 보낸다. -->
			<input type="text" name="keyword" value="${keyword}" class="boxTF">
			<input type="hidden" name="sortCol" value="new">
		    <button type="button" class="btn2" onclick="searchList()">검색</button>
		 </form>
	</div>
	<button type="button" class="btn" style="float: right;" onclick="javascript:location.href='${pageContext.request.contextPath}/ms/created';">게시물 추가</button>
            <select style="float: right; margin-right: 5px;" id="sortColumn" class="selectField" onchange="searchList()">
                  <option value="new" ${sortCol=="new"?"selected='selected'":""}>등록일순</option>
                  <option value="stock" ${sortCol=="stock"?"selected='selected'":""}>재고순</option>
                  <option value="popularity" ${sortCol=="popularity"?"selected='selected'":""}>판매인기순</option>
                  <option value="highPrice" ${sortCol=="highPrice"?"selected='selected'":""}>높은가격순</option>
                  <option value="rowPrice" ${sortCol=="rowPrice"?"selected='selected'":""}>낮은가격순</option>
            </select>
		<table style="border-color:#e5e5e5;  width: 100%; border-spacing: 0px; border-collapse: collapse; border-radius:50%; " >
			<tr align="center" bgcolor="white" height="35"  style="border-bottom: 2px solid #e5e5e5;"> 
				<th width="40" style="color: #1e1e1e;">번호 </th>
				<th width="100" style="color:#1e1e1e;">게시일</th>
				<th style="color:#1e1e1e;">분류/제목/가격</th>
				<th width="40" style="color: #1e1e1e;">재고</th>
				<th width="70" style="color: #1e1e1e;">수정/삭제</th>
			</tr>
		 <c:forEach var="dto" items="${list}">
			<tr class="shoplistbox" align="center" bgcolor="#ffffff" height="50" style="border-bottom: 1px solid #e5e5e5;"> 
				<td >${dto.listNum}</td>
			    <td height="100" >${dto.created_date}</td>
			    <td  height="50px" style="display: flex; flex-direction: row; justify-content: center;">
					<div>
						<a href="${articleUrl}&productNum=${dto.productNum}" style="text-decoration: none;height: 100%; "> <img src="${pageContext.request.contextPath}/uploads/ms/${dto.imageFilename}" width="70"
			                   height="70" border="0" onclick="javascript:article('${dto.productNum}');"></a>
			        </div>    
			            <a href="${articleUrl}&productNum=${dto.productNum}" style="text-decoration: none; width: 100%; height:80px; display: flex; justify-content: center; align-items: center;"><span>${dto.categoryName} / ${dto.productName} / ${dto.price}원</span></a>
				</td>
				<td height="50">${dto.stock}</td>
				<td height="50">
					<button type="button" class="btn" onclick="updateMaterialSell('${dto.productNum}');" style="margin: 2px;">수정</button>
			          <button type="button" class="btn" onclick="deleteMaterialSell('${dto.productNum}');" style="margin: 2px;">삭제</button>
			    </td>
		    </tr>
			</c:forEach>
		</table>

		<table style="width: 100%; border-spacing: 0px;">
			<tr height="35">
				<td align="center">
					${mselldataCount==0?"":paging }
				</td>
			</tr>
		</table>
	</div>
