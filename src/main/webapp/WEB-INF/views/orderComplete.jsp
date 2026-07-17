<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료 | 너의건강 YOUR HEALTH</title>
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
	.container {
		max-width: 560px;
		margin: 60px auto;
		padding: 0 20px;
	}
	.panel {
		background-color: #fff;
		border-radius: 12px;
		box-shadow: 0 2px 8px rgba(0,0,0,0.08);
		overflow: hidden;
		text-align: center;
	}
	.panel-header {
		background-color: #3B6D11;
		color: #fff;
		padding: 14px 20px;
		font-size: 16px;
		font-weight: bold;
	}
	.check-circle {
		width: 70px;
		height: 70px;
		background-color: #5c8a52;
		border-radius: 50%;
		display: flex;
		align-items: center;
		justify-content: center;
		margin: 30px auto 16px auto;
		color: #fff;
		font-size: 34px;
	}
	.complete-msg {
		font-size: 18px;
		font-weight: bold;
		color: #3B6D11;
		margin-bottom: 8px;
	}
	.ship-info {
		font-size: 14px;
		color: #5c8a52;
		font-weight: bold;
		margin-bottom: 20px;
	}
	.order-no {
		font-size: 14px;
		color: #666;
		margin-bottom: 4px;
	}
	.order-no b {
		color: #333;
	}
	.ship-msg {
		font-size: 14px;
		color: #888;
		margin-bottom: 24px;
	}
	.item-list {
		text-align: left;
		padding: 0 24px 20px 24px;
		font-size: 14px;
		color: #555;
	}
	.item-list div {
		display: flex;
		justify-content: space-between;
		padding: 6px 0;
		border-bottom: 1px solid #f0f0f0;
	}
	.total-line {
		padding: 16px 24px;
		background-color: #f5f8f0;
		font-size: 16px;
		font-weight: bold;
		color: #3B6D11;
		display: flex;
		justify-content: space-between;
	}
	.btn-row {
		display: flex;
		gap: 10px;
		padding: 20px;
	}
	.btn-row a {
		flex: 1;
		display: block;
		text-align: center;
		padding: 12px 0;
		border-radius: 8px;
		text-decoration: none;
		font-weight: bold;
		font-size: 14px;
	}
	.btn-home {
		background-color: #3B6D11;
		color: #fff;
	}
	.btn-list {
		background-color: #e8f0e3;
		color: #3B6D11;
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
			<a href="${pageContext.request.contextPath}/order/checkout">💳주문/결제</a>
			<span style="color:#ffffff; font-weight:bold; margin-left:15px;">😊${sessionScope.loginName}님 안녕하세요!😊</span>
			<a href="${pageContext.request.contextPath}/user/logout">🔒로그아웃</a>
		</nav>
	</header>

	<div class="container">
		<div class="panel">
			<div class="panel-header">✅ 주문완료</div>

			<div class="check-circle">✔</div>
			<div class="complete-msg">주문완료되었습니다!</div>
			<div class="ship-info">📦 배송은 2~3일 정도 소요됩니다</div>

			<div class="order-no">주문번호: <b>${order.orderNumber}</b></div>

			<div class="item-list">
				<c:forEach var="item" items="${items}">
					<div>
						<span>${item.productName} x ${item.quantity}</span>
						<span><fmt:formatNumber value="${item.unitPrice * item.quantity}" pattern="#,##0"/>원</span>
					</div>
				</c:forEach>
			</div>

			<div class="total-line">
				<span>총 결제금액</span>
				<span><fmt:formatNumber value="${order.totalPrice}" pattern="#,##0"/>원</span>
			</div>

			<div class="btn-row">
				<a class="btn-home" href="${pageContext.request.contextPath}/">🏠 홈으로 돌아가기</a>
				<a class="btn-list" href="${pageContext.request.contextPath}/order/list">📋 주문내역 보기</a>
			</div>
		</div>
	</div>

</body>
</html>