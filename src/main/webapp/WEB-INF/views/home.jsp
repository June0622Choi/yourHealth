<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>너의건강 YOUR HEALTH</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/banner.css">
</head>
<body>

<!-- 팝업 -->
<div class="modal-bg" id="modalBg" onclick="closeModal(event)">
    <div class="modal">
        <span class="modal-close" onclick="closeModalBtn()">✕</span>
        <div class="modal-img-wrap">
            <img class="modal-img" id="modalImg">
        </div>
        <div class="modal-badge" id="modalBadge">20대 추천</div>
        <div class="modal-name" id="modalName"></div>
        <div class="modal-price" id="modalPrice"></div>
        <div class="modal-desc" id="modalDesc"></div>
        <div class="modal-caution-box" id="modalCaution"></div>
        <div class="modal-cert">🏅 식품의약품안전처(식약처) 기능성 원료 인정 제품입니다.</div>
        <div class="modal-review-title">💬 고객 리뷰</div>
        <div id="modalReviews"></div>
        <div id="reviewFormArea" style="margin-top:10px;"></div>
        <button class="modal-btn" id="cartBtn">🛒 장바구니 담기</button>
    </div>
</div>

<!-- 헤더 -->
<div class="header">
    <div class="logo">
        <a href="http://192.168.0.35:8080/portalMain/" class="team-tag">INFO <span class="five">FIVE</span></a>
        <a href="${pageContext.request.contextPath}/" class="logo-link">
        <img src="${pageContext.request.contextPath}/image/logo.png" width="35" height="35" style="vertical-align:middle; margin-right:8px;">
        너의건강 YOUR HEALTH
    </div>
    <div class="nav">
    <a href="${pageContext.request.contextPath}/">🏠홈</a>
    <a href="${pageContext.request.contextPath}/cart/list">🛒장바구니</a>

     <a href="${pageContext.request.contextPath}/inquiry/list">📋고객문의</a>
        <a href="${pageContext.request.contextPath}/order/list">🧾마이페이지</a>
    <% if (session.getAttribute("loginId") != null) { %>
       <span style="color:#ffffff; font-weight:bold; margin-left:15px;">😊${sessionScope.loginName}님 안녕하세요!😊</span>
        <a href="${pageContext.request.contextPath}/user/logout">🔒로그아웃</a>
    <% } else { %>
        <a href="${pageContext.request.contextPath}/user/login">🔒로그인</a>
        <a href="${pageContext.request.contextPath}/user/register">🧑‍🤝‍🧑회원가입</a>
    <% } %>
    </div>
</div>

<!-- 배너 슬라이드 -->
<div class="banner" id="bannerSlide">
    <div class="circle c1"></div>
    <div class="circle c2"></div>
    <div class="circle c3"></div>
    <div class="circle c4"></div>
    <img src="${pageContext.request.contextPath}/image/banner.png" class="slide-img active">
    <img src="${pageContext.request.contextPath}/image/banner2.png" class="slide-img active">
    <img src="${pageContext.request.contextPath}/image/banner3.png" class="slide-img active">
    <img src="${pageContext.request.contextPath}/image/banner4.png" class="slide-img active">
</div>

