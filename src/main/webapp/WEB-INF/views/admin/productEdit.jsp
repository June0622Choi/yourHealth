<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 | 너의건강 YOUR HEALTH</title>
<style>
	* { box-sizing: border-box; }
	body { margin: 0; font-family: 'Malgun Gothic', sans-serif; background-color: #eef2e6; color: #333; }
	header { background-color: #3B6D11; padding: 18px 40px; display: flex; justify-content: space-between; align-items: center; }
	header .logo { color: #fff; font-size: 20px; font-weight: bold; }
	header nav a { color: #fff; text-decoration: none; margin-left: 20px; font-size: 14px; font-weight: bold; }
	.container { max-width: 600px; margin: 40px auto; padding: 0 20px; }
	.page-title { font-size: 22px; font-weight: bold; color: #3B6D11; margin-bottom: 20px; }
	.panel { background-color: #fff; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.08); padding: 24px; }
	.form-row { margin-bottom: 14px; }
	.form-row label { display: block; font-size: 13px; color: #666; margin-bottom: 4px; font-weight: bold; }
	.form-row input, .form-row textarea {
		width: 100%; padding: 10px 12px; border: 1px solid #ddd; border-radius: 6px; font-size: 14px; font-family: inherit;
	}
	.form-row textarea { resize: vertical; min-height: 60px; }
	.submit-btn {
		width: 100%; padding: 14px 0; background-color: #3B6D11; color: #fff; border: none;
		border-radius: 8px; font-size: 15px; font-weight: bold; cursor: pointer; margin-top: 8px;
	}
</style>
</head>
<body>
	<header>
		<div class="logo">📦 상품 수정</div>
		<nav>
			<a href="${pageContext.request.contextPath}/admin/products">← 상품관리</a>
			<a href="${pageContext.request.contextPath}/admin/logout">🔒 로그아웃</a>
		</nav>
	</header>
	<div class="container">
		<div class="page-title">✏️ 상품 수정</div>
		<div class="panel">
			<form action="${pageContext.request.contextPath}/admin/products/edit" method="post">
				<input type="hidden" name="productId" value="${product.productId}">
				<div class="form-row">
					<label>상품명</label>
					<input type="text" name="name" value="${product.name}" required>
				</div>
				<div class="form-row">
					<label>가격</label>
					<input type="number" name="price" value="${product.price}" required>
				</div>
				<div class="form-row">
					<label>카테고리</label>
					<input type="text" name="category" value="${product.category}" required>
				</div>
				<div class="form-row">
					<label>재고</label>
					<input type="number" name="stock" value="${product.stock}" required>
				</div>
				<div class="form-row">
					<label>상품 설명</label>
					<textarea name="description">${product.description}</textarea>
				</div>
				<div class="form-row">
					<label>주의사항</label>
					<textarea name="caution">${product.caution}</textarea>
				</div>
				<div class="form-row">
					<label>이미지 파일명</label>
					<input type="text" name="imgEmoji" value="${product.imgEmoji}">
				</div>
				<button type="submit" class="submit-btn">✅ 수정 완료</button>
			</form>
		</div>
	</div>
</body>
</html>