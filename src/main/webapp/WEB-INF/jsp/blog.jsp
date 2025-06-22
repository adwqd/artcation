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

  <!-- Custom CSS for Blog Card Hover Effects -->
  <style>
    .blog-post {
      background: #fff;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0,0,0,0.1);
      transition: all 0.3s ease;
      overflow: hidden;
      height: 100%;
      border: 1px solid #f8f9fa;
      position: relative;
    }

    .blog-post:hover {
      transform: translateY(-10px);
      box-shadow: 0 20px 40px rgba(0,0,0,0.15);
    }

    .blog-post .card-link {
      text-decoration: none;
      color: inherit;
      display: block;
      height: 100%;
      cursor: pointer;
    }

    .blog-post .card-link:hover {
      text-decoration: none;
      color: inherit;
    }

    .blog-post .post-img {
      position: relative;
      overflow: hidden;
      border-radius: 15px 15px 0 0;
    }

    .blog-post .post-img img {
      transition: transform 0.3s ease;
      width: 100%;
      height: 200px;
      object-fit: cover;
    }

    .blog-post:hover .post-img img {
      transform: scale(1.05);
    }

    .blog-post .post-content {
      padding: 20px;
    }

    .blog-post .post-title {
      margin-bottom: 15px;
    }

    .blog-post .post-title {
      color: #2c3e50;
      font-weight: 600;
      font-size: 1.1rem;
      transition: color 0.3s ease;
    }

    .blog-post:hover .post-title {
      color: #3498db;
    }

    .blog-post .post-excerpt {
      color: #7f8c8d;
      line-height: 1.6;
      margin-bottom: 15px;
      font-size: 0.9rem;
    }

    .blog-post .post-meta {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding-top: 15px;
      border-top: 1px solid #ecf0f1;
      font-size: 0.85rem;
      margin-bottom: 0;
      flex-wrap: wrap;
      gap: 15px;
    }

    .blog-post .post-meta span {
      color: #95a5a6;
      display: flex;
      align-items: center;
      gap: 5px;
    }

    .blog-post .post-meta i {
      color: #3498db;
    }

    .blog-post:hover .post-meta span {
      color: #7f8c8d;
    }

    /* 애니메이션 효과 */
    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(30px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .blog-post {
      animation: fadeInUp 0.6s ease forwards;
    }

    /* 반응형 디자인 */
    @media (max-width: 768px) {
      .blog-post .post-content {
        padding: 20px;
      }
      
      .blog-post .post-img img {
        height: 200px;
      }
      
      .blog-post .post-meta {
        justify-content: flex-start;
        gap: 10px;
      }
    }

    /* 페이지네이션 스타일 */
    .pagination .page-link {
      color: #333;
      background-color: #ffffff;
      border-color: #dee2e6;
      padding: 0.3rem 1rem;
      margin: 0 2px;
      border-radius: 5px;
      transition: all 0.3s ease;
    }

    .pagination .page-link:hover {
      color: #333;
      background-color: #f8f9fa;
      border-color: #dee2e6;
      transform: translateY(-2px);
    }

    .pagination .page-item.active .page-link {
      color: #ffffff;
      background-color: #ff6b35;
      border-color: #ff6b35;
      box-shadow: 0 4px 8px rgba(255, 107, 53, 0.3);
    }

    .pagination .page-item.disabled .page-link {
      color: #6c757d;
      background-color: #e9ecef;
      border-color: #dee2e6;
    }

    /* 검색 결과 스타일 */
    .search-result-info {
      background: linear-gradient(135deg, #6c757d 0%, #5a6268 100%);
      color: white;
      padding: 15px 20px;
      border-radius: 10px;
      margin-bottom: 30px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }

    .search-form .form-control:focus {
      border-color: #ff6b35;
      box-shadow: 0 0 0 0.2rem rgba(255, 107, 53, 0.25);
    }

    .search-form .btn-primary {
      background-color: #ff6b35;
      border-color: #ff6b35;
    }

    .search-form .btn-primary:hover {
      background-color: #e55a2b;
      border-color: #e55a2b;
    }

    /* 로그인 후 드롭다운 메뉴만 특별한 스타일 */
    .navmenu .dropdown ul a[href*="/artist/write"],
    .navmenu .dropdown ul a[href*="/logout"] {
      color: #000000 !important;
    }

    .navmenu .dropdown ul a[href*="/artist/write"]:hover,
    .navmenu .dropdown ul a[href*="/logout"]:hover {
      background-color: transparent !important;
      color: #ff6b35 !important;
    }
  </style>
</head>

<body class="blog-page">

  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

      <a href="<c:url value='/'/>" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="<c:url value='/assets/img/logo.png'/>" alt=""> -->
        <h1 class="sitename">Artcation Goseong</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="<c:url value='/'/>">홈</a></li>
          <li><a href="<c:url value='/#about'/>">아트케이션 고성이란?</a></li>
          <li><a href="<c:url value='/blog'/>" class="active">예술인 기록</a></li>
          <li><a href="<c:url value='/community'/>">커뮤니티</a></li>
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
    <div class="page-title dark-background">
      <div class="container position-relative">
        <h1>예술인 <span style="color: #ff6b35;">기록</span></h1>
        <p>고성 지역 예술인들의 창작 활동과 작품 이야기를 만나보세요</p>
        
        <!-- 검색 폼 -->
        <div class="mt-4">
          <div class="d-flex justify-content-center mb-3">
            <div class="col-lg-6 col-xl-5">
              <form action="<c:url value='/blog'/>" method="get" class="search-form">
                <div class="input-group">
                  <input type="text" name="search" class="form-control" placeholder="제목 또는 예술인명으로 검색..." value="<c:out value='${searchKeyword}'/>">
                  <button type="submit" class="btn btn-primary">
                    <i class="bi bi-search"></i> 검색
                  </button>
                </div>
                <!-- 현재 정렬과 페이지 유지를 위한 숨겨진 필드 -->
                <input type="hidden" name="sort" value="${currentSort}">
                <input type="hidden" name="page" value="1">
              </form>
            </div>
          </div>
          
          <!-- 검색 초기화 버튼과 breadcrumbs -->
          <div class="d-flex justify-content-between align-items-center">
            <div>
              <c:if test="${not empty searchKeyword}">
                <a href="<c:url value='/blog'/>" class="btn btn-outline-light">
                  <i class="bi bi-x-circle"></i> 검색 초기화
                </a>
              </c:if>
            </div>
            <nav class="breadcrumbs">
              <ol>
                <li><a href="<c:url value='/'/>">홈</a></li>
                <li class="current">예술인 기록</li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </div><!-- End Page Title -->

    <!-- Blog Section -->
    <section class="blog section">
      <div class="container">
        
                
        <!-- 정렬 옵션 -->
        <div class="row mb-4">
          <div class="col-12">
            <div class="d-flex align-items-center">
              <label for="sortSelect" class="form-label me-2 mb-0"></label>
              <select id="sortSelect" class="form-select" style="width: auto;" onchange="changeSortOrder()">
                <option value="latest" ${currentSort == 'latest' ? 'selected' : ''}>최신순</option>
                <option value="views" ${currentSort == 'views' ? 'selected' : ''}>조회순</option>
                <option value="oldest" ${currentSort == 'oldest' ? 'selected' : ''}>오래된순</option>
              </select>
            </div>
          </div>
        </div>
         
        <!-- 검색 결과 정보 -->
        <c:if test="${not empty searchKeyword}">
          <div class="search-result-info">
            <div class="d-flex align-items-center">
              <i class="bi bi-search me-2" style="font-size: 1.5rem;"></i>
              <div>
                <h5 class="mb-1">검색 결과</h5>
                <p class="mb-0">"<strong>${searchKeyword}</strong>" 검색 결과 총 <strong>${totalPosts}</strong>개의 글을 찾았습니다.</p>
              </div>
            </div>
          </div>
        </c:if>
        
        <div class="row gy-3">
          
          <!-- Blog Posts -->
          <c:forEach var="post" items="${blogPosts}" varStatus="status">
            <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="${status.index * 100}">
              <article class="blog-post">
                <a href="<c:url value='/blog/${post.postId}'/>" class="card-link">
                  <c:if test="${not empty post.imageUrl}">
                    <div class="post-img">
                      <img src="<c:url value='${post.imageUrl}'/>" alt="${post.title}" class="img-fluid" 
                           onerror="this.parentElement.style.display='none';">
                    </div>
                  </c:if>
                  <div class="post-content">
                    <h3 class="post-title">${post.title}</h3>
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
                    <span class="post-author">
                      <i class="bi bi-palette"></i>
                      ${post.displayName}
                    </span>
                    <span class="post-date">
                      <i class="bi bi-calendar"></i>
                      <c:choose>
                        <c:when test="${not empty post.createdAt}">
                          ${post.createdAt.year}.${post.createdAt.monthValue}.${post.createdAt.dayOfMonth}
                        </c:when>
                        <c:otherwise>
                          2024.06.21
                        </c:otherwise>
                      </c:choose>
                    </span>
                    <span class="post-views">
                      <i class="bi bi-eye"></i>
                      ${post.viewCount}회
                    </span>
                  </div>
                  </div>
                </a>
              </article>
            </div>
          </c:forEach>

          <!-- 검색 결과가 없을 때 -->
          <c:if test="${empty blogPosts && not empty searchKeyword}">
            <div class="col-12 text-center py-5">
              <div class="alert alert-info">
                <i class="bi bi-info-circle-fill me-2"></i>
                "<strong>${searchKeyword}</strong>"에 대한 검색 결과가 없습니다.
                <br><br>
                <small class="text-muted">
                  • 다른 키워드로 검색해보세요<br>
                  • 예술인 이름이나 작품명을 정확히 입력해보세요<br>
                  • 검색어를 줄여서 다시 시도해보세요
                </small>
              </div>
            </div>
          </c:if>

          <!-- Sample Blog Posts (when no data and no search) -->
          <c:if test="${empty blogPosts && empty searchKeyword}">
            <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
              <article class="blog-post">
                <a href="#" class="card-link">
                  <div class="post-img">
                    <img src="<c:url value='/assets/img/blog/blog-1.jpg'/>" alt="고성 예술" class="img-fluid">
                  </div>
                  <div class="post-content">
                    <h3 class="post-title">고성의 아름다운 예술</h3>
                  <p class="post-excerpt">고성의 자연과 예술이 만나는 특별한 순간을 소개합니다.</p>
                  <div class="post-meta">
                    <span class="post-author">
                      <i class="bi bi-palette"></i>
                      관리자
                    </span>
                    <span class="post-date">
                      <i class="bi bi-calendar"></i>
                      2024.06.20
                    </span>
                    <span class="post-views">
                      <i class="bi bi-eye"></i>
                      125회
                    </span>
                  </div>
                  </div>
                </a>
              </article>
            </div>

            <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
              <article class="blog-post">
                <a href="#" class="card-link">
                  <div class="post-img">
                    <img src="<c:url value='/assets/img/blog/blog-2.jpg'/>" alt="문화 행사" class="img-fluid">
                  </div>
                  <div class="post-content">
                    <h3 class="post-title">문화 행사 소개</h3>
                  <p class="post-excerpt">다가오는 문화 행사와 전시회 일정을 확인해보세요.</p>
                  <div class="post-meta">
                    <span class="post-author">
                      <i class="bi bi-palette"></i>
                      관리자
                    </span>
                    <span class="post-date">
                      <i class="bi bi-calendar"></i>
                      2024.06.19
                    </span>
                    <span class="post-views">
                      <i class="bi bi-eye"></i>
                      89회
                    </span>
                  </div>
                  </div>
                </a>
              </article>
            </div>

            <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
              <article class="blog-post">
                <a href="#" class="card-link">
                  <div class="post-img">
                    <img src="<c:url value='/assets/img/blog/blog-3.jpg'/>" alt="전통 문화" class="img-fluid">
                  </div>
                  <div class="post-content">
                    <h3 class="post-title">전통 문화의 현대적 해석</h3>
                  <p class="post-excerpt">고성의 전통 문화를 현대적으로 재해석한 작품들을 만나보세요.</p>
                  <div class="post-meta">
                    <span class="post-author">
                      <i class="bi bi-palette"></i>
                      관리자
                    </span>
                    <span class="post-date">
                      <i class="bi bi-calendar"></i>
                      2024.06.18
                    </span>
                    <span class="post-views">
                      <i class="bi bi-eye"></i>
                      156회
                    </span>
                  </div>
                  </div>
                </a>
              </article>
            </div>
          </c:if>

        </div>

        <!-- 페이지네이션 -->
        <c:if test="${totalPages > 1}">
          <div class="row">
            <div class="col-12">
              <nav aria-label="Blog pagination" class="d-flex justify-content-center mt-5">
                <ul class="pagination pagination-lg">
                  <!-- 이전 페이지 -->
                  <c:if test="${currentPage > 1}">
                    <li class="page-item">
                      <a class="page-link" href="?page=${currentPage - 1}&sort=${currentSort}<c:if test='${not empty searchKeyword}'>&search=${searchKeyword}</c:if>" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                      </a>
                    </li>
                  </c:if>
                  
                  <!-- 페이지 번호들 -->
                  <c:forEach var="i" begin="1" end="${totalPages}">
                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                      <a class="page-link" href="?page=${i}&sort=${currentSort}<c:if test='${not empty searchKeyword}'>&search=${searchKeyword}</c:if>">${i}</a>
                    </li>
                  </c:forEach>
                  
                  <!-- 다음 페이지 -->
                  <c:if test="${currentPage < totalPages}">
                    <li class="page-item">
                      <a class="page-link" href="?page=${currentPage + 1}&sort=${currentSort}<c:if test='${not empty searchKeyword}'>&search=${searchKeyword}</c:if>" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                      </a>
                    </li>
                  </c:if>
                </ul>
              </nav>
              
              <!-- 페이지 정보 -->
              <div class="text-center mt-3">
                <small class="text-muted">
                  <c:choose>
                    <c:when test="${not empty searchKeyword}">
                      "${searchKeyword}" 검색 결과: 총 ${totalPosts}개 중 ${(currentPage - 1) * 6 + 1} - ${currentPage * 6 > totalPosts ? totalPosts : currentPage * 6}번째
                    </c:when>
                    <c:otherwise>
                      총 ${totalPosts}개의 글 중 ${(currentPage - 1) * 6 + 1} - ${currentPage * 6 > totalPosts ? totalPosts : currentPage * 6}번째 글
                    </c:otherwise>
                  </c:choose>
                </small>
              </div>
            </div>
          </div>
        </c:if>

      </div>
    </section>

  </main>
<%@ include file="common/footer.jsp" %> 
  <!-- Vendor JS Files -->
  <script src="<c:url value='/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/aos/aos.js'/>"></script>
  <script src="<c:url value='/assets/vendor/glightbox/js/glightbox.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/swiper/swiper-bundle.min.js'/>"></script>

  <!-- Main JS File -->
  <script src="<c:url value='/assets/js/main.js'/>"></script>

  <!-- Sort functionality -->
  <script>
    function changeSortOrder() {
      const sortValue = document.getElementById('sortSelect').value;
      const currentUrl = new URL(window.location);
      currentUrl.searchParams.set('sort', sortValue);
      currentUrl.searchParams.set('page', '1'); // 정렬 변경 시 첫 페이지로 이동
      window.location.href = currentUrl.toString();
    }
  </script>

</body>
</html> 