<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 | 너의건강 YOUR HEALTH</title>
<style>
	* { box-sizing: border-box; }
	body {
		margin: 0;
		font-family: 'Malgun Gothic', sans-serif;
		background-color: #eef2e6;
		color: #333;
		display: flex;
		align-items: center;
		justify-content: center;
		height: 100vh;
	}
	.login-box {
		background-color: #fff;
		border-radius: 12px;
		box-shadow: 0 2px 8px rgba(0,0,0,0.08);
		padding: 40px;
		width: 360px;
		text-align: center;
	}
	.login-box h2 {
		color: #3B6D11;
		margin-bottom: 24px;
	}
	.login-box input {
		width: 100%;
		padding: 12px;
		margin-bottom: 12px;
		border: 1px solid #ddd;
		border-radius: 6px;
		font-size: 14px;
	}
	.login-box button {
		width: 100%;
		padding: 12px;
		background-color: #3B6D11;
		color: #fff;
		border: none;
		border-radius: 6px;
		font-size: 15px;
		font-weight: bold;
		cursor: pointer;
	}
	.error-msg {
		color: #b33;
		font-size: 13px;
		margin-bottom: 12px;
	}
	.back-link {
		display: block;
		margin-top: 16px;
		font-size: 13px;
		color: #888;
		text-decoration: none;
	}
</style>
</head>
<body>

	<div class="login-box">
		<h2>🔐 관리자 로그인</h2>

		<c:if test="${not empty error}">
			<div class="error-msg">${error}</div>
		</c:if>

		<form action="${pageContext.request.contextPath}/admin/login" method="post">
			<input type="email" name="email" placeholder="관리자 이메일" required>
			<input type="password" name="password" placeholder="비밀번호" required>
			<button type="submit">로그인</button>
		</form>

		<a class="back-link" href="${pageContext.request.contextPath}/">← 홈으로 돌아가기</a>
	</div>

</body>
</html>