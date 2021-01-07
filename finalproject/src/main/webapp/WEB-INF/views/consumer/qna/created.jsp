<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
div, body {
	margin: 0;
}

#mContainor {
	width: 100%;
	height: auto;
	overflow: hidden;
}

#subContainor {
	width: 1280px;
	height: auto;
	margin: auto;
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
</style>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script type="text/javascript">
function sendQNA() {
    var f = document.qnaForm;

	var str = f.q_subject.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.subject.focus();
        return;
    }

	str = f.q_content.value;
    if(!str) {
        alert("내용을 입력하세요. ");
        f.content.focus();
        return;
    }

	f.action="${pageContext.request.contextPath}/consumer/qna/created";

    f.submit();
}
</script>
<div id="mContainor">
	<div id="subContainor">
		<div id="title_box">
			<h1>
				<i class="fas fa-dit"></i>&nbsp;고객문의
			</h1>
			<span style="float: right;">
				*필수입력 사항
			</span>
		</div>
		
		<form name="qnaForm" action="${pageContext.request.contextPath}/consumer/qna/created" method="post" enctype="multipart/form-data">
			<table class="helpTable">
				<tr style="border-bottom: 1px solid #cccccc; border-top: 1px solid #101010;">
					<td class="category_id">
						연락받으실 이메일주소*
					</td>
					<td>
						<input name="email" class="short_input" type="text">
					</td>
				</tr>
				
				<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
					<td class="category_id">
						연락받으실 연락처*
					</td>
					<td>
						<input name="tel" class="short_input" type="text">
					</td>
				</tr>
				
				<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #101010;">
					<td class="category_id">
						고객명
					</td>
					<td>
						<span>${sessionScope.member.userName}</span>
					</td>
				</tr>
				
				<tr style="border-bottom: 1px solid #cccccc;">
					<td class="category_id">
						문의 분류*
					</td>
					<td>
						<select name="questionType" style="width: 769px; height: 30px; border-radius: 5px;">
							<option value="1">DIY</option>
							<option value="2">계정</option>
							<option value="3">판매</option>
							<option value="4">기타</option>
						</select>
					</td>
				</tr>
				
				<tr style="border-bottom: 1px solid #cccccc;">
					<td class="category_id">
						문의 제목*
					</td>
					<td>
						<input name="q_subject" class="short_input" type="text">
					</td>
				</tr>
				
				<tr style="border-bottom: 1px solid #cccccc;">
					<td class="category_id">
						문의 내용*
					</td>
					<td>
						<textarea name="q_content" style="width: 760px; height: 300px; overflow: auto; resize: none;"></textarea>
					</td>
				</tr>
			</table>
		</form>
		
		<div style="margin: 28px; margin-left: 50px;">
			<strong>개인정보 수집 · 이용에 대한 안내</strong>
			<p style="padding-top: 18px; padding-bottom: 18px;">
				(주)DIY는 이용자 문의를 처리학 ㅣ위해 다음과 같이 개인정보를 수집 및 이용하여, 이를 위한 최소한의 개인정보이므로 동의를 해주셔야 처리가 가능합니다.<br>
				(선택 항목은 동의하지 않으셔도 문의 접수가 가능합니다.)
			</p>
			<p style="padding-bottom: 18px;">
				(필수) 개인정보 수집 · 이용에 대한 안내<br>
				문의접수 및 처리, 회신을 위한 최소한의 개인정보이며, 동의를 필요로 합니다.
			</p>
			<table id="agree_table">
				<thead>
					<tr style="border-top: 3px solid #cccccc;">
						<th scope="col" style="width: 270px; border-bottom: 1px solid #cccccc;">
							수집항목
						</th>
						<th scope="col" style="width: 220px; border-left: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
							수집목적
						</th>
						<th scope="col" style="width: 260px; border-left: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
							보유기간
						</th>
					</tr>
				</thead>
				
				<tbody>
					<tr style="border-bottom: 1px solid #cccccc;">
						<td>
							이메일 주소, 휴대폰 번호
						</td>
						<td style="border-left: 1px solid #cccccc;">
							문의 · 요청 · 불편사항 확인 및 처리결과 회신
						</td>
						<td style="border-left: 1px solid #cccccc;">
							3년간 보관 후 지체없이 파기
						</td>
					</tr>
				</tbody>
			</table>
			
			<p>
				더 자세한 내용에 대해서는 <a href="#">DIY 개인정보처리방침</a>을 참고하시기 바랍니다.
			</p>
			
			<span>
				<input type="checkbox">
				<label>
					위 내용에 동의합니다.
				</label>
			</span>
		</div>
		
		<div id="agree_button">
			<button class="btn_style" type="button" onclick="sendQNA();">문의접수</button>
			<button class="btn_style" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/consumer/list';">문의 취소</button>
		</div>
	</div>
</div>























