<!-- 베스트 상품 -->
<div class="section">
    <div class="section-title">🏆 BEST 베스트 상품</div>
    <div class="product-grid">
        <div class="product-card" onclick="openModal(1,'capsule.png','슬림컷 지방분해 캡슐','25,000','강력한 지방분해 성분으로 탄탄한 바디라인! 카르니틴, 공액리놀레산(CLA), 녹차추출물 함유.','BEST 1위','임산부 및 수유부 섭취 금지. 1일 2캡슐 초과 복용 금지.')">
            <div class="product-emoji">
                <img src="${pageContext.request.contextPath}/image/capsule.png" width="80" height="80" style="object-fit:cover; border-radius:8px;">
            </div>
            <div class="product-name">슬림컷 지방분해 캡슐</div>
            <div class="product-price">25,000원</div>
        </div>
        <div class="product-card" onclick="openModal(2,'fire.png','대사부스터 포뮬라','18,000','기초대사율을 높여주는 특화 포뮬라. 코엔자임Q10, B비타민, 아쉬와간다 함유.','BEST 2위','고혈압·심장질환자는 의사 상담 필요. 취침 4시간 전 섭취 금지.')">
            <div class="product-emoji">
                <img src="${pageContext.request.contextPath}/image/fire.png" width="80" height="80" style="object-fit:cover; border-radius:8px;">
            </div>
            <div class="product-name">대사부스터 포뮬라</div>
            <div class="product-price">18,000원</div>
        </div>
        <div class="product-card" onclick="openModal(3,'sparkle.png','콜라겐 다이어트 40플러스','65,000','40대 이상을 위한 콜라겐 다이어트. 저분자 콜라겐과 히알루론산 함유.','BEST 3위','알레르기 체질은 성분 확인 후 섭취. 1일 1포 권장.')">
            <div class="product-emoji">
                <img src="${pageContext.request.contextPath}/image/sparkle.png" width="80" height="80" style="object-fit:cover; border-radius:8px;">
            </div>
            <div class="product-name">콜라겐 다이어트 40플러스</div>
            <div class="product-price">65,000원</div>
        </div>
        <div class="product-card" onclick="openModal(4,'leaf.png','시니어 슬림케어','48,000','시니어를 위한 맞춤 슬림케어. 소화 부담을 줄인 저자극 성분 구성.','BEST 4위','지병이 있는 경우 복용 전 의사와 상담하세요.')">
            <div class="product-emoji">
                <img src="${pageContext.request.contextPath}/image/leaf.png" width="80" height="80" style="object-fit:cover; border-radius:8px;">
            </div>
            <div class="product-name">시니어 슬림케어</div>
            <div class="product-price">48,000원</div>
        </div>
    </div>
</div>

