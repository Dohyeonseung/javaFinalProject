<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<style>

#bbs-img{
	width:100%;
	display: flex;
	justify-content: center;
}

.main-frame{
	width: 70%;
	height:390px;
	margin:2.5%;
	background: none;
	text-align: center;
	display: flex;
}
.img-box{
	width: 100%;
	height : 100%;
	margin: 0 10px;
}


.swiper-container {
	width:80%;
	height:420px;
	margin-top: 70px;
	
	}
.swiper-slide {
	border:none;
	text-align:center;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}
.swiper-slide img {
	max-width:80%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
}



</style>

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
	 <p style="font-size: 18px; text-align: center;">새상품</p>
		<div id="bbs-img">
		
		<!-- foreach -->
		
		 <div class="main-frame">
				<div class="img-box" style="background: url('${pageContext.request.contextPath}/resources/img/bag.JPG');background-position: center;background-size:cover;background-position:center;"></div>
				<div class="img-box" style="background: url('${pageContext.request.contextPath}/resources/img/bag.JPG');background-position: center;background-size:cover;background-position:center;"></div>
				<div class="img-box" style="background: url('${pageContext.request.contextPath}/resources/img/bag.JPG');background-position: center;background-size:cover;background-position:center;"></div>	
				<div class="img-box" style="background: url('${pageContext.request.contextPath}/resources/img/bag.JPG');background-position: center;background-size:cover;background-position:center;"></div>	
				<p class="title-style">상품이름 </p>
			</div>
		<!---->
		</div>
		
		<div style="text-align:center; font-size: 18px; margin:100px;">신상품</div>
		<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/bag.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/bag.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/bag.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/bag.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/bag.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/bag.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/bag.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/bag.JPG"></div>
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next" style="background-image:url('${pageContext.request.contextPath}/resources/img/slider_right.JPG')"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev" style="background-image:url('${pageContext.request.contextPath}/resources/img/slider_left.JPG')"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>
		
		
		
		
		<div style="text-align:center; font-size: 18px; margin-top: 100px;">인기 상품</div>
		<div class="swiper-container">
	<div class="swiper-wrapper">
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/goodoo.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/goodoo.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/goodoo.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/goodoo.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/goodoo.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/goodoo.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/goodoo.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/goodoo.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/goodoo.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/goodoo.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/goodoo.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/goodoo.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/goodoo.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/goodoo.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/goodoo.JPG"></div>
		<div class="swiper-slide"><img src="${pageContext.request.contextPath}/resources/img/goodoo.JPG"></div>
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next" style="background-image:url('${pageContext.request.contextPath}/resources/img/slider_right.JPG')"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev" style="background-image:url('${pageContext.request.contextPath}/resources/img/slider_left.JPG')"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>

		
</div>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/slider/css/jquery.bxslider.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/slider/js/jquery.bxslider.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

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

new Swiper('.swiper-container', {

	slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 0, // 슬라이드간 간격
	slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});
</script>

