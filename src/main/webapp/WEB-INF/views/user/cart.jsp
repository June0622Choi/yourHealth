<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 | 너의건강 YOUR HEALTH</title>
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
		color: #3e5c3a;
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
	.cart-item {
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 16px 20px;
		border-bottom: 1px solid #eee;
	}
	.cart-item:last-child {
		border-bottom: none;
	}
	.item-name {
		font-weight: bold;
		font-size: 15px;
		margin-bottom: 6px;
	}
	.item-price {
		color: #5c8a52;
		font-weight: bold;
	}
	.qty-box {
		display: flex;
		align-items: center;
		gap: 8px;
		margin-top: 8px;
	}
	.qty-btn {
		width: 26px;
		height: 26px;
		border: 1px solid #ccc;
		background-color: #fff;
		border-radius: 6px;
		cursor: pointer;
		font-weight: bold;
	}
	.qty-num {
		min-width: 20px;
		text-align: center;
		font-weight: bold;
	}
	.delete-link {
		color: #b33;
		text-decoration: none;
		font-size: 13px;
		margin-left: 10px;
	}
	.item-right {
		text-align: right;
	}
	.line-total {
		font-weight: bold;
		margin-top: 6px;
	}
	.summary {
		padding: 18px 20px;
		background-color: #f5f8f0;
		font-size: 17px;
		font-weight: bold;
		color: #3e5c3a;
		display: flex;
		justify-content: space-between;
	}
	.order-btn {
		display: block;
		text-align: center;
		background-color: #3B6D11;
		color: #fff;
		padding: 14px 0;
		font-size: 16px;
		font-weight: bold;
		text-decoration: none;
		border: none;
		width: 100%;
		cursor: pointer;
		border-bottom-left-radius: 12px;
		border-bottom-right-radius: 12px;
	}
	.empty-box {
		padding: 60px 20px;
		text-align: center;
		color: #888;
	}
	.empty-box a {
		color: #3e5c3a;
		font-weight: bold;
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
			<a class="active" href="${pageContext.request.contextPath}/cart/list">🛒 장바구니</a>
			<a href="${pageContext.request.contextPath}/order/checkout">💳주문/결제</a>
			<a href="${pageContext.request.contextPath}/inquiry/list">📋 고객문의</a>
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
		<div class="page-title">🛒 장바구니</div>

		<div class="panel">
			<div class="panel-header">🛒 장바구니</div>

			<c:choose>
				<c:when test="${empty cartList}">
					<div class="empty-box">
						장바구니가 비어있습니다.<br>
						<a href="${pageContext.request.contextPath}/">상품 보러가기</a>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="item" items="${cartList}">
						<div class="cart-item" id="cartItem${item.cartId}">
							<div>
								<div class="item-name">${item.productName}</div>
								<div class="item-price"><fmt:formatNumber value="${item.price}" pattern="#,##0"/>원</div>
								<div class="qty-box">
									<button type="button" class="qty-btn" onclick="changeQty(${item.cartId}, -1)">-</button>
									<span class="qty-num" id="qtyNum${item.cartId}">${item.quantity}</span>
									<button type="button" class="qty-btn" onclick="changeQty(${item.cartId}, 1)">+</button>
								</div>
							</div>
							<div class="item-right">
								<div class="line-total">
									<fmt:formatNumber value="${item.price * item.quantity}" pattern="#,##0"/>원
								</div>
								<a class="delete-link" href="${pageContext.request.contextPath}/cart/delete?cartId=${item.cartId}"
									onclick="return confirm('장바구니에서 삭제하시겠습니까?');">🗑 삭제</a>
							</div>
						</div>
					</c:forEach>

					<div class="summary">
						<span>총 결제금액</span>
						<span><fmt:formatNumber value="${totalPrice}" pattern="#,##0"/>원</span>
					</div>

					<a class="order-btn" href="${pageContext.request.contextPath}/order/checkout">🛒 주문하기</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<script>
		var ctx = "${pageContext.request.contextPath}";

		function changeQty(cartId, diff) {
			var numEl = document.getElementById("qtyNum" + cartId);
			var newQty = parseInt(numEl.innerText) + diff;
			if (newQty < 1) {
				newQty = 1;
			}

			fetch(ctx + "/cart/updateQuantity", {
				method: "POST",
				headers: { "Content-Type": "application/x-www-form-urlencoded" },
				body: "cartId=" + cartId + "&quantity=" + newQty
			}).then(function() {
				location.reload();
			});
		}
	</script>

</body>
</html>