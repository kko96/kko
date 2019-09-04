<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%--
--%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%--
--%><!-- HEADER -->
	<header id="header">
		<div class="header">
			<div class="topBox">
				<h1 class="logo">관리자 페이지</h1>
				<button type="button" class="navToggle btn">Toggle</button>
				<a href='<c:url value="/admin/logout"/>' class="logOut btn">Logout</a>
			</div>
		</div><!-- /.header -->
	</header><!-- /#header -->