<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
			uri="http://java.sun.com/jsp/jstl/core" %>
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
			$(".cancelBtn").click(function() {
				location.href="/manager/company/info";
			});
			$(".modifyBtn").click(function() {
				var modify_yn = false;
				modify_yn = confirm("수정하시겠습니까?");
				if(modify_yn == false){
					return;
				}
				$.post("/manager/company/infoUpdate"
						,{	
							memberName:$("#memberName").val()						
							,memberId:$("#memberId").val()	
							,phone:$("#phone").val()
							,email:$("#email").val()
							,mngName:$("#mngName").val()
							,repTel:$("#repTel").val()
							,bizNo:$("#bizNo").val()
							,memberNo:$("#hidNo").val()
						}//data
						,function(data,status){
							if(status == "success"){
									if(data > 0){
										alert("저장 되었습니다.");
										location.href="/manager/company/info?memberNo=${loginUser.userNo}";
									} else {
										alert("잠시 후에 다시 시도해 주세요.");
									}
							} else {
								alert("admin : 02-5555-7777");
							}
						}//function
					);//post
			});
		});
    </script>
</head>
<!--/head-->

<body>
<input type="hidden" id="hidNo" value="${loginUser.userNo}" />
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
                        <li><a href="/manager/company/list?mngNo=${loginUser.mngNo}">사업장관리</a></li>
                        <li><a href="#">1:1문의</a></li>
                        <li><a href="#">내정보</a></li>          
                        <li><a href="/manager/logout">로그아웃</a></li>              
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
    </header><!--/header-->

    <section id="contact-page">
    	<div class="container">
    		<div class="large-title text-center">
    			<h1>사장님 정보</h1>
    		</div>
	       	 	<div class="row">
		    		<div class="form-group col-md-6">
		     			<label for="memberName">이름</label>
		     			<input type="text" class="form-control" id="memberName" name="memberName" value="${MemberVO.memberName}">
		    		</div>
		    		<div class="form-group col-md-6">
		     		 	<label for="memberId">아이디</label>
		      			<input type="text" class="form-control" id="memberId" name="memberId" value="${MemberVO.memberId}">
		    		</div>
		  		</div>
		  		<div class="row">
		    		<div class="form-group col-md-6">
		     			<label for="phone">휴대전화</label>
		     			<input type="text" class="form-control" id="phone" name="phone" value="${MemberVO.phone}">
		    		</div>
		    		<div class="form-group col-md-6">
			     	 	<label for="email">이메일 주소</label>
			      		<input type="text" class="form-control" id="email" name="email" value="${MemberVO.email}">
		    		</div>
		    	</div>
		    	<div class="row">	
		    		<div class="form-group col-md-6">
		     			<label for="mngName">대표자</label>
		     			<input type="text" class="form-control" id="mngName" name="mngName" value="${ManagerVO.mngName}">
		    		</div>
		    		<div class="form-group col-md-6">
		     	 		<label for="repTel">대표번호</label>
		      			<input type="text" class="form-control" id="repTel" name="repTel" value="${ManagerVO.repTel}">
		    		</div>
		    	</div>
		    	<div class="row">
		    		<div class="form-group col-md-6">
		     	 		<label for="bizNo">사업자등록번호</label>
		      			<input type="text" class="form-control" id="bizNo" name="bizNo" value="${ManagerVO.bizNo}">
		    		</div>
		    	</div>
		  		<div class="row">
					<div class="form-group col-md-6">
						<button type="submit" class="form-control btn-warning modifyBtn" id="inputPassword4">확인</button>
					</div>
					<div class="form-group col-md-6">
					<button type="submit" class="form-control btn-info cancelBtn" id="inputPassword4">취소</button>
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
