<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%--
--%><%@ include file="../include/common.jsp" %><%--
--%><!DOCTYPE html>
<html>
<head>
<c:import url="../include/head.jsp"/>
<c:import url="../include/app.jsp"/>
<script>
/**
 * 	관리자 페이지 로그인 JS
 */
var form;
$(function(){
	form = $(".signIn");
	form.validate({
        debug: false,   //debug가 true인 경우 validation 후 submit을 수행하지 않음
        focusCleanup: true, //true이면 잘못된 필드에 포커스가 가면 에러를 지움
        rules: rules,
        messages: messages,
        errorPlacement: function (error, element) {
        	element.parent().find(".message").addClass("error").text(error.text());
        },
        success: function(error, element) {
        	$(element).parent().find(".message").removeClass("error").text("OK");
        },
        submitHandler: function(){
        	var formData = new FormData(form[0]);
			$.ajax({
				url: form.attr("action"), 
				data:formData, 
				//data:form.serialize(),
				dataType:'json', 
				processData:false, 
				contentType :false,
				type: form.attr("method"), 
				success:function(data, status, xhr){
// 					console.log(data, status, xhr);
					if(data.result){
						commonAlert("로그인 성공", data.returnURL);
					}else{
						commonAlert(data.message);
					}
				}, 
				error:function(xhr, status, error){
// 					console.log(xhr, status, error);
					commonAlert("처리 오류 잠시후 다시 시도해 주세요.");
				}
			});//ajax
        }
    });
});
var rules = {
	userId: {
        required: true
    },
    userPw: {
        required: true
    }
};
var messages = {
	userId: {
         required : "아이디를 입력하세요."
	},
	userPw: {
		 required : "비밀번호를 입력하세요."
    }
};
</script>
</head>
<body>
<div id="wrap" class="hideNav">
	<!-- HEADER -->
	<header id="header">
		<div class="header">
			<div class="topBox">
				<h1 class="logo">관리자 페이지</h1>
			</div>
		</div><!-- /.header -->
	</header><!-- /#header -->
	<!-- Content -->
	<div id="container">
		<div class="contentWrap">
			<div class="contents">
				<form action='<c:url value="/admin/login"/>' name="signIn" class="signIn" method="post">
					<fieldset class="box">
						<legend class="hide">로그인 폼</legend>
						<input type="hidden" name="board" value="login"/>
						<p>
							<label for="userId">아이디</label><input type="text" name="userId" id="userId"/>
							<span class="message"></span>
						</p>
						<p>
							<label for="userPw">비밀번호</label><input type="password" name="userPw" id="userPw"/>
							<span class="message"></span>
						</p>
					</fieldset>
					<fieldset class="fOpt">
						<button type="submit" class="rBtn">로그인</button>
					</fieldset>
				</form>
			</div><!-- /.contents -->
		</div><!-- /.contentWrap -->
	</div><!-- /#container -->
	<c:import url="../include/footer.jsp"/>
</div><!-- /#wrap -->
<c:import url="../include/modal.jsp"/>
</body>
</html>