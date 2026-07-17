<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>로그인 - 너의건강</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/banner.css">
    <style>
        .login-wrap {
            max-width: 400px;
            margin: 80px auto;
            background: white;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        .login-wrap h2 { color: #3B6D11; margin-bottom: 25px; }
        .login-wrap input {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            box-sizing: border-box;
        }
        .login-wrap button {
            width: 100%;
            padding: 12px;
            background: #3B6D11;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
        }
        .login-wrap button:hover { background: #2d5a0e; }
        .login-links { margin-top: 18px; font-size: 13px; }
        .login-links a { color: #3B6D11; text-decoration: none; margin: 0 8px; }
    </style>
</head>
<body style="background-color:#f0f7e8;">
<div class="login-wrap">
    <h2>🔒 로그인</h2>
    <form action="${pageContext.request.contextPath}/user/login" method="post">
        <input type="text" name="email" placeholder="이메일" required>
        <input type="password" name="password" placeholder="비밀번호" required>
        <button type="submit">로그인</button>
    </form>
    <div class="login-links">
        <a href="${pageContext.request.contextPath}/">홈으로</a> |
        <a href="${pageContext.request.contextPath}/user/register">회원가입</a>
    </div>
</div>
</body>
</html>