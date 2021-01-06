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

#imageSector {
	position: fixed;
	width: auto;
	height: auto;
	z-index: 1;
	top: 300px;
	left: 250px;
}
</style>
<script type="text/javascript">
$(function() {
	$(document).on("click", "#view td[class=scon]", function() {
		var image = $(this).parent().attr("data-image");
		image = image + ".png";
		var out = "";
		out += "<img style='width: 950px; height: 650px;' src='${pageContext.request.contextPath}/images/";
		out += image;
		out += "'>";
		
		$("#imageSector").empty();
		$("#imageSector").append(out);
	});
	
	$("#imageSector").click(function() {
		$("#imageSector").empty();
	});
});

function change(userId, state) {
	if(state == 0) {
		state = 1;
	} else {
		state = 0;
	}
	
	if(!confirm("권한을 변경하시겠습니까 ?")) {
		return false;
	}
	
	var query = "?userId=" + userId + "&state=" + state; 
	
	location.href="${pageContext.request.contextPath}/admin/authority/sellerChange" + query;
}

</script>
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
                <strong>${waitDataCount} 명</strong>
            </td>
            <td align="right">
                &nbsp;
            </td>
         </tr>
      </table>
      
      <table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
        <tr align="center" bgcolor="FFFFFF" height="35" style="border-top: 2px solid #1e1e1e; border-bottom: 1px solid #1e1e1e;"> 
            <th width="20%" style="color: #1e1e1e;">날짜</th>
            <th width="10%" style="color: #1e1e1e;">아이디</th>
            <th width="10%" style="color: #1e1e1e;">이름</th>
            <th width="40%" style="color: #1e1e1e;">주소</th>
            <th width="20%" style="color: #1e1e1e;">권한부여</th>
        </tr>
		<c:forEach var="dto" items="${list}">
			<tr id="view" data-image="${dto.fileName}" align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
	            <td class="scon">${dto.created}</td>
	            <td class="scon">${dto.userId}</td>
	            <td class="scon">${dto.userName}</td>
	            <td class="scon">${dto.addr}</td>
	            <td>
	            	<c:if test="${dto.enable != 0}">
	            		<a onclick="change('${dto.userId}', '${dto.enable}');" style="float: center"><i class="fas fa-check" style="color: #1e1e1e;"></i></a>
	            	</c:if>
	            	<c:if test="${dto.enable == 0}">
	            		<a onclick="change('${dto.userId}', '${dto.enable}');" style="float: center"><i class="fas fa-times" style="color: #1e1e1e;"></i></a>
	            	</c:if>
	            </td>
	        </tr>
		</c:forEach>       
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
                <button type="button" class="btn_style" id="returnList_btn" style="margin-right: 750px;" onclick="location.href='${pageContext.request.contextPath}/admin/authority/sellerList'">새로고침</button>
             </form>
          </div>
      </div>
      
      <div id="imageSector" style="border: 1px solid black;">
      </div>
   </div>
</div>