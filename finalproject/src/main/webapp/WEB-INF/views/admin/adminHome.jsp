<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
div, ul, li, body, span, a, strong, table {
	margin: 0;
	padding: 0;
}

#mainContainer {
	width: 100%;
	height: auto;
	margin: 0;
	padding: 0;
	overflow: hidden;
}

#contentContainer {
	width: 1280px;
	height: 1980px;
	margin: auto;
}
.subContentBox {
	width: 100%;
	height: 400px;
	margin-top: 150px;
	margin-bottom: 50px;
}

.subContentTitle {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #e5e5e5;
}

.subContent {
	width: 85%;
	height: 60%;
	padding: 25px 40px 25px 40px;
	margin: 25px auto;
	border-top: 2px solid #1e1e1e;
	border-bottom: 2px solid #1e1e1e;
	border-left: 2px solid #1e1e1e;
	border-right: 2px solid #1e1e1e;
}

.subContent_noneborder {
	width: 85%;
	height: 60%;
	padding: 25px 40px 25px 40px;
	margin: 25px auto;
}

.ul_dashboard, .li_dashboard {
	display: table-cell;
	vertical-align: top;
}

.ul_dashboard {
	display: table;
	width: 100%;
	height: 100%;
	list-style: none;
	font-family: "맑은 고딕", "나눔 고딕", sans-serif;
	font-weight: bold;
}

.li_dashboard {
    padding-top: 13px;
    padding-left: 15px;
    padding-right: 10px;
}

.li_title {
	display: inline-block;
}

.li_value {
	display: block;
	margin-top: 75px;
	font-size: 50px;
	text-align: left;
	padding-left: 5px;
}

.s_li_value {
	display: block;
	margin-top: 75px;
	font-size: 45px;
	text-align: left;
	padding-left: 5px;
}

.table_dashboard {
	width: 100%;
	margin: 0px auto;
	border-spacing: 0px;
	border-collapse: collapse;
	font-family: "맑은 고딕", "나눔 고딕", sans-serif;
}
</style>
<div id="mainContainer">
    <div id="contentContainer">
		<div class="subContentBox">
			<div class="subContentTitle">
				<h2><i class="fas fa-chart-line"></i> 방문통계</h2>
			</div>
			<div class="subContent">
				<ul class="ul_dashboard">
					<li class="li_dashboard" style="border-right: 1px solid #e5e5e5;">
						<span class="li_title">일일방문자 | 20.12.16 기준</span>
						<strong class="li_value">1984</strong>
					</li>
					<li class="li_dashboard" style="border-right: 1px solid #e5e5e5;">
						<span class="li_title">월간방문자 | 2020.12 기준</span>
						<strong class="s_li_value">1,824,924</strong>
					</li>
					<li class="li_dashboard" style="border-right: 1px solid #e5e5e5;">
						<span class="li_title">일일가입자 | 20.12.16 기준</span>
						<strong class="li_value">124</strong>
					</li>
					<li class="li_dashboard">
						<span class="li_title">월간가입자 | 2020.12 기준</span>
						<strong class="s_li_value">2,800</strong>
					</li>
				</ul>				
			</div>
		</div>
		<div class="subContentBox">
			<div class="subContentTitle">
				<h2><i class="fas fa-chart-line"></i> 판매통계</h2>
			</div>
			<div class="subContent">
				<ul class="ul_dashboard">
					<li class="li_dashboard" style="border-right: 1px solid #e5e5e5;">
						<span class="li_title">일일판매건 | 20.12.16 기준</span>
						<strong class="li_value">47건</strong>
					</li>
					<li class="li_dashboard" style="border-right: 1px solid #e5e5e5;">
						<span class="li_title">일일판매금 | 2020.12 기준</span>
						<strong class="s_li_value">2,640,700원</strong>
					</li>
					<li class="li_dashboard" style="border-right: 1px solid #e5e5e5;">
						<span class="li_title">월간판매건 | 20.12.16 기준</span>
						<strong class="li_value">2742건</strong>
						
					</li>
					<li class="li_dashboard">
						<span class="li_title">월간판매금 | 2020.12 기준</span>
						<strong class="s_li_value">37,620,2440원</strong>
					</li>
				</ul>
			</div>
		</div>
		<div class="subContentBox">
			<div class="subContentTitle">
				<h2><i class="fas fa-user-check"></i> 신규권한신청</h2>
			</div>
			<div class="subContent_noneborder">
				<table class="table_dashboard">
					<tr align="center" height="35" bgcolor="#eeeeee" style="border-bottom: 1px solid #e5e5e5; border-top: 3px solid #cccccc;">
						<th>아이디</th>
						<th>회원명</th>
						<th>신청일짜</th>
						<th>승인여부</th>
					</tr>
					<tr align="center" height="35" style="border-bottom: 1px solid #e5e5e5;">
						<td>superAccount</td>
						<td>마스터</td>
						<td>2020-12-16</td>
						<td>승인완료</td>
					</tr>
				</table>
			</div>
		</div>
    </div>
</div>