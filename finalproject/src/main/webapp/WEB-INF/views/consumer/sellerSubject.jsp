<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style type="text/css">
div, body {
	margin: 0;
}

#mContainor td {
	border: 1px solid black;
}

#mContainor {
	width: auto;
	height: auto;
	overflow: hidden;
}

#subContainor {
	width: 1280px;
	margin: auto;
	text-align: center;
}


.helpTable {
	width: 100%;
	border-collapse: collapse;
}
.category_id {
	text-align: center;
	font-family: "맑은 고딕";
	font-size: 16px;
	font-weight: bold;
	width: 260px;
	height: 100px;
}
.short_input {
	border-radius: 5px;
	width: 760px;
	height: 30px;
}

.hp_content {
	border-radius: 5px;
}

#agree_table {
	font-size: 16px;
	font-weight: bold;
	font-family: "맑은 고딕";
	border-collapse: collapse;
}

a {
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}

#agree_button {
	margin-top: 75px;
	float: right;
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
    box-shadow: 0 120px 0 0 rgba(0, 0, 0, 0.25) inset, 
                0 -120px 0 0 rgba(0, 0, 0, 0.25) inset;
}

#info input {
	border: none;
	text-align: center;
}

.help_btn {
	width: 100px;
	height: 60px;
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
<script src="https://cdn.rawgit.com/eligrey/FileSaver.js/5ed507ef8aa53d8ecfea96d96bc7214cd2476fd2/FileSaver.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#bankName").change(function() {
		var bankName = $("#bankName option:selected").val();
		
		switch (bankName){
		    case "국민은행": $("#bankImage").attr("src", "${pageContext.request.contextPath}/resources/images_help/kbstar.jpg"); break;
		    case "우리은행": $("#bankImage").attr("src", "${pageContext.request.contextPath}/resources/images_help/we.jpg"); break;
		    case "신한은행": $("#bankImage").attr("src", "${pageContext.request.contextPath}/resources/images_help/sinhan.jpg"); break;
		    case "기업은행": $("#bankImage").attr("src", "${pageContext.request.contextPath}/resources/images_help/giup.jpg"); break;
		    default: alert("오류");
		}
	});
	
	$("#proImage").click(function() {
		$("#imageChange").click();
	});
	
	$("#imageChange").change(function() {
		setImageFromFile(this, '#proImage');
	});
	
	$("#man").click(function() {
		$(this).css('color', 'red');
		$("#woman").css('color', 'black');
	});
	
	$("#woman").click(function() {
		$(this).css('color', 'red');
		$("#man").css('color', 'black');
	});
	
	function setImageFromFile(input, expression) {
	    if (input.files && input.files[0])
	    {
	        var reader = new FileReader();
	 
	            reader.onload = function (e) {
	                $(expression).attr('src', e.target.result);
	           }
	           reader.readAsDataURL(input.files[0]);
	     }
	}
	
    $("#save").click(function() {
    	var userName = document.getElementById("userName").value;
    	var tel = document.getElementById("tel").value;
    	var addr = document.getElementById("addr").value;
    	var bankName = document.getElementById("bankName").value;
    	var bankOwner = document.getElementById("bankOwner").value;
    	var bankNumber = document.getElementById("bankNumber").value;
    	
    	html2canvas($("#info").get(0)).then(function(canvas) {
    		var myImg = canvas.toDataURL("image/png");
			myImg = myImg.replace("data:image/png;base64,", "");

			$.ajax({
				type : "POST",
				data : {
					"imgSrc": myImg,
					"userName": userName,
					"tel": tel,
					"addr": addr,
					"bankName": bankName,
					"bankOwner": bankOwner,
					"bankNumber": bankNumber
				},
				dataType : "text",
				url : "${pageContext.request.contextPath}/consumer/ImgSaveTest",
				success : function(data) {
					console.log(data);
					alert("정상적으로 신청되었습니다.");
					location.href = "${pageContext.request.contextPath}/consumer/main";
				},
				error : function(a, b, c) {
					alert("error");
				}
    		});
	    });
    	
    	
	});
})
</script>
<div id="mContainor">
	<div id="subContainor">
		<div id="title_box" style="text-align: center; width: 1000px; height: auto; background: #fff; display: inline-block;">
			<h1 style="margin-top: 15px; text-align: left;">
				<i class="fas fa-edit"></i>&nbsp;판매자 등록
			</h1>
		</div>
		<div id="info" style="text-align: center; width: 1000px; height: 600px; background: #fff; display: inline-block;">
			<div id="element" style="width: 900px; height: auto; display: inline-block; margin-top: 15px;">
				<table style="border-spacing: 0; width: 900px; margin-bottom: 30px;">
					<tr>
						<td rowspan="5" style="width: 200px; height: 300px;">
							<input id="imageChange" type="file" accept="image/*" style="z-index: -1; position: fixed;">
							<img id="proImage" style="width: 200px; height: 300px; max-width: 200px; max-height: 300px; min-width: 200px; min-height: 300px;" src="${pageContext.request.contextPath}/resources/images_help/no_Image.png">
						</td>
						<td rowspan="3" style="width: 60px;">성명</td>
						<td style="width: 60px;">
							<span>한 글</span>
						</td>
						<td style="width: 90px;">
							<input type="text" id="userName" value="${dto.userName}">
						</td>
						<td style="width: 60px;">
							<span>지원분야</span>
						</td>
						<td colspan="3">
							<span>판매자</span>
						</td>
					</tr>
					<tr>
						<td rowspan="2" colspan="2" style="width: 150px; background: grey;">
						</td>
						<td style="width: 80px;">
							<span>생년월일</span>
						</td>
						<td style="width: 160px;">
							<input type="text" id="birth" value="${dto.birth}" style="border: none; width: 100%; height: 100%;">
						</td>
						<td style="width: 60px;">
							<span>연령</span>
						</td>
						<td style="width: 145px;">
							<input type="text" id="age" value="${dto.age}세" style="border: none;">
						</td>
					</tr>
					<tr>
						<td style="width: 60px;">
							<span>성 별</span>
						</td>
						<td style="width: 160px;">
							<a id="man" style="color: red;">남자</a>&nbsp;ㅣ&nbsp;<a id="woman">여자</a>
						</td>
						<td style="width: 60px;">
							<span>국 적</span>
						</td>
						<td style="width: 100px;">
							<input type="text" id="nation" value="${dto.nation}" style="border: none;">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<span>주 소 지</span>
						</td>
						<td colspan="5">
							<input type="text" id="addr" value="${dto.addr}" style="border: none; width: 500px;">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<span>전 화 번 호</span>
						</td>
						<td colspan="2">
							<input type="text" id="tel" value="${dto.tel}" style="border: none;">
						</td>
						<td>
							<span>E-mail</span>
						</td>
						<td colspan="2">
							<input type="text" id="email" value="${dto.email}" style="border: none;">
						</td>
					</tr>
				</table>
			</div>
			
			<hr>
			
			<div style="display: inline-block; margin-top: 30px;">
				<table style="border-spacing: 0; width: 900px; height: 200px; margin-bottom: 30px;">
					<tr>
						<td rowspan="2" style="width: 20%; font-size: 42px;">은행</td>
						<td rowspan="2" style="width: 30%;">
							<div style="width: 270px; height: auto; text-align: center;">
								<img id="bankImage" style="width: 150px; height: 150px; max-width: 150px; max-height: 150px;" src="${pageContext.request.contextPath}/resources/images_help/kbstar.jpg">
							</div>
							<select id="bankName" data-html2canvas-ignore="true">
								<option value="국민은행">국민은행</option>
								<option value="우리은행">우리은행</option>
								<option value="신한은행">신한은행</option>
								<option value="기업은행">기업은행</option>
							</select>
						</td>
						<td style="width: 20%; font-size: 30px;">예금주</td>
						<td style="width: 30%; font-size: 20px;">
							<input id="bankOwner" type="text" style="border: none;">
						</td>
					</tr>
					<tr>
						<td style="font-size: 30px;">계좌 번호</td>
						<td style="font-size: 20px;">
							<input id="bankNumber" type="text" style="border: none;">
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div style="text-align: right; width: 1000px; height: auto; background: #fff; display: inline-block;">
			<hr style="margin-bottom: 10px;">
		   <button class="help_btn" type="button" onclick="javascript:history.back();">돌아가기</button>
		   <button class="help_btn" type="button" id="save">제출하기</button>
		</div>
	</div>
</div>