<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
#helpCenter {
	width: auto;
	height: auto;
	text-align: center;
}

#helpSpace {
	display: inline-block;
	width: 1160px;
	height: 100%;
	text-align: left;
}

#categori {
	margin: 30px;
	margin-left: 0px;
}

#left_space {
	font-family: "맑은 고딕";
	font-size: 20px;
	font-weight: 900;
	margin-top: 100px;
	width: 50%;
	float: left;
}

#right_space {
	float: left;
}

#helpService {
	width: 1160px;
}

#populCategori {
	text-align: center;
	width: 1160px;
	margin-top: 50px;
	margin-bottom: 50px;
}

#populCategori ol {
	list-style: none;
	display: inline-block;
}

#populCategori li {
	float: left;
	margin-right: 30px;
}

#populList {
	text-align: center;
	width: 1160px;
}

#helpList li {
	width: 530px;
	height: 30px;
	text-align: left;
	float: left;
	margin-top: 5px;
	margin-left: 25px;
	margin-right: 25px;
}

#helpCallTable td {
	margin-left: 35px;
	margin-right: 35px;
}

.helpCategori_btn {
	width: 200px;
	height: 120px;
	border-radius: 5px;
	color: #FFFFFF;
	background-color: #454E55;
	transition: all 0.9s, color 0.3s;
	font-size: 30px;
}

.helpCategori_btn:hover {
	box-shadow: 0 120px 0 0 rgba(0, 0, 0, 0.25) inset, 
					0 -120px 0 0 rgba(0, 0, 0, 0.25) inset;
}

.openBtn {
	 margin: 0px;
	 width: 20px;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dateUtil.js"></script>
<script type="text/javascript">
function listSearch() {
	var f = document.searchForm;
	
	if(!f.keyword.value.trim()) {
		alert("검색값을 입력해주세요.");
		return;
	}
	
	f.submit();
}

$(function() {
	$(".row-subject").click(function() {
		if ($(this).next("tr").is(":hidden")) {
			$(".row-subject").next("tr").hide(300);
			$(this).next("tr").show(200);
		} else {
			$(this).next("tr").hide(200);
		}
	});
});
</script>

<div id="helpCenter">
	<div id="helpSpace">
		<div id="categori">
			<a href="${pageContext.request.contextPath}">홈</a> > <a href="${pageContext.request.contextPath}/help/main">고객센터</a>
		</div>
		
		<hr>
		
		<div id="helpSearch" style="width: 1160px; height: 280px;">
			<div id="left_space">
				<div style="margin-left: 30px;">
				안녕하세요. <br>
				DIY 고객지원입니다. <br>
				무엇을 도와드릴까요?
				</div>
			</div>
			
			<div id="right_space" style="width: 50%">
				<form name="searchForm" action="${pageContext.request.contextPath}/consumer/list" method="post">
					<table style="border: 0px; border-spacing: 0px; margin-top: 100px;">
						<tr>
							<td>
								<select name="questionType" style="border: 0px; border-bottom: 2px solid black; height: 34px;">
									<option value="1">DIY</option>
									<option value="2">계정</option>
									<option value="3">신청</option>
									<option value="4">기타</option>
								</select>
							</td>
							<td>
								<input type="text" name="keyword" style="border: 0px; border-bottom: 2px solid black; height: 32px;">
							</td>
							<td>
								<button type="button" onclick="listSearch();" style="border: 0px; border-bottom: 2px solid black; height: 34px; background-color: #FFFFFF;">검색</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		
		<hr>
		
		<div id="helpService">
			<h3 style="margin-top: 10px;">ㅣ 고객서비스</h3>
			
			<div id="populCategori">
				<ol>
					<li><button class="helpCategori_btn" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/consumer/list?questionType=1';">DIY 관련</button></li>
					<li><button class="helpCategori_btn" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/consumer/list?questionType=2';">계정 관련</button></li>
					<li><button class="helpCategori_btn" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/consumer/list?questionType=3';">신청 관련</button></li>
					<li><button class="helpCategori_btn" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/consumer/list?questionType=4';">기타</button></li>
				</ol>
			</div>
		</div>
		
		<hr>
		
		<div id="helpList" style="text-align: center;">
			<h3 style="margin-top: 10px; margin-bottom: 20px; text-align: left;">ㅣ 자주하는 질문</h3>
		
		
			<hr>
			
			<h3 style="margin: 10px 0 10px 0"> ㅣ <a href="${pageContext.request.contextPath}/consumer/main?questionType=1">DIY</a> ㅣ 
												<a href="${pageContext.request.contextPath}/consumer/main?questionType=2">계정</a> ㅣ 
												<a href="${pageContext.request.contextPath}/consumer/main?questionType=3">신청</a> ㅣ 
												<a href="${pageContext.request.contextPath}/consumer/main?questionType=4">기타</a> ㅣ </h3>
			
			<hr>
			
			<ol style="list-style: none; width: 1160px;">
				<c:forEach var="dto" items="${list}">
					<li><a href="">[${dto.questionType=='1'?'DIY':dto.questionType=='2'?'계정이용':dto.questionType=='3'?'판매신청':'기타'}] ${dto.f_subject}</a></li>
				</c:forEach>
			</ol>
		
		</div>
		
		<hr>
		
		<div id="helpCall" style="text-align: center;">
			<h3 style="margin-top: 10px; text-align: left">ㅣ 고객센터 운영 안내</h3>
			
			<div id="helpCallTable" style="display: inline-block; width: 470px;">
				<table style="width: 100%;">
					<tr>
						<td><img src="${pageContext.request.contextPath}\\resources/images_help/cll.png"></td>
						<td><img src="${pageContext.request.contextPath}\\resources/images_help/clc.png"></td>
						<td><img src="${pageContext.request.contextPath}\\resources/images_help/can.png"></td>
					</tr>
					
					<tr>
						<td>
							유료전화<br>
							XXX-XXXX-XXXX
						</td>
						<td>
							운영시간<br>
							09:00 ~ 18:00
						</td>
						<td>
							휴무<br>
							공휴일, 토요일, 일요일
						</td>
					</tr>
				</table>
			</div>
			
		</div>
				
	</div>
</div>