<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
function cateInsert() {
	var f = document.categoryForm;
	
	var str = f.category.value;
    if(!str) {
        alert("카테고리를 입력하세요. ");
        f.subject.focus();
        return;
    }
    
    f.action="${pageContext.request.contextPath}/tip/insertCategory";

    f.submit();
}

function cateDelete(categoryNum) {
	var q = "categoryNum="+categoryNum;
	var url = "${pageContext.request.contextPath}/tip/deleteCategory?" + q;
	
	if(confirm("해당 카테고리를 삭제 하시 겠습니까 ? ")) {
		location.href=url;
	}
}
</script>

<div class="body-container" style="width: 830px;">
    <div class="body-title">
        <h3><i class="fas fa-chalkboard"></i>카테고리 변경 </h3>
    </div>

	 <div id="category" align="center">
			<form name="categoryForm" method="post" style="width: 500px; height: 1000px;">
				<table class="category-table" style="width: 100%; margin: 0px auto; border-spacing: 1px; background:#999;">
				 
					  <tr align="center" bgcolor="#eeeeee" height="35"> 
					      <td width="300" style="color: #787878;">카테고리</td>
					      <td style="color: #787878;">변경</td>
					  </tr>
					  <c:forEach var="dto" items="${listAllCategory}">
					  <tr align="center" bgcolor="#FFFFFF" height="35"> 
					  	<td >${dto.category}</td>
					  	<td ><button type="button" class="btn" onclick="cateDelete(${dto.categoryNum});">삭제</button></td>
					  </tr>
					  </c:forEach>
					  <tr align="center" bgcolor="#FFFFFF" height="35"> 
					  	<td><input name="category" type="text"></td>
					  	<td> <button type="button"  class="btn" onclick="cateInsert();">추가</button> </td>
					  </tr>
				  
				
				</table>
		<div><button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/tip/created';">돌아가기</button></div>
			</form>
		</div>
</div>