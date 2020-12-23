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

// 상태변경
function detailedMember(userId) {
	var dlg = $("#member_dialog").dialog({
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

function updateOk() {
	var f = document.deteailedMemberForm;
	
	if(! f.stateCode.value) {
		f.stateCode.focus();
		return;
	}
	if(! $.trim(f.memo.value)) {
		f.memo.focus();
		return;
	}
	
	var url = "${pageContext.request.contextPath}/admin/management/updateMemberState";
	var query=$("#deteailedMemberForm").serialize();

	var fn = function(data){
		$("form input[name=page]").val("${page}");
	};
	ajaxFun(url, "post", "html", query, fn);
		
	$('#member_dialog').dialog("close");
	
}

function deleteOk(userId) {
	if(confirm("선택한 계정을 삭제 하시겠습니까 ?")) {
			
	}
	
	$('#member_dialog').dialog("close");
}

// 상태변동기록


function selectStateChange() {
	var f = document.deteailedMemberForm;
	
	var s = f.stateCode.value;
	var txt = f.stateCode.options[f.stateCode.selectedIndex].text;
	
	f.memo.value = "";	
	if(! s) {
		return;
	}

	if(s!="0" && s!="6") {
		f.memo.value = txt;
	}
	
	f.memo.focus();
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
	    			<span>${dto.userId}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<th class="category_name">이름</th>
	    		<td class="info_value">
					<span>${dto.userName}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">가입일자</th>
	    		<td class="info_value">
					<span>${dto.created_date}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">회원분류</th>
	    		<td class="info_value">
					<span>${dto.memberCategory==1?"일반회원":"판매자"}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">이메일</th>
	    		<td class="info_value">
					<span>${dto.email}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">전화번호</th>
	    		<td class="info_value">
					<span>${dto.tel}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
	    		<th class="category_name">주소</th>
	    		<td class="info_value">
					<span>${dto.addr1}${dto.addr2}</span>
	    		</td>
	    	</tr>
	    	
	    	<tr style="border-top: 1px solid #cccccc; border-bottom: 1px solid #101010;">
	    		<th class="category_name">계정상태</th>
	    		<td class="info_value">
					<span>${dto.enabled==1?"활성화":"비활성화"}</span>
	    		</td>
	    	</tr>
	    	</table>
	    	
	    	<div class="table_box" id="memberStateDetaile">
	    		<div class="info_title">
					<h2><i class="fas fa-sync-alt"></i> 계정상태 변동내역
						<span style="font-size: 12px; float: right; padding-top: 16px;">최대 10건까지 표시됩니다.</span>
					</h2>
				</div>
				
				<table style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse;">
					  <tr align="center" bgcolor="#eeeeee" height="35" style="border-top: 2px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
					      <th width="30" style="color: #787878;">변동날짜</th>
					      <th width="30" style="color: #787878;">아이디</th>
					      <th width="30" style="color: #787878;">관리자명</th>
					      <th width="100" style="color: #787878;">사&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;유</th>
					  </tr>
					 
					 <c:forEach var="vo" items="${listState}">
					  <tr align="center" bgcolor="#ffffff" height="35" style="border-bottom: 1px solid #cccccc;"> 
					      <td width="30">${vo.registration_date}</td>
					      <td width="30">${vo.userId}</td>
					      <td width="30">${vo.registerId}</td>
					      <td width="100" style="text-align: center"><a style="color: #1e1e1e;">${vo.memo}</a></td>
					  </tr>
					 </c:forEach>
					 
					 <c:if test="${listState.size()==0}">
					  	<tr height="30" align="center" bgcolor="#ffffff">
					  		<td colspan="4">등록된 정보가 없습니다.</td>
						</tr>  
					 </c:if>
					 
				</table>
	    	</div>
	    	
	    	<div class="btn_box">
	    		<form action="">
	    			<button type="button" class="btn_style" id="returnList_btn" style="margin-right: 1070px;" onclick="location.href='${pageContext.request.contextPath}/admin/management/list'">리스트</button>
	    			<button type="button" class="btn_style" id="stateChange_btn" onclick="detailedMember('${dto.userId}');">상태변경</button>
	    		</form>
	    	</div>
	    	
		</div>
	</div>
</div>

<div id="member_dialog" style="display: none;">
	    	
</div>
