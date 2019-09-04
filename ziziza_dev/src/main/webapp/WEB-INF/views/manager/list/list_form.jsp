<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    			<h1>사업장 관리</h1>
    		</div>
	       	<div class="row">
      			<div class= "col-xs-12">
                	<table class="table table-bordered">
	                    <thead class="text-center">
	                       <tr>
	                          <th scope="col" class="col-xs-1">번호</th>
	                          <th scope="col" class="col-xs-5">상호명</th>
	                          <th scope="col" class="col-xs-3">등록일</th>
	                          <th scope="col" class="col-xs-1">상태</th>
	                       </tr>
	                    </thead>
	                    
                        <c:forEach items="${list}" var="vo" varStatus="status">
	                     	<tbody>   
									<tr>
										<td>${vo.companyNo}</td>
										<td><a href='<c:url value="/manager/company/detail?companyNo=${vo.companyNo}"/>' title="게시물 정보 보기">${vo.companyName}</a></td>
										<td>${vo.registDate}</td>
										<td>${vo.state}</td>
									</tr>
	                     	</tbody>
						</c:forEach>
						
                  	</table>
                  	
			  		<div class="row text-right">
						<div class="form-group">
							<a href='<c:url value="/manager/company/regist?mngNo=${loginUser.mngNo}"/>'><input type="button" class="btn btn-info btn-lg registbtn" value="등록"></a>
						</div>
					</div>
     			</div>
   			</div>
   			
			
   			<div class="row">
                <div class="col-md-12 text-center">
                    <ul class="pagination pagination-lg">
                        <li><a href="#"><i class="fa fa-long-arrow-left"></i></a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#"><i class="fa fa-long-arrow-right"></i></a></li>
                    </ul>
                    <!--/.pagination-->
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
