<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">

#msellBody{
	width:100%;
	height:100%;
	display: flex;
	justify-content: center;
}

#materialSell_AT {
	width: 970px;
	height: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

ul li {
	list-style: none;
}

img {
 max-width: 100%; 
 height: auto; 
}

.thumbnail {
	width: 70%;
	height: 80%;
	float: left;
	max-width: 960px;
}

.thumbnail_main {
	border: 1px solid #e4e4e4;
	background: #3e3e3e;
	margin: auto;
	width: 100%; 
	height: 600px;
	overflow: hidden;
}

.iteminfo {
	width: 500px;
	height: 100px;
	position: relative;
	
}

.reviewLink{
	width: 100%;
	height: 2px;
	text-align: center;
	margin-top: 30px;
	position: relative;
}

.reviewLink a{
	 color: #4684e9;
	 text-decoration: none;
}
.iteminfo{
	font-size: 20px;
	text-align: center;
	font-weight: bold;
	margin-top: 25px;
}
.priceBtn{
	color: #000;
	width: 100px;
	height: 45px;
	border: none;
    border-radius: 30px 30px 30px 30px;
}
.likeBox{
	height:56px;
	width: 100%; 
	display: flex;
	justify-content: space-around;
	
	border-width:1px 0px 1px 0px;
  	border-color:#e5e5e5;
  	border-style:solid;
}

.likeBox button{
	border: none;
	font-size: 20px;
	background: white;
	color: #333;
	width: 100%;
	height: 51px;
}


@media screen and (max-width: 786px){
.thumbnail_main {
		height: 500px;
	}
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">

<script type="text/javascript">
$(function(){
	var menu = "${menuItem}"; 
	$("#tab-"+menu).addClass("active");

	listPage(1);
	
	$("ul.tabs li").click(function() {
		tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function(){ 
			$(this).removeClass("active"); 
		});
		
		$("#tab-"+tab).addClass("active"); 
		
		listPage(1);
	});
});

function login() {
	location.href="${pageContext.request.contextPath}/member/login";
}

function ajaxHTML(url, method, query, selector) {
	$.ajax({
		type:method
		,url:url
		,data:query
		,success:function(data) {
			$(selector).html(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status===403) {
	    		login();
	    		return false;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

function ajaxJSON(url, method, query, fn) { 
	$.ajax({
		type:method
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			fn(data);
		}
		,beforeSend:function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status===403) {
	    		login();
	    		return false;
	    	}
	    	
	    	console.log(jqXHR.responseText);
	    }
	});
}

function listPage(page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	
	var url="${pageContext.request.contextPath}/selltab/information/"+tab;
	var query="pageNo="+page+"&productNum=${dto.productNum}"; 
	var selector = "#tab-content";
	
	ajaxHTML(url, "get", query, selector); 
}

</script>

<body>

	
<div id="msellBody">
	
<div id="materialSell_AT">
		<div class="thumbnail">
			<div class="thumbnail_main">
				<img alt="" src="${pageContext.request.contextPath}/uploads/ms/${dto.imageFilename}">
			</div>
		</div>
		
		<div class="reviewLink"><a href="#">★★★★ 리뷰96건</a></div>
	
		<div class="iteminfo">
			${dto.productName}
			<div style="margin-top: 16px;">
				<button type="button" style="background-color: #1e1e1e; color: white;" class="priceBtn" onclick="">${dto.price}원</button>
				<button type="button" style="background-color: #ffeb00;" class="priceBtn" onclick="">${dto.price}원</button>
			</div>
		</div>
		
		<div class="likeBox">
			<button type="button" onclick=""><span style="font-size: 18px">♡ </span>찜</button>
			<button type="button" onclick="">공유</button>
		</div>
		<div style="width: 100%; height: 15px; background: #f4f4f4;" ></div>

		<div style="clear: both; width: 100%;">
	        <div style="clear: both;">
	          	<ul class="tabs">
			       <li id="tab-main" data-tab="main">정보</li>
			       <li id="tab-review" data-tab="review">리뷰</li>
			       <li id="tab-qna" data-tab="qna">질문답변</li>
		   		</ul>
	   		</div>
	   		<div id="tab-content" style="clear:both; padding: 20px 10px 0px;"></div>
		</div>
</div>

</div>
</body>
</html>