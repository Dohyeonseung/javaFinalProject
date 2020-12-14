<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="header-top">
    <div class="header-left">
        <p style="margin: 2px;">
            <a href="${pageContext.request.contextPath}/" style="text-decoration: none;">
                <span id="header_logo">SPRING</span>
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
                <a href="${pageContext.request.contextPath}/">로그아웃</a>
                &nbsp;|&nbsp;
                <a href="${pageContext.request.contextPath}/">정보수정</a>
                
                <c:if test="${sessionScope.member.userId=='admin'}">
                    &nbsp;|&nbsp;
                    <a href="${pageContext.request.contextPath}/admin">관리자</a>
                </c:if>
            </c:if>
        </div>
    </div>
</div>

<div class="menu">
    <ul class="nav">
       <li>
            <a href="#">Home</a>
        </li>
    
        <li>
            <a href="#">소개</a>
            <ul>
                <li><a href="${pageContext.request.contextPath}/company/company">회사소개</a></li>
                <li><a href="#">이용안내</a></li>
                <li><a href="${pageContext.request.contextPath}/company/ethics">윤리규정</a></li>
                <li><a href="#">찾아 오시는길</a></li>
            </ul>
        </li>
         
        <li>
            <a href="#">Sell</a>
            <ul>
                <li><a href="#">재료 판매</a></li>
                <li><a href="#">예약 판매</a></li>
                <li><a href="#">완제품 판매</a></li>
            </ul>
        </li>

        
        <li>
            <a href="#">Buy</a>
            <ul>
                <li><a href="#">재료구매</a></li>
                <li><a href="#">예약 구매</a></li>
                <li><a href="#">완제품구매</a></li>
            </ul>
        </li>
        
        <li>
            <a href="#">커뮤니티</a>
          <ul>
           <li><a href="#">지역모임</a></li>
           <li><a href="#">DIY Tip</a></li>
           <li><a href="#">묻고 답하기</a></li>
           <li><a href="#">공지사항</a></li>
        </ul>
        </li>
        
        <li>
            <a href="#">고객센터</a>
           <ul>
         <li><a href="#">1:1문의(Q&A)</a></li>
           <li><a href="#">자주하는 질문</a></li>
           <li><a href="#">실시간 채팅</a></li>
           <li><a href="#">판매자 서비스</a></li>
        </ul>
        </li>  
       </ul>
</div>