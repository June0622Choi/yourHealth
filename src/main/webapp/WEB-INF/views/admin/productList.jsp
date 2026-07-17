<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리 | 너의건강 YOUR HEALTH</title>
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
	.add-btn {
		display: inline-block;
		margin-bottom: 12px;
		background-color: #3B6D11;
		color: #fff;
		padding: 8px 16px;
		border-radius: 6px;
		text-decoration: none;
		font-size: 13px;
		font-weight: bold;
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
	.stock-low {
		color: #b33;
		font-weight: bold;
	}
	.edit-link {
		color: #3B6D11;
		font-weight: bold;
		text-decoration: none;
	}
</style>
</head>
<body>

	<header>
		<div class="logo">📦 상품관리</div>
		<nav>
			<a href="${pageContext.request.contextPath}/admin/dashboard">← 대시보드</a>
			<a href="${pageContext.request.contextPath}/admin/logout">🔒 로그아웃</a>
		</nav>
	</header>

	<div class="container">
		<div class="page-title">📦 상품관리 (전체 ${productList.size()}개)</div>

		<a class="add-btn" href="${pageContext.request.contextPath}/admin/products/add">➕ 상품 추가</a>

		<table>
			<tr>
				<th>번호</th>
				<th>상품명</th>
				<th>카테고리</th>
				<th>가격</th>
				<th>재고</th>
				<th>관리</th>
			</tr>
			<c:forEach var="p" items="${productList}">
				<tr>
					<td>${p.productId}</td>
					<td>${p.name}</td>
					<td>${p.category}</td>
					<td><fmt:formatNumber value="${p.price}" pattern="#,##0"/>원</td>
					<td class="${p.stock < 10 ? 'stock-low' : ''}">${p.stock}개</td>
					<td>
    <a class="edit-link" href="${pageContext.request.contextPath}/admin/products/edit?productId=${p.productId}">✏️ 수정</a>
    &nbsp;
    <form action="${pageContext.request.contextPath}/admin/products/delete" method="post" style="display:inline;">
        <input type="hidden" name="productId" value="${p.productId}">
        <button type="submit" style="background:none; border:none; color:#b33; font-weight:bold; cursor:pointer; font-size:14px;"
            onclick="return confirm('정말 삭제하시겠습니까?');">🗑 삭제</button>
    </form>
</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>