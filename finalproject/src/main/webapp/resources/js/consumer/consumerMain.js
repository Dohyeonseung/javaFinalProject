/**
 * 
 */

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
	
	$(document).on("click", ".popul", function() {
		var faqNum = $(this).attr("data-faqNum");
		
		var fn = function(data) {
			printQNA(data);
		};
		
		ajaxJSON("get", "${pageContext.request.contextPath}/consumer/readPopul", "faqNum=" + faqNum, fn);
	});
	
	$(document).on("click", ".modal_content", function() {
		$(this).parent().empty();
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
	var ss = data.dto.questionType=="1"?"DIY":data.dto.questionType=="2"?"계정이용":data.dto.questionType=="3"?"판매신청":"기타";
	out += "<div class='modal_content'>";
	out += "<table>";
	out += "<tr>";
	out += "<td>구분</td>";
	out += "<td><input type='text' value='" + ss + "'></td>";
	out += "<td>제목</td>";
	out += "<td><input type='text' value='" + data.dto.f_subject + "'></td>";
	out += "</tr>";
	out += "<tr>";
	out += "<td colspan='4' style='margin-top: 20px; border: 1px solid black;'>" + data.dto.f_content + "</td>";
	out += "</tr>";
	out += "</table>";
	out += "</div>";
	
	$("#modal").empty();
	$("#modal").append(out);
}