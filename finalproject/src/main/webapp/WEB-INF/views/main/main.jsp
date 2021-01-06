<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<style>
.intoSubject{
  background: linear-gradient(to right, #f00, #00f);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    
    font-size: 40px;
}

.title_name{
 background: linear-gradient(to right, #f00, #00f);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}
#bbs-img{
	width:100%;
	display: flex;
	justify-content: center;
	margin-bottom: 120px;
}

.main-frame{
	width: 70%;
	height:390px;
	margin:1%;
	background: none;
	text-align: center;
	display: flex;
}
.img-box{
	width: 100%;
	height : 100%;
	
}

.imgBackbox{
	width:280px;
	height:390px;
	margin: 10px;
	
}


.swiper-container {
	width:80%;
	height:420px;
	margin-top: 20px;
	
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

#box2-1{
		width: 160px;
		height: 70px;
		background-image: url('${pageContext.request.contextPath}/resources/img/titleBackground.jpg');
		background-position: center;
		background-size: cover;
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 30px auto;
}
</style>

<div class="body-container">
        	<div class="photo-gallery">
        		<ul class="slider">
        				<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img/slider_main1.jpg"></a></li>
        				<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img/slider_main2.jpg"></a></li>
        				<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img/slider_main3.jpg"></a></li>
        				<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img/slider_main4.png"></a></li>
        				<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img/slider_main5.jpg"></a></li>
        				<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img/slider3.jpg"></a></li>
        		</ul>
        	</div>

	<div class="intro">
		<div class="intoSubject">
			<h3>HANDMADE</h3>
		</div>
	 <div class="intoContent">
		<div class="intoWritten">
			<span style="font-size: 22px; color: #555; font-weight: bold;"  >DIY란?</span><br><br>
			
			<span style="font-weight: bold; font-size: 16px; font-family:serif;">명사(noun [naun] )</span><br>
			<span>기성품을 사는 대신 재료만 사다가 물건을 자기 손으로 직접 만들거나, 직업적으로 일하는 사람을 시키지 않고 자신이 직접 수리하거나 작업하는 활동. 
			<br>또는, 어떤 상품이 그렇게 할 수 있도록 생산된 상태인 것.</span>
		 	<br>
		 	<br>
		 	<span style="font-size: 20px;">
		 		내가 만드는 것이 곧 <span style="font-size: 21px; text-shadow: -1px 0 #FAE500, 0 1px #FAE500, 1px 0 #FAE500, 0 -1px #FAE500; ">Brand!</span> <br>
		 		손수 만든 제품을 사고 팔수 있다.<br>
		 	        창의적이면서 매매에 관한 다양한 정보를 필요로하는 사람들을 위한 전문매매사이트 <span class="title_name" style="font-size: 19px; font-weight: bold;">핸드메이드</span> 입니다.
		 	</span>
		 
		 </div>
		
		 <div class="linkBtn">
		 	<button type="button" class="btn btn-default">Introduce</button>
		 </div>
		</div>
	 </div>
	 
	 <div class="gifBox" style="width:100%; height:340px; display: flex; justify-content: center; margin-top: 100px; margin-bottom: 50px;">
	 	<img width="340" height="340" src="${pageContext.request.contextPath}/resources/img/diy5.gif">
	 	<img width="540" height="340" src="${pageContext.request.contextPath}/resources/img/diy3.gif">
	 	<img width="340" height="340" src="${pageContext.request.contextPath}/resources/img/diy8.gif">
	 	<img width="340" height="340" src="${pageContext.request.contextPath}/resources/img/diy7.gif">
	 </div>
	 
	 
	 

    <div id="box2-1"><span style="font-size: 20px; font-weight: bold;">인기상품</span></div>
      
      
      <div id="bbs-img">
      
      <!-- foreach -->
      
       <div class="main-frame">
       <div class="imgBackbox" style="width:100%; height: 390px; ">
            <div class="img-box" style="background: url('${pageContext.request.contextPath}/resources/img/나무의자4.JPG');background-position: center;background-size:cover;background-position:center;"></div>
            	<div>
            		<div style="border-bottom: 1px solid #e5e5e5; margin-top: 10px;"></div>
            		<p>이름: 원목 원형 벤딩스툴 3colors</p>
            		<p>가격 : 8000원</p>
            		<p>구분 : 완제품-가구
            	</div>
         </div>
         <div class="imgBackbox" style="width:100%; height: 390px; ">
            <div class="img-box" style="background: url('${pageContext.request.contextPath}/resources/img/디퓨저1.JPG');background-position: center;background-size:cover;background-position:center;"></div>
            	<div>
            		<div style="border-bottom: 1px solid #e5e5e5; margin-top: 10px;"></div>
            		<p>이름: 디퓨저 섬유스틱</p>
            		<p>가격 : 800원</p>
            		<p>구분 : 재료-기타
            	</div>
         </div>   

         <div class="imgBackbox" style="width:100%; height: 390px; ">
            <div class="img-box" style="background: url('${pageContext.request.contextPath}/resources/img/수세미1.JPG');background-position: center;background-size:cover;background-position:center;"></div>
            	<div>
            		<div style="border-bottom: 1px solid #e5e5e5; margin-top: 10px;"></div>
            		<p>이름: 수제 식빵수세미</p>
            		<p>가격 : 2000원</p>
            		<p>구분 : 완제품-생활용품
            	</div>
         </div>   
         <div class="imgBackbox" style="width:100%; height: 390px; ">
            <div class="img-box" style="background: url('${pageContext.request.contextPath}/resources/img/원목1.JPG');background-position: center;background-size:cover;background-position:center;"></div>
            	<div>
            		<div style="border-bottom: 1px solid #e5e5e5; margin-top: 10px;"></div>
            		<p>원목자재</p>
            		<p>가격 : 3000원</p>
            		<p>구분 : 재료-가구
            	</div>
         </div>      
            
               
               
         
         </div>
      <!---->
      </div>
	 
	 
	 		
		 <div id="box2-1"><span style="font-size: 20px; font-weight: bold;">재료구매</span></div>
		<div class="swiper-container">
	<div class="swiper-wrapper">
		<c:forEach var="dto" items="${list1}">
			<div class="swiper-slide"><img alt="" src="${pageContext.request.contextPath}/uploads/ms/${dto.imageFilename}"></div>
			<p>${dto.productName}<p>
			<p>${dto.price}<p>
		</c:forEach>  
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next" style="background-image:url('${pageContext.request.contextPath}/resources/img/slider_right.JPG')"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev" style="background-image:url('${pageContext.request.contextPath}/resources/img/slider_left.JPG')"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>
		
		
		
 <div id="box2-1"><span style="font-size: 20px; font-weight: bold;">예약구매</span></div>
<div class="swiper-container">
	<div class="swiper-wrapper">
		<c:forEach var="dto" items="${list2}">
			<div class="swiper-slide"><img alt="" src="${pageContext.request.contextPath}/uploads/cp/${dto.imageFilename}"></div>
			<p>${dto.productName}<p>
			<p>${dto.price}<p>
		</c:forEach>  
	</div>

	<!-- 네비게이션 -->
	<div class="swiper-button-next" style="background-image:url('${pageContext.request.contextPath}/resources/img/slider_right.JPG')"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	<div class="swiper-button-prev" style="background-image:url('${pageContext.request.contextPath}/resources/img/slider_left.JPG')"></div><!-- 이전 버튼 -->

	<!-- 페이징 -->
	<div class="swiper-pagination"></div>
</div>


	 <div id="box2-1"><span style="font-size: 20px; font-weight: bold;">완제품구매</span></div>
		<div class="swiper-container">
	<div class="swiper-wrapper">
		<c:forEach var="dto" items="${list3}">
			<div class="swiper-slide"><img alt="" src="${pageContext.request.contextPath}/uploads/rv/${dto.imageFilename}"></div>
			<p>${dto.productName}<p>
			<p>${dto.price}<p>
		</c:forEach>  
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

