<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>${post.title} - 아트케이션 고성</title>
  <meta name="description" content="커뮤니티 글 상세보기 - 아트케이션 고성">
  <meta name="keywords" content="고성, 아트케이션, 커뮤니티">

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
            <h1>커뮤니티</h1>
            <p>소통과 공유의 공간</p>
          </div>
        </div>
      </div>
    </div>

         <!-- Post Detail Section -->
     <section class="blog-details section">
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
         
         <div class="row">
          <div class="col-lg-8 offset-lg-2">
            
            <!-- Post Header -->
            <div class="post-header mb-4">
              <h2 class="post-title">${post.title}</h2>
              <div class="post-meta">
                <span class="author"><i class="bi bi-person"></i> ${post.authorName}</span>
                <span class="date"><i class="bi bi-calendar"></i> 
                  ${post.createdAt}
                </span>
                <span class="views"><i class="bi bi-eye"></i> ${post.viewCount}회</span>
              </div>
            </div>

            <!-- Post Content -->
            <div class="post-content mb-5">
              <div class="content-body">
                ${post.content}
              </div>
            </div>

            <!-- Action Buttons -->
            <div class="post-actions mb-4">
              <div class="d-flex justify-content-between">
                <a href="<c:url value='/community'/>" class="btn btn-secondary">
                  <i class="bi bi-arrow-left"></i> 목록으로
                </a>
                <div>
                  <button type="button" class="btn btn-warning me-2" data-bs-toggle="modal" data-bs-target="#editModal">
                    <i class="bi bi-pencil"></i> 수정
                  </button>
                  <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                    <i class="bi bi-trash"></i> 삭제
                  </button>
                </div>
              </div>
            </div>

          </div>
        </div>

      </div>
    </section>

  </main>

  <!-- Edit Modal -->
  <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editModalLabel">글 수정을 위한 비밀번호 확인</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="<c:url value='/community/edit/${post.postId}'/>" method="post">
          <div class="modal-body">
            <div class="mb-3">
              <label for="editPassword" class="form-label">비밀번호</label>
              <input type="password" class="form-control" id="editPassword" name="password" required>
              <small class="form-text text-muted">글 작성시 입력한 비밀번호를 입력해주세요.</small>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
            <button type="submit" class="btn btn-warning">수정하기</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- Delete Modal -->
  <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="deleteModalLabel">글 삭제를 위한 비밀번호 확인</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="<c:url value='/community/delete/${post.postId}'/>" method="post">
          <div class="modal-body">
            <div class="mb-3">
              <label for="deletePassword" class="form-label">비밀번호</label>
              <input type="password" class="form-control" id="deletePassword" name="password" required>
              <small class="form-text text-muted">글 작성시 입력한 비밀번호를 입력해주세요.</small>
            </div>
            <div class="alert alert-danger" role="alert">
              <strong>주의:</strong> 삭제된 글은 복구할 수 없습니다.
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
            <button type="submit" class="btn btn-danger">삭제하기</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- Vendor JS Files -->
  <script src="<c:url value='/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/aos/aos.js'/>"></script>

  <!-- Main JS File -->
  <script src="<c:url value='/assets/js/main.js'/>"></script>

</body>

</html> 