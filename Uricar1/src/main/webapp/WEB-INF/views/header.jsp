<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
   var name = "${mb.name}";
   if(name != ""){
   $('#name').html(name + '님');
   $('.suc').css('display','block');
   $('.bef').css('display','none');
   }
   if(name == "") {
	   $('.suc').css('display','none');
	   $('.bef').css('display','block');
   }
});
</script>
<!-- 여기서부터 소진이 편집 -->
<div class="top-bar">
	<span class="logo"> <img class="top-left logo"
		src="resources/images/logoR.png" width="250" height="150"
		onclick="gohome();">
	</span>
</div>
<!--  <h2 class="top-left">우리떠날Car</h2>-->
<div class="right">
	<nav class="top-right">
		<ul>
			<li class="suc"><a href="./logout">로그아웃</a></li>
			<li class="suc"><a href="./mypageFrm">마이페이지</a></li>
			<li class="bef"><a href="./joinFrm">회원가입</a></li>
			<li class="bef"><a href="./login">로그인</a></li>
			<li class="suc" id="name">${name}님</li>

		</ul>
	</nav>
</div>


<div class="left">
	<nav class="top-left">
		<ul class="tq">
			<li class="sodog"><a href="./cmInfo">소개</a>
				<ul class="submenu">
					<li><a href="./cmInfo">회사 소개</a></li>
					<li><a href="./cmInfo2">제휴사 소개</a></li>
				</ul>
			</li>
			<li class="sodog"><a href="./reserv">예약</a></li>
			<li class="sodog"><a href="./NowEventList">이벤트/쿠폰</a>
				<ul class="submenu">
					<li><a href="./NowEventList.jsp" aria-label="submenu">이벤트</a></li>
					<li><a href="./Coupon.jsp" aria-label="submenu">쿠폰</a></li>
				</ul>
			</li>
			<li class="sodog"><a href="./cuCenter">고객센터</a>
				<ul class="submenu">
					<li><a href="./cuCenter" aria-label="submenu">1대1 문의</a></li>
					<li><a href="./FAQ" aria-label="submenu">자주 찾는 질문</a></li>
				</ul>
			</li>
		</ul>
	</nav>
</div>

<script>
	function gohome() {
		var id = '${mb.mid}';

		if (id == '') {
			location.href = './';
		} else if (id != '') {
			location.href = './list';
		}
	}
</script>
