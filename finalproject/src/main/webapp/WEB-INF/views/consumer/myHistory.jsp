<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
body {
	text-align: center;
}

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
	min-height: 800px;
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

.star_rating a {
    color:#ccc;
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
		var content = $("#reviewContent").val();
		
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
	out += "<div style='width: 1000px; height: 800px; max-width: 1000px; max-height: 800px;'>";
	out += "<div class='questionContent' style='width: 480px; height: 600px; max-width: 480px; max-height: 600px; background-color: #ebebeb; float: left; border-radius: 15px; margin: 15px 10px 15px 10px;'>";
	out += "<table style='width: 460px; height: 580px; max-width: 460px; max-height: 580px; border-spacing: 0; margin: 10px;'>";
	out += "<tr style='margin-bottom: 10px;'>";
	out += "<td style='width: 460px; height: 50px; max-width: 460px; max-height: 50px; padding: 0;'>";
	out += "<div style='width: 360px; height: 40px; max-width: 460px; max-height: 50px; background-color: #FFFFFF; border-radius: 5px; margin-bottom: 5px; margin-top: 5px;'>";
	out += "<span style='margin-left: 5px;'>질문 : </span><input type='text' value='" + data.dto.q_subject + "' readonly='readonly' style='width: 300px; height: 30px; margin: 5px 5px 5px 0px; border: 0; border-bottom: 2px solid black;'>";
	out += "</div></td></tr>";
	out += "<tr style='margin-bottom: 10px;'>";
	out += "<td style='width: 460px; height: 50px; max-width: 460px; max-height: 50px; padding: 0;'>";
	out += "<div style='width: 360px; height: 40px; max-width: 460px; max-height: 50px; background-color: #FFFFFF; border-radius: 5px; margin-bottom: 5px; margin-top: 5px;'>";
	out += "<span style='margin-left: 5px;'>날짜 : </span><input type='text' value='" + data.dto.q_created + "' readonly='readonly' style='width: 300px; height: 30px; margin: 5px 5px 5px 0px; border: 0; border-bottom: 2px solid black;'>";
	out += "</div></td></tr><tr>";
	out += "<td style='width: 460px; height: 480px; max-width: 460px; max-height: 480px; padding: 0;'>";
	out += "<div style='width: 460px; height: 475px; max-width: 460px; max-height: 475px; background-color: #FFFFFF; border-radius: 5px; margin-top: 5px;'>";
	out += "<textarea readonly='readonly' style='width: 440px; height: 455px; resize: none; border: 0; margin: 10px; overflow: auto;'>" + data.dto.q_content + "</textarea>";
	out += "</div></td></tr></table></div>";
	if(data.dto.state != 0) {
		out += "<div class='answerContent' style='width: 480px; height: 400px; max-width: 480px; max-height: 400px; background-color: #ebebeb; float: left; border-radius: 15px; margin: 15px 10px 15px 10px;'>";
		out += "<table style='width: 460px; height: 380px; max-width: 460px; max-height: 380px; border-spacing: 0; margin: 10px;'>";
		out += "<tr style='margin-bottom: 10px;'>";
		out += "<td style='width: 460px; height: 50px; max-width: 460px; max-height: 50px; padding: 0;'>";
		out += "<div style='width: 360px; height: 40px; max-width: 460px; max-height: 50px; background-color: #FFFFFF; border-radius: 5px; margin-bottom: 5px; margin-top: 5px;'>";
		out += "<span style='margin-left: 5px;'>답변 : </span><input type='text' value='" + data.dto.a_subject + "' readonly='readonly' style='width: 300px; height: 30px; margin: 5px 5px 5px 0px; border: 0; border-bottom: 2px solid black;'>";
		out += "</div></td></tr>";
		out += "<tr style='margin-bottom: 10px;'>";
		out += "<td style='width: 460px; height: 50px; max-width: 460px; max-height: 50px; padding: 0;'>";
		out += "<div style='width: 360px; height: 40px; max-width: 460px; max-height: 50px; background-color: #FFFFFF; border-radius: 5px; margin-bottom: 5px; margin-top: 5px;'>";
		out += "<span style='margin-left: 5px;'>날짜 : </span><input type='text' value='" + data.dto.a_created + "' readonly='readonly' style='width: 300px; height: 30px; margin: 5px 5px 5px 0px; border: 0; border-bottom: 2px solid black;'>";
		out += "</div></td></tr>";
		out += "<tr>";
		out += "<td style='width: 460px; height: 270px; max-width: 460px; max-height: 270px; padding: 0;'>";
		out += "<div style='width: 460px; height: 265px; max-width: 460px; max-height: 265px; background-color: #FFFFFF; border-radius: 5px; margin-top: 5px;'>";
		out += "<textarea readonly='readonly' style='width: 440px; height: 245px; resize: none; border: 0; margin: 10px; overflow: auto;'>" + data.dto.a_content + "</textarea>";
		out += "</div></td></tr></table>";
		out += "</div>";
		if(data.dto.score < 1) {
			out += "<div class='answerReview' style='width: 480px; height: 160px; max-width: 480px; max-height: 160px; background-color: #ebebeb; float: left; border-radius: 15px; margin: 15px 10px 15px 10px;'>";
			out += "<table style='width: 460px; height: 141px; max-width: 460px; max-height: 141px; border-spacing: 0; margin: 10px;'>";
			out += "<tr style='margin-bottom: 10px;'>";
			out += "<td colspan='2' style='width: 460px; height: 21px; max-width: 460px; max-height: 21px; padding: 0;'>";
			out += "<div style='width: 140px; height: 21px; max-width: 140px; max-height: 21px; background-color: #FFFFFF; border-radius: 5px; margin-bottom: 5px; margin-top: 5px;'>";
			out += "<span style='margin-left: 5px; margin-top: 2px;'>후기 : </span><span class='star_rating' style='margin: 10px 0px 10px 0px; border: 0;'><a class='on'>★</a><a class='on'>★</a><a class='on'>★</a><a>★</a><a>★</a></span>";
			out += "</div></td></tr>";
			out += "<tr>";
			out += "<td style='width: 400px; height: 100px; max-width: 400px; max-height: 100px; padding: 0;'>";
			out += "<div style='width: 400px; height: 95px; max-width: 400px; max-height: 95px; background-color: #FFFFFF; border-radius: 5px; margin-top: 5px;'>";
			out += "<textarea id='reviewContent' style='width: 380px; height: 75px; resize: none; border: 0; margin: 10px; overflow: auto;'></textarea>";
			out += "</div></td>";
			out += "<td>";
			out += "<button class='test' data-qnaNum='" + data.dto.qnaNum + "' style='width: 50px; height: 97px; margin: 6px; margin-top: 10px;'>등록</button>";
			out += "</td></tr></table>";
			out += "</div>";
		}
	}
	out += "</div>";
	
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
				
				<c:if test="${empty list}">
					<tr>
						<td colspan="4">등록된 QNA가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				
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
			
			<table style="width: 100%; margin: 30px 0 30px 0; border-spacing: 0px;">
			   <tr height="35">
				 <td align="center" width="300" style="margin-right: 35px;">
				 	${paging}
				 </td>
			   </tr>
			</table>
			
		</div>
	</div>
</div>