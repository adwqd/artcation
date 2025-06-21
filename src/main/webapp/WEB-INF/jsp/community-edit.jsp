<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>글 수정 - 아트케이션 고성</title>
  <meta name="description" content="커뮤니티 글 수정 - 아트케이션 고성">
  <meta name="keywords" content="고성, 아트케이션, 커뮤니티, 글수정">

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

  <!-- Main CSS File -->
  <link href="<c:url value='/assets/css/main.css'/>" rel="stylesheet">
</head>

<body>

  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

      <a href="<c:url value='/'/>" class="logo d-flex align-items-center">
        <h1 class="sitename">Artcation Goseong</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="<c:url value='/'/>">홈</a></li>
          <li><a href="<c:url value='/#about'/>">예술인 소개</a></li>
          <li><a href="<c:url value='/blog'/>">예술인 기록</a></li>
          <li><a href="<c:url value='/community'/>" class="active">커뮤니티</a></li>
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
            <h1>커뮤니티 글 수정</h1>
            <p>내용을 수정해보세요</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Edit Post Section -->
    <section class="contact section">
      <div class="container">
        
        <!-- Flash Messages -->
        <c:if test="${not empty message}">
          <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
          </div>
        </c:if>
        <c:if test="${not empty error}">
          <div class="alert alert-danger alert-dismissible fade show" role="alert">
            ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
          </div>
        </c:if>
        
        <div class="row justify-content-center">
          <div class="col-lg-8">
            
            <!-- 기존 글 정보 표시 -->
            <div class="card mb-4">
              <div class="card-header">
                <h5 class="mb-0">현재 글 정보</h5>
              </div>
              <div class="card-body">
                <div class="post-meta mb-3">
                  <span class="author"><i class="bi bi-person"></i> ${post.authorName}</span>
                  <span class="date ms-3"><i class="bi bi-calendar"></i> ${post.createdAt}</span>
                  <span class="views ms-3"><i class="bi bi-eye"></i> ${post.viewCount}회</span>
                </div>
              </div>
            </div>
            
            <form action="<c:url value='/community/update/${post.postId}'/>" method="post" class="php-email-form">
              
              <!-- 작성자 정보 (읽기 전용) -->
              <div class="row gy-4 mb-4">
                <div class="col-md-12">
                  <label class="form-label">작성자</label>
                  <input type="text" class="form-control" value="${post.authorName}" readonly>
                  <small class="form-text text-muted">작성자는 수정할 수 없습니다.</small>
                </div>
              </div>

              <!-- 게시글 정보 -->
              <div class="row gy-4 mb-4">
                <div class="col-md-12">
                  <label for="title" class="form-label">제목 <span class="text-danger">*</span></label>
                  <input type="text" name="title" id="title" class="form-control" value="${post.title}" required>
                </div>
              </div>

              <div class="row gy-4 mb-4">
                <div class="col-md-12">
                  <label for="content" class="form-label">내용 <span class="text-danger">*</span></label>
                  <textarea class="form-control" name="content" id="content" rows="10" required>${post.content}</textarea>
                </div>
              </div>

              <!-- 버튼 -->
              <div class="row">
                <div class="col-md-12 text-center">
                  <button type="submit" class="btn btn-warning me-2">
                    <i class="bi bi-check-circle"></i> 수정 완료
                  </button>
                  <a href="<c:url value='/community/view/${post.postId}'/>" class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> 취소
                  </a>
                </div>
              </div>

            </form>
            
          </div>
        </div>

      </div>
    </section>

  </main>

  <!-- Vendor JS Files -->
  <script src="<c:url value='/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/aos/aos.js'/>"></script>

  <!-- Main JS File -->
  <script src="<c:url value='/assets/js/main.js'/>"></script>

</body>

</html> 