<!-- 연령별 탭 -->
<div class="section">
    <div class="section-title">🧑‍🤝‍🧑 연령대별 상품</div>
    <div class="tab-wrap">
         <div class="tab active" onclick="filterCategory('전체', this)">전체</div>
         <div class="tab" onclick="filterCategory('20대', this)">20대</div>
        <div class="tab" onclick="filterCategory('30대', this)">30대</div>
        <div class="tab" onclick="filterCategory('40대', this)">40대</div>
        <div class="tab" onclick="filterCategory('50대이상', this)">50대이상</div>
    </div>

   <div class="product-grid">
    <div class="product-card" data-category="20대" onclick="openModal(1,'capsule.png','슬림컷 지방분해 캡슐','25,000','강력한 지방분해 성분으로 탄탄한 바디라인! 카르니틴, 공액리놀레산(CLA), 녹차추출물 함유.','20대 추천','임산부 및 수유부 섭취 금지. 1일 2캡슐 초과 복용 금지.')">
        <div class="product-emoji">
            <img src="${pageContext.request.contextPath}/image/capsule.png" width="80" height="80" style="object-fit:cover; border-radius:8px;">
        </div>
        <div class="product-name">슬림컷 지방분해 캡슐</div>
        <div class="product-price">25,000원</div>
    </div>

    <div class="product-card" data-category="30대" onclick="openModal(2,'fire.png','대사부스터 포뮬라','18,000','기초대사율을 높여주는 특화 포뮬라. 코엔자임Q10, B비타민, 아쉬와간다 함유.','30대 추천','고혈압·심장질환자는 의사 상담 필요. 취침 4시간 전 섭취 금지.')">
        <div class="product-emoji">
            <img src="${pageContext.request.contextPath}/image/fire.png" width="80" height="80" style="object-fit:cover; border-radius:8px;">
        </div>
        <div class="product-name">대사부스터 포뮬라</div>
        <div class="product-price">18,000원</div>
    </div>

    <div class="product-card" data-category="40대" onclick="openModal(3,'sparkle.png','콜라겐 다이어트 40플러스','65,000','40대 이상을 위한 콜라겐 다이어트. 저분자 콜라겐과 히알루론산 함유.','40대 추천','알레르기 체질은 성분 확인 후 섭취. 1일 1포 권장.')">
        <div class="product-emoji">
            <img src="${pageContext.request.contextPath}/image/sparkle.png" width="80" height="80" style="object-fit:cover; border-radius:8px;">
        </div>
        <div class="product-name">콜라겐 다이어트 40플러스</div>
        <div class="product-price">65,000원</div>
    </div>

    <div class="product-card" data-category="50대이상" onclick="openModal(4,'leaf.png','시니어 슬림케어','48,000','시니어를 위한 맞춤 슬림케어. 소화 부담을 줄인 저자극 성분 구성.','50대 추천','지병이 있는 경우 복용 전 의사와 상담하세요.')">
        <div class="product-emoji">
            <img src="${pageContext.request.contextPath}/image/leaf.png" width="80" height="80" style="object-fit:cover; border-radius:8px;">
        </div>
        <div class="product-name">시니어 슬림케어</div>
        <div class="product-price">48,000원</div>
    </div>

    <div class="product-card" data-category="20대" onclick="openModal(6,'night.png','나이트번 야간지방연소','19,000','자는 동안 지방 연소를 돕는 나이트번. 취침 전 간편 섭취.','20대 추천','불면증이 있는 경우 섭취를 피해주세요.')">
        <div class="product-emoji">
            <img src="${pageContext.request.contextPath}/image/night.png" width="80" height="80" style="object-fit:cover; border-radius:8px;">
        </div>
        <div class="product-name">나이트번 야간지방연소</div>
        <div class="product-price">19,000원</div>
    </div>

    <div class="product-card" data-category="30대" onclick="openModal(7,'vitamin.png','이너뷰티 멀티비타민','45,000','속부터 챙기는 이너뷰티 멀티비타민. 비오틴, 콜라겐 함유.','30대 추천','다른 비타민제와 중복 섭취 시 과다 섭취에 주의하세요.')">
        <div class="product-emoji">
            <img src="${pageContext.request.contextPath}/image/vitamin.png" width="80" height="80" style="object-fit:cover; border-radius:8px;">
        </div>
        <div class="product-name">이너뷰티 멀티비타민</div>
        <div class="product-price">45,000원</div>
    </div>

    <div class="product-card" data-category="40대" onclick="openModal(8,'moisture.png','히알루론산 수분케어','58,000','피부 속 수분을 채워주는 히알루론산. 저분자 흡수 기술 적용.','40대 추천','피부 트러블이 있는 경우 섭취 전 확인이 필요합니다.')">
        <div class="product-emoji">
            <img src="${pageContext.request.contextPath}/image/moisture.png" width="80" height="80" style="object-fit:cover; border-radius:8px;">
        </div>
        <div class="product-name">히알루론산 수분케어</div>
        <div class="product-price">58,000원</div>
    </div>

    <div class="product-card" data-category="50대이상" onclick="openModal(9,'omega.png','오메가3 혈관케어','32,000','혈관 건강을 지키는 오메가3. EPA/DHA 고함량 정제.','50대 추천','혈액응고 관련 약물 복용 중이면 의사와 상담하세요.')">
        <div class="product-emoji">
            <img src="${pageContext.request.contextPath}/image/omega.png" width="80" height="80" style="object-fit:cover; border-radius:8px;">
        </div>
        <div class="product-name">오메가3 혈관케어</div>
        <div class="product-price">32,000원</div>
    </div>
</div>
</div>

<!-- 푸터 -->
<div class="footer">
    <p>© 2026 너의건강 | 사업자등록번호 000-00-00000 | 대표자: June Choi
    <p style="font-size:13px; opacity:0.85; margin-top:6px;">
        📧 비즈니스 문의: help@yourhealth.com &nbsp;|&nbsp; ☎ 1544-0000
        <a href="${pageContext.request.contextPath}/admin/login">관리자</a></p>
    </p>
</div>
 
<script>
var ctx = "${pageContext.request.contextPath}";
var currentProductId = null;
var isLoggedIn = <% if (session.getAttribute("loginId") != null) { %>true<% } else { %>false<% } %>;

