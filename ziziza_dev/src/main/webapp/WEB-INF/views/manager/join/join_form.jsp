<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>찜질방의 모든 정보 지지자</title>

    <!-- core CSS -->
    <link href="/corlate/css/bootstrap.min.css" rel="stylesheet">
    <link href="/corlate/css/font-awesome.min.css" rel="stylesheet">
    <link href="/corlate/css/animate.min.css" rel="stylesheet">
    <link href="/corlate/css/prettyPhoto.css" rel="stylesheet">
    <link href="/corlate/css/owl.carousel.min.css" rel="stylesheet">
    <link href="/corlate/css/icomoon.css" rel="stylesheet">
    <link href="/corlate/css/main.css" rel="stylesheet">
    <link href="/corlate/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    <script src="/corlate/js/jquery.js"></script>
    <script src="/corlate/js/bootstrap.min.js"></script>
    <script src="/corlate/js/jquery.prettyPhoto.js"></script>
    <script src="/corlate/js/owl.carousel.min.js"></script>
    <script src="/corlate/js/jquery.isotope.min.js"></script>
    <script src="/corlate/js/main.js"></script>
    <script type="text/javascript">
    	$(function() {
    		$(":checkbox").click(function(){
				if($(this).val() == 0) {
					$(this).val(1);
				} else if($(this).val() == 1) {
					$(this).val(0);
				}
			});//click
			
			$("#id_chk").click(function() {
				if($.trim($("#memberId").val()) == ""){
					alert("ID는 필수 입력 사항입니다.");
					$("#mbr_id").focus();
					return;
				}
				$.post("/manager/company/joinIdChk",
						{memberId:$("#memberId").val()},
						function(data,status){
							if(data == 0){
								alert("사용 가능한 ID 입니다.");
								chkid = $("#mbr_id").val();
								chkidyn = 1;
							}else{
								alert("이미 사용 중인 ID 입니다.");
							}
						}
				);
			});
			
			$(".joinBtn").click(function() {
				if($("#agree1").val() == 0){
					alert("서비스 이용 약관 동의 후 회원 가입 바랍니다.");
					$("#agree1").focus();
					return;
				}
				if($("#agree2").val() == 0){
					alert("개인 정보 제공 약관 동의 후 회원 가입 바랍니다.");
					$("#agree2").focus();
					return;
				}
				if($.trim($("#memberName").val()) == ""){
					alert("이름을 입력하세요.");
					return;
				}
				if($.trim($("#memberId").val()) == ""){
					alert("아이디를 입력하세요.");
					return;
				}
				if($.trim($("#password").val()) == ""){
					alert("비밀번호를 입력하세요.");
					return;
				}
				if($("#password").val() != $("#password_re").val()){
					alert("PWD와 Confirm PWD가 서로 다릅니다.\n다시 PWD 확인을 해주세요.");
					$("#password").focus();
					return;
				}
				if($.trim($("#phone").val()) == ""){
					alert("휴대전화 번호를 입력하세요.");
					return;
				}
				if($.trim($("#email").val()) == ""){
					alert("이메일 주소를 입력하세요.");
					return;
				}
				if($.trim($("#mngName").val()) == ""){
					alert("대표자 성명을 입력하세요.");
					return;
				}
				if($.trim($("#repTel").val()) == ""){
					alert("사업장 대표 번호를 입력하세요.");
					return;
				}
				if($.trim($("#bizNo").val()) == ""){
					alert("사업자 등록 번호를 입력하세요.");
					return;
				}
					$.post("/manager/company/joinInsert"
						,{										
							memberName:$("#memberName").val()						
							,memberId:$("#memberId").val()	
							,password:$("#password").val()		
							,phone:$("#phone").val()
							,email:$("#email").val()
							,mngName:$("#mngName").val()
							,repTel:$("#repTel").val()
							,bizNo:$("#bizNo").val()
						}//data
						,function(data,status){
							if(status == "success"){
									if(data > 0){
										alert("저장 되었습니다.");
										location.href="/manager/login";
									} else {
										alert("잠시 후에 다시 시도해 주세요.");
									}
							} else {
								alert("admin : 02-5555-7777");
							}
						}//function
					);//post
			});//joinBtn
		});
    </script>
</head>
<!--/head-->

