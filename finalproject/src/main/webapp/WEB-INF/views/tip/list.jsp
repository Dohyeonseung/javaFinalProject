<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.bigbox{
display: flex;
justify-content: center;
}

.imgLayout{
	width: 190px;
	height: 205px;
	padding: 10px 5px 10px;
	margin: 5px;
	cursor: pointer;
}
.subject {
     width:180px;
     height:25px;
     line-height:25px;
     margin:5px auto;
     border-top: 1px solid #DAD9FF;
     
     display: inline-block;
     white-space:nowrap;
     overflow:hidden;
     text-overflow:ellipsis;
     cursor: pointer;
}

.category{
	padding:5px;
	margin-right: 1px;
	margin-left: 1px;
}

.category h3{
	border-bottom: 1px solid #e5e5e5;
	height: 40px;
}

.category ul {
	margin: 0;
	padding: 0;
	list-style: none; 
}

.regionBox{
 list-style: none; 
 text-align: center;
 font-size: 18px;
}

.regionBox li{
	height: 36px;
	line-height: 36px;
}

.regionBox li:hover{
	background: #e5e5e5;
	
}
.regionBox li a:hover{
	color: white;
}
</style>

<script type="text/javascript">
function searchList() {
		var f=document.searchForm;
		f.submit();
}

function article(listNum) {
	var url="${articleUrl}&listNum="+listNum;
	location.href=url;
}
</script>
<div class="bigbox">
<div class="category" style="width: 200px; margin-left: 50px; margin-top: 150px; font-size: 30px;">
		<h3 align="center" style="margin-bottom: 20px;">카테고리</h3>
		<ul class="regionBox" >
			<li><a href="${pageContext.request.contextPath}/tip/main">모두보기</a></li>
			<c:forEach var="dto" items="${listCategory}">
		        		<li><a href="${pageContext.request.contextPath}/tip/main?categoryNum=${dto.categoryNum}">${dto.category}</a></li>
		        	</c:forEach>
		</ul>         
		 </div>
<div class="body-container" style="width: 800px; margin: 0px;">
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
		 	<a href="${pageContext.request.contextPath}/tip/main">D.I.Y 팁</a>
		 </li>
		
		</ul>
	</div>
    
    <div>
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%" style="font-size: 15px; padding-left: 10px;" >
		          ${dataCount}개(${page}/${total_page} 페이지)
		      </td>
		      <td align="right">
		          &nbsp;
		      </td>
		   </tr>
		</table>
		
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<c:forEach var="dto" items="${list}" varStatus="status">
                 <c:if test="${status.index==0}">
                       <tr>
                 </c:if>
                 <c:if test="${status.index!=0 && status.index%4==0}">
                        <c:out value="</tr><tr>" escapeXml="false"/>
                 </c:if>
			     <td width="210" align="center" style="padding-bottom: 30px">
			        <div class="imgLayout">
			        	<c:if test="${dto.imageFilename==null}">	
			             <img src="${pageContext.request.contextPath}/resources/images/noimageicon.PNG" width="180"
			                   height="180" border="0" onclick="javascript:article('${dto.listNum}');">
			             <span class="subject" onclick="javascript:article('${dto.listNum}');" >
			             
			                   제목:${dto.subject}
			             </span>
			             </c:if>
			             <c:if test="${dto.imageFilename!=null}">	
			             <img src="${pageContext.request.contextPath}/uploads/tip/${dto.imageFilename}" width="180"
			                   height="180" border="0" onclick="javascript:article('${dto.listNum}');">
			             <span class="subject" onclick="javascript:article('${dto.listNum}');" >
			             
			                   제목:${dto.subject}
			             </span>
			             </c:if>
			         <span style="border-bottom: 1px solid #DAD9FF;"><i class="far fa-thumbs-up"></i>좋아요 : ${dto.tipLikeCount}</span>
			         </div>
			     </td>
			     
</c:forEach>

<c:set var="n" value="${list.size()}"/>
<c:if test="${n>0&&n%4!=0}">
		        <c:forEach var="i" begin="${n%4+1}" end="4" step="1">
			         <td width="210">
			             <div class="imgLayout">&nbsp;</div>
			         </td>
		        </c:forEach>
</c:if>
	
<c:if test="${n!=0 }">
		       <c:out value="</tr>" escapeXml="false"/>
</c:if>
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
		          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/tip/main';">새로고침</button>
		      </td>
		      <td align="center">
		          <form name="searchForm" action="${pageContext.request.contextPath}/tip/main" method="post">
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
		          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/tip/created';">등록하기</button>
		      </td>
		   </tr>
		</table>
    </div>

</div>
<div class="lastbox" style="width: 200px; margin-right: 50px;"></div>
</div>