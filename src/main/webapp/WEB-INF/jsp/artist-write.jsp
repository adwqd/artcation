<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>예술인 기록 작성 - 아트케이션 고성</title>
  <meta name="description" content="예술인 기록 작성 - 아트케이션 고성">
  <meta name="keywords" content="고성, 아트케이션, 예술인, 기록작성">

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
            <h1>예술인 기록 작성</h1>
            <p>새로운 예술 활동과 경험을 공유해보세요</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Write Post Section -->
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
            
            <form action="<c:url value='/artist/write'/>" method="post" enctype="multipart/form-data" class="artist-write-form">
              
              <!-- 작성자 정보 (읽기 전용) -->
              <div class="row gy-4 mb-4">
                <div class="col-md-12">
                  <label class="form-label">작성자</label>
                  <input type="text" class="form-control" value="${sessionScope.displayName} (${sessionScope.role == 'admin' ? '관리자' : '예술인'})" readonly>
                  <small class="form-text text-muted">로그인한 사용자로 자동 설정됩니다.</small>
                </div>
              </div>

              <!-- 게시글 정보 -->
              <div class="row gy-4 mb-4">
                <div class="col-md-12">
                  <label for="title" class="form-label">제목 <span class="text-danger">*</span></label>
                  <input type="text" name="title" id="title" class="form-control" placeholder="예술인 기록의 제목을 입력하세요" required maxlength="200">
                </div>
              </div>

              <div class="row gy-4 mb-4">
                <div class="col-md-12">
                  <label for="content" class="form-label">내용 <span class="text-danger">*</span></label>
                  <textarea class="form-control" name="content" id="content" rows="10" placeholder="예술 활동, 작품 소개, 전시회 후기, 창작 과정 등을 자유롭게 작성해주세요." required></textarea>
                </div>
              </div>

              <!-- 이미지 첨부 -->
              <div class="row gy-4 mb-4">
                <div class="col-md-12">
                  <label for="imageFile" class="form-label">이미지 첨부 <span class="text-muted">(선택사항)</span></label>
                  <input type="file" class="form-control" id="imageFile" name="imageFile" accept="image/*" onchange="previewImage(this)">
                  <small class="form-text text-muted">JPG, PNG, GIF, WebP 형식만 가능하며, 최대 10MB까지 업로드할 수 있습니다.</small>
                  
                  <!-- 이미지 미리보기 -->
                  <div id="imagePreview" class="mt-3" style="display: none;">
                    <div class="card">
                      <div class="card-header d-flex justify-content-between align-items-center">
                        <span><i class="bi bi-eye"></i> 미리보기</span>
                        <button type="button" class="btn btn-sm btn-outline-danger" onclick="removeImage()">
                          <i class="bi bi-x"></i> 제거
                        </button>
                      </div>
                      <div class="card-body text-center">
                        <img id="previewImg" src="" alt="미리보기" class="img-fluid" style="max-height: 300px;">
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <!-- 버튼 -->
              <div class="row">
                <div class="col-md-12 text-center">
                  <button type="submit" class="btn btn-primary me-2">
                    <i class="bi bi-pencil"></i> 기록 작성
                  </button>
                  <a href="<c:url value='/blog'/>" class="btn btn-secondary">
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
  <script src="<c:url value='/assets/vendor/glightbox/js/glightbox.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/isotope-layout/isotope.pkgd.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/swiper/swiper-bundle.min.js'/>"></script>

  <!-- Main JS File -->
  <script src="<c:url value='/assets/js/main.js'/>"></script>

  <!-- 이미지 미리보기 JavaScript -->
  <script>
  function previewImage(input) {
    const file = input.files[0];
    const preview = document.getElementById('imagePreview');
    const previewImg = document.getElementById('previewImg');
    
    if (file) {
      // 파일 크기 체크 (10MB)
      if (file.size > 10 * 1024 * 1024) {
        alert('파일 크기는 10MB를 초과할 수 없습니다.');
        input.value = '';
        preview.style.display = 'none';
        return;
      }
      
      // 파일 타입 체크
      const allowedTypes = ['image/jpeg', 'image/jpg', 'image/png', 'image/gif', 'image/webp'];
      if (!allowedTypes.includes(file.type)) {
        alert('JPG, PNG, GIF, WebP 형식의 이미지만 업로드 가능합니다.');
        input.value = '';
        preview.style.display = 'none';
        return;
      }
      
      const reader = new FileReader();
      reader.onload = function(e) {
        previewImg.src = e.target.result;
        preview.style.display = 'block';
      };
      reader.readAsDataURL(file);
    } else {
      preview.style.display = 'none';
    }
  }
  
  function removeImage() {
    document.getElementById('imageFile').value = '';
    document.getElementById('imagePreview').style.display = 'none';
  }
  </script>

  <!-- 폼 검증 스크립트 -->
  <script>
    // 파일 선택 시 미리보기
    document.getElementById('imageFile').addEventListener('change', function(e) {
      const file = e.target.files[0];
      const preview = document.getElementById('imagePreview');
      
      if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
          preview.innerHTML = '<img src="' + e.target.result + '" class="img-fluid rounded" style="max-height: 200px;">';
        }
        reader.readAsDataURL(file);
      } else {
        preview.innerHTML = '';
      }
    });

    // 폼 제출 검증
    document.addEventListener('DOMContentLoaded', function() {
      const form = document.querySelector('form');
      
      if (form) {
        form.addEventListener('submit', function(e) {
          const title = document.getElementById('title').value.trim();
          const content = document.getElementById('content').value.trim();
          const image = document.getElementById('imageFile').files[0];
          
          if (!title) {
            alert('제목을 입력해주세요.');
            e.preventDefault();
            document.getElementById('title').focus();
            return false;
          }
          
          if (!content) {
            alert('내용을 입력해주세요.');
            e.preventDefault();
            document.getElementById('content').focus();
            return false;
          }
          
          if (!image) {
            alert('이미지를 선택해주세요.');
            e.preventDefault();
            document.getElementById('imageFile').focus();
            return false;
          }
          
          // 폼 제출 중 버튼 비활성화
          const submitBtn = this.querySelector('button[type="submit"]');
          if (submitBtn) {
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<i class="bi bi-hourglass-split"></i> 등록 중...';
          }
        });
      }
    });
  </script>

</body>

</html> 