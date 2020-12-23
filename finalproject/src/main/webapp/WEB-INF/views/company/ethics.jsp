<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, textarea, p, blockquote, th, td, input, select, textarea, button {
    margin: 0;
    padding: 0;
}

div{
	display: block;
}

body {
	font-size: 16px;
	font-family: "맑은 고딕", sans-serif;
	color: #666;
}

a {
	text-decoration: none;
	color: #101010;
}

a:hover {
	text-decoration: underline;
	color: #101010;
	font-weight: border:
}

a:active {
	text-decoration: underline;
	color: #101010;
	font-weight: border:
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
li {
    block-size: 56px;
    height: auto;
    inline-size: 824px;
    margin-inline-start: 36px;
    overflow-wrap: break-word;
    perspective-origin: 412px 28px;
    text-decoration: none solid rgb(102, 102, 102);
    transform-origin: 412px 28px;
    width: 824px;
    word-break: keep-all;
    border: 0px none rgb(102, 102, 102);
    font: 16px / 28px "맑은 고딕", sans-serif;
    list-style: outside none decimal;
    margin: 0px 0px 0px 36px;
    outline: rgb(102, 102, 102) none 0px;
}

.area_provision {
    margin-top: 80px;
    line-height: 28px;
    overflow: hidden;
    padding-bottom: 60px;
    border-bottom: 1px solid #e6e6e6;
}

#categori {
	width: 100%;
	height: auto;
    margin: 0;
	border-bottom: 1px solid #ccc;
}

#categori_box {
	width: 1480px;
	height: 45px;
	margin: auto;
	font-size: 16px;
	font-family: "맑은 고딕", sans-serif;
}

#ethics_containor {
    block-size: 9088px;
    height: 10000px;
    inline-size: 1903px;
    overflow-wrap: break-word;
    perspective-origin: 951.5px 4544px;
    text-decoration: none solid rgb(102, 102, 102);
    transform-origin: 951.5px 4544px;
    width: 1903px;
    word-break: keep-all;
    border: 0px none rgb(102, 102, 102);
    font: 16px / 24px "NotoSans Light", "Malgun Gothic", "맑은 고딕", "Apple SD Gothic Neo", 돋움, dotum, sans-serif;
    outline: rgb(102, 102, 102) none 0px;
}

.ethics_main {
    block-size: 8908px;
    height: 8908px;
    inline-size: 1160px;
    inset-block-end: 0px;
    inset-block-start: 0px;
    inset-inline-end: 0px;
    inset-inline-start: 0px;
    left: 0px;
    margin-inline-end: 371.5px;
    margin-inline-start: 371.5px;
    overflow-wrap: break-word;
    padding-block-end: 180px;
    perspective-origin: 580px 4544px;
    position: relative;
    right: 0px;
    text-decoration: none solid rgb(102, 102, 102);
    top: 0px;
    transform-origin: 580px 4544px;
    width: 1280px;
    word-break: keep-all;
    border: 0px none rgb(102, 102, 102);
    font: 16px / 24px "NotoSans Light", "Malgun Gothic", "맑은 고딕", "Apple SD Gothic Neo", 돋움, dotum, sans-serif;
    margin: 0px 371.5px;
    outline: rgb(102, 102, 102) none 0px;
    padding: 0px 0px 180px;
}

.ethics_content {
	margin-top: 80px;
}

.ethics_area {
	padding-left: 200px;
	float: center;
	width: 1280px;
}

#content_1st{
    block-size: 279px;
    height: 279px;
    inline-size: 900px;
    overflow-wrap: break-word;
    padding-block-end: 60px;
    perspective-origin: 430px 170px;
    text-decoration: none solid rgb(102, 102, 102);
    transform-origin: 430px 170px;
    width: 860px;
    word-break: keep-all;
    border-top: 0px none rgb(102, 102, 102);
    border-right: 0px none rgb(102, 102, 102);
    border-bottom: 1px solid rgb(230, 230, 230);
    border-left: 0px none rgb(102, 102, 102);
    font: 16px / 28px "NotoSans Light", "Malgun Gothic", "맑은 고딕", "Apple SD Gothic Neo", 돋움, dotum, sans-serif;
    outline: rgb(102, 102, 102) none 0px;
    overflow: hidden;
    padding: 0px 0px 60px;
}

#title_1st {
	height: 28px;
    font: 700 20px / 28px "맑은 고딕", sans-serif;
    margin: 0px;
}

.rules_1st {
	block-size: 224px;
    height: 224px;
    inline-size: 860px;
    margin-block-end: 0px;
    margin-block-start: 0px;
    overflow-wrap: break-word;
    padding-block-start: 27px;
    perspective-origin: 430px 125.5px;
    text-decoration: none solid rgb(102, 102, 102);
    transform-origin: 430px 125.5px;
    width: 860px;
    word-break: keep-all;
    border: 0px none rgb(102, 102, 102);
    font: 16px / 28px "맑은 고딕", sans-serif;
    margin: 0px;
    outline: rgb(102, 102, 102) none 0px;
    padding: 27px 0px 0px;
}

