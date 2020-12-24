<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.qnaBox{
	width: 100%;
	display: flex;
	justify-content: space-around;
	border - 
}
.qnafirst{
	
}
</style>


<script src="https://kit.fontawesome.com/839eefb84b.js" crossorigin="anonymous"></script>
  <c:forEach var="dto" items="${listQna}">	
   <div class=qnaBox>
   	 
  	 <div class=qnafirst>
  	 	<span style=color:#e5e5e5;>${dto.created}</span> <br>
  	 	<span style="font-size: 18px;"><i class="fas fa-user" style="color: #ffeb00;"></i> ${dto.userId}</span>
   	 </div>
   	 <div class=qnasecond>
  	 	${dto.content}
   	 </div>
</div>
   </c:forEach>


