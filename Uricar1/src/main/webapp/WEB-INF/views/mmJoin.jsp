<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=yes">
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="manual">
<meta name="format-detection" content="telepnone=no">
<meta property="og:type" content="website">
<script src="resources/js/cmm/common.js"></script>
<script src="resources/js/cmm/atrk.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<link rel="stylesheet"
	href="resources/fancybox/source/jquery.fancybox.css" media="all">
<link rel="stylesheet" href="resources/css/joinFrm/joinFrm1.css">
<link rel="stylesheet" href="resources/css/joinFrm/joinFrm2.css">
<link rel="stylesheet" href="resources/css/joinFrm/style_header.css">
<link rel="stylesheet" href="resources/css/joinFrm/style_kr_fixcss.css">
<link rel="stylesheet" href="resources/css/joinFrm/style_kr.css">
<link rel="stylesheet" href="resources/css/joinFrm/kh-old.css">
<link rel="stylesheet" href="resources/css/joinFrm/resultre.css">
<link rel="stylesheet" href="resources/css/joinFrm/tdoctor-old.css">
<link rel="stylesheet" href="resources/css/joinFrm/m2on-addon.css">
<link rel="stylesheet" href="resources/css/cmstyle.css">

<!-- Add jQuery library -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Add mousewheel plugin (this is optional) -->
<script type="text/javascript"
	src="resources/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>

<!-- Add fancyBox -->
<link rel="stylesheet"
	href="resources/fancybox/source/jquery.fancybox.css?v=2.1.7"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="resources/fancybox/source/jquery.fancybox.pack.js?v=2.1.7"></script>

<!-- Optionally add helpers - button, thumbnail and/or media -->
<link rel="stylesheet"
	href="resources/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="resources/fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
<script type="text/javascript"
	src="resources/fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>

<link rel="stylesheet"
	href="resources/fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7"
	type="text/css" media="screen" />
<script type="text/javascript"
	src="resources/fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

<link rel="stylesheet" href="resources/css/footer.css" />
</head>
<script type="text/javascript">
	$(document).ready(
			function() {
				/*
				 *  Simple image gallery. Uses default settings
				 */

				$('.fancybox').fancybox();

				/*
				 *  Different effects
				 */

				// Change title type, overlay closing speed
				$(".fancybox-effects-a").fancybox({
					helpers : {
						title : {
							type : 'outside'
						},
						overlay : {
							speedOut : 0
						}
					}
				});

				// Disable opening and closing animations, change title type
				$(".fancybox-effects-b").fancybox({
					openEffect : 'none',
					closeEffect : 'none',

					helpers : {
						title : {
							type : 'over'
						}
					}
				});

				// Set custom style, close if clicked, change title type and overlay color
				$(".fancybox-effects-c").fancybox({
					wrapCSS : 'fancybox-custom',
					closeClick : true,

					openEffect : 'none',

					helpers : {
						title : {
							type : 'inside'
						},
						overlay : {
							css : {
								'background' : 'rgba(238,238,238,0.85)'
							}
						}
					}
				});

				// Remove padding, set opening and closing animations, close if clicked and disable overlay
				$(".fancybox-effects-d").fancybox({
					padding : 0,

					openEffect : 'elastic',
					openSpeed : 150,

					closeEffect : 'elastic',
					closeSpeed : 150,

					closeClick : true,

					helpers : {
						overlay : null
					}
				});

				/*
				 *  Button helper. Disable animations, hide close button, change title type and content
				 */

				$('.fancybox-buttons')
						.fancybox(
								{
									openEffect : 'none',
									closeEffect : 'none',

									prevEffect : 'none',
									nextEffect : 'none',

									closeBtn : false,

									helpers : {
										title : {
											type : 'inside'
										},
										buttons : {}
									},

									afterLoad : function() {
										this.title = 'Image '
												+ (this.index + 1)
												+ ' of '
												+ this.group.length
												+ (this.title ? ' - '
														+ this.title : '');
									}
								});

				/*
				 *  Thumbnail helper. Disable animations, hide close button, arrows and slide to next gallery item if clicked
				 */

				$('.fancybox-thumbs').fancybox({
					prevEffect : 'none',
					nextEffect : 'none',

					closeBtn : false,
					arrows : false,
					nextClick : true,

					helpers : {
						thumbs : {
							width : 50,
							height : 50
						}
					}
				});

				/*
				 *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
				 */
				$('.fancybox-media').attr('rel', 'media-gallery').fancybox({
					openEffect : 'none',
					closeEffect : 'none',
					prevEffect : 'none',
					nextEffect : 'none',

					arrows : false,
					helpers : {
						media : {},
						buttons : {}
					}
				});

				/*
				 *  Open manually
				 */

				$("#fancybox-manual-a").click(function() {
					$.fancybox.open('1_b.jpg');
				});

				$("#fancybox-manual-b").click(function() {
					$.fancybox.open({
						href : 'iframe.html',
						type : 'iframe',
						padding : 5
					});
				});

				$("#fancybox-manual-c").click(function() {
					$.fancybox.open([ {
						href : '1_b.jpg',
						title : 'My title'
					}, {
						href : '2_b.jpg',
						title : '2nd title'
					}, {
						href : '3_b.jpg'
					} ], {
						helpers : {
							thumbs : {
								width : 75,
								height : 50
							}
						}
					});
				});

			});
