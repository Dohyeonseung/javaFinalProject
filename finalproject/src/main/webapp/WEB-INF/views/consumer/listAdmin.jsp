<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
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

#qnaList {
	display: inline-block;
	width: 1000px;
	min-height: 800px;
}

#qnaTable {
	width: 1000px;
	text-align: center;
	border-collapse: collapse;
}

.qnaList {
	font-size: 18px;
	border-bottom: 1px solid black;
}

.qnaTitle {
	border-bottom: 1px solid black;
	font-size: 22px;
	font-weight: 900;
}

#qnaRead {
	position: fixed;
	width: 1000px;
	height: auto;
	top: 150px;
	left: 150px;
	z-index: 1;
}

.help_btn {
	width: 80px;
	height: 50px;
	border-radius: 5px;
	color: #1e1e1e;
	background: #FFFFFF;
	transition: all 0.9s, color 0.3s;
	font-size: 20px;
}

.help_btn:hover {
	box-shadow: 0 120px 0 0 rgba(0, 0, 0, 0.25) inset, 0 -120px 0 0
		rgba(0, 0, 0, 0.25) inset;
	color: #FFFFFF;
}

</style>
<script type="text/javascript">
$(function() {
	$("#questionType").change(function() {
		var questionType = $("#questionType option:selected").val();
		var query = "?questionType=" + questionType;
		
		location.href = "${pageContext.request.contextPath}/consumer/listAdmin" + query;
	});
	
	$(document).on("click", ".qnaList", function() {
		var qnaNum = $(this).attr("data-qnaNum");
		var fn = function(data) {
			printQNA(data);
		};
		
		ajaxJSON("get", "${pageContext.request.contextPath}/consumer/readQNA", "num=" + qnaNum, fn);
	});
	
	$(document).on("click", "#send", function() {
		var qnaNum = $(this).attr("data-qnaNum");
		var content = $("#content").val();
		var subject = $("#subject").val();
		
		var query = "?qnaNum=" + qnaNum + "&subject=" + subject + "&content=" + content;
		location.href = "${pageContext.request.contextPath}/consumer/listAdminSubmit" + query;
	});
	
	$(document).on("click", "#cancle", function() {
		$("#qnaRead").empty();
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
	var out = "";
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
	
	out += "<div class='answerContent' style='width: 480px; height: 400px; max-width: 480px; max-height: 400px; background-color: #ebebeb; float: left; border-radius: 15px; margin: 15px 10px 15px 10px;'>";
	out += "<table style='width: 460px; height: 380px; max-width: 460px; max-height: 380px; border-spacing: 0; margin: 10px;'>";
	out += "<tr style='margin-bottom: 10px;'>";
	out += "<td style='width: 460px; height: 50px; max-width: 460px; max-height: 50px; padding: 0;'>";
	out += "<div style='width: 360px; height: 40px; max-width: 460px; max-height: 50px; background-color: #FFFFFF; border-radius: 5px; margin-bottom: 5px; margin-top: 5px;'>";
	out += "<span style='margin-left: 5px;'>제목 : </span><input type='text' id='subject' value='' style='width: 300px; height: 30px; margin: 5px 5px 5px 0px; border: 0; border-bottom: 2px solid black;'>";
	out += "</div></td></tr>";
	out += "<tr>";
	out += "<td style='width: 460px; height: 270px; max-width: 460px; max-height: 270px; padding: 0;'>";
	out += "<div style='width: 460px; height: 265px; max-width: 460px; max-height: 265px; background-color: #FFFFFF; border-radius: 5px; margin-top: 5px;'>";
	out += "<textarea id='content' style='width: 440px; height: 245px; resize: none; border: 0; margin: 10px; overflow: auto;'></textarea>";
	out += "</div></td></tr>";
	out += "<tr style='margin-bottom: 10px;'>";
	out += "<td style='width: 440px; height: 50px; max-width: 440px; max-height: 50px; padding: 0;'>";
	out += "<div style='width: 440px; height: 40px; max-width: 440px; max-height: 50px; border-radius: 5px; margin-bottom: 5px; margin-top: 5px;'>";
	out += "<button class='help_btn' id='cancle' style='float: right; margin-right: 10px;'>취소</button><button class='help_btn' id='send' data-qnaNum='" + data.dto.qnaNum + "' style='float: right; margin-right: 10px;'>등록</button>";
	out += "</div></td></tr></table>";
	out += "</div>";
	out += "</div>";
	
	$("#qnaRead").empty();
	$("#qnaRead").append(out);
}

</script>

<div id="helpCenter">
	<div id="helpSpace">
		<div id="categori">
			<a href="${pageContext.request.contextPath}">홈</a> > <a href="${pageContext.request.contextPath}/consumer/main">고객센터</a> > <a href="${pageContext.request.contextPath}/help/listAdmin">문의내역</a>
		</div>
		
		<hr>
		
		<h3 style="margin-top: 10px; margin-bottom: 10px; text-align: left;">ㅣ QNA 내역</h3>
		
		<div id="qnaRead" style="border: 0px;">
		
		</div>
		
		<div id="qnaList">
			<table id="qnaTable">
				<tr>
					<td class="qnaTitle" style="width: 10%">
						<select id="questionType">
							<option value="0" ${questionType=="0"?"selected='selected'":""}>전체</option>
							<option value="1" ${questionType=="1"?"selected='selected'":""}>DIY</option>
							<option value="2" ${questionType=="2"?"selected='selected'":""}>계정</option>
							<option value="3" ${questionType=="3"?"selected='selected'":""}>신청</option>
							<option value="4" ${questionType=="4"?"selected='selected'":""}>기타</option>
						</select>
					</td>
					<td class="qnaTitle" style="width: 70%">제목</td>
					<td class="qnaTitle" style="width: 20%">날짜</td>
				</tr>
				
				<c:if test="${empty list}">
					<tr>
						<td colspan="3">등록된 QNA가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				
				<c:forEach var="dto" items="${list}">
					<tr class="qnaList" data-qnaNum="${dto.qnaNum}">
						<td>${dto.questionType=='1'?'DIY':questionType=='2'?'계정이용':questionType=='3'?'판매신청':'기타'}</td>
						<td>${dto.q_subject}</td>
						<td>${dto.q_created}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<table style="width: 100%; margin: 30px 0 30px 0; border-spacing: 0px;">
		   <tr height="35">
			 <td align="center" width="300" style="margin-right: 35px;">
			 	${paging}
			 </td>
		   </tr>
		</table>
	</div>
</div>