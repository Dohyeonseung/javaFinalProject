<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
.footerBox{
 width: 100%;
 height: 420px;
 background: #1e1e1e;
}

.first{
	margin-left:20px;
	display: flex;
	justify-content: space-around;
	height: 50%;
	width: 80%;
}

.second{
	display:flex;
	justify-content: space-around;
	height: 50%;
	width: 80%;
}

.companyNum{
	margin-top:100px;
	height:50%;
	text-align: left;
}
.bankInfo{
	text-align: left;
	margin-top:100px;
}
.bbs{
 text-align: left;
	margin-top:100px;
}

.community{
    text-align: left;
	margin-top:100px;

}

.info{
 	text-align: left;
 	height: 100%;
	
}
.instar{
	text-align: left;
	height: 100%;
}
</style>



<div class="footerBox">
	<div class="first">
		<div class=companyNum style="color: white;">
			<span style="font-weight: bold;"> 회사번호 </span><br>
			<span style="font-weight: bold; font-size: 30px;">070-4141-6767</span><br>
			<span>OPEN 09:00 ~ CLOSE 18:00 SAT,SUN OFF</span><br>
		</div>
		<div class="bankInfo" style="color: white;">
			<span style="font-size: 20px;">BANK INFO</span><br>
			<span style="font-weight: bold; font-size: 20px;"> KB 국민 : </span><span style="font-weight: bold;  font-size: 20px;">000-00-00000</span><br>
			<span >예금주 : 누군가</span>
		</div>
		<div class="bbs" style="font-size: 17; color: white;">
			<span>ABOUT US</span><br>
			<span>AGREEMENT</span><br>
			<span>PRIVATE POLCY</span><br>
			<span>GUIDE</span>
		</div>
		
		<div class="community" style="color: white;">
			<h3>COMMUNITY</h3>
		  <ul style="list-style: none; font-size: 17px; color: white;">
			<li class="local">local</li>
			<li class="tip">tip</li>
			<li class="Q&A">Q&A</li>
			<li class="Notice">Notice</li>
	      </ul>
		</div>
		
	</div>
	
	<div class="second" style="margin-top: 20px;">
		<div class="info" style="font-size: 17px; color: white;" >
			<p>상호명 : HANDMADE</p>
			<p>주소:서울시 강남구 논현동 DIY 빌딩 1004호</p>
			<p>대표:유사장 김사장 도사장 박사장 권사장 / 개인정보관리자:사원모집중</p>
			<p>통신 판매업신고 번호: 제 2017강남 00000호</p>
			<p>메일:ygm2310@naver.com</p>
			<p>호스팅제공:엔에이치엔 고도(주)</p>
			<p>Conpyright (c) MINIMAL All Rights Reserved.</p>
		</div>
		
		<div class="instar">
			<h3 style="color: #666;"><i class="fab fa-instagram"></i>  INSTAGRAM  # 미니멀</h3>
			<div class="imgBackBox">
				<a href="#" style="text-decoration: none; "> <img src="${pageContext.request.contextPath}/resources/img/instar1.jpg" width="100"
			                   height="100" border="0"></a>
				<a href="#" style="text-decoration: none; "> <img src="${pageContext.request.contextPath}/resources/img/instar2.jpg" width="100"
			                   height="100" border="0"></a>
				<a href="#" style="text-decoration: none;"> <img src="${pageContext.request.contextPath}/resources/img/instar3.jpg" width="100"
			                   height="100" border="0"></a>
				<a href="#" style="text-decoration: none;"> <img src="${pageContext.request.contextPath}/resources/img/instar4.jpg" width="100"
			                   height="100" border="0"></a>
				<a href="#" style="text-decoration: none; "> <img src="${pageContext.request.contextPath}/resources/img/instar5.jpg" width="100"
			                   height="100" border="0"></a>

			</div>
		</div>
	</div>
	
</div>