</script>

<!-- 와이즈로그 -->
<script type="text/javascript">
	//document.domain = "*.kotra.or.kr";

	var nowZoom = 100; // 현재비율
	var maxZoom = 200; // 최대비율(500으로하면 5배 커진다)
	var minZoom = 80; // 최소비율

	//화면 키운다.
	function zoomIn() {
		var browser = window.navigator.userAgent;
		if (browser.indexOf('Firefox') != -1) {
			alert("컨트롤키를 누른상태에서 + 키를 누르시면 커집니다");
			return;
		}

		if (nowZoom < maxZoom) {
			nowZoom += 10; //25%씩 커진다.
		} else {
			return;
		}

		document.body.style.zoom = nowZoom + "%";
	}

	//화면 줄인다.
	function zoomOut() {
		var browser = window.navigator.userAgent;
		if (browser.indexOf('Firefox') != -1) {
			alert("컨트롤키를 누른상태에서 - 키를 누르시면 작아집니다");
			return;
		}
		if (nowZoom > minZoom) {
			nowZoom -= 10; //25%씩 작아진다.
		} else {
			return;
		}

		document.body.style.zoom = nowZoom + "%";
	}

	//화면 원래대로 
	function zoomDefault() {
		var browser = window.navigator.userAgent;
		if (browser.indexOf('MSIE') != -1) {
			nowZoom = 100;
			document.body.style.zoom = nowZoom + "%";
		}
	}
</script>

<script type="text/javascript">
	function fnTopMenuMouseOver() {
		$(".allmenu").removeClass("on");
		$(".mymenu").removeClass("on");
		$(".btn_family").removeClass("on");

		$('#family_view').hide();
		//$('#menu_view').hide();
		$('#allmenuView').hide();
		$('#mymenuView').hide();
	}

	function fnFamilyClick() {

		$(".allmenu").removeClass("on");
		$(".mymenu").removeClass("on");
		$(".btn_family").removeClass("on");

		//$('#family_view').hide();
		$('#menu_view').hide();
		$('#allmenuView').hide();
		$('#mymenuView').hide();

	}

	function fnFamilyMouseOver() {
		$(".allmenu").removeClass("on");
		$(".mymenu").removeClass("on");
		//$("#btn_family").removeClass("on");

		$('#family_view').hide();
		$('#menu_view').hide();
		$('#allmenuView').hide();
		$('#mymenuView').hide();
	}

	function fnAllMenuClick() {
		//$("#allmenu").removeClass("on");
		$(".mymenu").removeClass("on");
		$(".btn_family").removeClass("on");

		$('#family_view').hide();
		$('#menu_view').hide();
		//$('#allmenuView').hide();
		$('#mymenuView').hide();
	}

	function fnAllMenuMouseOver() {
		//$("#allmenu").removeClass("on");
		$(".mymenu").removeClass("on");
		$(".btn_family").removeClass("on");

		$('#family_view').hide();
		$('#menu_view').hide();
		$('#allmenuView').hide();
		$('#mymenuView').hide();
	}

	function fnMyMenuClick() {
		$(".allmenu").removeClass("on");
		//$(".mymenu").removeClass("on");
		$(".btn_family").removeClass("on");

		$('#family_view').hide();
		$('#menu_view').hide();
		$('#allmenuView').hide();
		//$('#mymenuView').hide();
	}

	function fnMyMenuMouseOver() {
		$(".allmenu").removeClass("on");
		//$("#mymenu").removeClass("on");
		$(".btn_family").removeClass("on");

		$('#family_view').hide();
		$('#menu_view').hide();
		$('#allmenuView').hide();
		$('#mymenuView').hide();
	}

	function fnMenuViewOver() {
		$('#menu_view').hide();
	}
