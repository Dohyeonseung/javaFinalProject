<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
#helpCenter {
	width: auto;
	height: auto;
	text-align: center;
	margin-bottom: 30px;
}

#helpSpace {
	display: inline-block;
	width: 1160px;
}

#categori {
	margin: 30px;
	margin-left: 0px;
	text-align: left;
}

#historyList {
	display: inline-block;
	width: 1000px;
}

#historyTable {
	width: 1000px;
	text-align: center;
	border-collapse: collapse;
}

.question {
	font-size: 18px;
	border-bottom: 1px solid black;
}

.answer {
	display: none;
	text-align: center;
}

.historyTitle {
	border-bottom: 1px solid black;
	font-size: 22px;
	font-weight: 900;
}

.questionContent {
	display: inline-block;
	width: 900px;
	margin-top: 15px;
}

.questionContent table {
	width: 900px;
	border: 1px solid black;
	text-align: left;
	margin-bottom: 15px;
}

.answerContent {
	display: inline-block;
	width: 900px;
	margin-top: 15px;
}

.answerContent table {
	width: 900px;
	border: 1px solid black;
	text-align: left;
	margin-bottom: 15px;
}

.answerReview {
	display: inline-block;
}

.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.star_rating a:first-child {margin-left:0;}
.star_rating a.on {color:#777;}

</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dateUtil.js"></script>
<script type="text/javascript">
$(function() {
	$(".question").click(function() {
		if ($(this).next("tr").is(":hidden")) {
			$(".question").next("tr").hide(300);
			$(this).next("tr").show(200);
		} else {
			$(this).next("tr").hide(200);
		}
	});
	
	$(".star_rating a").click(function() {
	    $(this).parent().children("a").removeClass("on");
	    $(this).addClass("on").prevAll("a").addClass("on");
	    return false;
	});
});
</script>

<div id="helpCenter">
	<div id="helpSpace">
		<div id="categori">
			<a href="${pageContext.request.contextPath}">홈</a> > <a href="${pageContext.request.contextPath}/consumer/main">고객센터</a> > <a href="${pageContext.request.contextPath}/help/myHistory">문의내역</a>
		</div>
		
		<hr>
		
		<h3 style="margin-top: 10px; margin-bottom: 10px; text-align: left;">ㅣ 문의내역</h3>
		
		<div id="historyList">
			<table id="historyTable">
				<tr>
					<td class="historyTitle" style="width: 10%">분류</td>
					<td class="historyTitle" style="width: 70%">문의내용</td>
					<td class="historyTitle" style="width: 10%">날짜</td>
					<td class="historyTitle" style="width: 10%">상태</td>
				</tr>
				
				<tr class="question">
					<td>DIY</td>
					<td>테스트1</td>
					<td>2020-11-10</td>
					<td>답변완료</td>
				</tr>
				
				<tr class="answer">
					<td colspan="4" style="border-bottom: 1px solid black;">
						<div style="width: 1000px; text-align: center;">
							<div class="questionContent">
								<table>
									<tr>
										<td>
											분류&nbsp;
											<input type="text" readonly="readonly" value="DIY">
										</td>
										<td>
											제목&nbsp;
											<input type="text" readonly="readonly" value="테스트 1">
										</td>
										<td>
											날짜&nbsp;
											<input type="text" readonly="readonly" value="2020-11-10">
										</td>
									</tr>
									
									<tr>
										<td>
											이름&nbsp;
											<input type="text" readonly="readonly" value="테스트">
										</td>
										<td colspan="2">
											이메일&nbsp;
											<input type="text" readonly="readonly" value="test@test.com">
										</td>
									</tr>
									
									<tr>
										<td colspan="3">
											<textarea readonly="readonly" style="width: 800px; resize: none;">'테스트 1'의 문의 내용</textarea>
										</td>
									</tr>

								</table>
							</div>
							
							<div class="answerContent">
								<table>
									<tr>
										<td>
											문의답변&nbsp;
											<input type="text" readonly="readonly" value="'테스트 1'의 대한 답변입니다.">
										</td>
										<td>
											날짜&nbsp;
											<input type="text" readonly="readonly" value="2020-11-15">
										</td>
									</tr>
									
									<tr>
										<td colspan="2">
											<textarea readonly="readonly" style="width: 800px; resize: none;">'테스트 1'의 답변 내용</textarea>
										</td>
									</tr>
								</table>
								
								<hr>
								
								<h3 style="text-align: left; margin-top: 5px; margin-left: 10px;">ㅣ 답변후기</h3>
							</div>
							
							<div class="answerReview">
								<table>
									<tr>
										<td rowspan="2">
											<textarea style="resize: none; width: 350px; height: 50px; padding: 10px;"></textarea>
										</td>
										<td>
											<p class="star_rating">
											    <a class="on">★</a>
											    <a class="on">★</a>
											    <a class="on">★</a>
											    <a>★</a>
											    <a>★</a>
											</p>
										</td>
									</tr>
									
									<tr>
										<td>
											<button>보내기</button>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		
	</div>
</div>