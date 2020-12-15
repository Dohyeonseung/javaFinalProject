<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style type="text/css">
div {
	margin: 0;
}

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

<div id="categori">
	<div id="categori_box">
            <a href="${pageContext.request.contextPath}">홈</a> > <a href="${pageContext.request.contextPath}/help/main">고객센터</a> > <a href="${pageContext.request.contextPath}/help/myHistory">FAQ</a>
	</div>
</div>

<div id="mContainor">
	<div id="subContainor">
		<div>
			<h1 class="desk_title"><i class="fas fa-question-circle"></i> DIY</h1>
		</div>
		<div class="keyword_containor">
			<span class="keyword_text"><a href="#">DIY</a></span>
			<span class="keyword_text"><a href="#">계정이용</a></span>
			<span class="keyword_text"><a href="#">판매신청</a></span>
			<span class="keyword_text"><a href="#">기타</a></span>
		</div>
		<table class="help_content">
			<tr style="border-bottom: 1px solid #ccc; height: 75px;">
				<td style="padding: 0 10px 0 10px;" align="center">1</td>
				<td class="help_title"><a href="#">계정이 도용당했어요</a></td>
				<td align="right" style="padding: 0 10px 0 0;"><i class="fas fa-angle-down"></i></td>
			</tr>
			
			<tr style="border-bottom: 1px solid #ccc; height: 75px;">
				<td style="padding: 0 10px 0 10px;" align="center">2</td>
				<td class="help_title"><a href="#">알 수 없는 사용자로부터 채팅이 왔어요</a></td>
				<td align="right" style="padding: 0 10px 0 0;"><i class="fas fa-angle-down"></i></td>
			</tr>
			
			<tr style="border-bottom: 1px solid #ccc; height: 75px;">
				<td style="padding: 0 10px 0 10px;" align="center">3</td>
				<td class="help_title"><a href="#">운영자를 사칭하는 유저가 있어요</a></td>
				<td align="right" style="padding: 0 10px 0 0;"><i class="fas fa-angle-down"></i></td>
			</tr>
			
			<tr style="border-bottom: 1px solid #ccc; height: 75px;">
				<td style="padding: 0 10px 0 10px;" align="center">4</td>
				<td class="help_title"><a href="#">현재 판매중인 상품이 구입이 안되요</a></td>
				<td align="right" style="padding: 0 10px 0 0;"><i class="fas fa-angle-down"></i></td>
			</tr>
			
			<tr style="border-bottom: 1px solid #ccc; height: 75px;">
				<td style="padding: 0 10px 0 10px;" align="center">5</td>
				<td class="help_title"><a href="#">이용약관에 위배되는 판매자가 있어요</a></td>
				<td align="right" style="padding: 0 10px 0 0;"><i class="fas fa-angle-down"></i></td>
			</tr>
			
			<tr style="border-bottom: 1px solid #ccc; height: 75px;">
				<td style="padding: 0 10px 0 10px;" align="center">6</td>
				<td class="help_title"><a href="#">구입한 제품에 문제가 생겼어요</a></td>
				<td align="right" style="padding: 0 10px 0 0;"><i class="fas fa-angle-down"></i></td>
			</tr>
			
			<tr style="border-bottom: 1px solid #ccc; height: 75px;">
				<td style="padding: 0 10px 0 10px;" align="center">7</td>
				<td class="help_title"><a href="#">회원탈퇴를 진행하고 싶어요</a></td>
				<td align="right" style="padding: 0 10px 0 0;"><i class="fas fa-angle-down"></i></td>
			</tr>
			
			<tr style="border-bottom: 1px solid #ccc; height: 75px;">
				<td style="padding: 0 10px 0 10px;" align="center">8</td>
				<td class="help_title"><a href="#">판매자 신청은 어떻게 진행하나요?</a></td>
				<td align="right" style="padding: 0 10px 0 0;"><i class="fas fa-angle-down"></i></td>
			</tr>
			
			<tr style="border-bottom: 1px solid #ccc; height: 75px;">
				<td style="padding: 0 10px 0 10px;" align="center">9</td>
				<td class="help_title"><a href="#">고객센터 유선 문의는 없나요?</a></td>
				<td align="right" style="padding: 0 10px 0 0;"><i class="fas fa-angle-down"></i></td>
			</tr>
			
			<tr style="border-bottom: 1px solid #ccc; height: 75px;">
				<td style="padding: 0 10px 0 10px;" align="center">10</td>
				<td class="help_title"><a href="#">계정권한이 잠겼어요</a></td>
				<td align="right" style="padding: 0 10px 0 0;"><i class="fas fa-angle-down"></i></td>
			</tr>
		</table>
		
		<table style="width: 100%; margin: 75px 0 100px 0; border-spacing: 0px;">
		   <tr height="35">
			 <td align="center" width="300" style="margin-right: 35px;">
			 	1 2 3 4
			 </td>
		   </tr>
		</table>
		<div>
			<span>원하시는 답변을 찾지못하셨다면, 고객센터로 문의해 주세요.</span>
			<div style="float: right;">
			<button class="btn_style" type="button"><i class="fas fa-edit"></i> 문의하기</button>
			</div>
		</div>
	</div>
</div>