</script>
<script type="text/javascript">
	//<![CDATA[
	function goMenu(param, url) {

		var frm = document.getElementById('menuForm');
		if (url != null && url != '')
			frm.action = url;
		frm.MENU_CD.value = param;

		if (url == null || url == '') {
			frm.submit();
		} else {
			if (url.indexOf("?") == -1)
				url = url + "?";
			location.href = url + "&MENU_CD=" + $('#MENU_CD').val()
					+ "&TOP_MENU_CD=" + $('#TOP_MENU_CD').val()
					+ "&LEFT_MENU_CD=" + $('#LEFT_MENU_CD').val()
					+ "&PARENT_MENU_CD=" + $('#PARENT_MENU_CD').val()
					+ "&CO_TYPE=" + $('#CO_TYPE').val()
		}

	}

	function goLanguage(url) {
		window.open(url);
	}

	var $kotraLoading = {
		show : function() {
			if (!$kotraLoading.loadingWrap.is(":visible")) {
				$kotraLoading.loadingWrap.show();
				//$(document.body).css("position","fixed");
			}
		},
		hide : function() {
			$kotraLoading.loadingWrap.hide();
			$(document.body).css("position", $kotraLoading.bodyPosition);
		},
		_init : function() {
			var loadingWrap = $("<div>").css({
				'width' : '100%',
				'height' : '100%',
				'top' : '0px',
				'position' : 'fixed',
				'z-index' : '999',
				'text-align' : 'center',
				'display' : 'none'
			});
			var loadingMask = $("<div>").css({
				'width' : '100%',
				'height' : '100%',
				'background' : '#000',
				'opacity' : '0.7'
			});
			var loadingConts = $("<div>").css({
				'width' : '400px',
				'height' : '120px',
				/*'background': '#fff',*/
				'opacity' : '1',
				'position' : 'fixed',
				'top' : 'calc(50% - 120px)',
				'left' : 'calc(50% - 200px)',
			/*'border-radius': '5px',*/
			/*'border' : '5px solid #6aabec'*/
			});
			var spinTitle = $("<h4>").css({
				'font-size' : '18px',
				'padding' : '10px 0px',
				'border-radius' : '5px 5px 0px 0px',
				'color' : '#06275a',
				'margin-bottom' : '5px',
				'margin-top' : '15px'
			});
			/*.text("잠시만 기다려 주세요");*/
			var spinnerImg = $("<img>", {
				'src' : '/images/kh_new/spinner.gif',
				'alt' : 'loading'
			}).css({
				'width' : '50px'
			});
			loadingWrap.append(loadingMask).append(
					loadingConts.append(spinTitle).append(spinnerImg));
			$kotraLoading.bodyPosition = $(document.body).css("position");
			$(document.body).append(loadingWrap);
			$kotraLoading.loadingWrap = loadingWrap;
		}
	}
	//메뉴이동시 스피너 출력
	/*
	 $(function(){
	 $kotraLoading._init();
	 $("#left_nav ul li>a").on('click', function(){
	 if($(this).attr('target') != '_blank'){
	 $kotraLoading.show();
	 }
	 });
	 })
	 */
</script>
<script src="resources/js/cmm/atrk.js"></script>
<style type="text/css">
/*회원가입*/
.join01 .box02 {
	overflow: hidden;
	position: relative;
	width: 743px;
	height: 158px;
	padding: 22px 0 0 37px;
	color: #5d5d5d;
}

.join01 .box02 a {
	position: absolute;
	left: 26px;
	top: 115px;
}

