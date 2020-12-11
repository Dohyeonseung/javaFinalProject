<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slick.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
<script type="text/javascript">
$(window).load(function() {
	  $('.flexslider').flexslider({
	    animation: "slide"
	  });
	});

</script>
</head>
<body>
<div class="body-container">
<div class="flexslider">
  <ul class="slides">
	<li><img src="${pageContext.request.contextPath}/resources/img/slider1.jpg" alt="이미지1"></li>
	<li><img src="${pageContext.request.contextPath}/resources/img/slider2.JPG" alt="이미지2"></li>
	<li><img src="${pageContext.request.contextPath}/resources/img/slider3.jpg" alt="이미지3"></li>
	</ul>
</div>

<div class="into">
	<div class="intoSubject">
		<h3>사이트를 소개하기</h3>
	</div>
	<div class="intoContent">
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

<div class="bbs-img">
<div class="main-frame" onclick="#">
	<div class="img-box">
	</div>
	</div>
</div>

</div>
</body>
</html>