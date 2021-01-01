<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.lbl {
   position:absolute; 
   margin-left:15px; margin-top: 17px;
   color: #999999; font-size: 11pt;
}
.loginTF {
  width: 287px; height: 47px;
  border:none;
  border-bottom:2px solid #ccc;
  color:#1e1e1e;
  font-size:14px;
  
}

.loginTF:focus {
	border-bottom:2px solid #4c4c4c;
}


  .idContent{
  
	display: flex;
	justify-content: center;
	width: 100%;
	line-height: 60px;
}


.checks {position: relative;}
 .checks input[type="checkbox"] { /* 실제 체크박스는 화면에서 숨김 */ position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0 } 
 .checks input[type="checkbox"] + label { display: inline-block; position: relative; cursor: pointer; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; } 
 .checks input[type="checkbox"] + label:before { /* 가짜 체크박스 */ content: ' '; display: inline-block; width: 21px; /* 체크박스의 너비를 지정 */ height: 21px; /* 체크박스의 높이를 지정 */ line-height: 21px; /* 세로정렬을 위해 높이값과 일치 */ margin: -2px 8px 0 0; text-align: center; vertical-align: middle; background: #fafafa; border: 1px solid  #e5e5e5; border-radius : 60px; box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05); } 
 .checks input[type="checkbox"] + label:active:before, .checks input[type="checkbox"]:checked + label:active:before { box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1); } 
 .checks input[type="checkbox"]:checked + label:before { /* 체크박스를 체크했을때 */ content: '\2714'; /* 체크표시 유니코드 사용 */ color: white; text-shadow: 1px 1px #fff; border:none; background: #FAE500; border-color: #adb8c0; box-shadow: 0px 1px 2px #FAE500, inset 0px -15px 10px -12px r#FAE500, inset 15px 10px -12px #FAE500; }

#loginButton{
	cursor: pointer;
}


</style>

<script type="text/javascript">
function bgLabel(ob, id) {
    if(!ob.value) {//ob값이 없으면
	    document.getElementById(id).style.display=""; //메서드는 주어진 문자열과 일치하는 id 속성을 가진 요소를 찾고, 이를 나타내는 Element 객체를 반환합니다.
    } else { //값이 있으면
	    document.getElementById(id).style.display="none"; //메서드는 주어진 문자열과 일치하는 id 속성을 가진 요소를 찾고, 이를 나타내는 Element 객체를 반환합니다.
    }
}

function sendLogin() {
    var f = document.loginForm;

    if(! f.userId.value) {
        alert("아이디를 입력하세요. ");
        f.userId.focus();
        return;
    }

    if(! f.userPwd.value) {
        alert("패스워드를 입력하세요. ");
        f.userPwd.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/member/login";
    f.submit();
}
</script>

<div class="body-container" style="display: flex; justify-content: center; align-items: center;">
    <div style="width:420px; margin-top:20px; padding:60px 0px; border:1px solid #e5e5e5;">
    	<div style="margin-left: 66px;">
        	<span style="font-weight: bold; font-size:27px; color: #424951;">회원 로그인</span>
        </div>
        
		<form name="loginForm" method="post" action="">
		  <table style="margin: 15px auto; width: 100%; border-spacing: 0px;">
		  <tr align="center" height="60"> 
		      <td> 
                <label for="userId" id="lblUserId" class="lbl" >아이디</label>
                <!--onfocus 속성은 요소가 포커스를 얻는 순간을 발생합니다. -->
                <!--onblur 속성은 요소가 포커스가 읽은 순간을 발생합니다.  -->
		        <input type="text" name="userId" id="userId" class="loginTF" maxlength="15"
		                   tabindex="1"
                           onfocus="document.getElementById('lblUserId').style.display='none';" 
                           onblur="bgLabel(this, 'lblUserId');">
		      </td>
		  </tr>
		  
		
		  <tr align="center" height="60"> 
		      <td>
		        <label for="userPwd" id="lblUserPwd" class="lbl" >패스워드</label>
		        <input type="password" name="userPwd" id="userPwd" class="loginTF" maxlength="20" 
		                   tabindex="2"
                           onfocus="document.getElementById('lblUserPwd').style.display='none';"
                           onblur="bgLabel(this, 'lblUserPwd');">
		      </td>
		  </tr>

				<tr height="60">
					<td><div style="margin-left: 66px;" class="checks"> <input type="checkbox"  id="ex_chk"> 
					<label for="ex_chk">로그인 상태 유지</label> </div></td>
				</tr>


				<tr align="center" height="60">
					<td>
						<button type="button" id="loginButton" onclick="sendLogin();" class="btnConfirm" style="font-family: inherit;">로그인</button>
					</td>
				</tr>

				<tr class="idContent">
		      <td>
		       		<a href="${pageContext.request.contextPath}/">아이디찾기</a>&nbsp;&nbsp;&nbsp;
		       		<a href="${pageContext.request.contextPath}/">패스워드찾기</a>&nbsp;&nbsp;&nbsp;
		       		<a href="${pageContext.request.contextPath}/member/member">회원가입</a>
		      </td>
		  </tr>
		  
		  <tr align="center" height="40" >
		    	<td><span style="color: blue;">${message}</span></td>
		  </tr>
		  
		  </table>
		</form>           
	</div>
</div>