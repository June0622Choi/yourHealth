<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>고객문의 상세 - 너의건강</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/banner.css">
    <style>
        .detail-wrap {
            max-width: 700px;
            margin: 40px auto;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .detail-wrap h2 {
            color: #3B6D11;
            margin-bottom: 20px;
        }
        .inquiry-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 8px;
        }
        .inquiry-meta {
            font-size: 13px;
            color: #888;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
        .status-badge {
            display: inline-block;
            padding: 3px 10px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: bold;
            margin-left: 8px;
        }
        .status-wait { 
        background: #fff3cd; 
        color: #d39e00;
         }
         
        .status-done { 
        background: #d4edda; 
        color: #3B6D11; 
        }
        
        .inquiry-content {
            padding: 20px 0;
            line-height: 1.6;
            border-bottom: 1px solid #eee;
        }
        .secret-notice {
            padding: 20px 0;
            color: #999;
        }
        .answer-section {
            margin-top: 20px;
            padding: 20px;
            background: #f8faf5;
            border-radius: 8px;
        }
        .answer-section h3 {
            color: #3B6D11;
            font-size: 15px;
            margin-bottom: 10px;
        }
        .answer-content {
            line-height: 1.6;
            white-space: pre-wrap;
        }
        .no-answer {
            color: #999;
            font-size: 14px;
        }
        .answer-form textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            min-height: 100px;
            resize: vertical;
            box-sizing: border-box;
        }
        .btn-row {
            margin-top: 15px;
            display: flex;
            gap: 10px;
        }
        .btn-row button, .btn-row a {
            padding: 10px 18px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
        }
        .btn-primary {
            background: #3B6D11;
            color: white;
        }
        .btn-secondary {
            background: #e0e0e0;
            color: #333;
        }
        .btn-danger {
            background: #d32f2f;
            color: white;
        }
        .bottom-actions {
            margin-top: 25px;
            display: flex;
            justify-content: space-between;
        }
        
        .btn-primary, .btn-secondary, .btn-danger {
	    display: inline-block;
	    padding: 10px 18px;
	    border: none;
	    border-radius: 8px;
	    font-size: 14px;
	    font-weight: bold;
	    cursor: pointer;
	    text-decoration: none;
	    text-align: center;
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
            <a href="${pageContext.request.contextPath}/">홈</a>
            <a href="${pageContext.request.contextPath}/cart/list">🛒 장바구니</a>
            <a href="${pageContext.request.contextPath}/order/checkout">주문/결제</a>
            <a href="${pageContext.request.contextPath}/inquiry/list">📋 고객문의</a>
            
              <c:choose>
        <c:when test="${sessionScope.adminId != null}">
            <a href="${pageContext.request.contextPath}/admin/dashboard">← 대시보드</a>
            <a href="${pageContext.request.contextPath}/admin/logout">🔒 로그아웃</a>
        </c:when>
        <c:when test="${sessionScope.loginId != null}">
            <span style="color:#ffffff; font-weight:bold; margin-left:15px;">😊${sessionScope.loginName}님 안녕하세요!😊</span>
            <a href="${pageContext.request.contextPath}/order/list">마이페이지</a>
            <a href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/user/login">🔒 로그인</a>
            <a href="${pageContext.request.contextPath}/user/register">회원가입</a>
        </c:otherwise>
    </c:choose>
</div>
        </div>
    </div>

    <div class="detail-wrap">
        <h2>📋 고객문의 상세</h2>

        <div class="inquiry-title">
            ${inquiry.title}
            <c:choose>
                <c:when test="${inquiry.status == '답변완료'}">
                    <span class="status-badge status-done">답변완료</span>
                </c:when>
                <c:otherwise>
                    <span class="status-badge status-wait">답변대기</span>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="inquiry-meta">
            작성자: ${inquiry.userName} &nbsp;|&nbsp; 작성일: ${inquiry.created_at}
        </div>

        <c:choose>
            <c:when test="${inquiry.is_secret == 'Y' && sessionScope.adminId == null && sessionScope.loginId != inquiry.users_id}">
                <div class="secret-notice">
                    🔒 비밀글입니다. 작성자만 열람 가능합니다.
                </div>
            </c:when>
            <c:otherwise>
                <div class="inquiry-content">${inquiry.content}</div>

                <div class="answer-section">
                    <h3>💬 답변</h3>

                    <c:choose>
                        <c:when test="${empty inquiry.answer}">
                            <c:choose>
                                <c:when test="${sessionScope.adminId != null}">
                                    <form class="answer-form" action="${pageContext.request.contextPath}/inquiry/answer" method="post">
                                        <input type="hidden" name="inquiryId" value="${inquiry.inquiryId}">
                                        <textarea name="answer" placeholder="답변을 입력하세요" required></textarea>
                                        <div class="btn-row">
                                            <button type="submit" class="btn-primary">답변 등록</button>
                                        </div>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <div class="no-answer">아직 답변이 등록되지 않았습니다.</div>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${sessionScope.adminId != null}">
                                    <div id="answerView">
                                        <div class="answer-content">${inquiry.answer}</div>
                                        <div class="btn-row">
                                            <button type="button" class="btn-primary" onclick="toggleEditAnswer()">수정</button>
                                            <form action="${pageContext.request.contextPath}/inquiry/deleteAnswer" method="post"
                                                  onsubmit="return confirm('답변을 삭제하시겠습니까?');" style="display:inline;">
                                                <input type="hidden" name="id" value="${inquiry.inquiryId}">
                                                <button type="submit" class="btn-danger">삭제</button>
                                            </form>
                                        </div>
                                    </div>

                                    <div id="answerEditForm" style="display:none;">
                                        <form class="answer-form" action="${pageContext.request.contextPath}/inquiry/answer" method="post"
                                              onsubmit="return confirm('답변을 수정하시겠습니까?');">
                                            <input type="hidden" name="inquiryId" value="${inquiry.inquiryId}">
                                            <textarea name="answer" required>${inquiry.answer}</textarea>
                                            <div class="btn-row">
                                                <button type="submit" class="btn-primary">저장</button>
                                                <button type="button" class="btn-secondary" onclick="toggleEditAnswer()">취소</button>
                                            </div>
                                        </form>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="answer-content">${inquiry.answer}</div>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>
                </div>
            </c:otherwise>
        </c:choose>

        <div class="bottom-actions">
            <a href="${pageContext.request.contextPath}/inquiry/list" class="btn-secondary">← 목록으로</a>

            <c:if test="${sessionScope.loginId != null && sessionScope.loginId == inquiry.users_id}">
                <div class="btn-row">
                    <a href="${pageContext.request.contextPath}/inquiry/edit?id=${inquiry.inquiryId}" class="btn-secondary">수정</a>
                    <form action="${pageContext.request.contextPath}/inquiry/delete" method="post"
                          onsubmit="return confirm('문의글을 삭제하시겠습니까?');">
                        <input type="hidden" name="id" value="${inquiry.inquiryId}">
                        <button type="submit" class="btn-danger">삭제</button>
                    </form>
                </div>
            </c:if>
        </div>
    </div>

    <script>
    function toggleEditAnswer() {
        var view = document.getElementById('answerView');
        var edit = document.getElementById('answerEditForm');
        if (edit.style.display === 'none') {
            view.style.display = 'none';
            edit.style.display = 'block';
        } else {
            view.style.display = 'block';
            edit.style.display = 'none';
        }
    }
    </script>
</body>
</html>