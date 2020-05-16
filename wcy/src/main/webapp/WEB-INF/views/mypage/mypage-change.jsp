<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- 파비콘 적용 -->
<link rel="shortcut icon"
	href="<c:url value='/img/favicon/wcy-favicon.ico'/>">


<link rel="stylesheet" href="<c:url value='/css/commons.css'/>">


<title>WE CODE YOU | 모든 프로그래머를 위한 아카데미</title>
<script src="https://code.jquery.com/jquery-3.5.0.min.js"
	integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ="
	crossorigin="anonymous"></script>

<style>
.left-section {
	float: left;
	width: 210px;
}

.left-section>h2 {
	width: 210px;
	height: 112px;
	background: #25283D;
	color: #fff;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
}

.left-section .left-sub-nav {
	width: 210px;
	border: solid #dbdbdb;
	border-width: 0 1px;
	box-sizing: border-box;
}

.left-section .left-sub-nav>li>a {
	padding: 10px 20px;
	font-size: 14px;
	display: block;
	position: relative;
	border-bottom: 1px solid #dbdbdb;
	font-weight: bold;
	color: #333;
}

.right-section {
	width: 840px;
	float: right;
	position: relative;
}

.right-header .right-sub-nav {
	width: 100%;
	background: #f4f4f4;
	border-radius: 5px;
	display: table;
	table-layout: fixed;
	margin-bottom: 50px;
	overflow: hidden;
}

.right-header .right-sub-nav li {
	display: table-cell;
}

.right-header .right-sub-nav li a {
	display: block;
	height: 60px;
	box-sizing: border-box;
	font-size: 18px;
	color: #888;
	padding: 0 0 0 20px;
	line-height: 60px;
	border-bottom: 4px solid #ddd;
}

.right-sub-nav li a.active {
	color: #25283D;
	border-color: #25283D;
}

.contents-title:before {
	display: block;
	content: '';
	width: 50px;
	height: 3px;
	background: #25283D;
	position: absolute;
	left: 0;
	top: 0;
}

.contents-title {
	font-size: 22px;
	margin-bottom: 20px;
	color: #000;
	position: relative;
	padding-top: 5px;
	height: 40px;
	line-height: 40px;
}

p {
	line-height: 150% !important;
}
</style>

</head>
<body>

	<jsp:include page="../include/header-sub.jsp" />


	<main class="wcy-main-content">
		<div class="left-section">
			<h2>MyPage</h2>
			<ul class="left-sub-nav">
				<li><a class="active" href="<c:url value='/mypage/myinfoChange' />">내 정보</a></li>
				<li><a href="<c:url value='/mypage/leclist?type=on' />">수강 목록</a></li>
				<li><a href="<c:url value='/mypage/pointInfo' />">내 포인트</a></li>
				<li><a href="<c:url value='/mypage/recentAct' />">최근 활동</a></li>
				<li><a href="<c:url value='/mypage/mylec' />">내 강의실</a></li>
			</ul>
		</div>

		<div class="right-section">
			<div class="right-header">
				<ul class="right-sub-nav">
					<li><a class="active"> 내 정보 </a></li>
				</ul>
			</div>
			<div class="right-contents">
				<h4 class="contents-title">${login.userName}님의 MYPAGE</h4>
				<p class="mb10">
					