.join01 .box02 a.btn {
	position: absolute;
	left: 26px;
	top: 61px;
}

.join01 .box03 {
	overflow: hidden;
	position: relative;
	width: 743px;
	height: 123px;
	padding: 22px 0 0 37px;
	color: #5d5d5d;
}

.join01 .box03 a {
	position: absolute;
	left: 26px;
	top: 85px;
}

.join01 .corporate {
	background: url(resources/images/bg_join01_1.gif) no-repeat;
}

.join01 .individual {
	background: url(resources/images/bg_join02.gif) no-repeat;
}

.join01 .membership {
	background: url(resources/images/bg_join03.gif) no-repeat;
}
</style>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						if (window.navigator.userAgent.indexOf("Edge") > -1) {
							alert("죄송합니다. 엣지 브라우져에서는 이용이 원활하지 않을 수 있으니 다른 브라우져(익스플로러, 크롬, 사파리 등)를 이용해 주시면 고맙겠습니다. 조치중이오니 많은 양해 바랍니다.");
						}
						/* alert("금일 24일 오후 12:20까지 회원가입이 불가하오니\n고객님의 양해를 부탁드립니다."); */
					});
</script>

<script>
	/* 20200723 버튼 스크립트*/
	$(function() {
		$('button.btn_more').click(function() {
			$('div.pop_home').slideDown();
		});

		$('div.pop_home p').hover(function() {
			$(this).addClass('on');
			$(this).find('.btn_s').hide();
			$(this).find('.btn_o').show();
		});

		$('div.pop_home p').mouseout(function(e) {
			$(this).siblings('p').removeClass('on');
			$(this).siblings('p').find('.btn_o').hide();
			$(this).siblings('p').find('.btn_s').show();
		});

		$('div.home_box').hover(function() {
			var btnOn = $('div.pop_home p.on');
			btnOn.removeClass('on');
			if (btnOn) {
				btnOn.find('.btn_o').hide();
				btnOn.find('.btn_s').show();
			}
		});

		$('div.home_box .btn_close').click(function() {
			var btnOn = $('div.pop_home p.on');
			btnOn.removeClass('on');
			if (btnOn) {
				btnOn.find('.btn_o').hide();
				btnOn.find('.btn_s').show();
			}

			$('div.pop_home').slideUp();
		});
	});
</script>

<style type="text/css">
/* #write_wrap03 { width:100%; height:100%; background:url("../../images/kh/service/bg.png"); position:fixed; z-index:200; top:0; left:0; display:none; text-align:left; border:0;}
#write03 { width:460px; height:170px; border:5px solid #286dc2; padding:10px 20px 20px 20px; margin:0 auto; margin-top:270px; background:#fff; position:relative; text-align:left; font-size:14px; overflow: auto;}
 */
/*아래 추가  */
/* 맨위 */
div.new_header_19 {
	height: 46px;
	background: #efefef;
}

div.new_header_19>div {
	position: relative;
	margin: 0 auto;
	padding: 2px 10px 0;
	width: 1200px;
	box-sizing: border-box;
}

div.new_header_19 a {
	display: inline-block;
	vertical-align: top;
}

div.new_header_19 .fR a {
	position: relative;
	margin: 15px 10px 0;
	height: 12px;
	font-size: 13px;
	line-height: 12px;
	color: #666 !important;
}

div.new_header_19 .fR a:nth-child(1):after {
	content: "";
	position: absolute;
	top: 0;
	right: -10px;
	display: block;
	width: 1px;
	height: 12px;
	vertical-align: top;
	background: #b8b8b8;
}

.fL {
	padding-left: 33px;
}

div.new_header_19 a {
	display: inline-block;
	vertical-align: top;
}

div.new_header_19 .fL a {
	margin: 7px 9px 0;
}

div.new_header_19 .fL img {
	height: 26px;
}

div.new_header_19 .fL button.btn_more {
	position: static;
	margin: 5px 0 0 5px;
	padding: 0 8px;
	width: auto;
	height: 29px;
	border: 1px solid #c2c2c2;
	border-radius: 2px;
	box-sizing: border-box;
}

