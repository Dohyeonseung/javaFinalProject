<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>




<script type="text/javascript">
$(function() {
   $('#menuBox').hover(function() {
      $(".subMenu").show(200);
   }, 
   function() {
      $(".subMenu").hide(200);
   })
});

$(document).ready(function(){
		var $header = $('.header');
		$(window).scroll(function(){
			if($(this).scrollTop()>0){
			$header.addClass('sticky');
			}else{
				$header.removeClass('sticky');
			}
		});
});
</script>
<div id="menuBox">
   <div class="header-top">
       <div class="header-left">
           <p style="margin: 2px;">
               <a href="${pageContext.request.contextPath}/" style="text-decoration: none;">
                   <span id="header_logo">HANDMADE</span>
               </a>
           </p>
       </div>
       
       <div class="search-box">
                  <input type="text" class="search-txt" name=""placeholder="Type to search">
                  <a class="search-btn" href="#">
                      <i class="fas fa-search"></i>
                  </a>
       </div>
       
       <div class="header-toogleBtn">
             <a href="#"><i class="fas fa-bars"></i></a>
       </div>
       <div class="header-right">
           <div style="padding-top: 20px;">
               <c:if test="${empty sessionScope.member}">
                   <a href="${pageContext.request.contextPath}/member/login">Login</a>
                       &nbsp;|&nbsp;
                   <a href="${pageContext.request.contextPath}/member/member">Sign Up</a>
                   
               </c:if>
               <c:if test="${not empty sessionScope.member}">
                   <span style="color:blue;">${sessionScope.member.userName}</span>님
                   &nbsp;|&nbsp;
                   <a href="${pageContext.request.contextPath}/member/logout">로그아웃</a>
                   &nbsp;|&nbsp;
                   <a href="${pageContext.request.contextPath}/">정보수정</a>
                   <c:if test="${not empty sessionScope.member and sessionScope.member.userId!='admin'}">
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <a href="${pageContext.request.contextPath}/buy/orderCheck"><i class="fas fa-user" style="font-size: 32px; "></i></a>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <a href="${pageContext.request.contextPath}/buy/cart"><i class="fas fa-shopping-cart" style="font-size: 32px;"></i></a>
                   </c:if>
                   <c:if test="${sessionScope.member.userId=='admin'}">
                       &nbsp;|&nbsp;
                       <a href="${pageContext.request.contextPath}/admin/home">관리자</a>
                   </c:if>
               </c:if>
           </div>
       </div>
   </div>
   
   <div class="menu">
      <ul class="menu_bar">
            <li><a href="#">Home</a></li>
            <li><a href="#">소개</a></li>
            <li><a href="#">Sell</a></li>
            <li><a href="#">Buy</a></li>
            <li><a href="#">커뮤니티</a> </li>
            <li><a href="${pageContext.request.contextPath}/consumer/main">고객센터</a></li>
      </ul>
      
      <div class="subMenu" style="z-index: 9999; display: none;" >
            <table class="menuTable" style="height: 180px;">
               <tr>
                  <td><a href="${pageContext.request.contextPath}/company/company">회사소개</a></td>
                  <td><a href="${pageContext.request.contextPath}/ms/list">재료 판매</a></td>
                  <td><a href="${pageContext.request.contextPath}/buy/material">재료구매</a></td>
                  <td><a href="${pageContext.request.contextPath}/region/main">지역모임</a></td>
                  <td><a href="${pageContext.request.contextPath}/consumer/myHistory">1:1문의(Q&A)</a></td>
               </tr>
               <tr>
                  <td><a href="#">이용안내</a></td>
                  <td><a href="${pageContext.request.contextPath}/rv/list">예약 판매</a></td>
                  <td><a href="${pageContext.request.contextPath}/buy/rsv">예약 구매</a></td>
                  <td><a href="${pageContext.request.contextPath}/tip/main">DIY Tip</a></td>
                  <td><a href="${pageContext.request.contextPath}/consumer/list">자주하는 질문</a></td>
               </tr>
               <tr>
                  <td><a href="${pageContext.request.contextPath}/company/ethics">윤리규정</a></td>
                  <td><a href="${pageContext.request.contextPath}/cp/list">완제품 판매</a></td>
                  <td><a href="${pageContext.request.contextPath}/buy/complete">완제품구매</a></td>
                  <td><a href="${pageContext.request.contextPath}/qna/list">묻고 답하기</a></td>
                  <td><a href="#"></a></td>
                  
               </tr>
               <tr>
                  <td><a href="#">찾아 오시는길</a></td>
                  <td></td>
                  <td><a href="${pageContext.request.contextPath}/market/list">D-Market</a></td>
                  <td><a href="${pageContext.request.contextPath}/notice/list">공지사항</a></td>
                  <td><a href="#"></a></td>
               </tr>
            </table>
      </div>
   
   </div>
</div>