<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
div, body {
	margin: 0;
	padding: 0;
}

#mainContainer {
	width: 100%;
	height: auto;
	overflow: hidden;
}

#contentContainer {
	width: 1800px;
	height: 1280px;
	margin: auto;
}

#home_table {
	width: 100%;
	height: 85%;
	margin-top: 70px;
}

.sales_home_title {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #e5e5e5;
}

.sales_icon {
	font-size: 150px;
	color: #4374D9;
}

.refrash_icon_sales {
	font-size: 16px;
	padding-left: 5px;
	padding-bottom: 5px;
}

.sales_info_table {
	width: 445px;
	height: 100%;
	display: inline-block;
	margin-top: 30px;
}

.sales_info_title {
	text-align: center;
	height: auto;
}

.sales_info_values {
	text-align: center;
	height: auto;
}

.sales_info_span {
	width: 150px;
	display: inline-block;
	padding: 20px 140px 20px 0;
	font-style: "맑은 고딕", "나눔 고딕", sans-serif;
	font-weight: bolder;
	font-size: 20px;
}

.line_bottom {
	border-bottom: 1px solid #e5e5e5;
}

.sales_refrash_a {
	text-decoration: none;
	color: #1e1e1e;
}

.sales-refrash_a:hover {
	text-decoration: none;
	color: #4374D9;
}

</style>
<div id="mainContainer">
	<div id="contentContainer">
		<div id="home_table">
			<div class="sales_home_title">
					<h1><i class="fas fa-shopping-cart"></i> 판매상황</h1>
			</div>
			
			<table class="sales_info_table" style="border-right: 1px solid #e5e5e5;">
				<tbody>
					<tr>
						<td style="width: 440px; height: 100%; padding-top: 100px;">
						<h1 class="sales_info_title">
							<span class="sales_icon"><i class="fas fa-hourglass-end"></i></span><br>
							<span style="display: inline-block; padding-top: 40px;">처리지연현황<a href="" class="sales_refrash_a"><i class="fas fa-sync-alt refrash_icon_sales"></i></a></span>
						</h1>
						<div class="sales_info_values">
							<span class="sales_info_span line_bottom">발송지연</span><span class="line_bottom" style="font-size: 20px; padding-bottom: 20px;">0건</span><br>
							<span class="sales_info_span line_bottom">취소지연</span><span class="line_bottom" style="font-size: 20px; padding-bottom: 20px;">0건</span><br>
							<span class="sales_info_span line_bottom">반품지연</span><span class="line_bottom" style="font-size: 20px; padding-bottom: 20px;">0건</span><br>
							<span class="sales_info_span line_bottom">교환지연</span><span class="line_bottom" style="font-size: 20px; padding-bottom: 20px;">0건</span><br>
						</div>
						</td>
					</tr>
				</tbody>
			</table>
			
			<table class="sales_info_table" style="border-right: 1px solid #e5e5e5;">
				<tbody>
					<tr>
						<td style="width: 440px; height: 100%; padding-top: 100px;">
						<h1 class="sales_info_title">
							<span class="sales_icon"><i class="fas fa-times"></i></span><br>
							<span style="display: inline-block; padding-top: 40px;">취소/반품/교환 현황<a href="" class="sales_refrash_a"><i class="fas fa-sync-alt refrash_icon_sales"></i></a></span>
						</h1>
						<div class="sales_info_values">
							<span class="sales_info_span line_bottom">취소요청</span><span class="line_bottom" style="font-size: 20px; padding-bottom: 20px;">0건</span><br>
							<span class="sales_info_span line_bottom">반품요청</span><span class="line_bottom" style="font-size: 20px; padding-bottom: 20px;">0건</span><br>
							<span class="sales_info_span line_bottom">교환요청</span><span class="line_bottom" style="font-size: 20px; padding-bottom: 20px;">0건</span><br>
						</div>
						</td>
					</tr>
				</tbody>
			</table>
			
			<table class="sales_info_table" style="border-right: 1px solid #e5e5e5;">
				<tbody>
					<tr>
						<td style="width: 440px; height: 100%; padding-top: 100px;">
						<h1 class="sales_info_title">
							<span class="sales_icon"><i class="fas fa-chart-bar"></i></span><br>
							<span style="display: inline-block; padding-top: 40px;">판매현황<a href="" class="sales_refrash_a"><i class="fas fa-sync-alt refrash_icon_sales"></i></a></span>
						</h1>
						<div class="sales_info_values">
							<span class="sales_info_span line_bottom">신규주문</span><span class="line_bottom" style="font-size: 20px; padding-bottom: 20px;">0건</span><br>
							<span class="sales_info_span line_bottom">배송준비</span><span class="line_bottom" style="font-size: 20px; padding-bottom: 20px;">0건</span><br>
							<span class="sales_info_span line_bottom">배송중</span><span class="line_bottom" style="font-size: 20px; padding-bottom: 20px;">0건</span><br>
							<span class="sales_info_span line_bottom">배송완료</span><span class="line_bottom" style="font-size: 20px; padding-bottom: 20px;">0건</span><br>
							<span class="sales_info_span line_bottom">최근일주일 거래</span><span class="line_bottom" style="font-size: 20px; padding-bottom: 20px;">0건</span><br>
						</div>
						</td>
					</tr>
				</tbody>
			</table>
			
			<table class="sales_info_table">
				<tbody>
					<tr>
						<td style="width: 440px; height: 100%; padding-top: 100px;">
						<h1 class="sales_info_title">
							<span class="sales_icon"><i class="fas fa-boxes"></i></span><br>
							<span style="display: inline-block; padding-top: 40px;">상품현황<a href="" class="sales_refrash_a"><i class="fas fa-sync-alt refrash_icon_sales"></i></a></span>
						</h1>
						<div class="sales_info_values">
							<span class="sales_info_span line_bottom">판매중인 상품</span><span class="line_bottom" style="font-size: 20px; padding-bottom: 20px;">0건</span><br>
							<span class="sales_info_span line_bottom">판매종료 상품</span><span class="line_bottom" style="font-size: 20px; padding-bottom: 20px;">0건</span><br>
							<span class="sales_info_span line_bottom">재고 10개 이하</span><span class="line_bottom" style="font-size: 20px; padding-bottom: 20px;">0건</span><br>
							<span class="sales_info_span line_bottom">재고 50개 이상</span><span class="line_bottom" style="font-size: 20px; padding-bottom: 20px;">0건</span><br>
						</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>