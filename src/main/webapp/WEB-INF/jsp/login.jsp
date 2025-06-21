<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>로그인 - 아트케이션 고성</title>
  <meta name="description" content="아트케이션 고성 로그인 페이지">
  <meta name="keywords" content="고성, 예술인, 로그인, 아트케이션">

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

<body class="login-page">

  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

      <a href="<c:url value='/'/>" class="logo d-flex align-items-center">
        <h1 class="sitename">Artcation Goseong</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="<c:url value='/'/>">홈</a></li>
          <li><a href="<c:url value='/#about'/>">아트케이션 고성이란</a></li>
          <li><a href="<c:url value='/blog'/>">예술인 기록</a></li>
          <li><a href="<c:url value='/community'/>">커뮤니티</a></li>

        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

    </div>
  </header>

  <main class="main">

    <!-- Page Title -->
    <div class="page-title dark-background">
      <div class="container">
        <h1>로그인</h1>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="<c:url value='/'/>">홈</a></li>
            <li class="current">로그인</li>
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->

    <!-- Login Section -->
    <section class="contact section">
      <div class="container">
        
        <!-- Flash Messages -->
        <c:if test="${not empty error}">
          <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="bi bi-exclamation-triangle-fill"></i>
            ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
          </div>
        </c:if>

        <c:if test="${not empty message}">
          <div class="alert alert-info alert-dismissible fade show" role="alert">
            <i class="bi bi-info-circle-fill"></i>
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
          </div>
        </c:if>
        
        <div class="row justify-content-center">
          <div class="col-lg-6">
            
            <form action="<c:url value='/login'/>" method="post" class="login-form">
              
              <!-- 로그인 안내 -->
              <div class="row gy-4 mb-4">
                <div class="col-md-12 text-center">
                  <h3><i class="bi bi-person-circle"></i> 로그인</h3>
                  <p class="text-muted">예술인 기록 작성을 위해 로그인해주세요</p>
                </div>
              </div>

              <!-- 로그인 폼 -->
              <div class="row gy-4 mb-4">
                <div class="col-md-12">
                  <label for="username" class="form-label">
                    <i class="bi bi-person-fill"></i> 사용자명 <span class="text-danger">*</span>
                  </label>
                  <input type="text" class="form-control" id="username" name="username" 
                         placeholder="사용자명을 입력하세요" autocomplete="username" required>
                </div>
              </div>

              <div class="row gy-4 mb-4">
                <div class="col-md-12">
                  <label for="password" class="form-label">
                    <i class="bi bi-lock-fill"></i> 비밀번호 <span class="text-danger">*</span>
                  </label>
                  <input type="password" class="form-control" id="password" name="password" 
                         placeholder="비밀번호를 입력하세요" autocomplete="current-password" required>
                </div>
              </div>

              <!-- 버튼 -->
              <div class="row">
                <div class="col-md-12 text-center">
                  <button type="submit" class="btn btn-primary me-2">
                    <i class="bi bi-box-arrow-in-right"></i> 로그인
                  </button>
                  <a href="<c:url value='/'/>" class="btn btn-secondary">
                    <i class="bi bi-house-fill"></i> 홈으로
                  </a>
                </div>
              </div>

            </form>
            
          </div>
        </div>

      </div>
    </section>

  </main>

  <!-- 로그인 폼 검증 스크립트 -->
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      const loginForm = document.querySelector('form');
      
      if (loginForm) {
        loginForm.addEventListener('submit', function(e) {
          const username = document.getElementById('username').value.trim();
          const password = document.getElementById('password').value.trim();
          
          if (!username) {
            alert('사용자명을 입력해주세요.');
            e.preventDefault();
            document.getElementById('username').focus();
            return false;
          }
          
          if (!password) {
            alert('비밀번호를 입력해주세요.');
            e.preventDefault();
            document.getElementById('password').focus();
            return false;
          }
          
          // 폼 제출 중 버튼 비활성화
          const submitBtn = this.querySelector('button[type="submit"]');
          if (submitBtn) {
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<i class="bi bi-hourglass-split"></i> 로그인 중...';
          }
        });
      }
    });
  </script>

  <!-- Vendor JS Files -->
  <script src="<c:url value='/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/aos/aos.js'/>"></script>
  <script src="<c:url value='/assets/vendor/glightbox/js/glightbox.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/isotope-layout/isotope.pkgd.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/swiper/swiper-bundle.min.js'/>"></script>

  <!-- Main JS File -->
  <script src="<c:url value='/assets/js/main.js'/>"></script>

<%@ include file="common/footer.jsp" %> 