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
  color:#ccc;
  font-size:14px;
  
}

.loginTF:focus {
	border-bottom:2px solid #4c4c4c;
}
input[type="checkbox"] {


    display:none;


}


input[type="checkbox"] + label span {
    
    width: 24px;
    height: 24px;
    margin: -2px 10px 0 0;
    vertical-align: middle;
    background: url(checkbox.svg) left top no-repeat;
    cursor: pointer;
    background-size: cover;
}
input[type="checkbox"]:checked + label span {
    background:url(checkbox.svg)  -26px top no-repeat;
     background-size: cover;
}
.idContent{
	margin-top: 60px;
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
					<td><input type="checkbox" id="check_test_box"  /> <label
						for="check_test_box"> <span></span> 체크박스입니다
					</label></td>
				</tr>


				<tr align="center" height="50" > 
		      <td>
		        <button type="button" onclick="sendLogin();" class="btnConfirm">로그인</button>
		      </td>
		  </tr>

		  <tr class="idContent" align="center" height="45">
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