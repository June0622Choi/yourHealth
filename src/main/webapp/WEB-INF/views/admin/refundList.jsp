<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환불관리 | 너의건강 YOUR HEALTH</title>
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
		padding: 18px 40px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	header .logo {
		color: #fff;
		font-size: 20px;
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
		max-width: 800px;
		margin: 40px auto;
		padding: 0 20px;
	}
	.page-title {
		font-size: 22px;
		font-weight: bold;
		color: #3B6D11;
		margin-bottom: 20px;
	}
	.refund-card {
		background-color: #fff;
		border-radius: 12px;
		box-shadow: 0 2px 8px rgba(0,0,0,0.08);
		padding: 20px;
		margin-bottom: 14px;
	}
	.refund-top {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 10px;
		padding-bottom: 10px;
		border-bottom: 1px solid #eee;
	}
	.refund-order-no {
		font-weight: bold;
		color: #3B6D11;
	}
	.refund-status {
		background-color: #e8f0e3;
		color: #3B6D11;
		padding: 4px 10px;
		border-radius: 12px;
		font-size: 12px;
		font-weight: bold;
	}
	.refund-info {
		font-size: 14px;
		color: #555;
		line-height: 1.8;
		margin-bottom: 12px;
	}
	.refund-actions {
		display: flex;
		gap: 8px;
	}
	.btn-approve {
		background-color: #3B6D11;
		color: #fff;
		border: none;
		padding: 8px 16px;
		border-radius: 6px;
		cursor: pointer;
		font-size: 13px;
		font-weight: bold;
	}
	.btn-reject {
		background-color: #b33;
		color: #fff;
		border: none;
		padding: 8px 16px;
		border-radius: 6px;
		cursor: pointer;
		font-size: 13px;
		font-weight: bold;
	}
	.empty-box {
		background-color: #fff;
		border-radius: 12px;
		padding: 60px 20px;
		text-align: center;
		color: #888;
	}
</style>
</head>
<body>

	<header>
		<div class="logo">🔄 환불관리</div>
		<nav>
			<a href="${pageContext.request.contextPath}/admin/dashboard">← 대시보드</a>
			<a href="${pageContext.request.contextPath}/admin/logout">🔒 로그아웃</a>
		</nav>
	</header>

	<div class="container">
		<div class="page-title">🔄 환불관리</div>

		<c:choose>
			<c:when test="${empty refundList}">
				<div class="empty-box">환불 신청 내역이 없습니다.</div>
			</c:when>
			<c:otherwise>
				<c:forEach var="r" items="${refundList}">
					<div class="refund-card">
						<div class="refund-top">
							<span class="refund-order-no">${r.orderNumber}</span>
							<span class="refund-status">${r.status}</span>
						</div>
						<div class="refund-info">
							사유: ${r.reason}<br>
							신청일: <fmt:formatDate value="${r.reuqestedAt}" pattern="yyyy-MM-dd HH:mm"/>
						</div>

						<c:if test="${r.status == '환불대기'}">
							<div class="refund-actions">
								<form action="${pageContext.request.contextPath}/refund/admin/approve" method="post" style="display:inline;">
									<input type="hidden" name="refundsId" value="${r.refundsId}">
									<button type="submit" class="btn-approve"
										onclick="return confirm('환불을 승인하시겠습니까?');">승인</button>
								</form>
								<form action="${pageContext.request.contextPath}/refund/admin/reject" method="post" style="display:inline;">
									<input type="hidden" name="refundsId" value="${r.refundsId}">
									<button type="submit" class="btn-reject"
										onclick="return confirm('환불을 거절하시겠습니까?');">거절</button>
								</form>
							</div>
						</c:if>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>

</body>
</html>