div.new_header_19 .fL button.btn_more span {
	display: inline-block;
	padding-right: 15px;
	font-weight: 600;
	font-size: 12px;
	line-height: 27px;
	color: #737373;
	background: url(../../images/btn_t_more.png) right center no-repeat;
}

.clear, .clear:after {
	content: "";
	display: block;
	clear: both;
}

/* 더보기 사이트  */
div.new_header_19 .pop_home {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	border-bottom: 3px solid #0092e0;
	background: #efefef;
	z-index: 200;
}

div.new_header_19 .pop_home h3 {
	margin: 0 6px;
	padding: 10px 0;
	width: 172px;
	text-align: center;
	font-size: 17px;
}

div.new_header_19>div {
	position: relative;
	margin: 0 auto;
	padding: 2px 10px 0;
	box-sizing: border-box;
}

div.new_header_19 .home_box {
	position: relative;
	margin: 0 auto;
	/* padding: 5px 0; */
	width: 1200px;
}

div.new_header_19 .home_box>div {
	padding: 10px 0;
}

div.new_header_19 h3 {
	display: inline-block;
	position: relative;
	padding: 0 25px 0 17px;
	vertical-align: top;
	font-weight: bold;
	font-size: 13px;
	line-height: 40px;
	color: #333;
}

div.new_header_19 .home_box p {
	display: inline-block;
	position: relative;
	margin: 10px 6px;
	width: 172px;
	height: 40px;
	vertical-align: top;
}

div.new_header_19 .home_box .btn_close {
	position: absolute;
	top: 0;
	right: 0;
	width: 63px;
	height: 32px;
	border: 1px solid #c2c2c2;
	box-sizing: border-box;
}

div.new_header_19 .home_box .btn_close span {
	display: inline-block;
	padding-right: 26px;
	font-weight: bold;
	font-size: 12px;
	color: #737373;
	background: url(../../images/btn_t_close.png) right center no-repeat;
}

div.new_header_19 .home_box a.btn_o strong {
	display: block;
	margin-top: 10px;
	font-size: 14px;
}

#header #nav .headNav {
	display: inline-block;
	color: #000;
	font-size: 18px;
	padding: 0px 0 0 28px;
	line-height: 30px;
}

#header #nav .headNav a {
	color: #000 !important;
}

#header #nav .headNav a.active {
	color: #4a8ac7 !important;
}

#header #nav .headNav a:hover {
	color: #76BBFD !important;
}

#header #nav li a.active {
	color: #29477d;
	border-bottom: 0 !important;
}

#header #nav>.head {
	position: absolute !important;
	left: 260px !important;
	top: 32px !important;
}

#header #nav li {
	display: inline-block;
	margin-left: 0px;
}

#header #nav li a {
	/* padding: 0px 20px 10px 20px !important; margin: 0px 20px 0px -20px; */
	border: 0px solid red;
}

#header #nav .headNav>.bidData {
	position: absolute;
	left: 152px;
	top: 50px;
}

#header .headBottom {
	height: 82px !important;
}

#header .headBottom .headGnb {
	position: absolute;
	left: 248px;
	top: 32px !important;
	z-index: 50;
}

#header .subNav>.contents_box>.subMenu {
	margin-left: 95px;
}

#header .headTop ul, #header .headTop li {
	float: right !important;
	margin: 4px 10px;
}

#header .headBottom .hamMenu, .search {
	top: 30px !important;
}

#header .headTop {
	height: 44px !important;
}
</style>
<script type="text/javascript" src="resources/js/common.js"></script>


<link rel="stylesheet" href="resources/css/joinFrm/joinFrm1.css" />
<link rel="stylesheet" href="resources/css/joinFrm/joinFrm2.css" />
<script src="resources/js/cmm/ui_customer.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var msg = "${msg}";
		console.log(msg);
		if (msg != "") {
			alert(msg);
			location.reload(true);
		}
	});
</script>
<form id='menuForm' action="#">
	<input type='hidden' name='MENU_CD' id='MENU_CD' value='' /> <input
		type='hidden' name='TOP_MENU_CD' id='TOP_MENU_CD' value='G1000' /> <input
		type='hidden' name='LEFT_MENU_CD' id='LEFT_MENU_CD' value='G1002' />
	<input type='hidden' name='PARENT_MENU_CD' id='PARENT_MENU_CD' value='' />
	<input type="hidden" name="sessionTimeChk" id="sessionTimeChk" value="" />
