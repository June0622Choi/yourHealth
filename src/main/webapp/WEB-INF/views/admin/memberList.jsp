<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 | 너의건강 YOUR HEALTH</title>
<style>
	* { box-sizing: border-box; }
	body { margin: 0; font-family: 'Malgun Gothic', sans-serif; background-color: #eef2e6; color: #333; }
	header { background-color: #3B6D11; padding: 18px 40px; display: flex; justify-content: space-between; align-items: center; }
	header .logo { color: #fff; font-size: 20px; font-weight: bold; }
	header nav a { color: #fff; text-decoration: none; margin-left: 20px; font-size: 14px; font-weight: bold; }
	.container { max-width: 800px; margin: 40px auto; padding: 0 20px; }
	.page-title { font-size: 22px; font-weight: bold; color: #3B6D11; margin-bottom: 20px; }
	table { width: 100%; border-collapse: collapse; background-color: #fff; border-radius: 12px; overflow: hidden; box-shadow: 0 2px 8px rgba(0,0,0,0.08); }
	th { background-color: #3B6D11; color: #fff; padding: 12px; text-align: left; font-size: 14px; }
	td { padding: 12px; border-bottom: 1px solid #eee; font-size: 14px; }
	tr:last-child td { border-bottom: none; }
</style>
</head>
<body>
	<header>
		<div class="logo">👥 회원관리</div>
		<nav>
			<a href="${pageContext.request.contextPath}/admin/dashboard">← 대시보드</a>
			<a href="${pageContext.request.contextPath}/admin/logout">🔒 로그아웃</a>
		</nav>
	</header>
	<div class="container">
		<div class="page-title">👥 회원관리 (전체 ${memberList.size()}명)</div>
		<table>
			<tr>
				<th>번호</th>
				<th>이메일</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>가입일</th>
			</tr>
			<c:forEach var="m" items="${memberList}">
				<tr>
					<td>${m.usersId}</td>
					<td>${m.email}</td>
					<td>${m.name}</td>
					<td>${m.phone}</td>
					<td><fmt:formatDate value="${m.createdAt}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>