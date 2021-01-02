<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<div class="body-container">
        	<div class="photo-gallery">
        		<ul class="slider">
        				<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img/slider1.jpg"></a></li>
        				<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img/slider2.JPG"></a></li>
        				<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img/slider3.jpg"></a></li>
        		</ul>
        	</div>

	<div class="intro">
		<div class="intoSubject">
			<h3>사이트를 소개하기</h3>
		</div>
	 <div class="intoContent">
		<div class="intoWritten">
			<span>Et malesuada fames ac turpis egestas sed. 
			Sit amet nisl suscipit adipiscing bibendum est ultricies. 
			Arcu ac tortor dignissim convallis aenean et tortor at.
			 Pretium viverra suspendisse potenti nullam ac tortor vitae purus. 
			 Eros donec ac odio tempor orci dapibus ultrices. 
			 Elementum nibh tellus molestie nunc.</span>
		 </div>
		
		 <div class="linkBtn">
		 	<button type="button" class="btn btn-default">Default button</button>
		 </div>
		</div>
	 </div>
</div>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/slider/css/jquery.bxslider.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/slider/js/jquery.bxslider.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.slider').bxSlider({
		auto: true,  // 자동 애니메이션 시작
		speed: 500, // 애니메이션 속도
		pause: 5000,  // 애니메이션 유지시간(단위:ms) 
		mode: 'horizontal', // 기본값. 슬라이드 모드 : 'fade', 'horizontal', 'vertical'
		autoControls: true,  // 시작 및 중지 버튼
		pager: true, // 동그라미(불릿) 버튼 노출 여부
		captions: true,  // 이미지 위에 텍스트 표시
		touchEnabled: false, // <a href="주소"> 에서 설정한 주소로 이동 가능하도록 
		controls: false // 좌우 버튼 노출 여부
	});
});
</script>