.title_ethics {
	block-size: 28px;
    height: 28px;
    inline-size: 860px;
    margin-block-end: 0px;
    margin-block-start: 60px;
    overflow-wrap: break-word;
    perspective-origin: 430px 14px;
    text-decoration: none solid rgb(30, 30, 30);
    transform-origin: 430px 14px;
    width: 860px;
    word-break: keep-all;
    border: 0px none rgb(30, 30, 30);
    font: 700 20px / 28px "맑은 고딕", sans-serif;
    margin: 60px 0px 0px;
    outline: rgb(30, 30, 30) none 0px;
}

.list_article {
	block-size: 476px;
    height: 476px;
    inline-size: 860px;
    margin-block-end: 0px;
    margin-block-start: 0px;
    overflow-wrap: break-word;
    padding-inline-start: 0px;
    perspective-origin: 430px 238px;
    text-decoration: none solid rgb(102, 102, 102);
    transform-origin: 430px 238px;
    width: 860px;
    word-break: keep-all;
    border: 0px none rgb(102, 102, 102);
    font: 16px / 28px "맑은 고딕", sans-serif;
    list-style: outside none none;
    margin: 0px;
    outline: rgb(102, 102, 102) none 0px;
    padding: 0px;
}

.group_rules {
	block-size: 3153px;
    inline-size: 860px;
    overflow-wrap: break-word;
    padding-block-end: 60px;
    perspective-origin: 430px 1607px;
    text-decoration: none solid rgb(102, 102, 102);
    transform-origin: 430px 1607px;
    width: 900px;
    word-break: keep-all;
    border-top: 0px none rgb(102, 102, 102);
    border-right: 0px none rgb(102, 102, 102);
    border-bottom: 1px solid rgb(230, 230, 230);
    border-left: 0px none rgb(102, 102, 102);
    font: 16px / 28px "맑은 고딕", sans-serif;
    outline: rgb(102, 102, 102) none 0px;
    overflow: hidden;
    padding: 0px 0px 60px;
}

.area_tit {
	word-break: keep-all;
	font-size: 16px;
	line-height: 1.5;
	font-family: 'NotoSans Light','Malgun Gothic','맑은 고딕','Apple SD Gothic Neo','돋움',dotum, sans-serif;
	color: #666;
	margin: 0;
	padding: 0;
	float: left;
	width: 300px;
}
</style>

<div id="categori">
	<div id="categori_box">
            <a href="${pageContext.request.contextPath}">홈</a> > <a href="${pageContext.request.contextPath}/help/main">회사소개</a> > <a href="${pageContext.request.contextPath}/help/myHistory">윤리규정</a>
	</div>
</div>
	
