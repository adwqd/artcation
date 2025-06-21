<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>예술인 기록 수정 - 아트케이션 고성</title>
  <meta name="description" content="예술인 기록 수정 페이지">
  <meta name="keywords" content="고성, 예술인, 기록, 수정">

  <!-- Favicons -->
  <link href="<c:url value='/assets/img/favicon.png'/>" rel="icon">
  <link href="<c:url value='/assets/img/apple-touch-icon.png'/>" rel="apple-touch-icon">

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="<c:url value='/assets/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
  <link href="<c:url value='/assets/vendor/bootstrap-icons/bootstrap-icons.css'/>" rel="stylesheet">
  <link href="<c:url value='/assets/vendor/aos/aos.css'/>" rel="stylesheet">
  <link href="<c:url value='/assets/vendor/glightbox/css/glightbox.min.css'/>" rel="stylesheet">
  <link href="<c:url value='/assets/vendor/swiper/swiper-bundle.min.css'/>" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="<c:url value='/assets/css/main.css'/>" rel="stylesheet">
</head>

<body class="blog-page">

  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

      <a href="<c:url value='/'/>" class="logo d-flex align-items-center">
        <h1 class="sitename">Artcation Goseong</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="<c:url value='/'/>">홈</a></li>
          <li><a href="<c:url value='/#about'/>">예술인 소개</a></li>
          <li><a href="<c:url value='/blog'/>" class="active">예술인 기록</a></li>
          <li><a href="<c:url value='/community'/>">커뮤니티</a></li>
          <li><a href="<c:url value='/#promotions'/>">홍보 및 공지</a></li>

          <c:choose>
            <c:when test="${not empty sessionScope.loginUser}">
              <li class="dropdown"><a href="#"><span>${sessionScope.displayName}님</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
                <ul>
                  <li><a href="<c:url value='/artist/write'/>">기록 작성</a></li>
                  <li><a href="<c:url value='/logout'/>">로그아웃</a></li>
                </ul>
              </li>
            </c:when>
            <c:otherwise>
              <li><a href="<c:url value='/login'/>">로그인</a></li>
            </c:otherwise>
          </c:choose>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

    </div>
  </header>

  <main class="main">

    <!-- Page Title -->
    <div class="page-title">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <h1>예술인 기록 수정</h1>
            <p>기록 내용을 수정해주세요</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Edit Form Section -->
    <section class="section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            
            <c:if test="${not empty error}">
              <div class="alert alert-danger" role="alert">
                <i class="bi bi-exclamation-triangle-fill"></i>
                ${error}
              </div>
            </c:if>

            <c:if test="${not empty message}">
              <div class="alert alert-success" role="alert">
                <i class="bi bi-check-circle-fill"></i>
                ${message}
              </div>
            </c:if>

            <!-- 기존 기록 정보 -->
            <div class="card mb-4">
              <div class="card-header bg-info text-white">
                <h5 class="mb-0">
                  <i class="bi bi-info-circle"></i> 기록 정보
                </h5>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-md-6">
                    <p><strong>작성자:</strong> ${post.displayName}</p>
                    <p><strong>작성일:</strong> ${post.createdAt}</p>
                  </div>
                  <div class="col-md-6">
                    <p><strong>조회수:</strong> ${post.viewCount}회</p>
                    <c:if test="${post.updatedAt != null}">
                      <p><strong>최종 수정:</strong> ${post.updatedAt}</p>
                    </c:if>
                  </div>
                </div>
              </div>
            </div>

            <div class="card shadow">
              <div class="card-header bg-warning text-dark">
                <h4 class="mb-0">
                  <i class="bi bi-pencil-square"></i> 기록 수정
                </h4>
                <p class="mb-0 mt-2">수정자: ${sessionScope.displayName} (${sessionScope.role == 'admin' ? '관리자' : '예술인'})</p>
              </div>
              <div class="card-body p-4">
                
                <form action="<c:url value='/artist/edit/${post.postId}'/>" method="post">
                  <div class="mb-4">
                    <label for="title" class="form-label">
                      <i class="bi bi-card-heading"></i> 제목 <span class="text-danger">*</span>
                    </label>
                    <input type="text" class="form-control" id="title" name="title" 
                           value="${post.title}" placeholder="예술인 기록의 제목을 입력하세요" required maxlength="200">
                    <div class="form-text">최대 200자까지 입력 가능합니다.</div>
                  </div>
                  
                  <div class="mb-4">
                    <label for="content" class="form-label">
                      <i class="bi bi-card-text"></i> 내용 <span class="text-danger">*</span>
                    </label>
                    <textarea class="form-control" id="content" name="content" rows="15" 
                              placeholder="예술 활동, 작품 소개, 전시회 후기, 창작 과정 등을 자유롭게 작성해주세요." required>${post.content}</textarea>
                    <div class="form-text">
                      <i class="bi bi-lightbulb"></i> 
                      다른 예술인들과 지역 주민들에게 도움이 될 수 있는 내용을 포함해주세요.
                    </div>
                  </div>
                  
                  <div class="d-flex gap-2 justify-content-between">
                    <div class="d-flex gap-2">
                      <a href="<c:url value='/blog/${post.postId}'/>" class="btn btn-outline-secondary">
                        <i class="bi bi-arrow-left"></i> 기록 보기
                      </a>
                      <a href="<c:url value='/blog'/>" class="btn btn-outline-secondary">
                        <i class="bi bi-list"></i> 목록으로
                      </a>
                    </div>
                    <div class="d-flex gap-2">
                      <button type="reset" class="btn btn-outline-warning">
                        <i class="bi bi-arrow-clockwise"></i> 되돌리기
                      </button>
                      <button type="submit" class="btn btn-warning">
                        <i class="bi bi-check-lg"></i> 수정 완료
                      </button>
                    </div>
                  </div>
                </form>

              </div>
            </div>

          </div>
        </div>
      </div>
    </section>

  </main>

  <!-- Footer -->
  <footer id="footer" class="footer dark-background">
    <div class="container footer-top">
      <div class="row gy-4">
        <div class="col-lg-4 col-md-6 footer-about">
          <a href="<c:url value='/'/>" class="logo d-flex align-items-center">
            <span class="sitename">아트케이션 고성</span>
          </a>
          <div class="footer-contact pt-3">
            <p>경상남도 고성군 고성읍 문화로 123</p>
            <p class="mt-3"><strong>전화:</strong> <span>055-123-4567</span></p>
            <p><strong>이메일:</strong> <span>artcation.goseong@gmail.com</span></p>
          </div>
          <div class="social-links d-flex mt-4">
            <a href=""><i class="bi bi-twitter-x"></i></a>
            <a href=""><i class="bi bi-facebook"></i></a>
            <a href=""><i class="bi bi-instagram"></i></a>
            <a href=""><i class="bi bi-youtube"></i></a>
            <a href=""><i class="bi bi-envelope"></i></a>
          </div>
        </div>
      </div>
    </div>

    <div class="container copyright text-center mt-4">
      <p>© <span>Copyright</span> <strong class="px-1 sitename">아트케이션 고성</strong> <span>All Rights Reserved</span></p>
    </div>
  </footer>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="<c:url value='/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/php-email-form/validate.js'/>"></script>
  <script src="<c:url value='/assets/vendor/aos/aos.js'/>"></script>
  <script src="<c:url value='/assets/vendor/glightbox/js/glightbox.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/swiper/swiper-bundle.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/isotope-layout/isotope.pkgd.min.js'/>"></script>

  <!-- Main JS File -->
  <script src="<c:url value='/assets/js/main.js'/>"></script>

  <script>
    // 폼 제출 전 확인
    document.querySelector('form').addEventListener('submit', function(e) {
      const title = document.getElementById('title').value.trim();
      const content = document.getElementById('content').value.trim();
      
      if (!title || !content) {
        e.preventDefault();
        alert('제목과 내용을 모두 입력해주세요.');
        return;
      }
      
      if (title.length > 200) {
        e.preventDefault();
        alert('제목은 200자 이내로 입력해주세요.');
        return;
      }
      
      if (content.length < 10) {
        e.preventDefault();
        alert('내용을 10자 이상 입력해주세요.');
        return;
      }
      
      if (!confirm('예술인 기록을 수정하시겠습니까?')) {
        e.preventDefault();
      }
    });

    // 글자 수 카운터
    document.getElementById('title').addEventListener('input', function() {
      const current = this.value.length;
      const max = 200;
      const counter = this.parentNode.querySelector('.form-text');
      counter.textContent = `${current}/${max}자 (최대 200자까지 입력 가능합니다.)`;
      
      if (current > max) {
        this.value = this.value.substring(0, max);
      }
    });

    // 페이지 로드 시 초기 글자 수 표시
    document.addEventListener('DOMContentLoaded', function() {
      const titleInput = document.getElementById('title');
      titleInput.dispatchEvent(new Event('input'));
    });
  </script>

</body>

</html> 