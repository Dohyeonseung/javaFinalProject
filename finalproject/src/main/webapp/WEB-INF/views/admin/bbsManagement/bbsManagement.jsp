<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
div, body, tr, th, td, tbody {
	margin: 0;
	padding: 0;
}

table {
	border-collapse: separate;
    text-indent: initial;
    border-spacing: 2px;
}
#mainContainer {
	width: 100%;
	height: auto;
	overflow: hidden;
}

#contentContainer {
	width: 1280px;
	height: 1280px;
	margin: auto;
}

#table_box {
	width: 100%;
	height: 100%;
	margin-top: 150px;
}

.bbsManagement_title {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #e5e5e5;
}

.controll_table {
	width: 100%;
	height: 85%;
	margin-top: 50px;
}

.bbs_category_list {
	width: 540px;
	height: 1040px;	
	margin: 0;
	padding: 0
}

.bbs_category_menu {
	width: 700px;
	height: 1040px;
	margin: 0;
	padding: 0;
	text-align: left;
	float: left;
}

.admin_box {
	width: 100%;
	height: 50%;
	padding-left: 20px;
	padding-right: 10px;

}	

.category_box {
	width: 95%;
	height: 100%;
	margin: 0;
	padding: 0;
}


.bbs_list {
	width: 100%;
	height: 100%;
	padding: 1px;
	border: 5px double #969694;
}

.cate_name {
	font-size: 16px;
}

.btn_style {
	width: 100px;
	height: 30px;
	border-radius: 0;
	border-top: 0;
	border-bottom: 0;
	border-left: 0;
	border-right: 0;
	font-family: "맑은 고딕", sans-serif;
	font-weight: bold;
}

.bbs_ol {
	list-style: none;
	padding-bottom: 15px;
}

.bbs_li {
	font-size: 18px;
	font-family: "맑은 고딕", "나눔 고딕", sans serif;
	font-weight: bolder;
	margin: 30px 0 30px 0;
}

.head_menu {
	font-size: 25px;
	font-weight: bold;
	font-family: "맑은 고딕", "나눔 고딕", sans serif;
}
.bbs_a {
	text-decoration: none;
	color: #1e1e1e;
}

.bbs_a:hover {
	text-decoration: none;
	color: #4374D9;
}
</style>

<div id="mainContainer">
	<div id="contentContainer">
		<div id="table_box">
			<div class="bbsManagement_title">
				<h2><i class="fas fa-cogs"></i> 게시판관리</h2>
			</div>
			<table class="controll_table">
				<tbody>
					<tr>
						<td class="bbs_category_list">
							<div class="category_box">
								<div class="bbs_list">
									<ol class="bbs_ol">
										<li class="bbs_li">
											<span class="head_menu">『Sell(판매)』</span>
											<ol class="bbs_ol">
												<li class="bbs_li"><a href="#" class="bbs_a">└ 재료판매</a></li>
												<li class="bbs_li"><a href="#" class="bbs_a">└ 예약판매</a></li>
												<li class="bbs_li"><a href="#" class="bbs_a">└ 완제품판매</a></li>
											</ol>										
										</li>
									</ol>
									
									<ol class="bbs_ol">
										<li class="bbs_li">
											<span class="head_menu">『Buy(구매)』</span>
											<ol class="bbs_ol">
												<li class="bbs_li"><a href="#" class="bbs_a">└ 재료구매</a></li>
												<li class="bbs_li"><a href="#" class="bbs_a">└ 예약구매</a></li>
												<li class="bbs_li"><a href="#" class="bbs_a">└ 완제품구매</a></li>
												<li class="bbs_li"><a href="#" class="bbs_a">└ D-Market</a></li>
											</ol>
										</li>										
									</ol>
									
									<ol class="bbs_ol">
										<li class="bbs_li">
											<span class="head_menu">『커뮤니티』</span>
											<ol class="bbs_ol">
												<li class="bbs_li"><a href="#" class="bbs_a">└ 지역모임</a></li>
												<li class="bbs_li"><a href="#" class="bbs_a">└ DIY팁</a></li>
												<li class="bbs_li"><a href="#" class="bbs_a">└ 묻고답하기</a></li>
												<li class="bbs_li"><a href="#" class="bbs_a">└ 공지사항</a></li>
											</ol>
										</li>									
									</ol>
								</div>
							</div>
						</td>
						<td class="bbs_category_menu">
							<table class="admin_box">
								<tr>
									<th class="cate_name">게시판명</th>
									<td><input type="text" style="width: 300px; height: 30px;"></td>
								</tr>
								
								<tr>
									<th class="cate_name">게시판상태</th>
									<td>
									<input type="checkbox"> 활성화
									<input type="checkbox"> 비활성화
									</td>
								</tr>
								
								<tr>
									<th class="cate_name">접근권한</th>
									<td>
									<input type="checkbox"> 모두
									<input type="checkbox"> 판매자
									<input type="checkbox"> 관리자
									</td>
								</tr>
							</table>
							
							<div style="float: right; padding-right: 30px;">
								<button class="btn_style">설정</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>