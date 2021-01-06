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
			var fn = function(data) {
				printQNA(data);
			};
			
			ajaxJSON("get", "${pageContext.request.contextPath}/consumer/readQNA", "num=" + $(this).attr("data-num"), fn);
		} else {
			$(this).next("tr").hide(200);
		}
	});
	$(document).on("click", ".star_rating a", function() {
	    $(this).parent().children("a").removeClass("on");
	    $(this).addClass("on").prevAll("a").addClass("on");
	    return false;
	});
	
	$(document).on("click", ".test", function() {
		var qnaNum = $(this).attr("data-qnaNum");
		var score = $(this).parent().parent().prev().find("a[class='on']").length;
		var content = $(this).parent().parent().prev().find("#reviewContent").val();
		
		if(!content) {
			alert("후기 내용을 입력해주세요.");
			return false;
		}
		
		var query = "?qnaNum=" + qnaNum + "&score=" + score + "&content=" + content;
		
		location.href = "${pageContext.request.contextPath}/consumer/answerReview" + query;
	});
});

function ajaxJSON(type, url, query, fn) {
	$.ajax({
		type: type,
		url: url,
		data: query,
		dataType: "json",
		success: function(data) {
			fn(data);
		},
		error: function() {
			console.log("실패");
		},
		beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    },
	    error:function(jqXHR) {
	    	if(jqXHR.status===403) {
	    		login();
	    		return false;
	    	}
	    	
	    	console.log(jqXHR.responseText);
	    }
	});
}

function printQNA(data) {
	$("#anw" + data.dto.qnaNum).empty();
	
	var out = "";
	out = "<td colspan='4' style='border-bottom: 1px solid black;'>";
	out += "<div style='width: 1000px; text-align: center;'>";
	out += "<div class='questionContent'>";
	out += "<table>";
	out += "<tr>";
	out += "<td>분류&nbsp;<input type='text' readonly='readonly' value='" + data.dto.questionType + "'></td>";
	out += "<td>제목&nbsp;<input type='text' readonly='readonly' value='" + data.dto.q_subject + "'></td>";
	out += "<td>날짜&nbsp;<input type='text' readonly='readonly' value='" + data.dto.q_created + "'></td>";
	out += "</tr>";
	out += "<tr>";
	out += "<td colspan='3'>"
	out += "<textarea readonly='readonly' style='width: 800px; resize: none;'>" + data.dto.q_content + "</textarea>";
	out += "</td>";
	out += "</tr>";
	out += "</table>";
	out += "</div>";
	
	if(data.dto.state != 0) {
		out += "<div class='answerContent'>";
		out += "<table>";
		out += "<tr>";
		out += "<td>문의답변&nbsp;	<input type='text' readonly='readonly' value='" + data.dto.a_subject + "'></td>";
		out += "<td>날짜&nbsp;<input type='text' readonly='readonly' value='" + data.dto.a_created + "'></td>";
		out += "</tr>";
		out += "<tr>";
		out += "<td colspan='2'><textarea readonly='readonly' style='width: 800px; resize: none;'>" + data.dto.a_content + "</textarea></td>";
		out += "</tr>";
		out += "</table>";
			if(data.dto.score < 1) {
				out += "<hr>";
				out += "<h3 style='text-align: left; margin-top: 5px; margin-left: 10px;'>ㅣ 답변후기</h3>";
				out += "</div>";
				out += "<div class='answerReview'>";
				out += "<table>";
				out += "<tr>";
				out += "<td rowspan='2'><textarea id='reviewContent' style='resize: none; width: 350px; height: 50px; padding: 10px;'></textarea></td>";
				out += "<td><p class='star_rating'><a class='on'>★</a><a class='on'>★</a><a class='on'>★</a><a>★</a><a>★</a></p></td>";
				out += "</tr>";
				out += "<tr>";
				out += "<td><button class='test' data-qnaNum='" + data.dto.qnaNum + "'>보내기</button></td>";
				out += "</tr>";
				out += "</table>";
				out += "</div>";
			}
		out += "</div>";
	}
	
	$("#anw" + data.dto.qnaNum).append(out);
}


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
				
				<c:forEach var="dto" items="${list}">
					<tr class="question" data-num="${dto.qnaNum}">
						<td>${dto.questionType=='1'?'DIY':questionType=='2'?'계정이용':questionType=='3'?'판매신청':'기타'}</td>
						<td>${dto.q_subject}</td>
						<td>${dto.q_created}</td>
						<td>${dto.state=='0'?'답변대기':'답변완료'}</td>
					</tr>
					
					<tr class="answer" id="anw${dto.qnaNum}">
					
					</tr>
				</c:forEach>
			</table>
		</div>
		
	</div>
</div>