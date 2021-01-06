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


@media screen and (max-width: 786px){
.thumbnail_main {
		height: 500px;
	}
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/slider/css/jquery.bxslider.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/slider/js/jquery.bxslider.min.js"></script>

<script type="text/javascript">
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
	
	var url="${pageContext.request.contextPath}/selltab/information/"+tab;
	var query="pageNo="+page+"&productNum=${dto.productNum}"; 
	var selector = "#tab-content";
	
	ajaxHTML(url, "get", query, selector); 
}

$(function(){
		$("body").on("click", ".btnReplyAnswerLayout", function(){
			var $trReplyAnswer = $(this).closest("tr").next();
			
			var isVisible = $trReplyAnswer.is(':visible');
			// var num = $(this).attr("data-num");
				
			if(isVisible) {
				$trReplyAnswer.hide();
			} else {
				$trReplyAnswer.show();
			}
		});
});

//댓글별 답글 등록
$(function(){
	$("body").on("click", ".btnSendReplyAnswer", function(){
		var num=$(this).attr("data-num");
		var $td=$(this).closest("td");
		var $tr=$(this).closest("tr");
		
		var answer=$td.find("textarea").val().trim();
		if(! answer) {
			$td.find("textarea").focus();
			return false;
		}
		answer = encodeURIComponent(answer);
		
		var url="${pageContext.request.contextPath}/selltab/information/answerQna";
		var query="num="+num+"&answer="+answer;
		
		var fn = function(data){
			$td.find("textarea").val("");
			
			var state=data.state;
			if(state==="true") {
				listPage(1);
			}
		};
		
		ajaxJSON(url, "post", query, fn);
		
	});
});

// 댓글별 답글 삭제
$(function(){
	$("body").on("click", ".deleteReplyAnswer", function(){
		if(! confirm("답변을 삭제하시겠습니까 ? ")) {
		    return false;
		}
		
		var num=$(this).attr("data-num");
		var url="${pageContext.request.contextPath}/selltab/information/answerQna";
		var query="num="+num+"&answer=";
		
		var fn = function(data){
			listPage(1);
		};
		
		ajaxJSON(url, "post", query, fn);
	});
});


$(function(){
	var tid=null;
	var strDate = "${dto.countDate}";
	if(strDate=="") {
		return false;		
	}
	
	diffDayTime(strDate);
	tid = setInterval(function(){
		diffDayTime(strDate);
	}, 1000*60)

	function diffDayTime(strDate) {
	    var sy = parseInt(strDate.substr(0, 4));
	    var sm = parseInt(strDate.substr(5, 2));
	    var sd = parseInt(strDate.substr(8, 2));

	    var date1=new Date();
	    var date2=new Date(sy, sm-1, sd, 24, 0, 0, 0);
	    
	    var sn=date1.getTime();
	    var en=date2.getTime();
	    var count=Math.floor((en-sn)/1000);
	    if(count<=0 && tid!=null) {
	    	clearInterval(tid);
	    	tid=null;
	    }
	    
	    var d=Math.floor(count/(24*3600));
	    var h=Math.floor((count/3600)%24);
	    var m=Math.floor((count/60)%60);
	    // var s=count%60;
	  
	    var str = d + "일 " + h +"시간 " + m + "분 남음"
	    $("#countDateLayout").html(str);
	}
});




</script>

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
			<p>판매시간: <span id="countDateLayout"></span><p>
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
		<div style="width: 100%; height: 15px; background: #f4f4f4;" ></div>
		
		<span id="toc-toggle" onclick="openCloseToc()"><i class="far fa-hand-point-up"></i> &nbsp; 상품상세 원본보기</span>
		<div id="toc-content" style=" margin-top: 20px; display:block;">${dto.content}</div>
	</div>	          

</div>

<script type="text/javascript">
$(function(){
	$('.slider').bxSlider({
		auto: false,  // 자동 애니메이션 시작
		speed: 500, // 애니메이션 속도
		pause: 5000,  // 애니메이션 유지시간(단위:ms) 
		mode: 'horizontal', // 기본값. 슬라이드 모드 : 'fade', 'horizontal', 'vertical'
		autoControls: false,  // 시작 및 중지 버튼
		pager: false, // 동그라미(불릿) 버튼 노출 여부
		captions: true,  // 이미지 위에 텍스트 표시
		touchEnabled: true // <a href="주소"> 에서 설정한 주소로 이동 가능하도록 
	});
});
</script>