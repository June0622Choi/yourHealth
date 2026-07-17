<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입 완료 - 너의건강</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/banner.css">
    <style>
        .welcome-wrap {
            max-width: 420px;
            margin: 100px auto;
            background: white;
            border-radius: 16px;
            padding: 50px 40px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        .welcome-icon { font-size: 50px; margin-bottom: 20px; }
        .welcome-wrap h2 { color: #3B6D11; margin-bottom: 10px; }
        .welcome-wrap p { color: #666; margin-bottom: 30px; }
        .welcome-btns { display: flex; gap: 10px; }
        .welcome-wrap a {
            flex: 1;
            display: inline-block;
            padding: 12px 20px;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
        }
        .btn-primary { background: #3B6D11; color: white; }
        .btn-primary:hover { background: #2d5a0e; }
        .btn-secondary { background: #f0f7e8; color: #3B6D11; border: 1px solid #3B6D11; }
        .btn-secondary:hover { background: #e0efd4; }
    </style>
</head>
<body style="background-color:#f0f7e8;">
    <div class="welcome-wrap">
        <div class="welcome-icon">🎉</div>
        <h2>환영합니다, ${username}님!</h2>
        <p>회원가입을 축하드립니다!</p>
        <div class="welcome-btns">
            <a href="${pageContext.request.contextPath}/" class="btn-secondary">홈으로</a>
            <a href="${pageContext.request.contextPath}/integrated/login" class="btn-primary">로그인 하러 가기</a>
        </div>
    </div>
</body>
</html>