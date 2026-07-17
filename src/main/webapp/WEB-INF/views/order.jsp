<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제 | 너의건강 YOUR HEALTH</title>
<style>
	* { box-sizing: border-box; }
	body {
		margin: 0;
		font-family: 'Malgun Gothic', sans-serif;
		background-color: #eef2e6;
		color: #333;
	}
		header {
	    background-color: #3B6D11;
	    padding: 15px 30px;
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	}
	header .logo {
	    color: #fff;
	    font-size: 22px;
	    font-weight: bold;
	}
	header nav a {
	    color: #fff;
	    text-decoration: none;
	    margin-left: 20px;
	    font-size: 14px;
	    font-weight: bold;
	}
	header nav a.active {
		font-weight: bold;
		border-bottom: 2px solid #fff;
		padding-bottom: 4px;
	}
	.container {
		max-width: 720px;
		margin: 40px auto;
		padding: 0 20px;
	}
	.page-title {
		font-size: 22px;
		font-weight: bold;
		color: #3B6D11;
		margin-bottom: 20px;
	}
	.panel {
		background-color: #fff;
		border-radius: 12px;
		box-shadow: 0 2px 8px rgba(0,0,0,0.08);
		overflow: hidden;
	}
	.panel-header {
		background-color: #3B6D11;
		color: #fff;
		padding: 14px 20px;
		font-size: 16px;
		font-weight: bold;
	}
	.section {
		padding: 20px;
		border-bottom: 1px solid #eee;
	}
	.section-title {
		font-weight: bold;
		color:#3B6D11;
		margin-bottom: 12px;
		font-size: 15px;
	}
	.form-row {
		margin-bottom: 12px;
	}
	.form-row label {
		display: block;
		font-size: 13px;
		color: #666;
		margin-bottom: 4px;
	}
	.form-row input {
		width: 100%;
		padding: 10px 12px;
		border: 1px solid #ddd;
		border-radius: 6px;
		font-size: 14px;
	}
	.pay-methods {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 10px;
	}
	.pay-methods label {
		display: flex;
		align-items: center;
		gap: 6px;
		font-size: 14px;
		border: 1px solid #ddd;
		border-radius: 6px;
		padding: 10px 12px;
		cursor: pointer;
	}
	.order-summary-list {
		font-size: 14px;
		color: #555;
		line-height: 1.8;
	}
	.summary {
	    padding: 18px 20px;
	    background-color: #f5f8f0;
	    font-size: 17px;
	    font-weight: bold;
	    color: #3B6D11;
	    display: flex;
		}
	.pay-btn {
		display: block;
		text-align: center;
		background-color: #3B6D11;
		color: #fff;
		padding: 14px 0;
		font-size: 16px;
		font-weight: bold;
		border: none;
		width: 100%;
		cursor: pointer;
		border-bottom-left-radius: 12px;
		border-bottom-right-radius: 12px;
	}
	.pay-btn:hover {
		background-color: #3B6D11;
	}
</style>
</head>
<body>

	<header>
			<div class="logo">
	    <img src="${pageContext.request.contextPath}/image/logo.png" width="35" height="35" style="vertical-align:middle; margin-right:8px;">
	    너의건강 YOUR HEALTH
	</div>
		<nav>
			<a href="${pageContext.request.contextPath}/">🏠홈</a>
			<a href="${pageContext.request.contextPath}/cart/list">🛒장바구니</a>
			<a class="active" href="${pageContext.request.contextPath}/order/checkout">📦 주문/결제</a>
			<c:choose>
			    <c:when test="${empty sessionScope.loginId}">
			        <a href="${pageContext.request.contextPath}/user/login">🔒 로그인</a>
			        <a href="${pageContext.request.contextPath}/user/register">회원가입</a>
			    </c:when>
			    <c:otherwise>
			        <span style="color:#ffffff; font-weight:bold; margin-left:15px;">😊${sessionScope.loginName}님 안녕하세요!😊</span>
			        <a href="${pageContext.request.contextPath}/user/logout">🔒 로그아웃</a>
			    </c:otherwise>
			</c:choose>
		</nav>
	</header>

	<div class="container">
		<div class="page-title">📦 주문/결제</div>

		<form class="panel" action="${pageContext.request.contextPath}/order/create" method="post">

			<div class="panel-header">📦 주문/결제</div>

			<div class="section">
				<div class="section-title">주문자 정보</div>
				<div class="form-row">
					<label for="receiverName">이름</label>
					<input type="text" id="receiverName" name="receiverName" placeholder="받으실 분 이름" required>
				</div>
				<div class="form-row">
					<label for="receiverPhone">전화번호</label>
					<input type="text" id="receiverPhone" name="receiverPhone" placeholder="010-0000-0000" required>
				</div>
				<div class="form-row">
					<label for="address">배송지 주소</label>
					<input type="text" id="address" name="address" placeholder="배송받으실 주소" required>
				</div>
			</div>

			<div class="section">
				<div class="section-title">결제수단</div>
				<div class="pay-methods">
		    <label><input type="radio" name="paymentMethod" value="카드" checked onchange="togglePayInfo()"> 카드</label>
		    <label><input type="radio" name="paymentMethod" value="계좌이체" onchange="togglePayInfo()"> 계좌이체</label>
		    <label><input type="radio" name="paymentMethod" value="카카오페이" onchange="togglePayInfo()"> 카카오페이</label>
		    <label><input type="radio" name="paymentMethod" value="네이버페이" onchange="togglePayInfo()"> 네이버페이</label>
		</div>
				<div id="accountInfo" style="display:none; margin-top:10px; padding:12px; background:#f0f7e8; border-radius:8px; font-size:14px;">
        💳 입금 계좌: <strong>MBC은행 402-1234-56-78910</strong> (예금주: 너의건강)
			</div>
		</div>
			<div class="section">
    <div class="section-title">주문 상품</div>
    <div class="order-summary-list">
        <c:forEach var="item" items="${cartList}" varStatus="status">
            ${item.productName} x ${item.quantity} = <fmt:formatNumber value="${item.price * item.quantity}" pattern="#,##0"/>원<c:if test="${!status.last}"> /</c:if>
        </c:forEach>
    </div>
</div>

			<div class="summary">
				<span>총 결제금액</span>
				<span><fmt:formatNumber value="${totalPrice}" pattern="#,##0"/>원</span>
			</div>

			<button type="submit" class="pay-btn">💳 결제하기</button>
		</form>
	</div>
	<script type="text/javascript">
	function togglePayInfo() {
	    var selected = document.querySelector('input[name="paymentMethod"]:checked').value;
	    var accountInfo = document.getElementById('accountInfo');
	    if (selected === '계좌이체') {
	        accountInfo.style.display = 'block';
	    } else {
	        accountInfo.style.display = 'none';
	    }
	}
	</script>

</body>
</html>