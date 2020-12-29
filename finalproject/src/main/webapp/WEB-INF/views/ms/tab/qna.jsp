<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.qnaBox{
	width: 100%;
	display: flex;
	justify-content: space-around; 
}
.qnasecond{
	display: flex;  
	align-items: center; 
	justify-content: center;"
}
.third{
	cursor: pointer;
}

</style>

<table style='width: 100%; margin: 10px auto 30px; border-spacing: 0px;'>
  <c:forEach var="dto" items="${listQna}">
  	<tr height='35' style='background: #eeeeee;'>
 		 <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-right:none;'>
	           <i class="fas fa-user" style="color: #ffeb00;"></i> ${dto.userName}
	      </td>
	      <td width='50%' style='padding:5px 5px; border:1px solid #cccccc; border-left:none;' align='right'>
	         ${dto.questionCreated}
	      </td>
  	</tr>
  	<tr>
	     <td colspan='2' valign='top' style='padding:5px 5px;'>
	         ${dto.question}
	     </td>
	 </tr>
	 <tr height='30'>
	 	<td colspan='2' style='padding:5px 5px;' align="right">
	 	    <i class="fas fa-chevron-down btnReplyAnswerLayout" data-num='${dto.num}'></i>
	 	</td>
	 </tr>
	 <tr class='replyAnswer' style='display: none;'>
        <td colspan='2'>
          <c:if test="${not empty dto.answer}">
            <div id='listReplyAnswer' class='answerList' style='border-top: 1px solid #cccccc;'>
			    <div class='answer' style='padding: 0px 10px;'>
			        <div style='clear:both; padding: 10px 0px;'>
			            <div style='float: left; width: 5%;'>└</div>
			            <div style='float: left; width:95%;'>
			                <div style='float: left;'><b>판매자</b></div>
			                <div style='float: right;'>
			                    <span>${dto.answerCreated}</span> |
			                    <c:if test="${sessionScope.member.userId==dto.sellerId}">
			                    	<span class='deleteReplyAnswer' style='cursor: pointer;' data-num='${dto.num}'>삭제</span>
			                    </c:if>
			                </div>
			            </div>
			        </div>
			        <div style='clear:both; padding: 5px 5px 5px 5%; border-bottom: 1px solid #ccc;'>
			            ${dto.answer}
			        </div>
			     </div>			            
            </div>
          	 </c:if>
		             <c:if test="${empty dto.answer}">
            <div style='clear: both; padding: 10px 10px;'>
                <div style='float: left; width: 5%;'>└</div>
                <div style='float: left; width:95%'>
                    <textarea cols='72' rows='12' class='boxTA' style='width:98%; height: 70px;'></textarea>
                 </div>
            </div>
             <div style='padding: 0px 13px 10px 10px; text-align: right;'>
                <button type='button' class='btn btnSendReplyAnswer' data-num='${dto.num}'>답변 등록</button>
            </div>
         </c:if>
        </td>
	 
	 </tr>
	 
  </c:forEach>
</table>  
 