<!-- 위의 정보들을 바꾸겠다. -->
<c:if test="${change eq 'info'}">
	<table border="0" class="tbl_model">
                <caption><span class="blind">연락처 수정 입력</span></caption>
                <colgroup>
                    <col style="width:22%"><col>
                </colgroup>
                <tbody>
                <tr>
                    <th scope="row">
                        <div class="thcell">
						     	  사용자 <span class="word_br">이름</span>
						     </div>
                    </th>
                    <td>
                        <div class="tdcell">
                            <p class="contxt_tit">${login.userName}</p>
                            <p class="contxt_desc">이름이 변경되었다면 이메일 인증을 통해 정보를 수정할 수 있습니다.</p>
                            <p class="btn_area_btm">
                                <a href="javascript:changeName();" class="btn_model"><b class="btn2">수정</b></a>
                            </p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">
                        <div class="thcell">휴대전화</div>
                    </th>
                    <td>
                        <div class="tdcell">
                            <p id="p_txt_phoneNo" class="contxt_tit">${login.userTel}</p>
                            <p class="contxt_desc">필요한 정보를 위코드유로부터 알림을 받을 때 사용할 휴대전화입니다.</p>
                            <div id="d_phoneNo" style="display:none">
                                <p id="p_txt_phoneNo_changeYn" class="contxt_tit2"><label for="phoneNo">변경할 휴대전화</label></p>
                                <p class="contxt_webctrl">
                                    <select id="internationalCode" name="internationalCode" class="country_drop" onchange="javascript:setInternationalCode('internationalCode','input_internationalCode', '');">
                                                <option value="233">가나</option>
                                                <option value="241">가봉</option>
                                                <option value="592">가이아나</option>
                                                <option value="220">감비아</option>
                                                <option value="502">과테말라</option>
                                                <option value="1671">괌</option>
                                                <option value="1473">그레나다</option>
                                                <option value="30">그리스</option>
                                                <option value="224">기니</option>
                                                <option value="245">기니비사우</option>
                                                <option value="264">나미비아</option>
                                                <option value="674">나우루</option>
                                                <option value="234">나이지리아</option>
                                                <option value="672">남극,오스트레일리아의외</option>
                                                <option value="27">남아프리카공화국</option>
                                                <option value="31">네덜란드</option>
                                                <option value="599">네덜란드령보네르</option>
                                                <option value="297">네덜란드령아루바</option>
                                                <option value="977">네팔</option>
                                                <option value="47">노르웨이</option>
                                                <option value="64">뉴질랜드</option>
                                                <option value="683">뉴질랜드령니우에</option>
                                                <option value="690">뉴질랜드령토켈라우제도</option>
                                                <option value="227">니제르</option>
                                                <option value="505">니카라과</option>
                                                <option value="82">대한민국</option>
                                                <option value="45">덴마크</option>
                                                <option value="299">덴마크령그린란드</option>
                                                <option value="298">덴마크령페로제도</option>
                                                <option value="1809">도미니카공화국</option>
                                                <option value="1829">도미니카공화국 2</option>
                                                <option value="1849">도미니카공화국 3</option>
                                                <option value="49">독일</option>
                                                <option value="670">동티모르</option>
                                                <option value="856">라오스</option>
                                                <option value="231">라이베리아</option>
                                                <option value="371">라트비아</option>
                                                <option value="7">러시아/카자흐스탄</option>
                                                <option value="961">레바논</option>
                                                <option value="266">레소토</option>
                                                <option value="40">루마니아</option>
                                                <option value="352">룩셈부르크</option>
                                                <option value="250">르완다</option>
                                                <option value="218">리비아</option>
                                                <option value="370">리투아니아</option>
                                                <option value="423">리히텐슈타인</option>
                                                <option value="261">마다가스카르</option>
                                                <option value="692">마셜제도공화국</option>
                                                <option value="691">마이크로네시아연방</option>
                                                <option value="853">마카오</option>
                                                <option value="389">마케도니아공화국</option>
                                                <option value="265">말라위</option>
                                                <option value="60">말레이시아</option>
                                                <option value="223">말리</option>
                                                <option value="52">멕시코</option>
                                                <option value="377">모나코</option>
                                                <option value="212">모로코</option>
                                                <option value="230">모리셔스</option>
                                                <option value="222">모리타니아</option>
                                                <option value="258">모잠비크</option>
                                                <option value="382">몬테네그로</option>
                                                <option value="373">몰도바</option>
                                                <option value="960">몰디브</option>
                                                <option value="356">몰타</option>
                                                <option value="976">몽골</option>
                                                <option value="1">미국/캐나다</option>
                                                <option value="1670">미국령북마리아나제도</option>
                                                <option value="95">미얀마</option>
                                                <option value="678">바누아투</option>
                                                <option value="973">바레인</option>
                                                <option value="1246">바베이도스</option>
                                                <option value="1242">바하마</option>
                                                <option value="880">방글라데시</option>
                                                <option value="229">베냉</option>
                                                <option value="58">베네수엘라</option>
                                                <option value="84">베트남</option>
                                                <option value="32">벨기에</option>
                                                <option value="375">벨라루스</option>
                                                <option value="501">벨리즈</option>
                                                <option value="387">보스니아헤르체고비나</option>
                                                <option value="267">보츠와나</option>
                                                <option value="591">볼리비아</option>
                                                <option value="257">부룬디</option>
                                                <option value="226">부르키나파소</option>
                                                <option value="975">부탄</option>
                                                <option value="359">불가리아</option>
                                                <option value="55">브라질</option>
                                                <option value="673">브루나이</option>
                                                <option value="685">사모아</option>
                                                <option value="966">사우디아라비아</option>
                                                <option value="378">산마리노</option>
                                                <option value="239">상투메프린시페</option>
                                                <option value="221">세네갈</option>
                                                <option value="381">세르비아</option>
                                                <option value="248">세이셀</option>
                                                <option value="1784">세인트빈센트그레나딘</option>
                                                <option value="252">소말리아</option>
                                                <option value="677">솔로몬제도</option>
                                                <option value="249">수단</option>
                                                <option value="597">수리남</option>
                                                <option value="94">스리랑카</option>
                                                <option value="268">스와질랜드</option>
                                                <option value="46">스웨덴</option>
                                                <option value="41">스위스</option>
                                                <option value="34">스페인</option>
                                                <option value="421">슬로바키아</option>
                                                <option value="386">슬로베니아</option>
                                                <option value="963">시리아</option>
                                                <option value="232">시에라리온</option>
                                                <option value="65">싱가포르</option>
                                                <option value="971">아랍에미리트</option>
                                                <option value="374">아르메니아</option>
                                                <option value="54">아르헨티나</option>
                                                <option value="1684">아메리칸사모아</option>
                                                <option value="354">아이슬란드</option>
                                                <option value="509">아이티</option>
                                                <option value="353">아일랜드</option>
                                                <option value="994">아제르바이잔</option>
                                                <option value="93">아프가니스탄</option>
                                                <option value="376">안도라</option>
                                                <option value="355">알바니아</option>
                                                <option value="213">알제리</option>
                                                <option value="244">앙골라</option>
                                                <option value="251">에디오피아</option>
                                                <option value="291">에리트레아</option>
                                                <option value="372">에스토니아</option>
                                                <option value="593">에콰도르</option>
                                                <option value="503">엘살바도르</option>
                                                <option value="44">영국</option>
                                                <option value="290">영국령세인트헬레나</option>
                                                <option value="246">영국령인도양지역</option>
                                                <option value="350">영국령지브롤터</option>
                                                <option value="500">영국령포클랜드제도</option>
                                                <option value="967">예멘</option>
                                                <option value="968">오만</option>
                                                <option value="43">오스트리아</option>
                                                <option value="504">온두라스</option>
                                                <option value="962">요르단</option>
                                                <option value="256">우간다</option>
                                                <option value="598">우루과이</option>
                                                <option value="998">우즈베키스탄</option>
                                                <option value="380">우크라이나</option>
                                                <option value="964">이라크</option>
                                                <option value="98">이란</option>
                                                <option value="972">이스라엘</option>
                                                <option value="20">이집트</option>
                                                <option value="39">이탈리아</option>
                                                <option value="91">인도</option>
                                                <option value="62">인도네시아</option>
                                                <option value="81">일본</option>
                                                <option value="1876">자메이카</option>
                                                <option value="260">잠비아</option>
                                                <option value="240">적도기니</option>
                                                <option value="995">조지아</option>
                                                <option value="86">중국</option>
                                                <option value="236">중앙아프리카공화국</option>
                                                <option value="253">지부티</option>
                                                <option value="263">짐바브웨</option>
                                                <option value="235">차드</option>
                                                <option value="420">체코</option>
                                                <option value="56">칠레</option>
                                                <option value="237">카메룬</option>
                                                <option value="238">카보베르데</option>
                                                <option value="974">카타르</option>
                                                <option value="855">캄보디아왕국</option>
                                                <option value="254">케냐</option>
                                                <option value="269">코모로,마요트</option>
                                                <option value="506">코스타리카</option>
                                                <option value="225">코트디부아르</option>
                                                <option value="57">콜롬비아</option>
                                                <option value="242">콩고</option>
                                                <option value="243">콩고민주공화국</option>
                                                <option value="53">쿠바</option>
                                                <option value="965">쿠웨이트</option>
                                                <option value="682">쿡제도</option>
                                                <option value="385">크로아티아</option>
                                                <option value="996">키르기스스탄</option>
                                                <option value="686">키리바시</option>
                                                <option value="357">키프로스</option>
                                                <option value="886">타이완</option>
                                                <option value="992">타지키스탄</option>
                                                <option value="255">탄자니아</option>
                                                <option value="66">태국</option>
                                                <option value="90">터키</option>
                                                <option value="228">토고</option>
                                                <option value="676">통가</option>
                                                <option value="993">투르크메니스탄</option>
                                                <option value="216">튀니지</option>
                                                <option value="1868">트리니다드토바고</option>
                                                <option value="507">파나마</option>
                                                <option value="595">파라과이</option>
                                                <option value="92">파키스탄</option>
                                                <option value="675">파푸아뉴기니</option>
                                                <option value="680">팔라우</option>
                                                <option value="970">팔레스타인</option>
                                                <option value="51">페루</option>
                                                <option value="351">포르투갈</option>
                                                <option value="48">폴란드</option>
                                                <option value="1787">푸에르토리코</option>
                                                <option value="33">프랑스</option>
                                                <option value="590">프랑스령과들루프</option>
                                                <option value="594">프랑스령기아나</option>
                                                <option value="687">프랑스령뉴칼레도니아</option>
                                                <option value="262">프랑스령레위니옹</option>
                                                <option value="596">프랑스령마르티니크</option>
                                                <option value="508">프랑스령생피에르미클롱</option>
                                                <option value="681">프랑스령월리스푸투나제</option>
                                                <option value="689">프랑스령폴리네시아</option>
                                                <option value="679">피지</option>
                                                <option value="358">핀란드</option>
                                                <option value="63">필리핀</option>
                                                <option value="36">헝가리</option>
                                                <option value="61">호주</option>
                                                <option value="852">홍콩</option>
                                    </select>
								    <span class="country_code_w">
                                        <span id="input_internationalCode" class="country_code">+82</span>
										<input type="text" id="phoneNo" name="phoneNo" maxlength="14" onkeydown="check_num_ajax2('phoneNo', '2', 'e_phoneNo','e_authNo');">
                                    </span>
                                    <a href="#" onclick="sendSmsForChangePhoneNo();return false;" class="btn_model"><span class="btn4">인증</span></a>
                                </p>
                                <p id="e_phoneNo" class="contxt_alert"></p>

                                <p class="contxt_tit2"><label for="authNo">인증번호 입력</label></p>
                                <p class="contxt_webctrl">
                                    <input type="text" id="authNo" name="authNo" value=""  maxlength="6" onkeydown="check_num_ajax2('authNo', '2', 'e_authNo','e_phoneNo');" disabled class="focus" style="width:254px">
                                </p>
                                <p id="e_authNo"  class="contxt_alert"></p>

                                <p class="btn_area_btm">
                                    <a href="#" onclick="cancelChange('phoneNo');return false;" class="btn_model"><b id="b_txt_phoneNo_cncl"  class="btn2">수정취소</b></a>
                                    <a href="#" onclick="checkAuthNoForChangePhoneNo();return false;" class="btn_model"><b id="b_txt_phoneNo_reg" class="btn3">수정완료</b></a>
                                </p>
                            </div>
                            <p id="p_phoneNo" class="btn_area_btm">
                                <a href="#" onclick="display('phoneNo');return false;" class="btn_model"><b class="btn2">수정</b></a>
                            </p>
                        </div>
                    </td>
                </tr>
  <tr>
                   <th scope="row">
                        <div class="thcell">
						     	 <span class="word_br">주소지</span>
						     </div>
                    </th>
                    <td>
                        <span class="zipcode">${login.userZipcode}</span> ${login.userAddress}<br>${login.userDetailAddress}
                    </td>
                    <td class="cell_edit">
                        <a href="#" class="_modify setting_btn type_h">수정</a><!--N=a:adr.listmodi-->
                        <input type="hidden" id="hash" value="2ff228e4bcb6dc68572bff884bff4541db19f05a79e29095b53b315355cc525d"/>
                    </td>
                </tr>
                
                </tbody>
            </table>
            
            
<br>
<a href="<c:url value='/mypage/myinfoChange' />">내정보</a> <br>
</c:if>

<c:if test="${change eq 'pw'}">
비밀번호 변경
안전한 비밀번호로 내정보를 보호하세요

다른 아이디/사이트에서 사용한 적 없는 비밀번호

이전에 사용한 적 없는 비밀번호가 안전합니다.<br>
	비밀번호: <input type="password" name="" id="" /><br>
	번호확인: <input type="password" name="" id="" /><br>
	
<br>
<a href="<c:url value='/mypage/myinfoChange' />">내정보</a> <br>
</c:if>

				</p>
			</div>
		</div>
	</main>

	<jsp:include page="../include/footer.jsp" />

	<script src="<c:url value = "/js/jquery-3.0.0.min.js"/>"></script>
	<script src="<c:url value = "/js/main.js"/>"></script>

<c:if test="${login == null}">
	<script>   
	   alert("로그인이 필요한 서비스입니다.");
	   location.href="<c:url value='/' />";
	</script>
</c:if>	

</body>
</html>