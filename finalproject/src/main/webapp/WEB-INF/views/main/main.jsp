<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="body-container">
<div class="sp-slideshow">
			
	<input id="button-1" type="radio" name="radio-set" class="sp-selector-1" checked="checked" />
	<label for="button-1" class="button-label-1"></label>
	
	<input id="button-2" type="radio" name="radio-set" class="sp-selector-2" />
	<label for="button-2" class="button-label-2"></label>
	
	<input id="button-3" type="radio" name="radio-set" class="sp-selector-3" />
	<label for="button-3" class="button-label-3"></label>
	
	<input id="button-4" type="radio" name="radio-set" class="sp-selector-4" />
	<label for="button-4" class="button-label-4"></label>
	
	<input id="button-5" type="radio" name="radio-set" class="sp-selector-5" />
	<label for="button-5" class="button-label-5"></label>
	
	<label for="button-1" class="sp-arrow sp-a1"></label>
	<label for="button-2" class="sp-arrow sp-a2"></label>
	<label for="button-3" class="sp-arrow sp-a3"></label>
	<label for="button-4" class="sp-arrow sp-a4"></label>
	<label for="button-5" class="sp-arrow sp-a5"></label>
	
	<div class="sp-content">
		<div class="sp-parallax-bg"></div>
		<ul class="sp-slider clearfix">
			<li><img src="${pageContext.request.contextPath}/resources/img/slider1.jpg" alt="이미지1"></li>
			<li><img src="${pageContext.request.contextPath}/resources/img/slider2.JPG" alt="이미지2"></li>
			<li><img src="${pageContext.request.contextPath}/resources/img/slider3.jpg" alt="이미지3"></li>
		</ul>
	</div><!-- sp-content -->

</div>
<div class="into">
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
