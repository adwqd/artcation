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
        <h1 class="sitename">아트케이션 고성</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="<c:url value='/'/>">홈</a></li>
          <li><a href="<c:url value='/#about'/>">예술인 소개</a></li>
          <li><a href="<c:url value='/blog'/>">예술인 기록</a></li>
          <li><a href="<c:url value='/community'/>">커뮤니티</a></li>
          <li><a href="<c:url value='/#promotions'/>">홍보 및 공지</a></li>
          <li><a href="<c:url value='/#contact'/>">문의하기</a></li>
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
            <h1>로그인</h1>
            <p>예술인 및 관리자 로그인</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Login Section -->
    <section class="section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-6 col-md-8">
            
            <div class="card shadow">
              <div class="card-header bg-primary text-white text-center">
                <h4 class="mb-0">로그인</h4>
                <p class="mb-0 mt-2">예술인 기록 작성을 위해 로그인해주세요</p>
              </div>
              <div class="card-body p-4">
                
                <c:if test="${not empty error}">
                  <div class="alert alert-danger" role="alert">
                    <i class="bi bi-exclamation-triangle-fill"></i>
                    ${error}
                  </div>
                </c:if>

                <c:if test="${not empty message}">
                  <div class="alert alert-info" role="alert">
                    <i class="bi bi-info-circle-fill"></i>
                    ${message}
                  </div>
                </c:if>

                <form action="<c:url value='/login'/>" method="post">
                  <div class="mb-3">
                    <label for="username" class="form-label">
                      <i class="bi bi-person-fill"></i> 사용자명
                    </label>
                    <input type="text" class="form-control" id="username" name="username" 
                           placeholder="사용자명을 입력하세요" required>
                  </div>
                  
                  <div class="mb-3">
                    <label for="password" class="form-label">
                      <i class="bi bi-lock-fill"></i> 비밀번호
                    </label>
                    <input type="password" class="form-control" id="password" name="password" 
                           placeholder="비밀번호를 입력하세요" required>
                  </div>
                  
                  <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary btn-lg">
                      <i class="bi bi-box-arrow-in-right"></i> 로그인
                    </button>
                  </div>
                </form>

                <hr class="my-4">
                
                <div class="text-center">
                  <h6 class="text-muted">테스트 계정</h6>
                  <div class="row">
                    <div class="col-6">
                      <small class="text-muted">
                        <strong>예술인:</strong><br>
                        ID: artist<br>
                        PW: artist123
                      </small>
                    </div>
                    <div class="col-6">
                      <small class="text-muted">
                        <strong>관리자:</strong><br>
                        ID: admin<br>
                        PW: admin123
                      </small>
                    </div>
                  </div>
                </div>

              </div>
              <div class="card-footer text-center">
                <a href="<c:url value='/'/>" class="btn btn-outline-secondary">
                  <i class="bi bi-house-fill"></i> 홈으로 돌아가기
                </a>
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

</body>

</html> 