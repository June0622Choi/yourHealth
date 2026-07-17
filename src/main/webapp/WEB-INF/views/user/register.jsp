<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>통합 회원가입</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/banner.css">
    <style>
        .register-wrap { 
        max-width: 420px; 
        margin: 60px auto; 
        background: white; 
        border-radius: 16px; 
        padding: 40px;
         box-shadow: 0 2px 10px rgba(0,0,0,0.1);
		}
        .register-wrap h2 { 
        color: #3B6D11; 
        margin-bottom: 25px; 
        text-align: center;
         }
        .register-wrap input { 
        width: 100%; 
        padding: 12px; 
        margin-bottom: 5px;
         border: 1px solid #ccc; 
         border-radius: 8px; 
         font-size: 14px; 
         box-sizing: border-box; 
         }
        .register-wrap button { 
        width: 100%; 
        padding: 12px; 
        background: #3B6D11; 
        color: white; 
        border: none;
         border-radius: 
         8px; 
         font-size: 15px; 
         font-weight: bold; 
         cursor: pointer; 
         }
         
        .id-row { 
        display: flex; 
        gap: 8px; 
        margin-bottom: 5px;
        align-items: center;
         }
         
        .id-row input {
    	 flex: 1;
    	  margin-bottom: 0;
         }
          
        .btn-check {
        width: auto !important;
        flex-shrink:0;
   		padding: 12px 14px;
	    background: #6b8e5a;
	    color: white;
	    border: none;
	    border-radius: 8px;
	    font-size: 12px;
	    font-weight: bold;
	    cursor: pointer;
	    white-space: nowrap;
	    box-sizing: border-box;
	}
        .check-msg { 
        font-size: 12px;
         margin-bottom: 
         15px; height: 
         16px; 
         }
         
        .check-msg.ok { 
        color: #3B6D11; 
        }
        .check-msg.dup { 
        color: #d32f2f; 
        }
    </style>
</head>
<body style="background-color:#f0f7e8;">
    <div class="register-wrap">
        <h2>📝회원가입</h2>
        <form action="${pageContext.request.contextPath}/integrated/register" method="post" onsubmit="return checkBeforeSubmit();">
            <div class="id-row">
                <input type="text" id="username" name="username" placeholder="아이디" required onchange="resetCheck()">
                <button type="button" class="btn-check" onclick="checkDuplicate()">중복확인</button>
            </div>
            <div class="check-msg" id="checkMsg"></div>

            <input type="password" name="password" placeholder="비밀번호" required>
            <input type="text" name="nickname" placeholder="닉네임" required>
            <input type="email" name="email" placeholder="이메일" required>
            <button type="submit">가입하기</button>
            <a href="${pageContext.request.contextPath}/" style="display:block; text-align:center; margin-top:14px; color:#3B6D11; font-size:13px; text-decoration:none; font-weight:bold;">← 홈으로 돌아가기</a>
        </form>
    </div>

    <script>
        var ctx = "${pageContext.request.contextPath}";
        var isChecked = false;

        function resetCheck() {
            isChecked = false;
            document.getElementById('checkMsg').textContent = '';
            document.getElementById('checkMsg').className = 'check-msg';
        }

        function checkDuplicate() {
            var username = document.getElementById('username').value;

            if (!username.trim()) {
                alert('아이디를 입력해주세요.');
                return;
            }

            fetch(ctx + '/integrated/checkUsername?username=' + encodeURIComponent(username))
                .then(res => res.text())
                .then(result => {
                    var msg = document.getElementById('checkMsg');
                    if (result === 'duplicate') {
                        msg.textContent = '이미 사용 중인 아이디입니다.';
                        msg.className = 'check-msg dup';
                        isChecked = false;
                    } else {
                        msg.textContent = '사용 가능한 아이디입니다.';
                        msg.className = 'check-msg ok';
                        isChecked = true;
                    }
                });
        }

        function checkBeforeSubmit() {
            if (!isChecked) {
                alert('아이디 중복확인을 먼저 해주세요.');
                return false;
            }
            return true;
        }
    </script>
</body>
</html>