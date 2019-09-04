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
			$(".registBtn").click(function() {
				if($.trim($("#companyName").val()) == ""){
					alert("상호명을 입력하세요.");
					return;
				}
				if($.trim($("#companyTel").val()) == ""){
					alert("전화번호를 확인하세요.");
					return;
				}
				if($.trim($("#openTime").val()) == ""){
					alert("오픈 시간을 확인하세요.");
					return;
				}
				if($.trim($("#closeTime").val()) == ""){
					alert("마감 시간을 확인하세요.");
					return;
				}
				if($.trim($("#subject").val()) == ""){
					alert("요금 대상을 확인하세요.");
					return;
				}
				if($.trim($("#price").val()) == ""){
					alert("요금을 확인하세요.");
					return;
				}
				if($.trim($("#address").val()) == ""){
					alert("소재지를 확인하세요.");
					return;
				}
				if($.trim($("#contents").val()) == ""){
					alert("사업장 소개를 확인하세요.");
					return;
				}
				$.post("/manager/company/insert"
					,{											//table
						companyName:$("#companyName").val()	//사업장
						,companyKind:$("#companyKind").val()	//사업장
						,companyTel:$("#companyTel").val()		//사업장
						,openTime:$("#openTime").val()		//사업장
						,closeTime:$("#closeTime").val()	//사업장
						,timeKind:$("#timeKind").val()		//요금
						,subject:$("#subject").val()			//요금
						,price:$("#price").val()			//요금
						,address:$("#address").val()		//사업장
						,contents:$("#contents").val()	//사업장
						,plantName:$("#plantName").val()	//편의시설
						,mngNo:$("#hidNo").val()
					}//data
					,function(data,status){
						if(status == "success"){
								if(data > 0){
									alert("저장 되었습니다.");
									location.href="/manager/company/list?mngNo=${loginUser.mngNo}";
								} else {
									alert("잠시 후에 다시 시도해 주세요.");
								}
						} else {
							alert("admin : 02-5555-7777");
						}
					}//function
				);//post
			});//registBtn
			
			$(".listBtn").click(function() {
				location.href="/manager/company/list?mngNo=${loginUser.mngNo}";
			});//listBtn
			
			$(".registBtn").click(function() {
				var form = new FormData(document.getElementById("imgform"));
				$.ajax({
					url:"manager/company/fileUp"
					,data:form
					,dataType:"text"
					,processData:false
					,contentType:false
					,type:"POST"
					,success:function(rusult){
						alert("success");
					}
					,error:function(xhr){
						alert("fail");
					}
				});			});//registBtn

		});
    </script>
</head>
<!--/head-->

