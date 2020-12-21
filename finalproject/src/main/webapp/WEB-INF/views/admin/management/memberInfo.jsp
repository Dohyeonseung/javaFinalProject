<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
div, body {
	margin: 0;
	padding: 0;
}


#mainContainer {
	width: 100%;
	height: auto;
	overflow: hidden;
}

#contentContainer {
	width: 1280px;
	height: 1980px;
	margin: auto;
}

.table_box {
	width: 100%;
	height: auto;
	margin-top: 150px;
}
.info_title {
	width: 100%;
	height: 50px;
	border-bottom: 1px solid #e5e5e5;
}

.infoTable {
	width: 100%;
	border-collapse: collapse;
	font-family: "맑은 고딕", "맑은 고딕", sans-serif;
	font-size: 18px;
	font-weight: bold;
}
.category_name {
	text-align: center;
	width: 260px;
	height: 100px;
}

.info_value {
	margin: 0;
	padding: 0;
	width: auto;
}

.btn_box {
	margin-top: 100px;
	float: right;
}

.btn_style {
	width: 100px;
	height: 30px;
	border-radius: 0;
	border-top: 0;
	border-bottom: 0;
	border-left: 0;
	border-right: 0;
	font-family: "맑은 고딕", sans-serif;
	font-weight: bold;
}

</style>

<script type="text/javascript">
function ajaxFun(url, method, dataType, query, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status == 403) {
				location.href="${pageContext.request.contextPath}/admin/management/detaile";
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function detailedMember(userId) {
	var dlg = $("#stateChange_btn").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 수정 " : function() {
		    	   updateOk(); 
		       },
		       " 삭제 " : function() {
		    	   deleteOk(userId);
			   },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		       }
		  },
		  height: 520,
		  width: 800,
		  title: "회원상세정보",
		  close: function(event, ui) {
		  }
	});

	var url = "${pageContext.request.contextPath}/admin/management/detaile";
	var query = "userId="+userId;
	
	var fn = function(data){
		$('#member_dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", "html", query, fn);
}
</script>

<div id="mainContainer">
	<div id="contentContainer">
		<div class="table_box">
			<div class="info_title">
				<h2><i class="fas fa-info-circle"></i> 회원정보</h2>
			</div>
			
			<table class="infoTable">
	    	<tr style="border-bottom: 1px solid #cccccc; border-top: 1px solid #101010;">
	    		<th class="category_name">아이디</th>
	    		<td class="info_value">
	    			<span>admin77</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<th class="category_name">이름</th>
	    		<td class="info_value">
					<span>관리자</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">가입일자</th>
	    		<td class="info_value">
					<span>2020-12-16</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">회원분류</th>
	    		<td class="info_value">
					<span>판매자</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">이메일</th>
	    		<td class="info_value">
					<span>admin77@diyLife.com</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">전화번호</th>
	    		<td class="info_value">
					<span>010-7777-7777</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">주소</th>
	    		<td class="info_value">
					<span>경기 성남시 분당구 불정로 6</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #101010;">
	    		<th class="category_name">계정상태</th>
	    		<td class="info_value">
					<span>활성화</span>
	    		</td>
	    	</tr>
	    	</table>
	    	
	    	<div class="table_box">
	    		<div class="info_title">
					<h2><i class="fas fa-sync-alt"></i> 계정상태 변동내역
						<span style="font-size: 12px; float: right; padding-top: 16px;">최대 15건까지 표시됩니다.</span>
					</h2>
				</div>
				
				<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
					  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th width="30" style="color: #787878;">변동날짜</th>
					      <th width="100" style="color: #787878;">사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;유</th>
					      <th width="30" style="color: #787878;">상태</th>
					      <th width="30" style="color: #787878;">정지날짜</th>
					      <th width="30" style="color: #787878;">해제날짜</th>
					  </tr>
					 
					  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
					      <td width="30">2020-12-18</td>
					      <td width="100" style="text-align: left"><a style="color: #1e1e1e;">커뮤니티 게시판 부정 이용</a></td>
					      <td width="30">7일 정지</td>
					      <td width="30">2020-12-18</td>
					      <td width="30">2020-12-25</td>
					  </tr>

				</table>
	    	</div>
	    	
	    	<div class="btn_box">
	    		<form action="">
	    			<button type="button" class="btn_style" id="returnList_btn" style="margin-right: 965px;" onclick="location.href='${pageContext.request.contextPath}/admin/management/list'">리스트</button>
	    			<button type="button" class="btn_style" id="stateChange_btn">상태변경</button>
	    			<button type="button" class="btn_style" id="memberDelete_btn">회원삭제</button>
	    		</form>
	    	</div>
	    	
	    	<div id="member_dialog"></div>
		</div>
	</div>
</div>
