<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bxslider/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bxslider/js/jquery.bxslider.min.js"></script>

<script type="text/javascript">
// 장바구니
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
	alert("상품을 장바구니에 담았습니다.");
}

// 구매
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
			var starScore = $("input[name=starScore]").val()
			var content=$tb.find("textarea").val().trim();
			if(! content) {
				$tb.find("textarea").focus();
				return false;
			}
			
			content = encodeURIComponent(content);
			
			var url="${pageContext.request.contextPath}/buytab/information/insertReview";
			var query="productNum="+productNum+"&content="+content+"&starScore="+starScore+"&answer=0";
			
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


// 작은 이미지 hover시 큰 이미지 변경
$(function (str) {
	$(".image-list").click(function () {
		var image = jQuery(this).attr("src");
		$("#thumbnail_in").attr("src", image);
		$(".image-list").css("border", 'none');
		$(this).css("border", '1px solid black');
		
	})
})

$(function(){
	Number.prototype.format = function(){
	    if(this==0) return 0;

	    var reg = /(^[+-]?\d+)(\d{3})/;
	    var n = (this + '');

	    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

	    return n;
	};

	// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
	String.prototype.format = function(){
	    var num = parseFloat(this);
	    if( isNaN(num) ) return "0";

	    return num.format();
	};
	
	jQuery('.format-money').text(function() {
	    jQuery(this).text(
	        jQuery(this).text().format()
	    );
	});
});

$(function() {
	  $(".plus").click(function(){
		   var num = $(this).parent().find("input").val();
		   var plusNum = Number(num) + 1;
		   
		   if(plusNum >= 99) {
			   $(this).parent().find("input").val(num);
		   } else {
			   $(this).parent().find("input").val(plusNum);          
		   }
	  });
		  
	  $(".minus").click(function(){
		   var num = $(this).parent().find("input").val();
		   var minusNum = Number(num) - 1;
		   
		   if(minusNum <= 0) {
			   $(this).parent().find("input").val(num);
		   } else {
			   $(this).parent().find("input").val(minusNum);          
		   }
	  });
})

$(document).on("click", ".star a", function() {

         var b= $(this).hasClass("on"); //해당되는 클래스가 존재한지 존재하지 않는지 on이존재하면 true/x-false
         $(this).parent().children("a").removeClass("on");
         $(this).addClass("on").prevAll("a").addClass("on"); //prevAll이전에 있는 모든것

         $(this).css("color", '#e9be0f');
         $(this).prevAll("a").css("color", '#e9be0f');

         if(b){
             $(this).removeClass("on");//on이 존재하면 on을 없애라
             $(this).css("color", '');
             $(this).nextAll("a").css("color", '');
         }

         var s=$(".star .on").length;//별의 갯수

         $("input[name=starScore]").val(s);
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
	margin: auto;
	width: 680px; 
	height: 500px;
	overflow: hidden;
	display: flex;
	justify-content: space-between;
}

.thumbnail_in {
	width: 500px;
	height: 600px;
}

.thumbnail_in img {
	width: 500px;
	height: 500px;
}

.image_list {
	width: 180px;
	height: 500px;
	overflow: auto;
	direction: rtl;
}

.image_list img {
	width: 130px;
	height: 130px;
}

.image_list li {
	margin: 25px;
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
<form name="orderForm" method="post">
			<div style="text-align: center;">
				<p style="margin: 20px 0px; font-size: 28px;">${dto.userName}<p>
				<input type="hidden" name="productNum" value="${dto.productNum}">
				<input type="hidden" name="seller" value="${dto.userName}">
				<input type="hidden" name="page" value="${page}">
			</div>
	<div id="msellBody">
		<div id="materialSell_AT">
			<div class="thumbnail">
			
				<div class="thumbnail_main">
	        			<div class="image_list">
	        				<ul>
	        					<li><img src="${pageContext.request.contextPath}/uploads/ms/${dto.imageFilename}" class="image-list"></li>
			        			<c:forEach var="vo" items="${listImage}">
			        					<li><img src="${vo}" class="image-list"></li>
			        		    </c:forEach>
			        		</ul>
	        			</div>
	        			<div class="thumbnail_in">
	        				<img src="${pageContext.request.contextPath}/uploads/ms/${dto.imageFilename}" id="thumbnail_in">
	        			</div>
	        	</div>
			</div>
			
			<div class="reviewLink"><a href="#">★★★★ 리뷰96건</a></div>
		
			<div class="iteminfo">
				${dto.productName}
				<input type="hidden" name="cName" value="${dto.productName}">
				<div style="margin-top: 16px;">
					<button type="button" style="background-color: #1e1e1e; color: white; border: none; outline: none;" class="priceBtn" onclick="">적립금<br><span class="format-money"> ${dto.reserves} </span>원</button>
					<button type="button" style="background-color: #ffeb00; border: none; outline: none;" class="priceBtn" onclick="">가격<br><span class="format-money"> ${dto.price} </span>원</button>
				</div>
			</div>
						<div class="info_content" style="margin-bottom: 40px;">
							수량
						<button type="button" class="minus" style="width: 20px; height: 20px; background: white; border: 1px solid #a6a6a6; margin-left: 30px;">-</button>
							<input type="text" id="count" name="count" style="width: 30px; height: 18px; text-align: center; border: 1px solid #a6a6a6;">
						<button type="button" class="plus" style="width: 20px; height: 20px; background: white; border: 1px solid #a6a6a6;">+</button>
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
</form>