<body>

    <header id="header">
        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/manager/main"><img src="/corlate/images/logo.png" alt="logo"></a>
                </div>

                <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                       <li><a href="/manager/company/">공지사항</a></li>
               			<li><a href="/manager/company/join">회원가입</a></li>
                      	<li><a href="/manager/login">로그인</a></li>
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
    </header><!--/header-->

    <section id="contact-page">
    	<div class="container">
    		<div class="large-title text-center">
    			<h1>회원가입</h1>
    		</div>
	       	 	<div class="form-row">
	       	 		<div class="form-group col-md-6">
		     		 	<label for="memberName">이름</label>
		      			<input type="text" class="form-control" id="memberName" name="memberName" placeholder="이름을 입력하세요.">
		    		</div>
		    		<div class="form-group col-md-5">
		     			<label for="memberId">아이디</label>
		     			<input type="text" class="form-control" id=memberId name="memberId" placeholder="아이디를 입력하세요.">
		    		</div>
		    		<div class="form-group col-md-1">
		    			<label for="id_chk">중복검사</label>
		     			<input type="button" class="form-control btn-success" id="id_chk" value="확인">
		    		</div>
		  		</div>
		  		<div class="form-group">
		    		<div class="form-group col-md-6">
		     			<label for="password">비밀번호</label>
		     			<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
		    		</div>
		    		<div class="form-group col-md-6">
			     	 	<label for="password_re">비밀번호 확인</label>
			      		<input type="password" class="form-control" id="password_re" placeholder="비밀번호 확인">
		    		</div>
		  		</div>
		  		<div class="form-group">
		    		<div class="form-group col-md-6">
		     			<label for="phone">휴대전화</label>
		     			<input type="tel" class="form-control" id="phone" name="phone" placeholder="휴대전화 번호를 입력하세요.">
		    		</div>
		    		<div class="form-group col-md-6">
		     	 		<label for="email">이메일 주소</label>
		      			<input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요.">
		    		</div>
		  		</div>
		  		<div class="form-group">
		  			<div class="form-group col-md-12">
			  			<p>
						  <a class="btn btn-success" data-toggle="collapse" href="#agreeText1" role="button" aria-expanded="false" aria-controls="collapseExample">
						   		서비스 이용 약관
						  </a>
						</p>
						<div class="collapse" id="agreeText1">
						  <div class="card card-body">
						   		서비스 이용 약관입니다.
						  </div>
						</div>
						<p>
						  <a class="btn btn-success" data-toggle="collapse" href="#agreeText2" role="button" aria-expanded="false" aria-controls="collapseExample">
						    	개인 정보 제공 약관
						  </a>
						</p>
						<div class="collapse" id="agreeText2">
						  <div class="card card-body">
						  		 개인 정보 제공 약관 약관입니다.
						  </div>
						</div>
						<div class="form-check">
      						<input class="form-check-input" type="checkbox" id="agree1" name="agree1" value="0">
      						<label class="form-check-label" for="terms_chk">
       						서비스 이용 약관 동의
     						</label>
     						<input class="form-check-input" type="checkbox" id="agree2" name="agree2" value="0">
      						<label class="form-check-label" for="terms_chk">
       						 개인 정보 제공 약관 동의
     						</label>
    					</div>
		  			</div>
		  		</div>
		  		<div class="form-group">
		  			<div class="form-group col-md-12">
		  				<button class="form-control btn-danger nextBtn" type="button" data-toggle="collapse" data-target="#collapseExample2" aria-expanded="false" aria-controls="collapseExample2">
    					2단계 입력
  						</button>
  						<div class="collapse" id="collapseExample2">
  							<div class="card card-body">
   								<div class="large-title text-center">
    								<h1>2단계</h1>
    							</div>
   								<div class="form-group">
   									<div class="form-group col-md-6">
    									<label for="mngName">대표자</label>
		      							<input type="text" class="form-control" id="mngName" name="mngName" placeholder="대표자 성명을 입력하세요.">
	      							</div>
	      							<div class="form-group col-md-6">
    									<label for="repTel">대표번호</label>
		      							<input type="tel" class="form-control" id="repTel" name="repTel" placeholder="사업장 대표 번호를 입력하세요.">
		      						</div>
		      						<div class="form-group col-md-6">
    									<label for="bizNo">사업자등록번호</label>
		      							<input type="text" class="form-control" id="bizNo" name="bizNo" placeholder="사업자등록번호를 입력하세요.">
	      							</div>
	      							<div class="form-group col-md-12">
    									<label for="exampleFormControlFile1">사업자 등록증 및 첨부파일</label>
    									<input type="file" class="form-control-file" id="exampleFormControlFile1">
	      							</div>
   								</div>
   								<div class="form-group">
   									<div class="form-group col-md-6">
    									<input type="button" class="form-control btn-info joinBtn" value="회원가입">
	      							</div>
	      							<div class="form-group col-md-6">
    									<input type="button" class="form-control btn-warning cancelBtn" value="취소">
	      							</div>
   								</div>
  							</div>
						</div>
		  			</div>
		  		</div>
	  	</div><!-- container -->
    </section><!--/#contact-page-->


    <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    &copy; 2013 <a target="_blank" href="http://shapebootstrap.net/" title="Free Twitter Bootstrap WordPress Themes and HTML templates">ShapeBootstrap</a>. All Rights Reserved.
                </div>
                <div class="col-sm-6">
                    <ul class="pull-right">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Faq</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
    <!--/#footer-->

</body>

</html>
