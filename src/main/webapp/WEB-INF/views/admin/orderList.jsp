<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문관리 | 너의건강 YOUR HEALTH</title>
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
	 font-size: 14px; }
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
</style>
</head>
<body>
	<header>
		<div class="logo">🧾 주문관리</div>
		<nav>
			<a href="${pageContext.request.contextPath}/admin/dashboard">← 대시보드</a>
			<a href="${pageContext.request.contextPath}/admin/logout">🔒 로그아웃</a>
		</nav>
	</header>
	<div class="container">
		<div class="page-title">🧾 주문관리 (전체 ${orderList.size()}건)</div>
		<table>
			<tr>
				<th>주문번호</th>
				<th>받는 분</th>
				<th>금액</th>
				<th>상태</th>
			</tr>
			<c:forEach var="o" items="${orderList}">
				<tr>
					<td>${o.orderNumber}</td>
					<td>${o.buyerName}</td>
					<td><fmt:formatNumber value="${o.totalPrice}" pattern="#,##0"/>원</td>
					<td><span class="badge">${o.status}</span></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>