</form>
<style>
td, tr, input, textarea {
	height: 25px;
	font-style: 나눔바른고딕;
	font-size: 15px;
	margin: 5px 0px 10px 10px;
	text-align: left;
}

table {
	margin-left: 50px;
}
</style>
</head>
<body style="background-color: #FFFFFF">

	<div class="wrap">
		<header>
			<jsp:include page="header.jsp"></jsp:include>
		</header>
	</div>
	<div id="menuLeft">
		<!-- snb 시작 -->
		<dl id="left_nav" style="margin-top: 200px; margin-left: -100px;">
			<dt class="">회원정보수정</dt>
			<dd>
				<a href="javascript:void(0)"
					onclick="javascript:$('input[name=PARENT_MENU_CD]').val('');$('input[name=LEFT_MENU_CD]').val('G1001');$('input[name=TOP_MENU_CD]').val('G1000');goMenu('G1001','http://localhost/controller/loginFrm');">로그인
				</a>
			</dd>
			<dd>
				<a href="javascript:void(0)" class="on"
					onclick="javascript:$('input[name=PARENT_MENU_CD]').val('');$('input[name=LEFT_MENU_CD]').val('G1002');$('input[name=TOP_MENU_CD]').val('G1000');goMenu('G1002','http://localhost/controller/joinFrm');">회원가입
				</a>
			</dd>
			<dd>
				<a href="javascript:void(0)"
					onclick="javascript:$('input[name=PARENT_MENU_CD]').val('');$('input[name=LEFT_MENU_CD]').val('G1003');$('input[name=TOP_MENU_CD]').val('G1000');goMenu('G1003','http://localhost/controller/mmId');">아이디찾기
				</a>
			</dd>
			<dd>
				<a href="javascript:void(0)"
					onclick="javascript:$('input[name=PARENT_MENU_CD]').val('');$('input[name=LEFT_MENU_CD]').val('G1004');$('input[name=TOP_MENU_CD]').val('G1000');goMenu('G1004','http://localhost/controller/mmPwd');">비밀번호찾기
				</a>
			</dd>
		</dl>
	</div>
	<div class="section join01">

		<ul class="join_step">

			<li><img src="resources/images/join_step_03.jpg" alt="회원정보입력"
				title="회원정보입력" style="margin-top: 100px;"/></li>

		</ul>


		<p>&nbsp;</p>
		<p style="width: 780px; text-align: right;">&nbsp;</p>
		<p style="width: 780px; text-align: right;">&nbsp;</p>

		<br />
		<div class="box0">
			<form name="mmJoin" action="memInsert" method="post">
				
					<p>일반 회원가입</p>
				
				<table brder="" bgcolor="#FFFFFF" cellspacing="1">

					<tr>
						<td>ID</td>
						<td><input type="text" size="20" class="login-input" id="mid"
							title="아이디" name="mid" autofocus placeholder="아이디 입력" required />
							<input type="button" class="btn_type10" value="중복체크"
							onclick="idcheck()"></td>
					</tr>

					<tr>
						<td align="right">PW</td>
						<td><input type="password" id="password_1" size="20"
							class="pw" title="비밀번호" name="password" placeholder="비밀번호 입력"
							required> <span>8~15자리의 영문,숫자,특수문자의 입력이 가능합니다.</span></td>
					</tr>

					<tr>
						<td text-align="center">PW확인</td>
						<td><input type="password" id="password_2" size="20"
							class="pw" placeholder="비밀번호 확인"> <span
							id="alert-success" style="display: none;">비밀번호가 일치합니다.</span> <span
							id="alert-danger"
							style="display: none; color: #d92742; font-weight: bold;">비밀번호가
								일치하지 않습니다.</span></td>

					</tr>
					<tr>
						<td text-align="center">이름</td>
						<td><input type="text" size="20" name="name" title="이름"
							value="" required />
					</tr>
					<tr>
						<td text-align="center">생년월일</td>
						<td><input type="text" size="20" name="birth" title="생년월일"
							value="" required />예)19950329
					</tr>

					<tr>
						<td text-align="center">성별</td>
						<td><input type="text" size="10" name="gender" title="성별"
							value="" required />예)남자, 여자
					</tr>

					

					<tr>
						<td text-align="center">이메일</td>
						<td><input type="text" size="30" name="email" title="이메일"
							value="" required />
					</tr>

					<tr>
						<td>주소</td>
						<td>우편번호 : <input type="text" name="zip"
							style="width: 80px; height: 26px;" />
							<button type="button" class="btn_type90"
								style="width: 60px; height: 32px;" onclick="openZipSearch()">검색</button>
							<br> <br>상세 주소: <input type="text" name="address"
							style="width: 300px; height: 30px;" required />
					</tr>

					<tr>
						<td text-align="center">전화번호</td>
						<td><input type="text" size="20" name="phone"
							placeholder="-제외하고 입력바랍니다." required />
					</tr>
					<tr>
						<td text-align="center">운전면허종류</td>
						<td><input type="text" size="20" name="license_type"
							title="운전면허종류" placeholder="면허증에 기입된 종류를 적어주세요." required/>
					</td>
						
					<tr>
						<td text-align="center">운전면허증등록번호</td>
						<td><input type="text" size="20" name="license_num"
							title="운전면허증등록번호" placeholder="-제외하고 입력바랍니다." required />
					</tr>
					
					<tr>
						<td text-align="center">운전면허종료일</td>
						<td><input type="text" size="20" name="license_end"
							title="운전면허증등록번호" placeholder="면허증에 기입된 종료일을 적어주세요." required />
					</tr>
					
					<tr>
						<td text-align="center">운전면허증발급일</td>
						<td><input type="text" size="20" name="license_start"
							title="운전면허증등록번호" placeholder="면허증에 기입된 발급일을 적어주세요." required />
					</tr>
					
					</tr>
					<tr>
						<td>운전면허증사진</td>
						<td><div class="filebox">
								<label for="file"></label> <input type="file" name="files"
									id="file"> <input class="upload-name" value="파일선택"
									readonly> <input type="hidden" id="filecheck" value="0"
									name="fileCheck">
							</div></td>
				</table>
				<br /> <br />
				<button type="submit" class="btn_type20">가입하기</button>
			</form>
		</div>
	</div>
	<footer>
		<jsp:include page="footer.jsp"></jsp:include>
		<!--<div class="fancybox-placeholder" style="display: none;"></div>-->
	</footer>