function openModal(pid, img, name, price, desc, badge, caution) {
    currentProductId = pid;

    document.getElementById('modalImg').src = ctx + '/image/' + img;
    document.getElementById('modalBadge').innerText = badge;
    document.getElementById('modalName').innerText = name;
    document.getElementById('modalPrice').innerText = price + '원';
    document.getElementById('modalDesc').innerText = desc;
    document.getElementById('modalCaution').innerText = '⚠️ 주의사항: ' + caution;
    document.getElementById('modalBg').classList.add('show');

    fetch(ctx + '/review/list?product_id=' + pid)
        .then(res => res.json())
        .then(reviews => {
            const container = document.getElementById('modalReviews');
            if (reviews.length === 0) {
                container.innerHTML = '<div class="modal-review">아직 리뷰가 없습니다.</div>';
            } else {
                container.innerHTML = reviews.map(r => {
                    const stars = '⭐'.repeat(r.rating);
                    return '<div class="modal-review">' + stars + ' ' + r.content + '</div>';
                }).join('');
            }
        })
        .catch(() => {
            document.getElementById('modalReviews').innerHTML = '<div class="modal-review">리뷰를 불러올 수 없습니다.</div>';
        });
    if (isLoggedIn) {
        document.getElementById('reviewFormArea').innerHTML =
            '<textarea id="reviewContent" placeholder="리뷰를 남겨보세요" style="width:100%; padding:8px; border:1px solid #ddd; border-radius:6px; font-size:12px; resize:vertical; min-height:50px;"></textarea>' +
            '<select id="reviewRating" style="width:100%; margin-top:6px; padding:6px; border-radius:6px; border:1px solid #ddd; font-size:12px;">' +
            '<option value="5">⭐⭐⭐⭐⭐ (5점)</option>' +
            '<option value="4">⭐⭐⭐⭐ (4점)</option>' +
            '<option value="3">⭐⭐⭐ (3점)</option>' +
            '<option value="2">⭐⭐ (2점)</option>' +
            '<option value="1">⭐ (1점)</option>' +
            '</select>' +
            '<button onclick="submitReview()" style="width:100%; margin-top:6px; padding:8px; background:#3B6D11; color:#fff; border:none; border-radius:6px; font-weight:bold; cursor:pointer; font-size:12px;">리뷰 등록</button>';
    } else {
        document.getElementById('reviewFormArea').innerHTML =
            '<div style="font-size:12px; color:#999;">리뷰를 작성하려면 로그인이 필요합니다.</div>';
    }

    document.getElementById('cartBtn').onclick = function() {
        fetch(ctx + '/cart/add', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'productId=' + currentProductId + '&quantity=1'
        }).then(function(response) {
            if (response.redirected && response.url.indexOf('/user/login') !== -1) {
                alert('로그인이 필요합니다!');
                window.location.href = ctx + '/user/login';
            } else {
                window.location.href = ctx + '/cart/list';
            }
        });
    }
}
function submitReview() {
    var content = document.getElementById('reviewContent').value;
    var rating = document.getElementById('reviewRating').value;

    if (!content.trim()) {
        alert('리뷰 내용을 입력해주세요.');
        return;
    }

    fetch(ctx + '/review/write', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: 'productId=' + currentProductId + '&rating=' + rating + '&content=' + encodeURIComponent(content)
    }).then(res => res.text())
    .then(result => {
        if (result === 'login_required') {
            alert('로그인이 필요합니다.');
        } else {
            alert('리뷰가 등록되었습니다!');
            document.getElementById('reviewFormArea').innerHTML = '';

            fetch(ctx + '/review/list?product_id=' + currentProductId)
                .then(res => res.json())
                .then(reviews => {
                    const container = document.getElementById('modalReviews');
                    container.innerHTML = reviews.map(r => {
                        const stars = '⭐'.repeat(r.rating);
                        return '<div class="modal-review">' + stars + ' ' + r.content + '</div>';
                    }).join('');
                });
        }
    });
}
function closeModal(event) {
    if(event.target === document.getElementById('modalBg')) {
        document.getElementById('modalBg').classList.remove('show');
    }
}

function closeModalBtn() {
    document.getElementById('modalBg').classList.remove('show');
}

function filterCategory(category, tabEl) {
    document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
    tabEl.classList.add('active');

    const ageSection = document.querySelectorAll('.section')[1];
    const cards = ageSection.querySelectorAll('.product-card');

    cards.forEach(card => {
        if (category === '전체' || card.dataset.category === category) {
            card.style.display = '';
        } else {
            card.style.display = 'none';
        }
    });
}
let slideIndex = 0;
function autoSlide() {
    const slides = document.querySelectorAll('.slide-img');
    if (slides.length === 0) return;
    slides[slideIndex].classList.remove('active');
    slideIndex = (slideIndex + 1) % slides.length;
    slides[slideIndex].classList.add('active');
}
setInterval(autoSlide, 2500);

</script>
</body>
</html>
