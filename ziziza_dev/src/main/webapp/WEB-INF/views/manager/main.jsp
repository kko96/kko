<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			$("#managerInfo").click(function() {
				alert("로그인 해주세요.");
			});
		});
    </script>
</head>
<!--/head-->

<body class="homepage">

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
                        
                        <c:choose>
                        	<c:when test="${loginUser != null && loginUser.roleName != ''}">
                        		<li><a href="/manager/logout">로그아웃</a></li>
                        	</c:when>
                        	<c:otherwise>
                        		<li><a href="/manager/company/">공지사항</a></li>
                       			<li><a href="/manager/company/join">회원가입</a></li>
		                        <li><a href="/manager/login">로그인</a></li>
                        	</c:otherwise>
                        </c:choose>
                    </ul>
                </div>	
            </div>
            <!--/.container-->
        </nav>
        <!--/nav-->

    </header>
    <!--/header-->
    
    <section id="recent-works">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4 single-work">
                    <div class="recent-work-wrap">
                    	<c:choose>
                    		<c:when test="${loginUser != null && loginUser.roleName == 'MANAGER'}">
		                        <a href='<c:url value="/manager/company/info?memberNo=${loginUser.userNo}"/>'>
		                        	<img class="img-responsive" src="/corlate/images/portfolio/item-1.png" alt="">
		                        </a>
		                        <p id="form-text">사장님 정보</p>
                    		</c:when>
                    		<c:otherwise>
                    			<img class="img-responsive" src="/corlate/images/portfolio/item-1.png" alt="">
                    			<p id="form-text">사장님 정보</p>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-6 col-md-4 single-work">
                    <div class="recent-work-wrap">
                    	<c:choose>
                    		<c:when test="${loginUser != null && loginUser.roleName == 'MANAGER'}">
		                    	<a href='<c:url value="/manager/company/list?mngNo=${loginUser.mngNo}"/>'>                	
		                        	<img class="img-responsive" src="/corlate/images/portfolio/item-2.png" alt="">
		                        </a>
		                        <p id="form-text">사업장 관리</p>
		                    </c:when>
		                    <c:otherwise>
		                 	    <img class="img-responsive" id="managerInfo" src="/corlate/images/portfolio/item-2.png" alt="">
		                    	<p id="form-text">사업장 관리</p>
		                    </c:otherwise>
		                </c:choose>
                        
                    </div>
                </div>	

                <div class="col-xs-12 col-sm-6 col-md-4 single-work">
                    <div class="recent-work-wrap">
                        <img class="img-responsive" src="/corlate/images/portfolio/item-3.png" alt="">
                        <p id="form-text">고객 센터</p>
                        <div class="overlay" id="customerCenter">
                        </div>
                    </div>
                </div>
            </div>
			<br><br>
            <div class="row">
                <div class="col-md-12 single-work">
                    <div class="recent-work-wrap2">
                        <img class="img-responsive" src="/corlate/images/portfolio/item-4.png" alt="">
                        <p id="form-text2">공지사항</p>
                        <div class="overlay" id="noice">
                        </div>
                    </div>
                </div>
            </div>
            <!--/.row-->
        </div>
        <!--/.container-->
    </section>
 
    
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
