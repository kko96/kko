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
</head>
<!--/head-->
<!-- <script src="../resources/jquery/jquery-3.4.1.js"></script> -->
<script type="text/javascript">
$(document).ready(function() {
	$("#btn_delete").click(function() {
		var goYN = confirm("글을 삭제 하시겠습니까?"); 
		if(goYN == false){
			return;
		}
		$.post(
				"/board/delete"	
				,{
					board_no:$("#hidNO").val()
					, title:$("#hidTit").val()
					, member_no:$("#hidMbrNo").val()
					, contents:$("#hidContents").val()
					}
				,function(data, status){
					if(status == "success"){
						if(data > 0){
							alert("게시글을 삭제 했습니다");
							location.href="/board/list";
						}  else if(data == -1){
							alert("로그인 후 이용이 가능합니다.");
						}  else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}
				}
			);
	});//click
	$("#btn_update").click(function() {
		location.href="/board/modify?board_no=${detailVO.board_no}"
	});
	$("#btn_list").click(function() {
		location.href="/board/list"
	});
	$("#reply_btn").click(function() {
		$.post(
				"/board/repinsert"
				,{
					board_no:$("#hidNO").val()
				   ,contents:$("#reply").val()
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
	$("#btn_repdelete").click(function() {
		var btn = $(this);
		var no = btn.parents("tr").find(".cmtNo").text()
		$.post(
				"/board/repdelete"	
				,{
					comment_no:no
				}
				,function(data, status){
					if(status == "success"){
						if(data > 0){
							alert("댓글 삭제 했습니다");
							btn.parents("tr").remove();
						}  else if(data == -1){
							alert("로그인 후 이용이 가능합니다.");
						}  else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}
				}
			);
	});
});//ready
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
    
    <div class="container">
   <h2>커뮤니티</h2>
   </div>
   
   <br><br>
	
<div class="container">
	<div class="row contact-wrap col-sm-6 col-md-offset-3">
<!-- 				<table border="1"> -->
<!-- 					<tr> -->
<!-- 						<th>제목</th> -->
<%-- 						<td>${detailVO.title}</td> --%>
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th>작성자</th> -->
<%-- 						<td>${detailVO.member_no}</td> --%>
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<th>내용</th> -->
<%-- 						<td>${detailVO.contents}</td>		 --%>
<!-- 					</tr> -->
<!-- 				</table> -->
<!--                 <form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="sendemail.php"> -->
<!--                     <div class="col-sm-6 col-md-offset-3"> -->
<!--                         <div class="form-group"> -->
<!--                             <label>제목</label> -->
<%--                             <input type="text" name="name" class="form-control" required="required" value="${detailVO.title}"> --%>
<!--                         </div> -->
<!--                         <div class="form-group"> -->
<!--                             <label>작성자</label> -->
<%--                             <input type="text" name="name" class="form-control" required="required" value="${detailVO.member_no}"> --%>
<!--                         </div> -->
<!--                         <div class="form-group"> -->
<!--                             <label>내용</label> -->
<%--                             <textarea name="message" id="message" required="required" class="form-control" rows="8">${detailVO.contents}</textarea> --%>
<!--                         </div>   -->
<!--                     </div> -->
<!--                 </form> -->
	</div>
	<div class="row">
		<div class="col-sm-6 col-md-offset-3">
						<table class="table ">
							<tbody>	
					<tr>
						<th>번호</th>
						<td>${detailVO.board_no}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${detailVO.title}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${detailVO.member_no}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${detailVO.contents}</td>		
					</tr>
							</tbody>
						</table>
						<input type="hidden" id="hidNO" value="${detailVO.board_no}" />
						<input type="hidden" id="hidTit" value="${detailVO.title}" />
						<input type="hidden" id="hidMbrNo" value="${detailVO.member_no}" />
						<textarea id="hidContents" style="display:none;">${detailVO.contents}</textarea>
		</div>
	</div>
	<div class="col-sm-4 col-md-offset-3">
	<input type="text" id="reply" class="form-control" required="required" placeholder="댓글을 입력해주세요.">
	</div>
	<div class="col-sm-4 col-md-offset-1">
	${session.usrSesn}
	${session.usrSesn.zi_no}
	${session.usrSesn.zi_id}
	${session.usrSesn.zi_nm}
	<button type="button" id="reply_btn" class="btn btn-outline-success">등록</button>
	</div>
	
	<br><br>
	<div class="col-sm-4 col-md-offset-5">
	<button type="button" id="btn_list" class="btn btn-outline-success">목록</button>
	<button type="button" id="btn_update" class="btn btn-outline-success">수정</button>
	<button type="button" id="btn_delete" class="btn btn-outline-success">삭제</button>
	</div>
	<div class="row">
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
					<td class="cmtNo">${vo.comment_no}</td>
					<td>${vo.member_no}</td>
					<td>${vo.contents}</td>
					<td>${vo.regist_date}</td>
					<td><button type="button" id="btn_repdelete" class="btn btn-outline-success">댓글삭제</button></td>
				</tr>
			</c:forEach>
							</tbody>
			</table>
		</div>
		<input type="hidden" id="rehidNO" value="${detailVO.member_no}" />
		<input type="hidden" id="rehidTit" value="${detailVO.contents}" />
	<br><br>
<!-- 	<div class="row"> -->	
<!-- 	<div class="col-sm-4 col-md-offset-3"> -->
<!-- 	<table class="table"> -->
<!-- 		<tbody>	 -->
<!-- 			<tr> -->
<!-- 				<td>이전글</td> -->
<!-- 				<td><a href="#">이전글 내용입니다</a></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>다음글</td> -->
<!-- 				<td><a href="#">다음글 내용입니다</a></td> -->
<!-- 			</tr> -->
<!-- 		</tbody> -->
<!-- 	</table> -->
<!-- 	</div> -->
<!-- 	</div> -->
	<br><br>
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
