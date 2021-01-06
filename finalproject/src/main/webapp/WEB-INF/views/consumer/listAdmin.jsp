<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
#qnaRead {
	position: relative;
	width: 100%;
	height: 100%;
	z-index: 5;
}

#qnaRead .content {
	position: fixed;
	top: 200px;
	left: 100px;
	width: 800px;
	background: #FFF;
	border: 2px solid #666;
}

#qnaRead .content table {
	width: 100%;
	border-spacing: 0;
}

#qnaRead .content tr {
	width: 100%;
}

#qnaRead .content td {
	border-bottom: 1px solid black;
	text-align: center;
}

#qnaRead .userData {
	width: 90%;
}

#qnaRead .questionContent {
	display: inline-block;
	border: 1px solid black;
	padding: 5px;
	width: 90%;
	height: 500px;
	overflow: auto;
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
		
		alert(qnaNum);
		
		var fn = function(data) {
			printQNA(data);
		};
		
		ajaxJSON("get", "${pageContext.request.contextPath}/consumer/readQNA", "num=" + qnaNum, fn);
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
	out += "<div class='content'>";
	out += "<table><tr>";
	out += "<td style='width: 15%;'><span>작성자</span></td>";
	out += "<td style='width: 20%;'><input class='userData' type='text' value='" + data.dto.userName + "'></td>";
	out += "<td style='width: 15%;'><span>날짜</span></td>";
	out += "<td style='width: 50%;'><input class='userData' type='text' value='" + data.dto.q_created + "'></td>";
	out += "</tr><tr>";
	out += "<td colspan='4'><div class='questionContent'>" + data.dto.q_content + "</div></td>";
	out += "</tr><tr>";
	out += "<td style='width: 20%'><span>첨부파일</span></td><td colspan='3'></td>";
	out += "</tr></table>";
	out += "<hr>";
	out += "<table><tr>";
	out += "<td rowspan='2' style='width: 80%;'><textarea style='width: 100%; height: 150px; resize: none;'></textarea></td>";
	out += "<td style='width: 20%;'><button style='width: 100%; height: auto;'>등록</button></td>";
	out += "</tr><tr>";
	out += "<td><button style='width: 100%; height: auto;'>취소</button></td>";
	out += "</tr></table>";
	out += "</div>";
	
	$("#qnaRead").append(out);
}

</script>

<div>
	<div>
		<div id="qnaRead">
		
		</div>
		<table>
			<tr>
				<td>
					<select id="questionType">
						<option value="0" ${questionType=="0"?"selected='selected'":""}>전체</option>
						<option value="1" ${questionType=="1"?"selected='selected'":""}>DIY</option>
						<option value="2" ${questionType=="2"?"selected='selected'":""}>계정</option>
						<option value="3" ${questionType=="3"?"selected='selected'":""}>신청</option>
						<option value="4" ${questionType=="4"?"selected='selected'":""}>기타</option>
					</select>
				</td>
				<td>
					제목
				</td>
				<td>
					등록일자
				</td>
			</tr>
			
			<c:forEach var="dto" items="${list}">
				<tr class="qnaList" data-qnaNum="${dto.qnaNum}">
					<td>${dto.questionType}</td>
					<td>${dto.q_subject}</td>
					<td>${dto.q_created}</td>
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