</body>
<script type="text/javascript">
	function openZipSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				$('[name=zip]').val(data.zonecode); // 우편번호 (5자리)
				$('[name=address]').val(data.address);
				$('[name=address]').val(data.buildingName);
			}
		}).open();
	}

	function idcheck() {
		var id = $('#mid').val();
		if (id == "") {
			alert("아이디를 입력하세요.");
			$('#mid').focus();
			return;
		}
		var ckObj = {
			"mid" : id
		};
		console.log(ckObj);

		$.ajax({
			url : "idCheck",
			type : "get",
			data : ckObj,
			success : function(data) {
				if (data == "success") {
					alert('사용 가능한 ID 입니다.');
				} else {
					alert('사용 할 수 없는 ID 입니다.');
					$('#mid').val('');
					$('#mid').focus();
				}

			},
			error : function(error) {
				console.log(error);
			}

		});
	}
</script>
<script>
	$('.pw').focusout(function() {
		var pwd1 = $("#password_1").val();
		var pwd2 = $("#password_2").val();

		if (pwd1 != '' && pwd2 == '') {
			null;
		} else if (pwd1 != "" || pwd2 != "") {
			if (pwd1 == pwd2) {
				$("#alert-success").css('display', 'inline-block');
				$("#alert-danger").css('display', 'none');
			} else {
				alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인 해주세요");
				$("#alert-success").css('display', 'none');
				$("#alert-danger").css('display', 'inline-block');
			}

		}
	});
</script>
<script type="text/javascript">
	$("#file").on('change', function() {
		var fileName = $("#file").val();
		$(".upload-name").val(fileName);

		if (fileName == "") {
			console.log("empty");
			$("#filecheck").val(0);
		} else {
			console.log("not empty");
			$("#filecheck").val(1);
		}
	});
</script>
</html>