<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 대시보드 | 너의건강 YOUR HEALTH</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.umd.min.js"></script>
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
	header a {
		color: #fff;
		text-decoration: none;
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
	.stat-grid {
		display: grid;
		grid-template-columns: repeat(5, 1fr);
		gap: 12px;
		margin-bottom: 24px;
		
	}
	.stat-card {
		background-color: #fff;
		border-radius: 12px;
		box-shadow: 0 2px 8px rgba(0,0,0,0.08);
		padding: 18px;
		text-align: center;
		text-decoration: none;
		color: inherit;
		display: block;
	}
	.stat-card:hover {
		box-shadow: 0 4px 12px rgba(0,0,0,0.12);
	}
	.stat-label {
		font-size: 13px;
		color: #888;
		margin-bottom: 6px;
	}
	.stat-value {
		font-size: 20px;
		font-weight: bold;
		color: #3B6D11;
	}
	.menu-grid {
		display: grid;
		grid-template-columns: repeat(5, 1fr);
		gap: 12px;
	}
	.menu-btn {
		display: block;
		text-align: center;
		background-color: #3B6D11;
		color: #fff;
		padding: 16px 0;
		border-radius: 8px;
		text-decoration: none;
		font-weight: bold;
		font-size: 14px;
		cursor: pointer;
		border: none;
	}
	.menu-btn.disabled {
		background-color: #b7c9ac;
	}
	.chart-panel {
		background: #fff;
		border-radius: 12px;
		box-shadow: 0 2px 8px rgba(0,0,0,0.08);
		padding: 20px;
		margin-bottom: 24px;
	}
</style>
</head>
<body>
	<header>
		<div class="logo">🛠 관리자 대시보드</div>
		<a href="${pageContext.request.contextPath}/admin/logout">🔒 로그아웃</a>
	</header>
	<div class="container">
		<div class="page-title">📊 관리자 대시보드</div>
		<div class="stat-grid">
			<div class="stat-card">
				<div class="stat-label">👤 총 회원</div>
				<div class="stat-value">${userCount}명</div>
			</div>
			<div class="stat-card">
				<div class="stat-label">📦 총 주문</div>
				<div class="stat-value">${orderCount}건</div>
			</div>
			<div class="stat-card">
				<div class="stat-label">💰 총 매출</div>
				<div class="stat-value"><fmt:formatNumber value="${totalSales}" pattern="#,##0"/>원</div>
			</div>
			<div class="stat-card">
				<div class="stat-label">🔄 환불신청</div>
				<div class="stat-value">${pendingRefundCount}건</div>
			</div>
			<a href="${pageContext.request.contextPath}/inquiry/list" class="stat-card">
				<div class="stat-label">📋 미답변 문의</div>
				<div class="stat-value">${unansweredCount}건</div>
			</a>
		</div>

		<div class="chart-panel">
			<canvas id="statChart" height="80"></canvas>
		</div>

		<div class="menu-grid">
			<a class="menu-btn" href="${pageContext.request.contextPath}/admin/products">📦 상품관리</a>
			<a class="menu-btn" href="${pageContext.request.contextPath}/admin/orders">🧾 주문관리</a>
			<a class="menu-btn" href="${pageContext.request.contextPath}/refund/admin/list">🔄 환불관리</a>
			<a class="menu-btn" href="${pageContext.request.contextPath}/admin/members">👥 회원관리</a>
			<a class="menu-btn" href="${pageContext.request.contextPath}/inquiry/list">📋 고객문의관리</a>
		</div>
	</div>

	<script>
	const ctx = document.getElementById('statChart').getContext('2d');
	new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: ['총 회원', '총 주문', '환불신청', '미답변 문의'],
	        datasets: [{
	            label: '건수',
	            data: [${userCount}, ${orderCount}, ${pendingRefundCount}, ${unansweredCount}],
	            backgroundColor: ['#3B6D11', '#6b8e5a', '#d32f2f', '#e8963c'],
	            borderRadius: 6
	        }]
	    },
	    options: {
	        responsive: true,
	        plugins: {
	            legend: { display: false }
	        },
	        scales: {
	            y: { beginAtZero: true }
	        }
	    }
	});
	</script>
</body>
</html>