<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
.footerBox{
 width: 100%;
 height: 470px;
}

.first{
	display: flex;
	justify-content: space-around;
}

.second{
	display: flex;
	justify-content: space-around;
}

.companyNum p{
	height:20px;
}
</style>



<div class="footerBox">

	<div class="first">
		<div class=companyNum style="width:300px; height: 1 ">
			<p style="font-weight: bold;"> 회사번호 </p><br>
			<p style="font-weight: bold; font-size: 20px;">070-4141-6767</p><br>
			<p>OPEN 09:00 ~ CLOSE 18:00 SAT,SUN OFF</p>
		</div>
		<div class="bankInfo">
			<p>BANK INFO</p>
			<p> KB 국민</p><span>000-00-00000</span>
			<p>예금주 : 누군가</p>
		</div>
		<div class="bbs">
			<p>ABOUT US</p>
			<p>AGREEMENT</p>
			<p>PRIVATE POLCY</p>
			<p>GUIDE</p>
		</div>
		
		<div class="community">
			<h3>COMMUNITY</h3>
		  <ul>
			<li class="local">local</li>
			<li class="tip">tip</li>
			<li class="Q&A">Q&A</li>
			<li class="Notice">Notice</li>
	      </ul>
		</div>
		
	</div>
	
	<div class="second">
		<div class="info">
			<p>상호명 : diy</p>
			<p>주소:서울시 강남구 논현동 DIY 빌딩 1004호</p>
			<p>대표:유사장 김사장 도사장 박사장 권사장 / 개인정보관리자:사원모집중</p>
			<p>통신 판매업신고 번호: 제 2017강남 00000호</p>
			<p>메일:ygm2310@naver.com</p>
			<p>호스팅제공:엔에이치엔 고도(주)</p>
			<p>Conpyright (c) MINIMAL All Rights Reserved.</p>
		</div>
		
		<div class="instar">
			<h3>INSTAGRAM  # 미니멀</h3>
			<div class="imgBackBox">
				<img src="${pageContext.request.contextPath}/resources/img/instar1.JPG">
				<img src="${pageContext.request.contextPath}/resources/img/instar2.JPG">
				<img src="${pageContext.request.contextPath}/resources/img/instar3.JPG">
				<img src="${pageContext.request.contextPath}/resources/img/instar4.JPG">
				<img src="${pageContext.request.contextPath}/resources/img/instar5.JPG">
			
			</div>
		</div>
	</div>
	
</div>
