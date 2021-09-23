<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<html>
<head>
<title>우리떠날Car?로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=yes">
<meta name="keywords" content>
<meta name="author" content="manual">
<meta name="format-detection" content="telepnone=no">
<meta property="og:type" content="website">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="resources/css/footer.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/fancybox/jquery.fancybox.css" media="all">
<!-- Add jQuery library -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- Add mousewheel plugin (this is optional) -->
<script type="text/javascript" src="resources/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>

<!-- Add fancyBox -->
<link rel="stylesheet" href="resources/fancybox/source/jquery.fancybox.css?v=2.1.7" type="text/css" media="screen" />
<script type="text/javascript" src="resources/fancybox/source/jquery.fancybox.pack.js?v=2.1.7"></script>

<!-- Optionally add helpers - button, thumbnail and/or media -->
<link rel="stylesheet" href="resources/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" type="text/css" media="screen" />
<script type="text/javascript" src="resources/fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
<script type="text/javascript" src="resources/fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>

<link rel="stylesheet" href="resources/fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" type="text/css" media="screen" />
<script type="text/javascript" src="resources/fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>

</head>
<script type="text/javascript">
$(document).ready(function(){
	var msg = "${msg}";
	console.log(msg);
	if(msg != ""){
		alert(msg);
		location.reload(true);
	}
});
</script>
<script type="text/javascript">
$(document).ready(function() {
	/*
	 *  Simple image gallery. Uses default settings
	 */

	$('.fancybox').fancybox();

	/*
	 *  Different effects
	 */

	// Change title type, overlay closing speed
	$(".fancybox-effects-a").fancybox({
		helpers: {
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
		openEffect  : 'none',
		closeEffect	: 'none',

		helpers : {
			title : {
				type : 'over'
			}
		}
	});

	// Set custom style, close if clicked, change title type and overlay color
	$(".fancybox-effects-c").fancybox({
		wrapCSS    : 'fancybox-custom',
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
		padding: 0,

		openEffect : 'elastic',
		openSpeed  : 150,

		closeEffect : 'elastic',
		closeSpeed  : 150,

		closeClick : true,

		helpers : {
			overlay : null
		}
	});

	/*
	 *  Button helper. Disable animations, hide close button, change title type and content
	 */

	$('.fancybox-buttons').fancybox({
		openEffect  : 'none',
		closeEffect : 'none',

		prevEffect : 'none',
		nextEffect : 'none',

		closeBtn  : false,

		helpers : {
			title : {
				type : 'inside'
			},
			buttons	: {}
		},

		afterLoad : function() {
			this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');
		}
	});


	/*
	 *  Thumbnail helper. Disable animations, hide close button, arrows and slide to next gallery item if clicked
	 */

	$('.fancybox-thumbs').fancybox({
		prevEffect : 'none',
		nextEffect : 'none',

		closeBtn  : false,
		arrows    : false,
		nextClick : true,

		helpers : {
			thumbs : {
				width  : 50,
				height : 50
			}
		}
	});

	/*
	 *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
	*/
	$('.fancybox-media')
		.attr('rel', 'media-gallery')
		.fancybox({
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
		$.fancybox.open([
			{
				href : '1_b.jpg',
				title : 'My title'
			}, {
				href : '2_b.jpg',
				title : '2nd title'
			}, {
				href : '3_b.jpg'
			}
		], {
			helpers : {
				thumbs : {
					width: 75,
					height: 50
				}
			}
		});
	});


});
</script>
<link type="text/css" rel="stylesheet" href="resources/css/cmstyle.css">
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
   <div class="box0">
      <form name="cmJoin" action="memInsert" method="post"
         >
         <h3>
            <strong>기업 회원가입</strong>
         </h3>
         <table brder="" bgcolor="#FFFFFF" cellspacing="1">

            <tr>
               <td>ID</td>
               <td><input type="text" size="20" class="login-input" id="cid"
                  title="아이디" name="cid" autofocus placeholder="아이디 입력" required/> <input
                  type="button" class="btn_type10" value="중복체크" onclick="idcheck()">
               </td>
            </tr>

            <tr>
               <td align="right">PW</td>
               <td><input type="password" id="password_1" size="20"
                  class="pw" title="비밀번호" name="pw" placeholder="비밀번호 입력" required> <span>8~15자리의
                     영문,숫자,특수문자의 입력이 가능합니다.</span></td>
            </tr>

            <tr>
               <td text-align="center">PW확인</td>
               <td><input type="password" id="password_2" size="20"
                  class="pw" placeholder="비밀번호 확인"> <span id="alert-success"
                  style="display: none;">비밀번호가 일치합니다.</span> <span id="alert-danger"
                  style="display: none; color: #d92742; font-weight: bold;">비밀번호가
                     일치하지 않습니다.</span></td>

            </tr>

            <tr>
               <td text-align="center">사업주명</td>
               <td><input type="text" size="10" name="ceo" title="사업주명"
                  value="" required/>
            </tr>

            <tr>
               <td text-align="center">기업명</td>
               <td><input type="text" size="20" name="cname" title="기업명"
                  value="" required/>
            </tr>

            <tr>
               <td text-align="center">사업자 등록 번호</td>
               <td><input type="text" size="20" name="cnum" title="사업자 등록 번호"
                  placeholder="-제외하고 입력바랍니다." required/>
            </tr>

            <tr>
               <td text-align="center">이메일</td>
               <td><input type="text" size="30" name="email" title="이메일"
                  value="" required/>
            </tr>

            <tr>
               <td>주소</td>
               <td>우편번호 : <input type="text" name="zip"
                  style="width: 80px; height: 26px;" />
                  <button type="button" class="btn_type90"
                     style="width: 60px; height: 32px;" onclick="openZipSearch()">검색</button>
                  <br><br>상세 주소: <input
                  type="text" name="address" style="width: 300px; height: 30px;" required/>
            </tr>

            <tr>
               <td text-align="center">전화번호</td>
               <td><input type="text" size="20" name="phone"
                  placeholder="-제외하고 입력바랍니다." required/>
            </tr>

            <tr>
               <td>사업자 등록증 첨부</td>
               <td><div class="filebox">
                     <label for="file"></label>
                     <input type="file" name="files" id="file">
                     <input class="upload-name" value="파일선택" readonly>
                     <input type="hidden" id="filecheck" value="0" name="fileCheck">
                  </div>
               </td>
               
         </table>
         <br /> <br />
         <button type="submit" class="btn_type20">가입하기</button>
      </form>
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
      var id = $('#cid').val();
      if (id == "") {
         alert("아이디를 입력하세요.");
         $('#cid').focus();
         return;
      }
      var ckObj = {
         "cid" : id
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
               $('#cid').val('');
               $('#cid').focus();
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
$("#file").on('change',function(){
   var fileName = $("#file").val();
   $(".upload-name").val(fileName);
   
   if(fileName == ""){
      console.log("empty");
      $("#filecheck").val(0);
   }
   else{
      console.log("not empty");
      $("#filecheck").val(1);
   }
});
</script>
</html>