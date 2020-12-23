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
	width: 1280px;
	height: 2580px;
	margin: auto;
}

.statistics_ContentBox {
	width: 100%;
	height: 700px;
	margin-top: 150px;
	margin-bottom: 50px;
}

.statistics_title {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #e5e5e5;
}

.statistics_Box {
	width: 85%;
	height: 70%;
	padding: 25px 40px 25px 40px;
	margin: 25px auto;
	border-top: 2px solid #1e1e1e;
	border-bottom: 2px solid #1e1e1e;
	border-left: 2px solid #1e1e1e;
	border-right: 2px solid #1e1e1e;
}
</style>

<script type="text/javascript">

</script>
<div id="mainContainer">
	<div id="contentContainer">
		<div class="statistics_ContentBox">
			<div class="statistics_title">
				<h2><i class="fas fa-chart-line"></i> 시간대판매통계</h2>
			</div>
			<div class="statistics_Box">
			
			</div>
		</div>
		
		<div class="statistics_ContentBox">
			<div class="statistics_title">
				<h2><i class="fas fa-chart-line"></i> 주간판매통계</h2>
			</div>
			<div class="statistics_Box">
			
			</div>
		</div>
		
		<div class="statistics_ContentBox">
			<div class="statistics_title">
				<h2><i class="fas fa-chart-line"></i> 월간판매통계</h2>
			</div>
			<div class="statistics_Box">
			
			</div>
		</div>
	</div>
</div>