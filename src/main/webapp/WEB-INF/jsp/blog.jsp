<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>예술인 기록 - 아트케이션 고성</title>
  <meta name="description" content="고성 지역 예술인들의 작품과 경험을 공유하는 공간">
  <meta name="keywords" content="고성, 아트케이션, 예술인, 기록, 작품, 경험">

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
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="<c:url value='/assets/img/logo.png'/>" alt=""> -->
        <h1 class="sitename">아트케이션 고성</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="<c:url value='/'/>">홈</a></li>
          <li><a href="<c:url value='/#about'/>">예술인 소개</a></li>
          <li><a href="<c:url value='/blog'/>" class="active">예술인 기록</a></li>
          <li><a href="<c:url value='/community'/>">커뮤니티</a></li>
          <li><a href="<c:url value='/#promotions'/>">홍보 및 공지</a></li>
          <li class="dropdown"><a href="#"><span>더보기</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
            <ul>
              <li><a href="<c:url value='/artist'/>">예술인 관리</a></li>
              <li><a href="<c:url value='/starter'/>">공지사항</a></li>
              <li><a href="<c:url value='/#team'/>">운영진 소개</a></li>
            </ul>
          </li>
          <li><a href="<c:url value='/#contact'/>">문의하기</a></li>
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
          <div class="col-lg-12 text-center">
            <h1>예술인 기록</h1>
            <p>고성 지역 예술인들의 작품과 경험을 공유하는 공간</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Blog Section -->
    <section class="blog section">
      <div class="container">
        
        <!-- Action Buttons -->
        <div class="row mb-4">
          <div class="col-12 text-center">
            <c:choose>
              <c:when test="${not empty sessionScope.loginUser && (sessionScope.role == 'artist' || sessionScope.role == 'admin')}">
                <div class="alert alert-info d-inline-block me-3">
                  <i class="bi bi-person-check-fill"></i>
                  <strong>${sessionScope.displayName}님</strong> 환영합니다!
                </div>
                <a href="<c:url value='/artist/write'/>" class="btn btn-primary btn-lg">
                  <i class="bi bi-pencil-square"></i> 새 기록 작성하기
                </a>
              </c:when>
              <c:otherwise>
                <div class="alert alert-warning d-inline-block me-3">
                  <i class="bi bi-info-circle-fill"></i>
                  예술인 기록을 작성하려면 로그인이 필요합니다
                </div>
                <a href="<c:url value='/login'/>" class="btn btn-outline-primary btn-lg">
                  <i class="bi bi-box-arrow-in-right"></i> 로그인하기
                </a>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
        
        <div class="row gy-4">
          
          <!-- Blog Posts -->
          <c:forEach var="post" items="${blogPosts}" varStatus="status">
            <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="${status.index * 100}">
              <article class="blog-post">
                <div class="post-img">
                  <!-- 디버깅: 이미지 URL 확인 -->
                  <!-- postId: ${post.postId}, imageUrl: ${post.imageUrl} -->
                  <c:choose>
                    <c:when test="${not empty post.imageUrl}">
                      <img src="<c:url value='${post.imageUrl}'/>" alt="${post.title}" class="img-fluid">
                    </c:when>
                    <c:otherwise>
                      <img src="<c:url value='/assets/img/blog/blog-1.jpg'/>" alt="${post.title}" class="img-fluid">
                    </c:otherwise>
                  </c:choose>
                </div>
                <div class="post-content">
                  <h3 class="post-title">
                    <a href="<c:url value='/blog/${post.postId}'/>">${post.title}</a>
                  </h3>
                  <p class="post-excerpt">
                    <c:choose>
                      <c:when test="${fn:length(post.content) > 100}">
                        ${fn:substring(post.content, 0, 100)}...
                      </c:when>
                      <c:otherwise>
                        ${post.content}
                      </c:otherwise>
                    </c:choose>
                  </p>
                  <div class="post-meta">
                    <span class="post-date">
                      <i class="bi bi-calendar"></i>
                      <c:choose>
                        <c:when test="${not empty post.createdAt}">
                          ${post.createdAt.year}년 ${post.createdAt.monthValue}월 ${post.createdAt.dayOfMonth}일
                        </c:when>
                        <c:otherwise>
                          2024년 06월 21일
                        </c:otherwise>
                      </c:choose>
                    </span>
                    <span class="post-author">
                      <i class="bi bi-person"></i>
                      ${post.displayName}
                    </span>
                  </div>
                </div>
              </article>
            </div>
          </c:forEach>

          <!-- Sample Blog Posts (when no data) -->
          <c:if test="${empty blogPosts}">
            <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
              <article class="blog-post">
                <div class="post-img">
                  <img src="<c:url value='/assets/img/blog/blog-1.jpg'/>" alt="고성 예술" class="img-fluid">
                </div>
                <div class="post-content">
                  <h3 class="post-title">
                    <a href="#">고성의 아름다운 예술</a>
                  </h3>
                  <p class="post-excerpt">고성의 자연과 예술이 만나는 특별한 순간을 소개합니다.</p>
                  <div class="post-meta">
                    <span class="post-date">
                      <i class="bi bi-calendar"></i>
                      2024년 06월 20일
                    </span>
                    <span class="post-author">
                      <i class="bi bi-person"></i>
                      관리자
                    </span>
                  </div>
                </div>
              </article>
            </div>

            <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
              <article class="blog-post">
                <div class="post-img">
                  <img src="<c:url value='/assets/img/blog/blog-2.jpg'/>" alt="문화 행사" class="img-fluid">
                </div>
                <div class="post-content">
                  <h3 class="post-title">
                    <a href="#">문화 행사 소개</a>
                  </h3>
                  <p class="post-excerpt">다가오는 문화 행사와 전시회 일정을 확인해보세요.</p>
                  <div class="post-meta">
                    <span class="post-date">
                      <i class="bi bi-calendar"></i>
                      2024년 06월 19일
                    </span>
                    <span class="post-author">
                      <i class="bi bi-person"></i>
                      관리자
                    </span>
                  </div>
                </div>
              </article>
            </div>

            <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
              <article class="blog-post">
                <div class="post-img">
                  <img src="<c:url value='/assets/img/blog/blog-3.jpg'/>" alt="전통 문화" class="img-fluid">
                </div>
                <div class="post-content">
                  <h3 class="post-title">
                    <a href="#">전통 문화의 현대적 해석</a>
                  </h3>
                  <p class="post-excerpt">고성의 전통 문화를 현대적으로 재해석한 작품들을 만나보세요.</p>
                  <div class="post-meta">
                    <span class="post-date">
                      <i class="bi bi-calendar"></i>
                      2024년 06월 18일
                    </span>
                    <span class="post-author">
                      <i class="bi bi-person"></i>
                      관리자
                    </span>
                  </div>
                </div>
              </article>
            </div>
          </c:if>

        </div>
      </div>
    </section>

  </main>

  <!-- Vendor JS Files -->
  <script src="<c:url value='/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/aos/aos.js'/>"></script>
  <script src="<c:url value='/assets/vendor/glightbox/js/glightbox.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/swiper/swiper-bundle.min.js'/>"></script>

  <!-- Main JS File -->
  <script src="<c:url value='/assets/js/main.js'/>"></script>

</body>
</html> 