<div id="ethics_containor">
	<div class="ethics_main">
		<div >
			
			
			
			<div class="ethics_content ethics_area">
				<!--서론-->

				<div id="content_1st">
					<h4 id="title_1st">
						서 론
					</h4>
					<p class="rules_1st">
						주식회사 카카오(이하 "회사"라 합니다)는 주식회사 카카오의 영업행위준칙 및 윤리강령을 준용하며, 윤리에 관한 결정을 함에 있어서 지침으로 합니다. 회사는 회사가 행하는 모든 사항, 회사 내부적인 관계, 회사 외부인사와의 관계에 있어서 철저히 청렴할 것을 확약합니다.<br> 본 규정의 기준은 주로 우리 모두에게 적용되는 법에 기초하는 한편, 일부 경우 법적인 의무를 넘어섭니다. 이와 관련하여, 본 규정은 회사가 추구하는 가치를 위배하거나, 외관상 그렇게 보일 수 있는 상황을 피하기 위하여 우리가 지켜야 할 원칙을 제시합니다.<br> 본 규정의 기준은 정책지침 또는 기타 준칙 매뉴얼에서 추가 설명되거나 집행될 수 있으며, 우리 사업의 특정 분야와 관련되어 지침이나 매뉴얼을 둘 수도 있습니다.<br> 본 강령 및 관련 지침과 교본은 윤리 담당부서 및 아지트에서 입수할 수 있습니다.
					</p>
				</div>
				<!-- 제 1 장 총 칙 -->

				<div class="group_rules" style="height: 960px;">
					<h4 class="title_ethics">
						제 1 장 총 칙
					</h4> <strong >제1조 [목적]</strong>
					<p >
						본 규정은 회사가 추구하는 가치를 위배하거나, 또는 그렇게 보일 수 있는 상황을 피하기 위하여 우리가 지켜야 할 원칙을 제시함을 그 목적으로 합니다.
					</p> <strong >제2조 [적용범위]</strong>
					<p >
						본 규정은 회사(경영권이 있는 국내·외 투자회사 포함) 및 크루에게 적용되며, 회사의 Business Partner에게도 본 규정을 이해시키고 실천을 권장합니다.
					</p> <strong >제3조 [용어의 정의]</strong>
					<p >
						본 규정에서 사용하는 용어의 정의는 다음과 같습니다.
					</p>
					<ol class="list_article area_provision" style="height: auto;">
						<li>
							사회통념상 인정되는 수준<br>건전한 상식을 가진 대부분의 사람이 수용할 수 있어야 하며, 업무를 공정히 처리하는데 지장을 주지 않는 수준을 말합니다.
						</li>
						<li>
							이해관계자<br>경쟁사, 고객 및 공급업체, 주주 등 회사에 대해 이해관계를 갖고 있는 모든 당사자. 넓은 의미에서 소비자, 종업원, 지역사회, 언론, 시민단체 등이 포함됩니다.
						</li>
						<li>
							유형 및 무형자산<br>여하한 형식의 회사의 자금뿐만 아니라 기계장비, 보급품, 도구, 재고, 자금, 컴퓨터 시스템 및 장비, 컴퓨터 소프트웨어, 컴퓨터 데이터, 차량, 기록 또는 보고서, 기밀 정보, 지적재산권 또는 기타 민감한 정보 또는 자료, 전화, 음성메일 또는 전자메일을 사용한 통신 등도 포함됩니다.
						</li>
						<li>
							Business Partner(이하 "BP"라 합니다)<br>회사와의 거래 또는 업무관계에 있거나 이를 희망하는 회사/단체 및 그에 속한 개인을 통칭하며, 개인적인 관계(친구, 친척 등)가 있더라도 Business Partner로 간주합니다.
						</li>
						<li>
							공직자 등<br>「부정청탁 및 금품 등 수수의 금지에 관한 법률」에서 정의한 공직자 또는 공적 업무 종사자 및 동 법률에서 정한 부정청탁 및 금품수수 등이 금지된 자를 말합니다.
						</li>
						<li>
							윤리 담당부서<br>윤리규정의 관리를 포함한 회사의 윤리경영 담당 업무를 총괄하는 부서를 말합니다.
						</li>
					</ol>
				</div>
				<!-- 제 2 장 구성원의 자세 -->

				<div class="group_rules" style="height: 3200px;">
					<h4 class="title_ethics">
						제 2 장 구성원의 자세
					</h4> <strong >제4조 [성실한 업무수행]</strong>
					<p >
						모든 크루는 자신의 권한과 책임을 명확히 인식하고 정직과 신뢰의 원칙에 입각하여 성실하게 업무수행 하여야 합니다. 특히, 근무시간 중 회사의 업무와 관계없는 업무를 수행하거나 유인행위를 하여서는 아니 됩니다.
					</p> <strong >제5조 [겸직 및 겸임]</strong>
					<ol>
						<li>
							회사의 모든 크루 및 이사회 구성원들은 윤리 담당부서의 승인 없이 다른 경쟁사, 고객, 배급업체 또는 공급업체를 위해 근무하거나 또는 그들로부터 서비스에 대한 보수를 수령하여서는 아니 됩니다.
						</li>
						<li>
							크루가 정부 기관 또는 다른 회사의 이사회에서 근무하고자 할 때에는 이사회의 승인을 받아야 합니다. 특히 이사회의 구성원들은 다음 각 호의 행위를 수행하는 경우 이사회 과반 찬성에 의한 승인을 받아야 합니다.
							<ol >
								<li>
									① 회사와 동종영업을 목적으로 하는 타사의 이사 또는 유한책임사원
								</li>
								<li>
									② 이사 개인 혹은 제3자 명의로 회사 사업영역의 거래 체결
								</li>
								<li>
									③ 이사 개인 혹은 제3자 명의로 회사와 거래를 체결
								</li>
							</ol>
						</li>
						<li>
							2항에 따른 이사회의 승인을 받은 경우라도 크루 및 이사회 구성원들은 반드시 회사의 업무와 그렇지 않은 경우를 구별토록 적절한 조치를 취하여야 합니다.
						</li>
						<li>
							윤리 담당부서는 3항에 이르는 ‘적절한 조치’에 대해 필요할 경우 감사를 수행하고 부적절한 사항에 대해서 시정을 요구할 수 있습니다.
						</li>
					</ol> <strong >제6조 [품위유지]</strong>
					<p >
						모든 크루는 각자의 언행이 회사의 신뢰와 명성에 직결된다는 것을 명심하고 사회 구성원으로서 책임과 의무를 다하도록 노력해야 합니다.
					</p> <strong >제7조 [회사의 자산 및 정보 보호]</strong>
					<ol >
						<li>
							모든 크루는 회사의 유형 및 무형자산을 적절하게 배당하고 사용하여야 합니다.
							<ol >
								<li>
									① 크루는 회사의 자산이 손실, 손해, 오용, 절도 또는 태업에 따른 파괴를 당하지 않도록 보호하여야 합니다.
								</li>
								<li>
									② 크루는 회사 자산이 효과적으로 사용되도록 보장하여야 합니다.
								</li>
								<li>
									③ 회사 자산은 사업 목적에 한하여서만 사용되어야 합니다. 회사의 이익을 목적으로 하지 않은 회사 자산 또는 서비스의 사용은 경영진의 승인을 필요로 합니다.
								</li>
							</ol>
						</li>
						<li>
							회사 및 크루는 정확한 장부 및 기록 관련법에 따라 회사는 장부 및 기록에 회사 자산의 거래 및 처분을 합리적으로 상세한 방식으로 정확하고 공정하게 반영하여야 합니다. 특히, 다음 각 호의 요건을 엄격하게 존중하여야 합니다.
							<ol >
								<li>
									① 허위 기재 및 오해를 일으킬 수 있는 기재는 엄격하게 금지되며, 회사는 어떠한 목적으로든 비공개 채무 또는 자산을 용인하지 아니합니다.
								</li>
								<li>
									② 대금 지급은 증빙 문서상 기록된 목적으로만 이루어져야 합니다.
								</li>
								<li>
									③ 모든 크루는 재무제표 및 기타 보고서의 정확성과 공정성을 보장하기 위하여 관리 및 회계관련 통제를 이행하여야 합니다.
								</li>
							</ol>
						</li>
						<li>
							모든 크루는 회사의 내부감사인 및 외부감사인에게 전적으로 협력하여야 합니다.
						</li>
						<li>
							모든 크루는 회사의 정보와 영업비밀을 보호하고 관리하며 회사의 보안기준을 준수하여야 합니다. 이 의무는 회사를 퇴직한 이후에도 유효하며, 특히 다음 각 호의 행위들은 엄격히 금지됩니다.
							<ol >
								<li>
									① (이용자정보의 무권한접근) 이용자의 정보에 권한 없이 접근하는 행위
								</li>
								<li>
									② (외부유출) 회사의 내부정보를 외부에 유출하는 행위. 아지트의 내용 역시 회사의 내부정보에 포함됩니다.
									<ul >
										<li>
											· 언론기관 관련자에게 유출하는 행위
										</li>
										<li>
											· 블로그, 블라인드 등 다수가 사용하는 외부채널에 유출하는 행위
										</li>
										<li>
											· 가족, 친구, 전 동료 등 외부의 지인에게 유출하는 행위
										</li>
									</ul>
								</li>
								<li>
									③ (내부유출) 업무상 취득한 회사의 내부보안정보를 회사 내부의 권한 없는 사람에게 유출하는 행위
								</li>
								<li>
									④ (내부자정보 거래) 내부자정보를 이용하여 자사주를 거래하는 행위
								</li>
							</ol>
						</li>
					</ol> <strong >제8조 [건전한 기업문화 조성]</strong>
					<p >
						모든 크루는 상하·동료 간에 성적 괴롭힘, 사적인 부담을 주는 행위 강요 등 건전한 관계 형성을 저해하는 일체의 행위를 하여서는 아니 되며, 상호 동반자로 인식하고 인격적으로 존중하여 건전한 조직분위기를 조성하여야 합니다. 또한, 특히, 건전한 기업문화 조성을 위하여 다음 각 호의 행위들은 엄격히 금지됩니다.
					</p>
					<ul >
						<li>
							(폭행) 물리적 폭력 (위협적 행동 포함)
						</li>
						<li>
							(폭언) 언어적 폭력
						</li>
						<li>
							(성적 괴롭힘) 상대방에게 성적 모멸감을 일으키는 행위
						</li>
						<li>
							(차별) 타인을 비하하는 차별적 발언이나 행동
						</li>
						<li>
							(은폐) 회사 내에서 동료에게 진실을 은폐하기 위해 허위사실을 말하거나 문서로 작성하는 행위
						</li>
					</ul> <strong >제9조 [공정한 업무수행]</strong>
					<ul >
						<li>
							모든 크루는 BP와 거래 시 공과 사를 엄격히 구분하고 공정하고 투명하게 업무를 수행하여야 합니다.
						</li>
						<li>
							모든 크루는 BP 및 거래처에게 공정한 거래 기회를 부여하고, 우월적 지위를 이용하여 공정거래를 해치는 요구 또는 언행을 하지 않아야 합니다.
						</li>
						<li>
							모든 크루는 자신과 가까운 친척들에 대한 업무평가 또는 급여를 관리감독, 검토하는 과정에 대해 개인적인 영향력을 행사하여서는 아니 됩니다.
						</li>
					</ul> <strong >제10조 [이해관계 충돌]</strong>
					<ul >
						<li>
							모든 크루는 회사의 정당한 사업시도와 관련하여 이해가 상충되는 행위를 하거나 이해상충 관계를 형성하여서는 아니 됩니다.
						</li>
						<li>
							크루가 업무영향력을 행사할 수 있거나, 업무 수행에 있어 크루의 판단이나 행동에 영향을 줄 수 있다고 생각되는 경우, 다음 각 호의 행위들이 금지됩니다. 단, 다음은 모든 이해상충 관계를 열거한 것이 아니므로 실제 상황에서는 엄격한 판단과 적용이 요구됩니다.
							<ol >
								<li>
									① 크루가 직접 또는 제3자를 통하여 회사나 BP, 경쟁업체와 거래하는 행위
								</li>
								<li>
									② 크루가 직접 또는 제3자를 통하여 BP와 금전대차, 공동투자, 대출보증, 부동산 또는 동산의 임대차 관계를 맺는 행위
								</li>
								<li>
									③ 크루가 직접 또는 제3자를 통하여 BP로부터 보상을 받는 행위
								</li>
								<li>
									④ 크루가 직접 또는 제3자를 통하여 BP의 주식이나 채권 등을 보유하는 행위 등 (단, 회사의 승인이 있는 경우는 예외로 합니다)
								</li>
							</ol>
						</li>
						<li>
							크루가 업무 수행과정에서 취득한 업무 상 정보를 이용하여 직접 또는 제3자를 통하여 부당하게 이익을 도모하는 다음 각 호의 행위들이 금지됩니다.
							<ol >
								<li>
									① 크루가 직접 또는 제3자를 통하여 회사가 구입 또는 임차하려고 하는 재산이나 유가증권 등을 구매하는 행위
								</li>
								<li>
									② 회사정보를 이용한 사적 조언 등의 기회에 BP로부터 본인 또는 제3자의 고용, 취업 추천 등을 보장받는 행위
								</li>
							</ol>
						</li>
						<li>
							크루는 가족 및 친인척이 회사나 BP와 거래하는 경우 이해상충 관계가 형성될 수 있으므로 이를 윤리 담당부서에 신고하여야 합니다.
						</li>
					</ul> <strong >제11조 [금품 및 향응]</strong>
					<ul >
						<li>
							모든 크루는 이해관계자를 비롯한 다른 당사자로부터 어떠한 금품 및 향응·접대 등을 수수하여서는 아니 되며, 불가피하게 금품 및 향응·접대 등을 수수한 경우에는 다음 각 호와 같이 조치한 후 상사에게 보고하고 그 경과를 윤리 담당부서에 신고하여야 합니다.
							<ol >
								<li>
									① 반송 가능한 경우에는 즉시 반송하여야 합니다.
								</li>
								<li>
									② 반송이 불가능하거나 곤란한 경우, 윤리 담당부서에 문의하여 윤리 담당부서의 안내에 따라 처리합니다.
								</li>
							</ol>
						</li>
						<li>
							다음 각 호의 경우에는 예외적으로 금품 및 향응·접대 수수가 인정됩니다. 다만, 그 액수 또는 가치가 사회통념상 용인될 수 있는 범위여야 합니다. 그 판단이 어려울 경우에는 윤리 담당부서에 문의하여야 합니다.
							<ol >
								<li>
									① 홍보 및 행사 기념품
								</li>
								<li>
									② 경조금
								</li>
								<li>
									③ 간소한 수준의 식·음료
								</li>
							</ol>
						</li>
						<li>
							모든 크루는 이해관계자를 비롯한 다른 당사자들에게 어떠한 금품 및 향응·접대 등을 제공해서는 아니 됩니다. 특히, 「부정청탁 및 금품 등 수수의 금지에 관한 법률」을 위반하여 공직자 등에게 부정 청탁 및 금품, 접대·편의 등을 제공해서는 아니 됩니다.
						</li>
						<li>
							모든 크루는 이해관계자들에게 자신들의 가족, 또는 친구의 이익을 위하여 어떠한 선물, 경조금, 기타 사례, 또는 사업상의 우대를 요청하여서는 아니 됩니다.
						</li>
						<li>
							정부 및 정부기관에서 주최한 회의에 회사를 대표하여 참석한 후 회의비를 수령하는 경우, 회의비를 윤리 담당부서에 신고해야 합니다.
						</li>
						<li>
							크루는 업무와 관련하여 BP 등과 업무시간 외에 회사 밖에서 접촉 시에는 조직장에게 사전 보고함을 원칙으로 합니다.
						</li>
					</ul> <strong >제12조 [윤리규정의 준수]</strong>
					<ul >
						<li>
							모든 크루는 본 규정의 준수 및 이에 대한 준수서약 의무가 있고, 그 해석 및 적용과 관련하여 의문이 생기면 윤리 담당 부서장과 상의하고 자문을 받아야 합니다.
						</li>
						<li>
							모든 크루는 본 윤리규정의 위반 사례를 인지한 경우에는 윤리 담당부서에 신고하여야 합니다.
						</li>
						<li>
							각 조직장은 소속 직원과 업무상 관련된 BP들이 회사의 윤리규정을 올바르게 이해하고 준수할 수 있도록 적극적으로 지원하고 관리할 책임이 있습니다.
						</li>
						<li>
							모든 크루는 매년 윤리경영 실천을 위해 서약서를 작성하고, 서약내용을 준수하여야 합니다.
						</li>
						<li>
							본 규정을 위반한 경우에는 사규에 따라 조치합니다.
						</li>
					</ul>
				</div>
				<!-- 제 3 장 고객에 대한 책임 -->

				<div class="group_rules" style="height: 680px;">
					<h4 class="title_ethics">
						제 3 장 고객에 대한 책임
					</h4> <strong >제13조 [고객중심 경영]</strong>
					<ul >
						<li>
							회사는 상품을 개발하는 과정에서 상품 완결성을 제고하기 위한 사전 검증 절차 도입 등을 통해 고객이 만족할 수 있는 상품과 서비스를 제공합니다.
						</li>
						<li>
							회사는 고객의 요구사항을 정확히 파악하기 위한 모든 노력을 다하며, 고객의 정당한 요구와 합리적인 제안을 적극적으로 수용하고 고객과의 약속은 반드시 지킵니다.
						</li>
						<li>
							회사는 고객이 합리적으로 제품과 서비스를 선택할 수 있도록 정확한 정보를 적시에 제공합니다
						</li>
					</ul> <strong >제14조 [고객정보 보호]</strong>
					<ul >
						<li>
							회사는 고객정보 보호 관련 법령을 준수하고, 고객정보 보호를 위한 업무 프로세스를 지속적으로 점검하고 개선하며, 필요 시 상품개발 단계에서 고객정보 사전영향 평가제를 도입하여 운영할 수 있습니다.
						</li>
						<li>
							회사는 최적의 IT 보안 시스템 및 전문 고객정보관리자 운영 등 고객정보 보호를 위한 최선의 노력을 다합니다.
						</li>
						<li>
							회사는 고객의 동의가 있거나 법률상 허용되는 경우를 제외하고는 고객정보를 제공받은 목적 외의 용도로 이용하거나 제 3자에게 제공하지 않습니다.
						</li>
					</ul> <strong >제15조 [고객가치 제고]</strong>
					<p >
						회사는 고객에게 제품과 서비스를 제공함에 있어 고객이 기대하는 품질수준 유지, 안심하고 유익하게 사용할 수 있는 이용환경 조성 등 고객가치의 제고를 위해 최선을 다합니다.
					</p>
				</div>
				<!-- 제 4 장 구성원에 대한 책임 -->

				<div class="group_rules" style="height: 500px;">
					<h4 class="title_ethics">
						제 4 장 구성원에 대한 책임
					</h4> <strong >제16조 [인간위주의 경영]</strong>
					<ul >
						<li>
							회사는 인종, 민족, 성, 신념, 종교, 나이, 장애 또는 성적 선호도에 기한 차별이 없는 근무 환경을 제공합니다.
						</li>
						<li>
							회사는 크루의 인격을 존중하고 역량과 성과에 따라 공정하고 합리적으로 대우합니다.
						</li>
						<li>
							회사는 최적의 업무 환경 구성을 포함하여 각 크루의 목표 달성을 지원합니다.
						</li>
						<li>
							회사는 모든 크루의 자기개발 활동을 지원하고 업무수행에 필요한 학습기회를 적극 제공합니다.
						</li>
					</ul> <strong >제17조 [크루의 안전과 행복]</strong>
					<ul >
						<li>
							회사는 모든 크루의 안전과 건강을 위한 제도를 정비하고 관련 교육을 정기적으로 실시하는 등 이와 관련된 국제기준, 관련법령, 내부규정 등을 준수합니다.
						</li>
						<li>
							회사는 모든 크루가 상호신뢰와 자긍심을 갖고 도전정신과 창의성을 발현하여 동료와 더불어 행복을 추구할 수 있도록 최선의 노력을 다합니다.
						</li>
					</ul>
				</div>
				<!-- 제 5 장 주주에 대한 책임 -->

				<div class="group_rules" style="height: 380px;">
					<h4 class="title_ethics">
						제 5 장 주주에 대한 책임
					</h4> <strong>제18조 [기업가치 제고]</strong>
					<p>
						회사는 끊임없는 혁신을 통한 투명하고 효율적인 경영으로 기업가치를 극대화하며, 그 성과를 주주와 공유합니다.
					</p> <strong>제19조 [주주권익 보호]</strong>
					<ul>
						<li>
							회사는 이사회 중심의 투명경영을 실천하며, 주주의 정당한 요구 및 제안을 존중합니다.
						</li>
						<li>
							회사는 재무제표 등 공시자료를 제반 법규 및 회계기준에 의거하여 작성하고 관련 법령에 따라 적정성·정확성·완전성·적시성 있는 공시를 합니다.
						</li>
					</ul>
				</div>
				<!-- 제 6 장 Business Partner와의 관계 -->

				<div class="group_rules" style="height: 470px;">
					<h4 class="title_ethics">
						제 6 장 Business Partner와의 관계
					</h4> <strong>제20조 [상생경영]</strong>
					<ul>
						<li>
							회사는 공정하고 합리적인 기준을 적용하여 사업목적에 적합한 BP를 선정하고, 동일한 기준으로 그 이행 과정 및 품질 등을 평가하여 이를 적절한 방법으로 해당 BP에게 전달합니다.
						</li>
						<li>
							회사는 우월적 지위를 이용한 부당한 행위를 하지 않으며, 상호이익과 공동발전을 추구합니다.
						</li>
						<li>
							회사는 BP를 상호신뢰의 기반 위에서 고객행복이라는 공동가치를 추구하는 전략적 동반자로 인식합니다.
						</li>
					</ul> <strong>제21조 [BP정보 보호]</strong>
					<ul>
						<li>
							회사는 BP의 정보와 영업비밀을 보호하여야 하며, BP의 동의가 있거나 법률상 허용 되는 경우를 제외하고는 제공받은 목적 외의 용도로 이용하지 않습니다.
						</li>
						<li>
							회사는 BP 등 타사의 정보나 영업비밀을 위법·부당한 방법으로 취득하거나 사용하지 않습니다.
						</li>
					</ul>
				</div>
				<!-- 제 7 장 사회에 대한 책임 -->

				<div class="group_rules" style="height: 1220px;">
					<h4 class="title_ethics">
						제 7 장 사회에 대한 책임
					</h4> <strong>제22조 [법, 규칙 및 규정 등의 준수]</strong>
					<p>
						회사의 방침은 선량한 "법인 시민"이 되는 것으로서 회사의 모든 크루는 아래 각 호와 같은 법, 규칙 및 규정을 준수하여야 합니다.
					</p>
					<ul>
						<li>
							회사가 사업을 영위하는 국가의 법령과 규칙
						</li>
						<li>
							사업상 체결한 계약의 조건
						</li>
						<li>
							그 밖의 회사가 사업을 영위하는 지역에서의 사회 통념상 윤리적이라고 받아들여지는 관습 및 기준
						</li>
					</ul> <strong>제23조 [경쟁 제한]</strong>
					<ul>
						<li>
							회사는 회사가 사업을 영위하는 국가의 경쟁 제한법을 준수합니다.
						</li>
						<li>
							회사 또는 모든 크루는 다른 상대방과 불합리하게 경쟁을 제한하는 계약 체결을 포함한 어떠한 담합 행위도 하여서는 아니 됩니다.
						</li>
						<li>
							크루는 경쟁사와 가격책정, 계약조건, 기타 기밀 정보 등 경쟁에 있어 민감한 정보에 관하여 논의해서는 아니 됩니다.
						</li>
					</ul> <strong>제24조 [건전한 문화 창달]</strong>
					<ul>
						<li>
							회사는 지속적인 기술 혁신 및 사업의 고도화 등을 통해 편리하고 풍요로운 세상을 구현함으로써 인간의 삶의 질을 향상시키고 나아가 인류의 행복에 공헌합니다.
						</li>
						<li>
							회사는 사업 지역에서 제공되는 서비스의 사회·문화적 유해성 여부를 고려하는 등 사업수행 시 지역사회의 건전한 문화 형성 및 창달을 위해 노력합니다
						</li>
					</ul> <strong>제25조 [인간의 존엄성 존중]</strong>
					<ul>
						<li>
							회사는 사업 지역에서 고객, 임직원 등 모든 이해관계자에 대해 인종, 종교, 성, 장애 등을 이유로 한 불합리한 차별을 하지 않습니다.
						</li>
						<li>
							회사는 사업 지역에서의 미성년자 보호, 고객 프라이버시 보호 등 기본적 인권을 보호합니다.
						</li>
					</ul> <strong>제26조 [환경친화적 경영]</strong>
					<p>
						회사는 환경보호 관련 국제기준 및 관련 법령, 내부규정 등을 준수하고, 환경친화적 경영을 실천합니다.
					</p> <strong>제27조 [사회공헌 활동]</strong>
					<p>
						회사는 사업지역의 기업시민으로서 자원봉사, 재난구호 등 사회봉사활동에 적극 참여합니다.
					</p> <strong>제28조 [정치적 중립성 유지]</strong>
					<ul>
						<li>
							회사는 개인의 참정권과 정치적 의사표현을 존중하나 회사의 자금, 인력, 시설 등을 정치적 목적으로 사용하는 일체의 개인적 정치활동은 인정하지 아니합니다.
						</li>
						<li>
							크루가 대표이사의 승인 없이 회사를 대표하여 실행하는 어떠한 정치적 기부도 금지됩니다.
						</li>
						<li>
							회사는 대정부 관련 부적절한 거래를 지양하고 각국의 관련 법규를 준수합니다.
						</li>
					</ul>
				</div>
				<!-- 제 8 장 윤리상담·신고 및 제보자 보호 -->

				<div class="group_rules" style="height: 790px;">
					<h4 class="title_ethics">
						제 8 장 윤리상담·신고 및 제보자 보호
					</h4> <strong>제29조 [윤리상담·신고 및 제보자 보호]</strong>
					<ul>
						<li>
							윤리 담당부서는 회사 시스템에 윤리상담을 위한 ‘핫라인 제보’를 구축·운영할 수 있습니다.
						</li>
						<li>
							윤리 담당 부서장은 윤리경영 관련 상담·신고에 대해 추가적인 사실관계 확인을 상임윤리위원회의 승인 하에 시행하며 필요에 따라서는 다음과 같이 조치합니다.
							<ol>
								<li>
									① 상담·신고된 사안에 따라 이를 해당업무 담당부서에 위임하거나 윤리 담당 부서장이 관련부서와 협의하여 처리합니다.
								</li>
								<li>
									② 상담·신고된 사안이 징계 심의가 필요하다고 판단되는 경우 상임윤리위원회에 심의를 제안할 수 있습니다.
								</li>
							</ol>
						</li>
						<li>
							회사는 BP관련 상담·신고가 있는 경우에는 다음과 같이 조치합니다.
							<ol>
								<li>
									① 접수된 사안의 경중, 위반 정도 등을 감안하여 재발방지 각서를 제출 받고 해당 BP 및 상담·신고자의 선처를 결정할 수 있습니다.
								</li>
								<li>
									② 회사는 전 호의 규정에도 불구하고 사안의 중대성, 사회 및 회사 등에의 영향 정도를 감안하여 해당 BP와의 거래물량 제한, 계약해지 등의 필요한 조치를 취할 수 있습니다.
								</li>
							</ol>
						</li>
						<li>
							회사는 상담·신고자 보호 및 상담·신고 장려를 위한 최선의 노력을 다합니다.
							<ol>
								<li>
									상담·신고자의 신분 및 상담·신고 내용을 보호하며, 상담·신고로 인한 불이익을 받지 않도록 최선의 노력을 다합니다.
								</li>
								<li>
									상담·신고자는 자신의 신분이 노출되어 필요하다고 판단할 때에는 윤리 담당 부서장에게 그 사실을 통보하고 신분보호를 요청할 수 있고, 이 경우 윤리 담당 부서장은 인사관리 및 법무관리 담당 부서장과의 협의를 통해 법률적 지원 및 부서 이동 등 필요한 조치를 취할 수 있습니다.
								</li>
								<li>
									모든 크루는 윤리 담당부서 등에 상담·신고자의 신분을 문의하거나 이를 알아내기 위한 탐문 등 신분노출을 가능하게 하는 어떠한 행위 또는 보복행위를 하여서는 아니 되며,<br> 그 행위 시도만으로도 징계 심의될 수 있습니다.
								</li>
								<li>
									상담·신고자가 부정행위에 가담하였으나, 그 사실을 상담·신고한 경우 회사는 부정행위에 대한 처벌이나<br> 징계 시 정상을 참작할 수 있습니다.
								</li>
								<li>
									상담·신고로 인하여 회사의 이익에 기여한 상담·신고자에게 포상할 수 있습니다.
								</li>
							</ol>
						</li>
						<li>
							윤리 담당부서장은 윤리규범 관련 상담·신고 내역 및 처리 결과를 접수일자 순으로 기록하여 보관합니다.
						</li>
					</ul>
				</div>
				<!-- 부칙 -->

				<div class="group_rules" style="height: 230px;">
					<h4 class="title_ethics">
						부 칙
					</h4> <strong>제1조 [시행일]</strong>
					<p>
						이 규정은 2019년 1월 2일부터 시행합니다.
					</p>
				</div>
				<p>
					영업행위준칙 및 윤리강령 - 2019.1.2 내용 개정본
				</p>
			</div>

		</div>
	</div>

</div>
