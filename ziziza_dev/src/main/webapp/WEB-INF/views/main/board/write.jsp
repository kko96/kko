<%@ page language="java"
	contentType="text/html; charset=UTF-8"
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
    <title>Home ziziza</title>

    <!-- core CSS -->
    <link href="../resources/corlate/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/corlate/css/font-awesome.min.css" rel="stylesheet">
    <link href="../resources/corlate/css/animate.min.css" rel="stylesheet">
    <link href="../resources/corlate/css/prettyPhoto.css" rel="stylesheet">
    <link href="../resources/corlate/css/owl.carousel.min.css" rel="stylesheet">
    <link href="../resources/corlate/css/icomoon.css" rel="stylesheet">
    <link href="../resources/corlate/css/main.css" rel="stylesheet">
    <link href="../resources/corlate/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" href="../resources/corlate/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../resources/corlate/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../resources/corlate/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../resources/corlate/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../resources/corlate/images/ico/apple-touch-icon-57-precomposed.png">
    
    <script src="../resources/corlate/js/jquery.js"></script>
    <script src="../resources/corlate/js/bootstrap.min.js"></script>
    <script src="../resources/corlate/js/jquery.prettyPhoto.js"></script>
    <script src="../resources/corlate/js/owl.carousel.min.js"></script>
    <script src="../resources/corlate/js/jquery.isotope.min.js"></script>
    <script src="../resources/corlate/js/main.js"></script>
    
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<script type="text/javascript">
$(document).ready(function(){
	$("#btn_write").click(function(){
		if($.trim($("#title").val()) == ""){
			alert("제목을 확인 하세요.");
			return;
		}
		if($.trim($("#contents").val()) == ""){
			alert("내용을 확인하세요.");
			return;
		}
		$.post("/board/insert"
				,{
					title:$("#title").val()
					,writer:$("#writer").val()
					,contents:$("#contents").val()
				 }//data
				 ,function(data,status){
					 if(status == "success"){
						 if(data > 0){
							 alert("저장 되었습니다.");
							 location.href="/board/list";
						 } else{
							 alert("잠시 후 다시 시도해 주세요.");
						 }
					 } else {
						 alert("admin : 02-xxx-xxxx");
					 } 
				 }
		);//post
	});//click
});//ready

</script>    
    
</head>
<!--/head-->

<body class="homepage">

    <header id="header">
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                       
                       <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/main/home">ziziza</a>
                	  </div>
                    </div>
                            
                    <div class="collapse navbar-collapse navbar-right">
                    <ul class="nav navbar-nav">
                        <li><a href="/manager/login">사장님페이지</a></li>
                        <li><a href="/joinform"> 회원가입 </a></li>
                        <li><a href="/login">로그인</a></li>
                        <li class="active"><a href="/notice/list">공지사항</a></li>
                        <li><a href="/event/list">이벤트</a></li>
                        <li><a href="/board/list">커뮤니티</a></li>
                    </ul>
                </div>
                
                </div>
                
            </div>
            <!--/.container-->
        </div>
        <!--/.top-bar-->

    </header>
    
    <body class="homepage">

    
    
   <div class="container">
   <h2>커뮤니티</h2>
   </div>
   
   <br><br>
	
<div class="container">
	<div class="row contact-wrap"> 
                <div class="status alert alert-success" style="display: none"></div>
                <form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="sendemail.php">
                    		<div class="col-sm-6 col-md-offset-3">
                        <div class="form-group">
                            <label>제목</label>
                            <input type="text" id="title" name="title" class="form-control" required="required">
                        </div>
                        <div class="form-group">
                            <label>작성자</label>
                            <input type="text" id="writer" name="writer" class="form-control" required="required" value="${loginUser.userName}">
                        <!-- input hidden userNo -->
                        </div>
                        <div class="form-group">
                            <label>내용</label>
                            <textarea name="contents" id="contents"  class="form-control" rows="8"></textarea>
                        </div>  
                    </div>
								<div class="col-sm-4 col-md-offset-8">
								<input type="button" id="btn_write" class="btn btn-outline-success" value="등록" />
								<input type="button" id="btn_write" class="btn btn-outline-success" value="취소" />
								</div>
                </form>
	</div>
</div>
    
    <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-xs-12">
                    &copy; 2019-7-04설립 사업명:지지자 컴퍼니 <a target="_blank" href="http://shapebootstrap.net/" title="Free Twitter Bootstrap WordPress Themes and HTML templates"></a>
                </div>
                <div class="col-sm-6 col-xs-12">
                    <ul class="pull-right">
                        <li><a href="#">문의사항</a></li>
                        <li><a href="#">고객센터 02-xxx-xxxx</a></li>
                        <li><a href="#">개인정보처리방침</a></li>
                        <li><a href="#">회사소개</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    
</body>

</html>
