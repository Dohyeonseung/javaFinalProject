<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">
div, body{
	margin: 0;
	padding: 0;
}

h3 {
	margin: 0;
	padding-top: 12.5px;
}

a {
	text-decoration: none;
	color: #FFFDF9;
}

a:hover {
	text-decoration: none;
	color: #1e1e1e;
	font-weight: bold;
}
#mainContainer {
	width: 100%;
	height: auto;
	margin: 0;
	padding: 0;
	overflow: hidden;
}

#title_menu {
	width: 100%;
	height: 50px;
	margin: 0 auto;
	padding: 0;
	background: #4374D9;
	color: #FFFDF9;
	font-family: "맑은 고딕", "나눔 고딕", sans-serif;
	border-bottom: 1px solid #4374D9;
}

#category_menu {
	width: 100%;
	height: 40px;
	margin: 0 auto;
	background: #FFFDF9;
	font-family: "맑은 고딕", "나눔 고딕", sans-serif;
}

ul {
	padding-inline-start: 0;
}

ul.nav {
  width:100%;
  margin: 0;
  padding: 0;
  list-style: none;
}

ul.nav li { 
  display: inline;
}

ul.nav li a {
  float: left;
  line-height: 40px;
  color: #555;
  text-decoration: none;
  margin: 0;
  padding: 0 30px;
}

ul.nav .current a, ul.nav li:hover > a {
  color: #333;
  font-weight : 900;
  text-decoration: none;
  background: #e9e9e9;
}

ul.nav ul {
  display: none;
}

ul.nav li:hover > ul {
  position: absolute;
  display: block;
  left: 416px;
  width: auto;
  height: 40px;
  margin: 40px 0 0 0;
  background: #e9e9e9;
  border: 1px solid #e9e9e9;
  z-index: 101;
  box-sizing: border-box;
}

ul.nav li:hover > ul li a {
  float: right;
  line-height: 39px;
  color: #333;
  text-decoration: none;
  margin: 0;
  padding: 0 20px 0 20px;
  background: #e9e9e9;
}

ul.nav li:hover > ul li a:hover {
  color: #333;
  text-decoration: none;
}

ul.nav li.active{
	font-weight: 700;
	border: 1px solid #dddddd;
	border-bottom-color:  transparent;
}
</style>
<script type="text/javascript">
//엔터 처리
$(function(){
	   $("input").not($(":button")).keypress(function (evt) {
	        if (evt.keyCode == 13) {
	            var fields = $(this).parents('form,body').find('button,input,textarea,select');
	            var index = fields.index(this);
	            if ( index > -1 && ( index + 1 ) < fields.length ) {
	                fields.eq( index + 1 ).focus();
	            }
	            return false;
	        }
	     });
});
</script>
<div id="mainContainer">
	<div id="title_menu">
		<h3>
			<a href="${pageContext.request.contextPath}/admin/home" style="border-right: 2px solid #FFFDF9; padding: 0 10px 0 20px;"><i class="fas fa-cog" style="color: #FFFDF9"></i> DIY Admin</a>
			<span style="padding: 0 0 0 10px;">관리</span>
			<span style="float: right; padding: 0 25px 0 0;">어서오세요 <strong style="color: #1e1e1e;">${sessionScope.member.userName}</strong>님
			<a href="${pageContext.request.contextPath}/admin/logout" style="padding: 0 25px 0 50px;">로그아웃</a>
			<a href="${pageContext.request.contextPath}" style="padding: 0 25px 0 25px;">DIY홈</a>
			</span>
		</h3>
	</div>
	<div id="category_menu">
		<ul class="nav">
			<li> <a href="${pageContext.request.contextPath}/admin/home" style="padding: 0 20px 0 20px;">관리홈</a> </li>
			<li> <a href="${pageContext.request.contextPath}/admin/management/list" style="padding: 0 20px 0 20px;">회원관리</a> </li>
			<li> <a href="${pageContext.request.contextPath}/admin/authority/list" style="padding: 0 20px 0 20px;">권한승인</a> </li>
			<li> <a href="${pageContext.request.contextPath}/admin/bbsManagement/deck" style="padding: 0 20px 0 20px;">게시판관리</a> </li>
			<li> <a href="${pageContext.request.contextPath}/admin/adminSales/saleshome">판매관리</a>
				<ul>
					<li> <a href="${pageContext.request.contextPath}/admin/adminSales/productlist">상품관리</a> </li>
					<li> <a href="${pageContext.request.contextPath}/admin/adminSales/chart">판매통계</a> </li>
				</ul>
			</li>
		</ul>
	</div>
</div>