<body>
<input type="hidden" id="hidNo" value="${loginUser.mngNo}" />
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
    			<h1>사업장 등록</h1>
    		</div>
	       	 	<div class="row">
		    		<div class="form-group col-md-4 col-md-offset-2">
		     			<label for="companyName">상호명</label>
 		     			<input type="text" id="companyName" class="form-control" name="companyName" placeholder="상호명 입력">
		    		</div>
		    		<div class="form-group col-md-2">
		    			<label for="companyKind">종류</label>
 		     			<select id="companyKind" name="companyKind" class="form-control">
 		     				<option value="찜질방" <c:if test="${fn:contains(vo.companyKind, '찜질방')}">selected</c:if>>찜질방</option>
 		     				<option value="사우나" <c:if test="${fn:contains(vo.companyKind, '사우나')}">selected</c:if>>사우나</option>
 		     				<option value="목욕탕" <c:if test="${fn:contains(vo.companyKind, '목욕탕')}">selected</c:if>>목욕탕</option>
 		     			</select>
		    		</div>
		    		<div class="form-group col-md-2" >
		     		 	<label for="companyTel">전화번호</label>
 		      			<input type="tel" id="companyTel" class="form-control" name="companyTel" placeholder="전화번호 입력">
		    		</div>
		  		</div>
		  		<div class="row">
		    		<div class="form-group col-md-4 col-md-offset-2">
		    			<label for="openTime">open시간</label>
		     			<input type="text" id="openTime" class="form-control" name="openTime" placeholder="ex)00:00">
		    		</div>
		    		<div class="form-group col-md-4">
			     	 	<label for="closeTime">close시간</label>
			      		<input type="text" id="closeTime" class="form-control" name="closeTime"  placeholder="ex)24:00">
		    		</div>	
		    	</div>
		    	<div class="row">	
		    		<div class="form-group col-md-2 col-md-offset-2">
		     			<label for="timeKind">주/야</label>
		    		</div>
		    		<div class="form-group col-md-2">
		     			<label for="subject">대상</label>
		    		</div>
		    		<div class="form-group col-md-3">
		     			<label for="price">요금</label>
		    		</div>
		    	</div>
		    	<div class="row">
		    		<div class="form-group col-md-2 col-md-offset-2">
		     			<select id="timeKind" name="timeKind" class="form-control">
		     				<option value="주간" <c:if test="${fn:contains(vo.timeKind, '주간')}">selected</c:if>>주간</option>
		     				<option value="야간" <c:if test="${fn:contains(vo.timeKind, '야간')}">selected</c:if>>야간</option>
 		     			</select>
		    		</div>
		    		<div class="form-group col-md-2">
		     			<input type="text" id="subject" class="form-control" name="subject"  placeholder="대상 입력"/>
		    		</div>
		    		<div class="form-group col-md-3">
		     			<input type="text" id="price" class="form-control" name="price" placeholder="요금 입력"/>
		    		</div>
		    		<div class="form-group col-md-1" >
 		      			<input type="button" id="priceAdd" class="form-control btn-success" value="추가"/>
		    		</div>		
		    	</div>
		    	<div class="row">
		    		<div class="form-group col-md-6 col-md-offset-2" id="chargeArea">
		    		</div>
		    	</div>	

		  		<div class="row">
		    		<div class="form-group col-md-8 col-md-offset-2">
		    			<label for="address">소재지</label>
		    			<input type="text" id="address" class="form-control" name="address" placeholder="소재지 입력">
		    		</div>	
		    	</div>
		    	<div class="row">
		    		<div class="form-group col-md-8 col-md-offset-2">
		     			<label for="contents">소개</label>
		     			<textarea id="contents" required="required" class="form-control" name="contents" rows="3"></textarea>
		    		</div>
		    	</div>
		    	<div class="row">	
		    		<div class="form-group col-md-8 col-md-offset-2">
		     			<label for="plantName">편의시설</label>
		    		</div>
		    	</div>
		    	<div class="row">
		    		<div class="form-group col-md-2 col-md-offset-2">
			    		<select id="plantName" name="plantName" class="form-control">
		     				<option value="주차장" <c:if test="${fn:contains(vo.plantName, '주차장')}">selected</c:if>>주차장</option>
		     				<option value="수면실" <c:if test="${fn:contains(vo.plantName, '수면실')}">selected</c:if>>수면실</option>
		     				<option value="매점" <c:if test="${fn:contains(vo.plantName, '매점')}">selected</c:if>>매점</option>
			     		</select>
			     	</div>
			     	<div class="form-group col-md-1">
			     		<input type="button" id="plantAdd" class="form-control btn-success" value="추가"/>
			     	</div>
		    	</div>
		    	<div class="row">
			    	<form id="imgform" class="form-group col-md-2 col-md-offset-2" action="mng/company/fileUp" method="post" enctype="multipart/form-data">
			    		<label for="imgChumbu">사진 첨부</label>
						<input type="file" id="imgChumbu" name="imgChumbu"/>
						<input type="file" id="imgChumbu2" name="imgChumbu2"/>
					</form>
				</div>
				
		  		<div class="row">	
		  			<div class="form-group col-md-1 col-md-offset-8">
		     			<button type="button" class="form-control btn-warning listBtn" id="inputPassword4">취소</button>
		  			</div>
		  			<div class="form-group col-md-1">
		     			<button type="submit" class="form-control btn-info registBtn">확인</button>
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
