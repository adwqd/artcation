<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>글쓰기 - 아트케이션 고성</title>
  <meta name="description" content="커뮤니티 글쓰기 - 아트케이션 고성">
  <meta name="keywords" content="고성, 아트케이션, 커뮤니티, 글쓰기">

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
        <h1 class="sitename">아트케이션 고성</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="<c:url value='/'/>">홈</a></li>
          <li><a href="<c:url value='/#about'/>">예술인 소개</a></li>
          <li><a href="<c:url value='/blog'/>">예술인 기록</a></li>
          <li><a href="<c:url value='/community'/>" class="active">커뮤니티</a></li>
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
            <h1>커뮤니티 글쓰기</h1>
            <p>자유롭게 소통하고 정보를 공유해보세요</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Write Post Section -->
    <section class="contact section">
      <div class="container">
        
        <div class="row justify-content-center">
          <div class="col-lg-8">
            
            <form action="<c:url value='/community/write'/>" method="post" class="php-email-form">
              
              <!-- 작성자 정보 -->
              <div class="row gy-4 mb-4">
                <div class="col-md-6">
                  <label for="authorName" class="form-label">아이디 <span class="text-danger">*</span></label>
                  <input type="text" name="authorName" id="authorName" class="form-control" placeholder="사용하실 아이디를 입력해주세요" required>
                  <small class="form-text text-muted">글 작성시 사용할 아이디입니다.</small>
                </div>
                
                <div class="col-md-6">
                  <label for="authorPassword" class="form-label">비밀번호 <span class="text-danger">*</span></label>
                  <input type="password" name="authorPassword" id="authorPassword" class="form-control" placeholder="글 수정/삭제시 사용" required>
                  <small class="form-text text-muted">글 수정이나 삭제할 때 필요한 비밀번호입니다.</small>
                </div>
              </div>

              <!-- 게시글 정보 -->
              <div class="row gy-4 mb-4">
                <div class="col-md-12">
                  <label for="title" class="form-label">제목 <span class="text-danger">*</span></label>
                  <input type="text" name="title" id="title" class="form-control" placeholder="게시글 제목을 입력해주세요" required>
                </div>
              </div>

              <div class="row gy-4 mb-4">
                <div class="col-md-12">
                  <label for="content" class="form-label">내용 <span class="text-danger">*</span></label>
                  <textarea class="form-control" name="content" id="content" rows="10" placeholder="내용을 입력해주세요" required></textarea>
                </div>
              </div>

              <!-- 버튼 -->
              <div class="row">
                <div class="col-md-12 text-center">
                  <button type="submit" class="btn btn-primary me-2">
                    <i class="bi bi-pencil"></i> 글쓰기
                  </button>
                  <a href="<c:url value='/community'/>" class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> 목록으로
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