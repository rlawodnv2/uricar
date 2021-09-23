<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>차량목록페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquert.min.js"></script>
<script type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){
	var chk = "${check}";
	
	if(chk == "2"){
		alert("차량 등록 성공!");
		location.reload(true);
	}
	if(chk == "3"){
		alert("자량 삭제 성공!");
		location.reload(true);
	}
	
	var name = "${cm.cm_name}";
	$('#cmname').html(name + '님');
	$('.suc').css('display', 'block');
	$('.bef').css('display', 'none');
});

</script>
</head>
<body>
<header>
	<jsp:include page="header.jsp"></jsp:include>
	</header>
<div class="wrap">
	<section>
	<div class="content">
		<div class="board-form">
		<h2 class="login-header">차량 목록</h2>
		<div class="data-area">
			<div class="title-row">
				<div class="t-no p-10">번호</div>
				<div class="t-title p-30">제목</div>
				<div class="t-name p-15">작성자</div>
				<div class="t-date p-30">작성일</div>
			</div>
			<c:forEach var="cbitem" items="${cbList}">
			<div class="data-row">
				<div class="t-no p=10">${cbitem.cbnum}</div>
				<div class="t-title p-30"><a href="contents?cbnum=${cbitem.cbnum}">
					${cbitem.ctitle}</a></div>
				<div class="t-name p-15">${cbitem.cid}</div>
				<div class="t-date p-30">${cbitem.cbdate}</div>
				
			</div>
			</c:forEach>
		</div>
		<div class="btn-area">
			<div class="paging">${paging}</div>
			<button class="wr-btn" onclick="location.href='./carInsert'">차랑등록하기</button>
		</div>
	</div>
	</div>
	</section>
</div>
<footer>
	<jsp:include page="footer.jsp"></jsp:include>
	<!--<div class="fancybox-placeholder" style="display: none;"></div>-->
	</footer>
</body>
</html>