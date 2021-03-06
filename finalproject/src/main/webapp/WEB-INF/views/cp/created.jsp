<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se/js/HuskyEZCreator.js" charset="utf-8"></script><!-- 네이버거 넣어놓은것 -->
<script type="text/javascript">
    function check() {
        var f = document.boardForm;

    	var str = f.productName.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.productName.focus();
            return false;
        }

        str = f.content.value;
        if(!str || str=="<p>&nbsp;</p>") {
            f.content.focus();
            return false;
        }
        
        var mode="${mode}";
        if(mode=="created"||mode=="update" && f.upload.value!="") {
    		if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.upload.value)) {
    			alert('이미지 파일만 가능합니다.(bmp 파일은 불가) !!!');
    			f.upload.focus();
    			return;
    		}
    	}

    	f.action="${pageContext.request.contextPath}/cp/${mode}";
			
        return true;
    }
</script>

<div class="body-container" style="width: 830px;">
   <div class="body-title">
		<h4>홈 > Sell - 재료판매 </h4>
	</div>
    
    <div>
			<form name="materialSellForm" method="post" onsubmit="return submitContents(this);" enctype="multipart/form-data">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tbody id="materialSellBody">
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">제품이름</td>
			      <td style="padding-left:10px;" colspan="3"> 
			        <input type="text" name="productName" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.productName}">
			      </td>
			  </tr>
			  
			   <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      	<td width="100" bgcolor="#eeeeee" style="text-align: center;" >가&nbsp;&nbsp;&nbsp;&nbsp;격</td>
		      	
			      <td style="padding-left:10px;"> 
			        <input type="text" name="price" maxlength="100" class="boxTF" style="width: 95%;"  value="${dto.price}">
			      	<input type="hidden" name="reserves" value="${dto.reserves}">
			      </td>
		         <td width="100" bgcolor="#eeeeee" style="text-align: center;">구&nbsp;&nbsp;&nbsp;&nbsp;분</td>
			      <td style="padding-left:10px;"> 
			         <input type="radio" name="division" value="1" checked="checked"> 완제품 판매
			      </td>
			     </tr>
			  
			 <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <td width="100" bgcolor="#eeeeee" style="text-align: center;">카테고리</td>
		      <td style="padding-left:10px;"> 
		        <select name="categoryNum" class="selectField">
		        	<c:forEach var="vo" items="${listCategory}">
		        		<option value="${vo.categoryNum}" ${dto.categoryNum==vo.categoryNum?"selected='selected'":""}>${vo.categoryName}</option>
		        	</c:forEach>
		        </select>
		         <td width="100" bgcolor="#eeeeee" style="text-align: center;">재&nbsp;&nbsp;&nbsp;&nbsp;고</td>
			      <td style="padding-left:10px;"> 
			        <input type="number" name="stock" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.stock}">
			      </td>
		        </tr>
	 
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
			      <td style="padding-left:10px;" colspan="3"> 
			          ${sessionScope.member.userName}
			      </td>
			  </tr>
			
			  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
			      <td valign="top" style="padding:5px 0px 5px 10px;" colspan="3"> 
			        <textarea name="content" id="content" class="boxTA" style="width:98%; height: 270px;">${dto.content}</textarea>
			      </td>
			  </tr>
			 
			 <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">이미지</td>
			      <td style="padding-left:10px;" colspan="3"> 
			          <input type="file" name="upload" class="boxTF" size="53"
			                     accept="image/*" 
			                     style="height: 25px; width: 97%;">
			       </td>
			  </tr>
						  
			  </tbody>
			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			      	<c:if test="${mode=='update'}">
						<input type="hidden" name="num" value="${dto.productNum }">
						<input type="hidden" name="imageFilename" value="${dto.imageFilename}">
						<input type="hidden" name="page" value="${page}">
					</c:if>
			      
			        <button type="submit" class="btn">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="btn">다시입력</button>
			        <button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/ms/list';">${mode=='update'?'수정취소':'등록취소'}</button>

			      </td>
			    </tr>
			  </table>
			</form>
    </div>
   <script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "content",
			sSkinURI: "${pageContext.request.contextPath}/resources/se/SmartEditor2Skin.html",	
			htParams : {bUseToolbar : true,
				fOnBeforeUnload : function(){
					// alert(" Ok !!!");
				}
			}, //boolean
			fOnAppLoad : function(){
				//예제 코드
				//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator: "createSEditor2"
		});
		
		function pasteHTML() {
			var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
			oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
		}
		
		function showHTML() {
			var sHTML = oEditors.getById["content"].getIR();
			alert(sHTML);
		}
			
		function submitContents(elClickedObj) {
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
			
			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
			
			try {
				// elClickedObj.form.submit();
				return check();
			} catch(e) {}
		}
		
		function setDefaultFont() {
			var sDefaultFont = '돋움';
			var nFontSize = 24;
			oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
		}
</script>    
    
</div>

