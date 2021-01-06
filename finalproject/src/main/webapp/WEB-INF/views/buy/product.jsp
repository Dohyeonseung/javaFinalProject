<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bxslider/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bxslider/js/jquery.bxslider.min.js"></script>

<script type="text/javascript">
function cartSubmit() {
	var f=document.orderForm;

	var str = f.count.value;
    if(!str) {
        alert("수량을 입력하세요.");
        f.count.focus();
        return;
    }
	
	f.action="${pageContext.request.contextPath}/buy/addcart";

	f.submit();
	
}


function orderSubmit(productNum) {
	
	var f=document.orderForm;

	var str = f.count.value;
    if(!str) {
        alert("수량을 입력하세요.");
        f.count.focus();
        return;
    }
    
	var count;
	count = $('#count').val();
	var url="orderForm?productNum="+productNum+"&count="+count;
	location.href=url;
}

function openCloseToc() {
	  if(document.getElementById('toc-content').style.display === 'block') {
	    document.getElementById('toc-content').style.display = 'none';
	  } else {
	    document.getElementById('toc-content').style.display = 'block';
	  }
}


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
		
		var url="${pageContext.request.contextPath}/buytab/information/"+tab;
		var query="pageNo="+page+"&productNum=${dto.productNum}"; 
		var selector = "#tab-content";
		
		ajaxHTML(url, "get", query, selector); 
}

// 리뷰 등록
$(function(){
	$("body").on("click", ".btnSendReply", function(){
			var productNum="${dto.productNum}";
			var $tb = $(this).closest("table");
			var content=$tb.find("textarea").val().trim();
			if(! content) {
				$tb.find("textarea").focus();
				return false;
			}
			content = encodeURIComponent(content);
			
			var url="${pageContext.request.contextPath}/buytab/information/insertReview";
			var query="productNum="+productNum+"&content="+content+"&answer=0";
			
			var fn = function(data){
				$tb.find("textarea").val("");
				
				var state=data.state;
				if(state==="true") {
					listPage(1);
				} else if(state==="false") {
					alert("리뷰를 추가 하지 못했습니다.");
				}
			};
			
			ajaxJSON(url, "post", query, fn);
		});
});

//qna 등록
$(function(){
	$("body").on("click", ".btnSendQna", function(){	
			var productNum="${dto.productNum}";
			var $tb = $(this).parent().parent().find("textarea");
			var content=$tb.val().trim();
			if(! content) {
				$tb.focus();
				return false;
			}
			content = encodeURIComponent(content);
			
			var url="${pageContext.request.contextPath}/buytab/information/questionsQna";
			var query="productNum="+productNum+"&question="+content;
			
			var fn = function(data){
				$tb.val("");
				
				var state=data.state;
				if(state==="true") {
					listPage(1);
				} else if(state==="false") {
					alert("질문을 추가 하지 못했습니다.");
				}
			};
			
			ajaxJSON(url, "post", query, fn);
		});
});



$(function(){
		 $(".star a").click(function(){
			 var b= $(this).hasClass("on"); //해당되는 클래스가 존재한지 존재하지 않는지 on이존재하면 true/x-false
			 $(this).parent().children("a").removeClass("on");
			 $(this).addClass("on").prevAll("a").addClass("on"); //prevAll이전에 있는 모든것
			 if(b){
				 $(this).removeClass("on");//on이 존재하면 on을 없애라
			 }
			 var s=$(".star .on").length;//별의 갯수
			 $("input[name=score]").val(s);
		 });
});

</script>

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

.slider li img {
	height: 600px;
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
#toc-toggle{
margin-top:20px; 
width: 96%; 
height: 45px;
 border-radius: 5px 5px 5px 5px; 
 background: #fafafa; 
 font-size: 16px; 
 display: flex; 
 justify-content: center; 
align-items: center; 
cursor: pointer;
}




</style>


<div id="msellBody">
	
<div id="materialSell_AT">
		<div class="thumbnail">
		<!--
			<div class="thumbnail_main">
				<img alt="" src="${pageContext.request.contextPath}/uploads/ms/${dto.imageFilename}">
			</div>
			  -->
			<div class="thumbnail_main">
        		<ul class="slider">
        		    <c:forEach var="vo" items="${listImage}">
        				<li><a href="#"><img src="${vo}"></a></li>
        		    </c:forEach>
        		    <c:if test="${listImage.size()==0}">
        				<li><a href="#"><img src="${pageContext.request.contextPath}/resources/img/no-image.png">
        					<p>${dto.countDate}</p>
        				</a></li>
        		    </c:if>
        		</ul>
        	</div>
		</div>
		
		<div>
			<p>판매자:${dto.userName}<p>
		</div>
		<div class="reviewLink"><a href="#">★★★★ 리뷰96건</a></div>
	
		<div class="iteminfo">
			${dto.productName}
			<div style="margin-top: 16px;">
				<button type="button" style="background-color: #1e1e1e; color: white;" class="priceBtn" onclick="">${dto.reserves}원</button>
				<button type="button" style="background-color: #ffeb00;" class="priceBtn" onclick="">${dto.price}원</button>
			</div>
		</div>
					<div class="info_content" style="margin-bottom: 40px;">
					수량	<input type="number" id="count" name="count">
					</div>
	
		
		<div class="likeBox">
			
			<button type="button" class="cart" onclick="javascript:location.href='${pageContext.request.contextPath}';"><span style="font-size: 18px">♡ </span>찜</button>
			<button type="button" class="cart" onclick="cartSubmit()">장바구니</button>
			<button type="button" class="purchase" onclick="javascript:orderSubmit('${dto.productNum}');">구매하기</button>
		</div>
		<div style="width: 100%; height: 15px; background: #f4f4f4;" ></div>

		<div style="clear: both; width: 100%;">
	        <div style="clear: both;">
	          	<ul class="tabs">
			       <li id="tab-main" data-tab="main">상세정보</li>
			       <li id="tab-review" data-tab="review">리뷰</li>
			       <li id="tab-qna" data-tab="qna">질문답변</li>
		   		</ul>
	   		</div>
	   		<div id="tab-content" style="clear:both; padding: 20px 10px 0px;"></div>
		</div>
		<div style="width: 100%; height: 15px; background: #f4f4f4;" ></div>
		
		<span id="toc-toggle" onclick="openCloseToc()"><i class="far fa-hand-point-up"></i> &nbsp; 상품상세 원본보기</span>
		<div id="toc-content" style=" margin-top: 20px; display: block;">${dto.content}</div>
	</div>	          

</div>
