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
			$(".deleteBtn").click(function() {
				var del_yn = false;
				del_yn = confirm("정말로 삭제하시겠습니까?");
				if(del_yn == false){
					return;
				}
				$.get("/manager/company/delete"
						,{
							companyNo:$("#hidNo").val()
						}//data
						,function(data,status) {
							if(status == "success") {
								if(data > 0){
									alert("삭제 되었습니다.");
									location.href="/manager/company/list?mngNo=${loginUser.mngNo}";
								} else {
									alert("잠시 후 다시 시도해 주세요.");
								}
							} else {
								alert("admin : 02-5555-7777");
							}
						}//function
				);//get
			});//deleteBtn
		});
    	
    	$(function() {
			$(".listBtn").click(function() {
				location.href="/manager/company/list?mngNo=${loginUser.mngNo}";
			});
		});
    	
    	$(function() {
			$(".modifyBtn").click(function() {
				location.href="/manager/company/modify?companyNo=${detailVO.companyNo}";
			});
		});
    	
    	$(function() {
			$("#companyPromotion").click(function() {
				location.href="/manager/company/promotion?companyNo=${detailVO.companyNo}";
			});
		});
    </script>
</head>
<!--/head-->

<body>
<input type="hidden" id="hidNo" value="${detailVO.companyNo}" />
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
    			<h2>${detailVO.companyName}</h2>
    			<br>
    			<h1>상세페이지</h1>
    		</div>
    			<div class="row">
    				<div class="form-group col-md-2 col-md-offset-2">
    					<button type="button" class="form-control btn-primary" id="companyInfo">사업장 정보</button>
    				</div>
    				<div class="form-group col-md-2">
    					<button type="button" class="form-control btn-primary" id="companyPromotion">프로모션</button>
    				</div>
    				<div class="form-group col-md-2">
    					<button type="button" class="form-control btn-primary" id="companyReview">리뷰</button>
    				</div>
    			</div>
    			<br>
	       	 	<div class="row">
		    		<div class="form-group col-md-4 col-md-offset-2">
		     			<label for="companyName">상호명</label>
		     			<input type="text" class="form-control" id="companyName" name="companyName" disabled value="${detailVO.companyName}">
		    		</div>
		    		<div class="form-group col-md-2">
		    			<label for=companyKind>종류</label>
 		     			<input type="text" class="form-control" id="companyKind" name="companyKind" disabled value="${detailVO.companyKind}">
		    		</div>
		    		<div class="form-group col-md-2" >
		     		 	<label for="companyTel">전화번호</label>
 		      			<input type="tel" class="form-control" id="companyTel" name="companyTel" disabled value="${detailVO.companyTel}">
		    		</div>	
		  		</div>
		  		<div class="row">
		    		<div class="form-group col-md-4 col-md-offset-2">
		    			<label for="openTime">open시간</label>
		     			<input type="text" class="form-control" id="openTime" name="openTime" disabled value="${detailVO.openTime}">
		    		</div>
		    		<div class="form-group col-md-4">
			     	 	<label for="closeTime">close시간</label>
			      		<input type="text" class="form-control" id="closeTime" name="closeTime" disabled value="${detailVO.closeTime}">
		    		</div>	
		    	</div>
		    	<div class="row">	
		    		<div class="form-group col-md-2 col-md-offset-2">
		     			<label for="timeKind">주/야</label>
		     			<input type="text" class="form-control" id="timeKind" name="timeKind" disabled value="${detailChargeVO.timeKind}">
		    		</div>
		    		<div class="form-group col-md-2">
		     			<label for="subject">대상</label>
		     			<input type="text" class="form-control" id="subject" name="subject" disabled value="${detailChargeVO.subject}">
		    		</div>
		    		<div class="form-group col-md-4">
		     			<label for="price">요금</label>
		     			<input type="text" class="form-control" id="price" name="price" disabled value="${detailChargeVO.price}">
		    		</div>
		    	</div>
		    	<div class="row">
		    		<div class="form-group col-md-8 col-md-offset-2">
		 			</div>
		  		</div>
		  		<div class="row">
		    		<div class="form-group col-md-8 col-md-offset-2">
		    			<label for="address">소재지</label>
		    			<input type="text" id="address" class="form-control" name="address" disabled value="${detailVO.address}">
		    		</div>	
		    	</div>
		    	<div class="row">	
		    		<div class="form-group col-md-8 col-md-offset-2">
		     			<label for="contents">소개</label>
		     			<input type="text" id="contents" class="form-control" name="contents" disabled value="${detailVO.contents}">
		    		</div>
		    	</div>
		    	<div class="row">	
		    		<div class="form-group col-md-6 col-md-offset-2">
		     			<label for="plantName">편의시설</label>
		     			<input type="text" id="plantName" class="form-control" name="plantName" disabled value="${detailChargeVO.plantName}">
		    		</div>
		    	</div>
		    	<div class="row">
		    		<div class="form-group col-md-2 col-md-offset-2">
		     			<button type="submit" class="btn btn-success" id="inputPassword4">첨부이미지</button>
		     			<div class="chumbuimage">
		     			</div>
		    		</div>
		  		</div>
		  		<div class="row">
		  			<div class="form-group col-md-1 col-md-offset-2">
		     			<button type="submit" class="form-control btn-danger deleteBtn" id="deleteBtn">삭제</button>
		  			</div>
		  			<div class="form-group col-md-1 col-md-offset-5">
		     			<button type="submit" class="form-control btn-warning listBtn" id="listBtn">목록</button>
		  			</div>
		  			<div class="form-group col-md-1">
		     			<button type="submit" class="form-control btn-info modifyBtn" id="inputPassword4">수정</button>
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
