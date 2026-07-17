<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 | 너의건강 YOUR HEALTH</title>
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
		max-width: 900px;
		margin: 40px auto;
		padding: 0 20px;
	}
	.page-title {
		font-size: 22px;
		font-weight: bold;
		color: #3B6D11;
		margin-bottom: 20px;
	}
	table {
		width: 100%;
		border-collapse: collapse;
		background-color: #fff;
		border-radius: 12px;
		overflow: hidden;
		box-shadow: 0 2px 8px rgba(0,0,0,0.08);
	}
	th {
		background-color: #3B6D11;
		color: #fff;
		padding: 12px;
		text-align: left;
		font-size: 14px;
	}
	td {
		padding: 12px;
		border-bottom: 1px solid #eee;
		font-size: 14px;
	}
	tr:last-child td {
		border-bottom: none;
	}
	.badge {
		background-color: #e8f0e3;
		color: #3B6D11;
		padding: 3px 10px;
		border-radius: 10px;
		font-size: 12px;
		font-weight: bold;
	}
	.empty-box {
		background-color: #fff;
		border-radius: 12px;
		padding: 60px 20px;
		text-align: center;
		color: #888;
	}
	.empty-box a {
		color: #3B6D11;
		font-weight: bold;
	}
	.refund-form {
		display: inline;
	}
	.refund-form select {
		padding: 5px;
		margin-right: 5px;
		border: 1px solid #ddd;
		border-radius: 4px;
		font-size: 12px;
	}
	.refund-form button {
		padding: 5px 10px;
		background-color: #d32f2f;
		color: white;
		border: none;
		border-radius: 4px;
		cursor: pointer;
		font-size: 12px;
		font-weight: bold;
	}
	.refund-form button:hover {
		background-color: #b71c1c;
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
			<a href="${pageContext.request.contextPath}/cart/list">🛒 장바구니</a>
			<a href="${pageContext.request.contextPath}/order/checkout">💳주문/결제</a>
			<a href="${pageContext.request.contextPath}/inquiry/list">📋 고객문의</a>
			<span style="color:#ffffff; font-weight:bold; margin-left:15px;">😊${sessionScope.loginName}님 안녕하세요!😊</span>
			<a href="${pageContext.request.contextPath}/user/logout">🔒 로그아웃</a>
		</nav>
	</header>
	<div class="container">
		<div class="page-title">🧾 나의 주문내역</div>
		<c:choose>
			<c:when test="${empty orderList}">
				<div class="empty-box">
					주문 내역이 없습니다.<br>
					<a href="${pageContext.request.contextPath}/">상품 보러가기</a>
				</div>
			</c:when>
			<c:otherwise>
				<table>
					<tr>
						<th>주문번호</th>
						<th>받는 분</th>
						<th>금액</th>
						<th>상태</th>
						<th>작업</th>
					</tr>
					<c:forEach var="o" items="${orderList}">
						<tr>
							<td>${o.orderNumber}</td>
							<td>${o.receiverName}</td>
							<td><fmt:formatNumber value="${o.totalPrice}" pattern="#,##0"/>원</td>
							<td><span class="badge">${o.status}</span></td>
							<td>
								<c:if test="${o.status == '주문완료'}">
									<form action="${pageContext.request.contextPath}/refund/request" method="POST" class="refund-form">
										<input type="hidden" name="orderId" value="${o.orderId}">
										<select name="reason" required>
											<option value="">사유 선택</option>
											<option value="변심">변심</option>
											<option value="상품불량">상품불량</option>
											<option value="배송지연">배송지연</option>
											<option value="기타">기타</option>
										</select>
										<button type="submit">환불신청</button>
									</form>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>