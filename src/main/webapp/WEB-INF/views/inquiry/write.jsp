<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>문의 작성 - 너의건강</title>
    <style>
        * { box-sizing: border-box; 
        }
        body { margin: 0; font-family: 'Malgun Gothic', sans-serif; 
        background-color: #eef2e6; 
        color: #333; 
        }

        .header {
            background-color: #3B6D11;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header .logo {
            color: #fff;
            font-size: 22px;
            font-weight: bold;
        }
        .header .nav a {
            color: #fff;
            text-decoration: none;
            margin-left: 20px;
            font-size: 14px;
            font-weight: bold;
        }

        .write-wrap { 
        max-width: 600px; 
        margin: 40px auto; 
        padding: 30px; 
        background: white; 
        border-radius: 12px; 
        box-shadow: 0 2px 8px rgba(0,0,0,0.1); 
        }
        
        .write-wrap h2 { 
        color: #3B6D11; 
        margin-bottom: 20px; 
        }
        
        .form-group { 
        margin-bottom: 15px;
         }
         
        .form-group label { 
        display: block; 
        font-weight: bold; 
        margin-bottom: 5px; 
        color: #3B6D11; 
        }
        
        .form-group input, .form-group textarea {
            width: 100%; 
            padding: 10px; 
            border: 1px solid #ddd; 
            border-radius: 8px; 
            font-size: 14px; 
            box-sizing: border-box;
        }
        
        .form-group textarea { 
        height: 120px; 
        resize: vertical;
        }
        
        .btn-submit {
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
        
        .btn-submit:hover { 
        background: #2d5a0e; 
        }
        
        .radio-row {
    	display: flex;
    	align-items: center;
    	gap: 20px;
		}
		
		.radio-label {
    	display: flex !important;   /* .form-group label의 block을 확실히 덮어씀 */
    	align-items: center;
    	gap: 6px;
    	font-weight: normal;
    	color: #333;
    	margin-bottom: 0;
		}		
		
		.radio-label input[type="radio"] {
    	width: auto;   /* .form-group input의 width:100% 무효화 */
		}
        
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/image/logo.png" width="35" height="35" style="vertical-align:middle; margin-right:8px;">
            너의건강 YOUR HEALTH
        </div>
        <div class="nav">
            <a href="${pageContext.request.contextPath}/">🏠홈</a>
            <a href="${pageContext.request.contextPath}/cart/list">🛒 장바구니</a>
            <a href="${pageContext.request.contextPath}/order/checkout">💳주문/결제</a>
            <a href="${pageContext.request.contextPath}/inquiry/list">📋 고객문의</a>
            <span style="color:#ffffff; font-weight:bold; margin-left:15px;">😊${sessionScope.loginName}님 안녕하세요!😊</span>
        <a href="${pageContext.request.contextPath}/user/logout">🔒 로그아웃</a>
        </div>
    </div>
    <div class="write-wrap">
        <h2>✏️ 문의 작성</h2>
        <form action="${pageContext.request.contextPath}/inquiry/write" method="post">
            <div class="form-group">
                <label>제목</label>
                <input type="text" name="title" required>
            </div>
            <div class="form-group">
                <label>내용</label>
                <textarea name="content" required></textarea>
            </div>
           <div class="form-group">
           <label>공개 설정</label>
				<label class="radio-label">
            		<input type="radio" name="is_secret" value="N" checked> 공개글
            	 </label>
            	<label class="radio-label">
            		 <input type="radio" name="is_secret" value="Y"> 🔒 비밀글
            	</label>
          </div>
            <button type="submit" class="btn-submit">등록하기</button>
        </form>
    </div>
</body>
</html>