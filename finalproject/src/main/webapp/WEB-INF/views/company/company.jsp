<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
div {
	margin: 0;
	padding: 0;
	display: block;
}

body {
	margin: 0px;
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

#main_con {
	background: #EBEBEB;
	width: 1903px;
	height: 5403px;
	
}

#content_corp {
	width: 1280px;
	height: 4680px;
	margin-left: 20%;
	margin-right: 15%;
}

#title_corp {
	font-weight: bolder;
	font-family: "맑은 고딕";
	color: #999999;
}

#text_corp {
	font-weight: bold;
	font-family: "맑은 고딕";
	font-size: 28px;
	margin: 30px 0px 0px;
	padding-bottom: 200px;
}

.card_title {
	margin-left: 50px;
	margin-top: 70px;
	font-size: 30px;
	font-family: "맑은 고닥";
	font-weight: bolder;
}

.card_content {
	margin-left: 50px;
	margin-top: 70px;
	font-size: 20px;
	font-family: "맑은 고딕";
	font-weight: bolder;
	padding-top: 80px;
}

.card_content_left {
	width: 50%;
	height: 100%;
	float: bottom;
}
.card_content_right {
	float: left;
	width: 50%;
	height: 100%;
}

.card_box {
	display:flex; border-radius:20px;
	background: #FFF;
	flex-wrap: nowrap;
	margin-bottom: 150px;
	width: 1160px;
	height: 680px;
}

.img_corp {
	width: 100%;
	height: 100%;
	border-top-right-radius: 20px;
	border-bottom-right-radius: 20px;
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


</style>

<div id="categori">
	<div id="categori_box">
            <a href="${pageContext.request.contextPath}">홈</a> > <a href="${pageContext.request.contextPath}/help/main">회사소개</a> > <a href="${pageContext.request.contextPath}/help/myHistory">DIY</a>
	</div>
</div>
	<div id="main_con">
		<div id="content_corp">
			<h2 id="title_corp">Do It YourSelf</h2>
			<p id="text_corp">
				나의 생각이 그대로 반영된 물건이 없나요? <br> 나의 관점, 생각하는 기능, 지향하는 목표까지 DIY는 <br>
				우리가 원하는 방향을 나아가는데 있어서 가장 좋은 습관이자 문화 입니다. <br> 내가 생각하는 나만의 생활공간.
				<strong>DIY입니다.</strong>
			</p>
			
			<div class="card_box">
				<div class="card_content_left">
					<p class="card_title">
					가보지 않은 길을<br>
					두려워하지 않습니다.
					</p>				
					
					<p class="card_content">
					"가보지 않은 길은 위험하잖아?"<br>
					배는 정박해 있을 때 가장 안전하지만<br>
					그것은 배의 존재 이유가 아닙니다.<br>
					가보지 않은 길은 실패의 위험이 따르지만<br>
					우리는 개선보다 혁신의 길을 가는 사람들입니다.<br>
					문제 자체를 다시 정의하고<br>
					새로운 해답을 찾는것에 집중합니다.<br>
					<strong>도전을 통한 DIY.</strong>
					</p>
				</div>
				<div class="card_content_right">
					<img class="img_corp" src="루시드냥.jpg">
				</div>
			</div>
			
			
			<div class="card_box">
				<div class="card_content_left">
					<p class="card_title">
					무엇이든 본질만 남기고<br>
					처음부터 다시 생각해 봅니다.
					</p>
					
					<p class="card_content">
					"원래 그게 당연한 거 아냐?"<br>
					불편하고 복잡한 게 당연할 리 없습니다.<br>
					그래서 우리는 본질에서 출발합니다.<br>
					시작부터 다르게 질문합니다.<br>
					끊임없이 '왜?' 라는 물음을 던집니다.<br>
					그렇게 익숙한 것을 새롭게,
					<strong>가치 있게 만듭니다.</strong>
					</p>
				</div>
				<div class="card_content_right">
					<img class="img_corp" src="루시드냥.jpg">
				</div>
			</div>
			
			
			<div class="card_box">
				<div class="card_content_left">
					<p class="card_title">
					스스로 몰입하고<br>
					주도적인 삶을 추구합니다.
					</p>
				
					<p class="card_content">
					"왜 이걸 만들까?"<br>
					DIY Crew라면 가장 먼저 해야 하는 질문입니다.<br>
					우리는 DIY의 원동력을 스스로 만들어냅니다.<br>
					내가 원해서 만드는 나의 DIY인거죠<br>
					<strong>언제나 내가 먼저 생각하고, 질문하고, 움직입니다.</strong>
					</p>
				</div>
				<div class="card_content_right">
					<img class="img_corp" src="루시드냥.jpg">
				</div>
			</div>
			
			<div class="card_box">
				<div class="card_content_left">
					<p class="card_title">
					나보다 동료의 생각이<br>
					더 옳을 수 있다는<br>
					믿음을 가집니다.
					</p>
				
					<p class="card_content">
					"내가 항상 정답일까?"<br>
					개인의 완벽함에 기대기 보다<br>
					동료와 함께 완성해 나갑니다.<br>
					격렬한 토론과 논쟁 속에서도<br>
					서로에 대한 신뢰가 있다면<br>
					반드시 더 나은 답을 찾을 수 있습니다.<br>
					신뢰를 받기 위해서 상대방을 먼저 존중하세요.<br>
					혼자 가면 빨리 갈 수 있지만<br>
					<strong>함께 가면 멀리 갈 수 있습니다.</strong>
					</p>
				</div>
				<div class="card_content_right">
					<img class="img_corp" src="루시드냥.jpg">
				</div>
			</div>
			
			<div class="card_box">
				<div class="card_content_left">
					<p class="card_title">
					주도적인 삶을 살아가고자<br>
					나를 바꾸려고 노력합니다.
					</p>		
					
					<p class="card_content">
					"너무 거창한 이야기 아냐?"<br>
					삶을 지속적으로 변화시킬 수 있는 가장 좋은 방법은<br>
					행동하는 것을 습관화 하는 것입니다.<br>
					생각에서 끝난다면 변화는 올 수 없습니다. <br>
					하지만 생각이 행동이 되고<br>
					그것이 습관처럼 몸에 녹아든다면<br>
					<strong>삶의 주체는 바로 당신입니다.</strong>
					</p>
				</div>
				<div class="card_content_right">
					<img class="img_corp" src="루시드냥.jpg">
				</div>
				</div>
			</div>
		</div>
		
