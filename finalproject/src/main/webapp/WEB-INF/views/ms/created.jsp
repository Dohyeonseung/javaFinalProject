<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
    function check() {
        var f = document.boardForm;

    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
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

    	f.action="${pageContext.request.contextPath}/ms/${mode}";
			
        return true;
    }
</script>

<div class="body-container" style="width: 830px;">
    <div class="body-title">
        <h3><i class="fab fa-asymmetrik"></i> 재료판매 </h3>
    </div>
    
    <div>
			<form name="materialSellForm" method="post" onsubmit="return submitContents(this);" enctype="multipart/form-data">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tbody id="materialSellBody">
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="productName" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.productName}">
			      </td>
			  </tr>
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">가&nbsp;&nbsp;&nbsp;&nbsp;격</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="price" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.price}">
			      </td>
			  </tr>
			  
			 <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
		      <td width="100" bgcolor="#eeeeee" style="text-align: center;">카테고리</td>
		      <td style="padding-left:10px;"> 
		        <select name="categoryNum" class="selectField">
		        	<c:forEach var="vo" items="${listCategory}">
		        		<option value="${vo.categoryNum}" ${dto.categoryNum==vo.categoryNum?"selected='selected'":""}>${vo.category}</option>
		        	</c:forEach>
		        </select>
		
			        <input type="text" name="division" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.division}">
			   <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">재&nbsp;&nbsp;&nbsp;&nbsp;고</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="stock" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.stock}">
			      </td>
			  </tr>
			  
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">적&nbsp;&nbsp;립&nbsp;&nbsp;금</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="reserves" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.reserves}">
			      </td>
			  </tr>
			
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">작성자</td>
			      <td style="padding-left:10px;"> 
			          ${sessionScope.member.userName}
			      </td>
			  </tr>
			
			  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
			      <td valign="top" style="padding:5px 0px 5px 10px;"> 
			        <textarea name="content" id="content" class="boxTA" style="width:98%; height: 270px;">${dto.content}</textarea>
			      </td>
			  </tr>
			 
			 <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">이미지</td>
			      <td style="padding-left:10px;"> 
			          <input type="file" name="upload" class="boxTF" size="53"
			                     accept="image/*" 
			                     style="height: 25px;">
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
    
    
</div>