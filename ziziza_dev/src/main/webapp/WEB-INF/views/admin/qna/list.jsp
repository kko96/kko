<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%--
--%><%@ include file="../include/common.jsp" %><%--
--%><c:set var="menu" value="4" scope="request"/><%--
--%><c:set var="subMenu" value="1" scope="request"/><%--
--%><!DOCTYPE html>
<html>
<head>
<c:import url="../include/head.jsp"/>
<c:import url="../include/app.jsp"/>
<script>
//리스트 출력
function putList(list){
	tbody.empty();
	if(list.length > 0){
		$.each(list, function(index, vo){
			var tr = temp.clone();
			var link = $('<a href="<c:url value='/admin/qna/modify'/>?no=' + vo.qnaNo + '">').text(vo.qstTitle);
			tr.find("td").eq(0).text(vo.state)
						.next().text(vo.roleName)
						.next().append(link)
						.next().text(vo.answerName)
						.next().text(vo.answerDate)
						.next().text(vo.memberName)
						.next().text(vo.registDate)		
			tbody.append(tr);
		});
	}else{
		$("<td colspan='7'>").text("등록된 데이터가 없습니다.").appendTo(tbody);
	}
}
</script>
</head>
<body>
<div id="wrap" class="hideNav">
	<c:import url="../include/header.jsp"/>
	<c:import url="../include/navigation.jsp"/>
	<!-- Content -->
	<div id="container">
		<div class="contentWrap">
			<div class="contents">
				<div class="title"><h3>문의 목록</h3></div>
				<form action='<c:url value="/admin/qna/list"/>' name="search" class="search" method="post">
					<fieldset class="box">
						<legend class="hide">목록 검색</legend>
						<input type="hidden" name="board" value="list"/>
						<input type="hidden" name="currentPage" value="1"/>
						<p>
							<select name="state">
								<option value="A">상태</option>
								<option value="Y">답변</option>
								<option value="N">미답변</option>
							</select>
							<select name="roleName">
								<option value="ALL">구분</option>
								<option value="USER">일반</option>
								<option value="MANAGER">사업자</option>
							</select>
						</p>
						<p>
							<select name="searchType" >
								<option value="NONE">검색조건</option>
								<option value="TITLE">제목</option>
								<option value="CNT">내용</option>
							</select>
							<input type="text" name="searchTxt" class="txtBox"/>
							<button type="submit">검색</button>
						</p>
					</fieldset>
				</form>
				<div class="content">
					<table class="lTbl">
						<caption class="hide">문의 목록</caption>
						<thead>
							<tr>
								<th scope="col">상태</th>
								<th scope="col">구분</th>
								<th scope="col">제목</th>
								<th scope="col">답변자</th>
								<th scope="col">답변일</th>								
								<th scope="col">문의자</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="lOpt">
					<c:import url="../include/pagination.jsp"/>
				</div>
			</div><!-- /.contents -->
		</div><!-- /.contentWrap -->
	</div><!-- /#container -->
	<c:import url="../include/footer.jsp"/>
</div><!-- /#wrap -->
<c:import url="../include/modal.jsp"/>
</body>
</html>