<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>고객문의 - 너의건강</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/banner.css">
    <style>
        * { box-sizing: border-box; }
        body {
		margin: 0; 
        font-family: 'Malgun Gothic', sans-serif; 
        background-color: #eef2e6; 
        color: #333; 
        
        }

        .header {
            background-color: #3B6D11;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header .logo {
            color: #fff;
            font-size: 22px;
            font-weight: bold;
        }
        .header .nav a {
            color: #fff;
            text-decoration: none;
            margin-left: 20px;
            font-size: 14px;
            font-weight: bold;
        }

        .board-wrap {
            max-width: 900px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .board-title {
            font-size: 24px;
            font-weight: bold;
            color: #3B6D11;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }

        th {
            background: #3B6D11;
            color: white;
            padding: 12px;
        }

        td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }

        tr:hover {
            background: #f7faf3;
            cursor: pointer;
        }

        .status-wait {
            color: #d32f2f;
            font-weight: bold;
        }

        .status-done {
            color: #3B6D11;
            font-weight: bold;
        }
        .btn-write {
            display: inline-block;
            margin-bottom: 15px;
            padding: 10px 20px;
            background: #3B6D11;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
        }

        .empty {
            text-align: center;
            padding: 40px;
            color: #999;
        }

        .footer {
            background: #3B6D11;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 40px;
            font-size: 13px;
        }

        .new-badge {
            background-color: #e8963c;
            color: #fff;
            font-size: 10px;
            font-weight: bold;
            padding: 2px 6px;
            border-radius: 8px;
            margin-left: 6px;
        }
    </style>
</head>
<body>

    <div class="header">
        <div class="logo">
            <img src="${pageContext.request.contextPath}/image/logo.png" width="35" height="35" style="vertical-align:middle; margin-right:8px;">
            너의건강 YOUR HEALTH
        </div>
        <div class="nav">
            <a href="${pageContext.request.contextPath}/">🏠홈</a>
            <a href="${pageContext.request.contextPath}/cart/list">🛒장바구니</a>
            <a href="${pageContext.request.contextPath}/order/checkout">💳주문/결제</a>
            <a href="${pageContext.request.contextPath}/inquiry/list">📋고객문의</a>

            <c:choose>
                <c:when test="${sessionScope.adminId != null}">
                    <a href="${pageContext.request.contextPath}/admin/dashboard">← 대시보드</a>
                    <a href="${pageContext.request.contextPath}/admin/logout">🔒 로그아웃</a>
                </c:when>
                <c:when test="${sessionScope.loginId != null}">
                    <a href="${pageContext.request.contextPath}/order/list">🧾마이페이지</a>
                    <span style="color:#ffffff; font-weight:bold; margin-left:15px;">😊${sessionScope.loginName}님 안녕하세요!😊</span>
                    <a href="${pageContext.request.contextPath}/user/logout">🔒로그아웃</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/user/login">🔒로그인</a>
                    <a href="${pageContext.request.contextPath}/user/register">회원가입</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="board-wrap">
        <div class="board-title">📋 고객문의 게시판</div>
        <a href="${pageContext.request.contextPath}/inquiry/write" class="btn-write">✏️ 문의 작성</a>

        <c:choose>
            <c:when test="${empty list}">
                <div class="empty">아직 등록된 문의가 없습니다.</div>
            </c:when>
            <c:otherwise>
                <c:set var="today"><fmt:formatDate value="<%= new Date() %>" pattern="yyyy-MM-dd"/></c:set>
                <table>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>상태</th>
                        <th>작성일</th>
                    </tr>
                    <c:forEach var="inq" items="${list}">
                        <c:set var="postDate"><fmt:formatDate value="${inq.created_at}" pattern="yyyy-MM-dd"/></c:set>
                        <tr onclick="location.href='${pageContext.request.contextPath}/inquiry/detail?id=${inq.inquiryId}'">
                            <td>${inq.inquiryId}</td>
                            <td>
                                <c:if test="${inq.is_secret == 'Y'}">🔒 </c:if>${inq.title}
                                <c:if test="${postDate == today}">
                                    <span class="new-badge">NEW</span>
                                </c:if>
                            </td>
                            <td>${inq.userName}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${inq.status == '답변대기'}">
                                        <span class="status-wait">답변대기</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status-done">답변완료</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td><fmt:formatDate value="${inq.created_at}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="footer">
    <p>© 2026 너의건강 | 사업자등록번호 000-00-00000 | 대표자: June Choi
    <p style="font-size:13px; opacity:0.85; margin-top:6px;">
        📧 비즈니스 문의: help@yourhealth.com &nbsp;|&nbsp; ☎ 1544-0000
        <a href="${pageContext.request.contextPath}/admin/login">관리자</a></p>
    </p>
</div>
</body>
</html>