<%@ page language="java"
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>

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
    

</head>

<script type="text/javascript">
$(document).ready(function() {
	$("#reply_btn").click(function() {
		$.post(
				"/zlzlza/repInsert"
				,{
					contents:$("#reply").val(),
					score:$("#score").val()		
				}
				,function(data,status){
					if(status == "success"){
						if(data == 0){
							alert("잠시 후, 다시 시도해 주세요.");
						} else if(data == -1){
							alert("로그인 해 주세요.");
						} else {
							$("#reply").val("");
							$.each(data,function(index,vo){
								$("#replyTable").append("<tr>");
								$("#replyTable").append("<td>"+vo.member_no+"</td>");
								$("#replyTable").append("<td>"+vo.contents+"</td>");
								$("#replyTable").append("<td>"+vo.regist_date+"</td>");
								$("#replyTable").append("</tr>");
							});
						}
					}
			},"json");
	});
});
</script>

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
                        <li><a href="portfolio.html">사장님페이지</a></li>
                        <c:if test="${loginUser == null}">
                        <li><a href="/joinform"> 회원가입 </a></li>
                        <li><a href="/loginform">로그인</a></li>
                        </c:if>
                        <c:if test="${loginUser != null}">
                        <li><a href="/loginform">로그아웃</a></li>
                        </c:if>
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
    
   <div class="container">
    	<div class="row">
    	<div class="col-md-10 col-md-offset-1 text-center">
                    <div class="single-pricing featured">
                        <span></span>
                        <h1>
                            <span>///</span>
                            	이미지 넣을 공간
                            <span>///</span>
                        </h1>
                    </div>
                </div>
    	
    	</div>
    </div>


	<div class="container">
	 <div class="row">
	  <div class="col-sm-12 col-sm-offset-1" style="padding-left:2%">
	  	<h1>${detailVO.company_name}</h1>
		<h4>이벤트:이벤트 내용입니다</h4>
		<h4>주소 : ${detailVO.address}</h4>
	  </div>		
	 </div>	
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="col-md-10 col-md-offset-1 text-center">
                    <div class="single-pricing featured">
                    	<p>${detailVO.contents}</p>
                    	영업시간: ${detailVO.open_time}~${detailVO.close_time}
                    </div>
                </div>
			</div>
						<div class="col-sm-6 col-sm-offset-1">
							<h5>전화번호 : ${detailVO.company_tel}</h5>
						</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
<!-- 			<div class="f3xljso"> -->
<!-- 			<div class="fla3bp24"> -->
<!-- 			<div class="col-sm-12 col-sm-offset-1" style="padding-left:2%"> -->
<!-- 				<h2>편의시설 및 서비스</h2> -->
<!-- 			</div> -->
<!-- 		<div class="f4nsdxu swiper col-sm-1 col-md-offset-1 text-center"> -->
<!-- 		 <div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode"> -->
<!-- 		 	<div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;"> -->
<!-- 		 		<div class="swiper-slide facility-icon swiper-slide-active"> -->
<!-- 		 			<img alt="facility icon" src="../resources/bootstrap2/corlate/images/_ionicons_svg_md-restaurant (2).svg"> -->
<!-- 		 			<div>식당</div> -->
<!-- 		 		</div> -->
<!-- 		 	</div> -->
<!-- 		 </div> -->
<!-- 		</div> -->
<!-- 		<div class="f4nsdxu swiper col-sm-1 text-center"> -->
<!-- 		 <div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode"> -->
<!-- 		 	<div class="swiper-wrapper" style="transform: translate3d(0px, 0px, 0px); transition-duration: 0ms;"> -->
<!-- 		 		<div class="swiper-slide facility-icon swiper-slide-active"> -->
<!-- 		 			<img alt="facility icon" src="../resources/bootstrap2/corlate/images/_ionicons_svg_md-restaurant (2).svg"> -->
<!-- 		 			<div>식당</div> -->
<!-- 		 		</div> -->
<!-- 		 	</div> -->
<!-- 		 </div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 			</div>  -->
		</div>
		<br><br>
		
	<div class="col-sm-4 col-md-offset-3">
	<input type="text" id="score" class="form-control" required="required" placeholder="댓글을 입력해주세요.">
	<input type="text" id="reply" class="form-control" required="required" placeholder="댓글을 입력해주세요.">
	</div>
	${session.usrSesn}
	${session.usrSesn.zi_no}
	${session.usrSesn.zi_id}
	${session.usrSesn.zi_nm}
	<button type="button" id="reply_btn" class="btn btn-outline-success">등록</button>
	
	<div class="col-sm-6 col-md-offset-3">
	<table id="replyTable" class="table ">
			<thead>
								<tr>
									<th>작성자</th>
									<th>내용</th>
									<th>등록일</th>
								</tr>
			</thead>
							<tbody>
			<c:forEach items="${reply_list}" var="vo" varStatus="status">
				<tr>
					<td>${vo.member_no}</td>
					<td>${vo.contents}</td>
					<td>${vo.regist_date}</td>
				</tr>
			</c:forEach>
			</tbody>
	</table>	
	
	</div>
	
	</div>
	
    
    <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-xs-12">
                    &copy; 2019-7-04설립 	사업명:지지자 컴퍼니 <a target="_blank" href="http://shapebootstrap.net/" title="Free Twitter Bootstrap WordPress Themes and HTML templates"></a>
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
