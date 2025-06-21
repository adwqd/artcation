<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>예술인 기록 수정 - 아트케이션 고성</title>
  <meta name="description" content="예술인 기록 수정 - 아트케이션 고성">
  <meta name="keywords" content="고성, 아트케이션, 예술인, 기록수정">

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
            <h1>예술인 기록 수정</h1>
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
                <h5 class="mb-0">현재 기록 정보</h5>
              </div>
              <div class="card-body">
                <div class="post-meta mb-3">
                  <span class="author"><i class="bi bi-person"></i> ${post.displayName}</span>
                  <span class="date ms-3"><i class="bi bi-calendar"></i> ${post.createdAt.toString().replace('T', ' ').substring(0, 19)}</span>
                  <span class="views ms-3"><i class="bi bi-eye"></i> ${post.viewCount}회</span>
                  <c:if test="${post.updatedAt != null}">
                    <span class="updated ms-3"><i class="bi bi-pencil"></i> 최종 수정: ${post.updatedAt.toString().replace('T', ' ').substring(0, 19)}</span>
                  </c:if>
                </div>
              </div>
            </div>
            
            <form action="<c:url value='/artist/edit/${post.postId}'/>" method="post" enctype="multipart/form-data" class="artist-edit-form">
              
              <!-- 작성자 정보 (읽기 전용) -->
              <div class="row gy-4 mb-4">
                <div class="col-md-12">
                  <label class="form-label">작성자</label>
                  <input type="text" class="form-control" value="${post.displayName}" readonly>
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

              <!-- 현재 이미지 표시 -->
              <c:if test="${not empty post.imageUrl}">
                <div class="row gy-4 mb-4">
                  <div class="col-md-12">
                    <label class="form-label">현재 이미지</label>
                    <div class="card">
                      <div class="card-header d-flex justify-content-between align-items-center">
                        <span><i class="bi bi-image"></i> 현재 업로드된 이미지</span>
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="removeCurrentImage" name="removeCurrentImage" value="true">
                          <label class="form-check-label text-danger" for="removeCurrentImage">
                            <i class="bi bi-trash"></i> 이미지 삭제
                          </label>
                        </div>
                      </div>
                      <div class="card-body text-center">
                        <img src="<c:url value='${post.imageUrl}'/>" alt="현재 이미지" class="img-fluid" style="max-height: 300px;">
                        <c:if test="${not empty post.imageName}">
                          <p class="text-muted mt-2 mb-0"><small>파일명: ${post.imageName}</small></p>
                        </c:if>
                      </div>
                    </div>
                  </div>
                </div>
              </c:if>

              <!-- 새 이미지 첨부 -->
              <div class="row gy-4 mb-4">
                <div class="col-md-12">
                  <label for="imageFile" class="form-label">
                    <c:choose>
                      <c:when test="${not empty post.imageUrl}">새 이미지로 변경</c:when>
                      <c:otherwise>이미지 첨부</c:otherwise>
                    </c:choose>
                    <span class="text-muted">(선택사항)</span>
                  </label>
                  <input type="file" class="form-control" id="imageFile" name="imageFile" accept="image/*" onchange="previewImage(this)">
                  <small class="form-text text-muted">
                    <c:choose>
                      <c:when test="${not empty post.imageUrl}">새 이미지를 선택하면 기존 이미지가 교체됩니다.</c:when>
                      <c:otherwise>JPG, PNG, GIF, WebP 형식만 가능하며, 최대 10MB까지 업로드할 수 있습니다.</c:otherwise>
                    </c:choose>
                  </small>
                  
                  <!-- 새 이미지 미리보기 -->
                  <div id="imagePreview" class="mt-3" style="display: none;">
                    <div class="card">
                      <div class="card-header d-flex justify-content-between align-items-center">
                        <span><i class="bi bi-eye"></i> 새 이미지 미리보기</span>
                        <button type="button" class="btn btn-sm btn-outline-danger" onclick="removeNewImage()">
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
                  <button type="submit" class="btn btn-warning me-2">
                    <i class="bi bi-check-circle"></i> 수정 완료
                  </button>
                  <a href="<c:url value='/blog/${post.postId}'/>" class="btn btn-secondary">
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
  
  function removeNewImage() {
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
        // 기존 이미지 복원
        const existingImage = document.getElementById('existingImage').value;
        if (existingImage) {
          preview.innerHTML = '<img src="<c:url value="/uploads/"/>' + existingImage + '" class="img-fluid rounded" style="max-height: 200px;">';
        }
      }
    });

    // 폼 제출 검증
    document.addEventListener('DOMContentLoaded', function() {
      const form = document.querySelector('form');
      
      if (form) {
        form.addEventListener('submit', function(e) {
          const title = document.getElementById('title').value.trim();
          const content = document.getElementById('content').value.trim();
          
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
          
          // 폼 제출 중 버튼 비활성화
          const submitBtn = this.querySelector('button[type="submit"]');
          if (submitBtn) {
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<i class="bi bi-hourglass-split"></i> 수정 중...';
          }
        });
      }
    });
  </script>

  <%@ include file="common/footer.jsp" %>

</body>

</html> 