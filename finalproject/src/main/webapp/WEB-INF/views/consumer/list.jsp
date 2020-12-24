<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style type="text/css">
div {
	margin: 0;
}
z
body{
	margin: 0;
}
#mContainor {
	width: 100%;
	height: 2000px;
	overflow: hidden;
}

#subContainor {
	width: 1280px;
	height: 100%;
	margin: auto;
}

#categori {
	width: 100%;
	height: auto;
    margin: 0;
	border-bottom: 1px solid #ccc;
}

#categori_box {
	width: 1280px;
	height: 45px;
	margin: auto;
	font-size: 16px;
	font-family: "맑은 고딕", sans-serif;
}

.desk_title{
	margin-top: 45px;
	margin-bottom: 45px;
}

.keyword_containor {
	border-collapse: collapse;
	border-top: 3px solid #101010;
	border-bottom: 3px solid #101010;
	font-family: "맑은 고딕", sans-serif;
	margin: 30px 0 75px 0;
}

.keyword_text{
	overflow: hidden;
    display: inline-block;
    margin-bottom: 1px;
    padding: 5px 45px 5px 45px;
    white-space: normal;
    font-size: 25px
}

a {
	text-decoration: none;
	color: #101010;
}

a:hover {
	text-decoration: underline;
	color: #101010;
	font-weight: border:
}

a:active {
	text-decoration: underline;
	color: #101010;
	font-weight: border:
}

.help_content {
	border-collapse: collapse;
	border-spacing: 0px;
	width: 100%;
	font-size: 25px;
	font-family: "맑은 고딕", sans-serif
}

.help_title {
	text-align: left;
	padding-left: 65px;
}

.btn_style {
	width: 150px;
	height: 50px;
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
    box-shadow: 0 50px 0 0 rgba(0, 0, 0, 0.25) inset, 
                0 -50px 0 0 rgba(0, 0, 0, 0.25) inset;
}
</style>
<script type="text/javascript">

$(function() {
	$(".question").click(function() {
		if ($(this).next("tr").is(":hidden")) {
			$(".question").next("tr").hide(300);
			$(".question").find("svg").removeClass("fas fa-angle-down");
			$(".question").find("svg").removeClass("fas fa-angle-up");
			$(".question").find("svg").addClass("fas fa-angle-down");
			$(this).find("svg").removeClass("fas fa-angle-down");
			$(this).find("svg").addClass("fas fa-angle-up");
			$(this).next("tr").show(200);
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/consumer/updateReview",
				data: "num=" + $(this).attr("data-num")
			});
		} else {
			$(this).next("tr").hide(200);
			$(this).find("svg").removeClass("fas fa-angle-up");
			$(this).find("svg").addClass("fas fa-angle-down");
		}
	});
});

function searchList() {
	var f = document.searchForm;
	
	if(!f.keyword.value.trim()){
		alert("검색어를 입력해주세요.");
	}
	
	f.submit();
}
</script>

<div id="categori">
	<div id="categori_box">
            <a href="${pageContext.request.contextPath}">홈</a> > <a href="${pageContext.request.contextPath}/consumer/main">고객센터</a> > <a href="${pageContext.request.contextPath}/help/myHistory">FAQ</a>
	</div>
</div>

<div id="mContainor">
	<div id="subContainor">
		<div>
			<h1 class="desk_title"><i class="fas fa-question-circle"></i>&nbsp;${questionType=='1'?'DIY':questionType=='2'?'계정이용':questionType=='3'?'판매신청':'기타'}</h1>
		</div>
		<div class="keyword_containor">
			<span class="keyword_text"><a href="${pageContext.request.contextPath}/consumer/list?questionType=1">DIY</a></span>
			<span class="keyword_text"><a href="${pageContext.request.contextPath}/consumer/list?questionType=2">계정이용</a></span>
			<span class="keyword_text"><a href="${pageContext.request.contextPath}/consumer/list?questionType=3">판매신청</a></span>
			<span class="keyword_text"><a href="${pageContext.request.contextPath}/consumer/list?questionType=4">기타</a></span>
		</div>
		<table class="help_content">
			<c:if test="${empty list}">
				<div style="text-align: center;">
					<h3 style="display: inline-block;">결과가 존재하지 않습니다.</h3>
				</div>
			</c:if>
		
			<c:forEach var="dto" items="${list}">
				<tr class="question" style="border-bottom: 1px solid #ccc; height: 75px;" data-num="${dto.faqNum}">
					<td style="padding: 0 10px 0 10px;" align="center">${dto.listNum}</td>
					<td class="help_title">[${dto.questionType=='1'?'DIY':dto.questionType=='2'?'계정이용':dto.questionType=='3'?'판매신청':'기타'}] ${dto.f_subject}</td>
					<td align="right" style="padding: 0 10px 0 0;"><i class="fas fa-angle-down"></i></td>
				</tr>
				
				<tr style="border-bottom: 1px solid #ccc; height: 75px; display: none;">
					<td></td>
					<td>${dto.f_content}</td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
		
		<table style="width: 100%; margin: 30px 0 30px 0; border-spacing: 0px;">
		   <tr height="35">
			 <td align="center" width="300" style="margin-right: 35px;">
			 	${paging}
			 </td>
		   </tr>
		</table>
		<div style="text-align: center; width: 100%; margin-bottom: 20px;">
			<div style="display: inline-block;">
				<form name="searchForm" action="${pageContext.request.contextPath}/consumer/list" method="post">
					<table style="border: 0px; border-spacing: 0px; padding-bottom: 0px;">
						<tr>
							<td>
								<select name="questionType" style="border: 0px; border-bottom: 2px solid black; height: 75px; font-size: 25px;">
									<option value="1" ${questionType=="1"?"selected='selected'":""}>DIY</option>
									<option value="2" ${questionType=="2"?"selected='selected'":""}>계정</option>
									<option value="3" ${questionType=="3"?"selected='selected'":""}>신청</option>
									<option value="4" ${questionType=="4"?"selected='selected'":""}>기타</option>
								</select>
							</td>
							<td>
								<input type="text" name="keyword" value="${keyword}" style="border: 0px; border-bottom: 2px solid black; height: 73px; font-size: 25px; padding: 0 5px 0 5px;">
							</td>
							<td>
								<button type="button" onclick="searchList();" style="border: 0px; border-bottom: 2px solid black; height: 75px; background-color: #FFFFFF; font-size: 25px;">검색</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		
		
		<div>
			<span>원하시는 답변을 찾지못하셨다면, 고객센터로 문의해 주세요.</span>
			<div style="float: right;">
			<c:if test="${sessionScope.member.userId=='admin'}">
				<button class="btn_style" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/consumer/faq/created';"><i class="fas fa-edit"></i> 자주하는 질문 등록</button>
			</c:if>
			<button class="btn_style" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/consumer/qna/created';"><i class="fas fa-edit"></i> 문의하기</button>
			</div>
		</div>
	</div>
</div>