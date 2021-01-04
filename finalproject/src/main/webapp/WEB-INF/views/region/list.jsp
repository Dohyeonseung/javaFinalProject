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
<div style="width: 200px; margin-left: 50px;">
		<p>카테고리</p>

		<ul style="list-style: none;">
		<li><a href="${pageContext.request.contextPath}/region/main">모두보기</a></li>
		<li><a href="${pageContext.request.contextPath}/region/main?region=1">서울</a></li>
		<li><a href="${pageContext.request.contextPath}/region/main?region=2">경기</a></li>
		<li><a href="${pageContext.request.contextPath}/region/main?region=3">강원</a></li>
		<li><a href="${pageContext.request.contextPath}/region/main?region=4">충청</a></li>
		<li><a href="${pageContext.request.contextPath}/region/main?region=5">경상</a></li>
		<li><a href="${pageContext.request.contextPath}/region/main?region=6">전라</a></li>
		</ul>         
		 </div>
<div class="body-container" style="width: 800px; margin: 0px;">
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
		 	<a href="${pageContext.request.contextPath}/tip/main">지역 게시판</a>
		 </li>
		
		</ul>
	</div>
    <div class="body-title">
        <h3><i class="far fa-image"></i>지역 게시판</h3>
    </div>
    
    
    <div>
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px;">
		   <tr height="35">
		      <td align="left" width="50%">
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
                 <c:if test="${status.index!=0 && status.index%3==0}">
                        <c:out value="</tr><tr>" escapeXml="false"/>
                 </c:if>
			     <td width="210" align="center" style="padding-bottom: 30px">
			        <div class="imgLayout">
			        	<c:if test="${dto.saveFilename==null}">	
			             <img src="${pageContext.request.contextPath}/resources/img/no-image.png" width="180"
			                   height="180" border="0" onclick="javascript:article('${dto.listNum}');">
			             <span class="subject" onclick="javascript:article('${dto.listNum}');" >
			             
			                   제목:${dto.subject}
			             </span>
			             </c:if>
			             <c:if test="${dto.saveFilename!=null}">	
			             <img src="${pageContext.request.contextPath}/uploads/tip/${dto.saveFilename}" width="180"
			                   height="180" border="0" onclick="javascript:article('${dto.listNum}');">
			             <span class="subject" onclick="javascript:article('${dto.listNum}');" >
			             
			                   제목:${dto.subject}
			             </span>
			             </c:if>
			         <span style="border-bottom: 1px solid #DAD9FF;">좋아요 : ${dto.regionLikeCount}</span>
			         </div>
			     </td>
			     
</c:forEach>

<c:set var="n" value="${list.size()}"/>
<c:if test="${n>0&&n%3!=0}">
		        <c:forEach var="i" begin="${n%3+1}" end="3" step="1">
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
		          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/region/main';">새로고침</button>
		      </td>
		      <td align="center">
		          <form name="searchForm" action="${pageContext.request.contextPath}/region/main" method="post">
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
		          <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/region/created';">등록하기</button>
		      </td>
		   </tr>
		</table>
    </div>

</div>
<div class="lastbox" style="width: 200px; margin-right: 50px;"></div>
</div>