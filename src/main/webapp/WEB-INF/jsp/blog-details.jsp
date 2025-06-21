<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title><c:out value="${post.title}" default="예술인 기록"/> - 고성 예술인 플랫폼</title>
  <meta name="description" content="고성 지역 예술인들의 작품과 이야기를 공유하는 플랫폼">
  <meta name="keywords" content="고성, 예술인, 작품, 창작, 지역예술">

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
  <link href="<c:url value='/assets/vendor/animate.css/animate.min.css'/>" rel="stylesheet">
  <link href="<c:url value='/assets/vendor/glightbox/css/glightbox.min.css'/>" rel="stylesheet">
  <link href="<c:url value='/assets/vendor/swiper/swiper-bundle.min.css'/>" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="<c:url value='/assets/css/main.css'/>" rel="stylesheet">
  
  <style>
    .artwork-image {
      max-width: 100%;
      height: auto;
      border-radius: 10px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.1);
      margin-bottom: 2rem;
    }
    
    .artist-info {
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      color: white;
      padding: 2rem;
      border-radius: 15px;
      margin-bottom: 2rem;
    }
    
    .post-meta-enhanced {
      background: #f8f9fa;
      padding: 1.5rem;
      border-radius: 10px;
      margin-bottom: 2rem;
    }
    
    .comment-form-korean {
      background: #fff;
      padding: 2rem;
      border-radius: 15px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }
    
    .sidebar-widget-korean {
      background: #fff;
      padding: 1.5rem;
      border-radius: 10px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
      margin-bottom: 2rem;
    }

    /* 호버 효과 통일 */
    .btn:hover, .form-control:focus, .form-select:focus, .dropdown-toggle:hover {
      border-color: #ff6b35 !important;
      box-shadow: 0 0 0 0.2rem rgba(255, 107, 53, 0.25) !important;
    }
    
    .btn-primary {
      background-color: #ff6b35;
      border-color: #ff6b35;
    }
    
    .btn-primary:hover {
      background-color: #e55a2b;
      border-color: #e55a2b;
    }

    /* 드롭다운 메뉴 스타일 */
    .dropdown-menu {
      border: none;
      box-shadow: 0 4px 15px rgba(0,0,0,0.1);
      border-radius: 8px;
    }
    
    .dropdown-item:hover {
      background-color: #f8f9fa;
    }
    
    .dropdown-item.text-danger:hover {
      background-color: #f8d7da;
      color: #721c24 !important;
    }
    
    /* 토글 버튼 스타일 */
    .btn-toggle {
      background: none;
      border: none;
      color: #6c757d;
      font-size: 1.2rem;
      padding: 0.25rem 0.5rem;
      border-radius: 4px;
      transition: all 0.2s ease;
    }
    
    .btn-toggle:hover {
      background-color: #f8f9fa;
      color: #ff6b35;
      transform: translateY(-1px);
    }

    /* 드롭다운 토글 버튼 호버 효과 */
    .btn-outline-secondary:hover {
      background-color: #ff6b35 !important;
      border-color: #ff6b35 !important;
      color: white !important;
    }

    /* 입력창 호버 및 포커스 효과 */
    .form-control:hover, .form-control:focus {
      border-color: #ff6b35 !important;
      box-shadow: 0 0 0 0.2rem rgba(255, 107, 53, 0.25) !important;
    }

    /* 텍스트에어리어 호버 및 포커스 효과 */
    textarea.form-control:hover, textarea.form-control:focus {
      border-color: #ff6b35 !important;
      box-shadow: 0 0 0 0.2rem rgba(255, 107, 53, 0.25) !important;
    }
  </style>
</head>

<body class="blog-details-page">

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
        <h1>예술인 기록 상세보기</h1>
        <p>고성 지역 예술인들의 창작 활동과 작품 이야기를 만나보세요</p>
        
        <!-- breadcrumbs를 오른쪽 아래로 이동 -->
        <div class="d-flex justify-content-end mt-4">
          <nav class="breadcrumbs">
            <ol>
              <li><a href="<c:url value='/'/>">홈</a></li>
              <li><a href="<c:url value='/blog'/>">예술인 기록</a></li>
              <li class="current"><c:out value="${post.title}" default="상세보기"/></li>
            </ol>
          </nav>
        </div>
      </div>
    </div><!-- End Page Title -->

    <div class="container">
      <div class="row">

        <div class="col-lg-8">

          <!-- Blog Details Section -->
          <section id="blog-details" class="blog-details section">
            <div class="container">

              <!-- 뒤로가기 버튼 -->
              <div class="mb-4">
                <button type="button" class="btn btn-light" onclick="history.back()">
                  <i class="bi bi-arrow-left"></i> 뒤로가기
                </button>
              </div>

              <article class="article">

                <!-- 제목과 작업 도구 -->
                <div class="d-flex justify-content-between align-items-start mb-4">
                  <h2 class="title mb-0"><c:out value="${post.title}" default="제목 없음"/></h2>
                  
                  <!-- 수정/삭제 버튼 (작성자 또는 관리자만 표시) -->
                  <c:if test="${not empty sessionScope.loginUser && (sessionScope.userId == post.artistId || sessionScope.role == 'admin')}">
                    <div class="dropdown">
                      <button class="btn btn-outline-secondary btn-sm" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-three-dots-vertical"></i>
                      </button>
                      <ul class="dropdown-menu dropdown-menu-end">
                        <li>
                          <a class="dropdown-item" href="<c:url value='/artist/edit/${post.postId}'/>">
                            <i class="bi bi-pencil me-2"></i>수정
                          </a>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                          <button class="dropdown-item text-danger" onclick="deletePost(${post.postId})">
                            <i class="bi bi-trash me-2"></i>삭제
                          </button>
                        </li>
                      </ul>
                    </div>
                  </c:if>
                </div>

                <!-- 작품 이미지 -->
                <c:if test="${not empty post.imageUrl}">
                  <div class="post-img mb-4 text-center">
                    <img src="<c:url value='${post.imageUrl}'/>" alt="${post.title}" class="img-fluid rounded shadow-sm" style="max-width: 400px; max-height: 300px; object-fit: cover;">
                  </div>
                </c:if>

                <!-- 게시글 메타 정보 -->
                <div class="post-meta-enhanced">
                  <div class="row text-center">
                    <div class="col-md-4">
                      <i class="bi bi-calendar3 text-primary"></i>
                      <strong>작성일:</strong>
                      <time datetime="${post.createdAt}">${post.createdAt.toString().replace('T', ' ').substring(0, 19)}</time>
                    </div>
                    <div class="col-md-4">
                      <i class="bi bi-chat-dots text-success"></i>
                      <strong>댓글:</strong>
                      <span><c:out value="${commentCount}" default="0"/>개</span>
                    </div>
                    <div class="col-md-4">
                      <i class="bi bi-eye text-info"></i>
                      <strong>조회:</strong>
                      <span>${post.viewCount}회</span>
                    </div>
                  </div>
                </div>

                <!-- 작품 설명 -->
                <div class="content">
                  <div class="card border-0 shadow-sm">
                    <div class="card-body p-4">
                      <div class="content-text">
                        <c:choose>
                          <c:when test="${not empty post.content}">
                            <p style="white-space: pre-wrap; line-height: 1.8;"><c:out value="${post.content}"/></p>
                          </c:when>
                          <c:otherwise>
                            <p class="text-muted">작품에 대한 설명이 없습니다.</p>
                          </c:otherwise>
                        </c:choose>
                      </div>
                    </div>
                  </div>
                </div>

              </article>

            </div>
          </section><!-- /Blog Details Section -->

          <!-- Blog Comments Section -->
          <section id="blog-comments" class="blog-comments section">
            <div class="container">
              <div class="card border-0 shadow-sm">
                <div class="card-body p-4">
                  <h4 class="comments-count mb-4">
                    <i class="bi bi-chat-square-text text-primary"></i> 
                    댓글 <c:out value="${commentCount}" default="0"/>개
                  </h4>

                  <c:choose>
                    <c:when test="${not empty comments}">
                      <c:forEach var="comment" items="${comments}">
                        <div id="comment-${comment.commentId}" class="comment border-bottom pb-3 mb-3">
                          <div class="d-flex">
                            <div class="comment-avatar me-3">
                              <c:choose>
                                <c:when test="${comment.authorId != null}">
                                  <!-- 로그인 사용자 (예술인) -->
                                  <div class="bg-success rounded-circle d-flex align-items-center justify-content-center" style="width: 50px; height: 50px;">
                                    <i class="bi bi-palette-fill text-white"></i>
                                  </div>
                                </c:when>
                                <c:otherwise>
                                  <!-- 게스트 사용자 -->
                                  <div class="bg-secondary rounded-circle d-flex align-items-center justify-content-center" style="width: 50px; height: 50px;">
                                    <i class="bi bi-person-fill text-white"></i>
                                  </div>
                                </c:otherwise>
                              </c:choose>
                            </div>
                            <div class="flex-grow-1">
                              <div class="d-flex justify-content-between align-items-start mb-2">
                                <div>
                                  <h6 class="mb-0">
                                    <c:out value="${comment.authorName}"/>
                                    <c:if test="${comment.authorId != null}">
                                      <span class="badge bg-success ms-2">예술인</span>
                                    </c:if>
                                  </h6>
                                </div>
                                <div class="d-flex align-items-center">
                                  <small class="text-muted me-3">
                                    <c:choose>
                                      <c:when test="${comment.createdAt != null}">
${comment.createdAt.toString().replace('T', ' ').substring(0, 19)}
                                      </c:when>
                                      <c:otherwise>
                                        방금 전
                                      </c:otherwise>
                                    </c:choose>
                                  </small>
                                  
                                  <!-- 수정/삭제 버튼 -->
                                  <c:set var="canModify" value="false"/>
                                  <c:choose>
                                    <c:when test="${sessionScope.role == 'admin'}">
                                      <c:set var="canModify" value="true"/>
                                    </c:when>
                                    <c:when test="${comment.authorId != null && sessionScope.userId == comment.authorId}">
                                      <c:set var="canModify" value="true"/>
                                    </c:when>
                                  </c:choose>
                                  
                                  <c:if test="${canModify || comment.authorId == null}">
                                    <div class="dropdown">
                                      <button class="btn btn-outline-secondary btn-sm" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="bi bi-three-dots-vertical"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                          <button class="dropdown-item edit-comment-btn" 
                                                  data-comment-id="${comment.commentId}" 
                                                  data-comment-content="<c:out value='${comment.content}'/>"
                                                  data-is-guest="${comment.authorId == null}">
                                            <i class="bi bi-pencil me-2"></i>수정
                                          </button>
                                        </li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li>
                                          <button class="dropdown-item text-danger delete-comment-btn" 
                                                  data-comment-id="${comment.commentId}"
                                                  data-is-guest="${comment.authorId == null}">
                                            <i class="bi bi-trash me-2"></i>삭제
                                          </button>
                                        </li>
                                      </ul>
                                    </div>
                                  </c:if>
                                </div>
                              </div>
                              <p class="mb-0" style="line-height: 1.6;"><c:out value="${comment.content}"/></p>
                            </div>
                          </div>
                        </div>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <div class="text-center text-muted py-5">
                        <i class="bi bi-chat-square-dots" style="font-size: 3rem; opacity: 0.3;"></i>
                        <p class="mt-3">아직 댓글이 없습니다.<br>첫 번째 댓글을 남겨보세요!</p>
                      </div>
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
            </div>
          </section><!-- /Blog Comments Section -->

          <!-- Comment Form Section -->
          <section id="comment-form" class="comment-form section">
            <div class="container">
              <div class="comment-form-korean">
                <!-- 플래시 메시지 표시 -->
                <c:if test="${not empty error}">
                  <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="bi bi-exclamation-triangle-fill"></i> ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                  </div>
                </c:if>
                <c:if test="${not empty success}">
                  <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="bi bi-check-circle-fill"></i> ${success}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                  </div>
                </c:if>

                <form action="<c:url value='/comment/artist/${post.postId}'/>" method="post">
                  <h4 class="mb-4">
                    <i class="bi bi-pencil-square text-primary"></i> 댓글 작성
                  </h4>
                  
                  <c:choose>
                    <c:when test="${not empty sessionScope.loginUser}">
                      <!-- 로그인된 예술인 -->
                      <div class="alert alert-info mb-4">
                        <i class="bi bi-person-check-fill"></i>
                        <strong>${sessionScope.displayName}님</strong>으로 댓글을 작성합니다.
                      </div>
                      
                      <div class="row">
                        <div class="col form-group mb-4">
                          <label for="content" class="form-label">댓글 내용 *</label>
                          <textarea name="content" class="form-control" id="content" rows="5" placeholder="댓글을 입력해주세요..." required></textarea>
                        </div>
                      </div>
                    </c:when>
                    <c:otherwise>
                      <!-- 비로그인 사용자 -->
                      <p class="text-muted mb-4">
                        <i class="bi bi-info-circle"></i>
                        비회원으로 댓글을 작성합니다. 수정/삭제 시 비밀번호가 필요합니다.
                      </p>
                      
                      <div class="row">
                        <div class="col-md-6 form-group mb-3">
                          <label for="guestName" class="form-label">이름 *</label>
                          <input name="guestName" type="text" class="form-control" id="guestName" placeholder="이름을 입력해주세요" required>
                        </div>
                        <div class="col-md-6 form-group mb-3">
                          <label for="guestPw" class="form-label">비밀번호 *</label>
                          <input name="guestPw" type="password" class="form-control" id="guestPw" placeholder="수정/삭제용 비밀번호" required>
                          <div class="form-text">댓글 수정/삭제 시 사용됩니다.</div>
                        </div>
                      </div>
                      
                      <div class="row">
                        <div class="col form-group mb-4">
                          <label for="content" class="form-label">댓글 내용 *</label>
                          <textarea name="content" class="form-control" id="content" rows="5" placeholder="댓글을 입력해주세요..." required></textarea>
                        </div>
                      </div>
                    </c:otherwise>
                  </c:choose>

                  <div class="text-center">
                    <button type="submit" class="btn btn-primary btn-lg px-5">
                      <i class="bi bi-send"></i> 댓글 등록
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </section><!-- /Comment Form Section -->

        </div>

        <!-- 사이드바 -->
        <div class="col-lg-4 sidebar">
          <div class="widgets-container">

            <!-- 예술인 정보 위젯 -->
            <div class="sidebar-widget-korean">
              <div class="d-flex flex-column align-items-center text-center">
                <div class="bg-gradient-primary rounded-circle d-flex align-items-center justify-content-center mb-3" 
                     style="width: 80px; height: 80px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);">
                  <i class="bi bi-palette-fill text-white" style="font-size: 2rem;"></i>
                </div>
                <h5><c:out value="${post.displayName}" default="예술인"/></h5>
                <p class="text-muted small mb-3">아트케이션 참여 예술인</p>
                
                <div class="row text-center w-100">
                  <div class="col-6">
                    <div class="border-end">
                      <strong class="d-block">${post.viewCount}</strong>
                      <small class="text-muted">조회수</small>
                    </div>
                  </div>
                  <div class="col-6">
                    <strong class="d-block">${commentCount}</strong>
                    <small class="text-muted">댓글수</small>
                  </div>
                </div>
              </div>
            </div>

            <!-- 검색 위젯 -->
            <div class="sidebar-widget-korean">
              <h5 class="widget-title mb-3">
                <i class="bi bi-search text-primary"></i> 검색
              </h5>
              <form action="<c:url value='/blog'/>" method="get" class="d-flex">
                <input type="text" name="search" class="form-control me-2" placeholder="제목, 예술인명..." value="<c:out value='${param.search}'/>">
                <button type="submit" class="btn btn-primary">
                  <i class="bi bi-search"></i>
                </button>
              </form>
            </div>

            <!-- 최근 작품 위젯 -->
            <div class="sidebar-widget-korean">
              <h5 class="widget-title mb-3">
                <i class="bi bi-clock-history text-primary"></i> <c:out value="${post.displayName}"/>님의 다른 작품
              </h5>
              
              <c:choose>
                <c:when test="${not empty recentPosts}">
                  <c:forEach var="recentPost" items="${recentPosts}" varStatus="status">
                    <c:if test="${status.index < 5}">
                      <div class="post-item border-bottom pb-2 mb-2">
                        <h6 class="mb-1">
                          <a href="<c:url value='/blog/${recentPost.postId}'/>" class="text-decoration-none">
                            <c:out value="${recentPost.title}"/>
                          </a>
                        </h6>
                        <small class="text-muted">
                          <i class="bi bi-person"></i> <c:out value="${recentPost.displayName}"/> · 
                          <i class="bi bi-calendar3"></i> ${recentPost.createdAt.monthValue}월 ${recentPost.createdAt.dayOfMonth}일
                        </small>
                      </div>
                    </c:if>
                  </c:forEach>
                </c:when>
                <c:otherwise>
                  <p class="text-muted text-center py-3">
                    <i class="bi bi-image" style="font-size: 2rem; opacity: 0.3;"></i><br>
                    <c:out value="${post.displayName}"/>님의 다른 작품이 없습니다.
                  </p>
                </c:otherwise>
              </c:choose>
            </div>

          </div>
        </div>

      </div>
    </div>

  </main>

  <!-- Vendor JS Files -->
  <script src="<c:url value='/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/aos/aos.js'/>"></script>
  <script src="<c:url value='/assets/vendor/glightbox/js/glightbox.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/swiper/swiper-bundle.min.js'/>"></script>

  <!-- Main JS File -->
  <script src="<c:url value='/assets/js/main.js'/>"></script>

  <!-- 댓글 관리 JavaScript -->
  <script>
  document.addEventListener('DOMContentLoaded', function() {
    // 이벤트 위임을 사용하여 동적 요소에도 이벤트 적용
    document.addEventListener('click', function(e) {
      // 댓글 수정 버튼 클릭
      if (e.target.closest('.edit-comment-btn')) {
        e.preventDefault();
        const btn = e.target.closest('.edit-comment-btn');
        const commentId = btn.dataset.commentId;
        const content = btn.dataset.commentContent;
        const isGuest = btn.dataset.isGuest === 'true';
        
        editComment(commentId, content, isGuest);
      }
      
      // 댓글 삭제 버튼 클릭
      if (e.target.closest('.delete-comment-btn')) {
        e.preventDefault();
        const btn = e.target.closest('.delete-comment-btn');
        const commentId = btn.dataset.commentId;
        const isGuest = btn.dataset.isGuest === 'true';
        
        deleteComment(commentId, isGuest);
      }
    });
  });

  function editComment(commentId, content, isGuest) {
    const newContent = prompt('댓글 내용을 수정하세요:', content);
    if (newContent === null || newContent.trim() === '') return;
    
    let formData = new FormData();
    formData.append('content', newContent.trim());
    
    // 게스트인 경우 비밀번호 확인
    if (isGuest) {
      const password = prompt('수정을 위해 비밀번호를 입력하세요:');
      if (password === null || password.trim() === '') return;
      formData.append('guestPw', password.trim());
    }
    
    // AJAX 요청
    fetch('<c:url value="/community/comments/"/>' + commentId + '/edit', {
      method: 'POST',
      body: formData
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        alert('댓글이 성공적으로 수정되었습니다.');
        location.reload(); // 페이지 새로고침
      } else {
        alert('댓글 수정에 실패했습니다: ' + (data.message || '알 수 없는 오류'));
      }
    })
    .catch(error => {
      console.error('Error:', error);
      alert('댓글 수정 중 오류가 발생했습니다.');
    });
  }

  function deleteComment(commentId, isGuest) {
    if (!confirm('댓글을 삭제하시겠습니까?')) return;
    
    let formData = new FormData();
    
    // 게스트인 경우 비밀번호 확인
    if (isGuest) {
      const password = prompt('삭제를 위해 비밀번호를 입력하세요:');
      if (password === null || password.trim() === '') return;
      formData.append('guestPw', password.trim());
    }
    
    // AJAX 요청
    fetch('<c:url value="/community/comments/"/>' + commentId + '/delete', {
      method: 'POST',
      body: formData
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        alert('댓글이 성공적으로 삭제되었습니다.');
        location.reload(); // 페이지 새로고침
      } else {
        alert('댓글 삭제에 실패했습니다: ' + (data.message || '알 수 없는 오류'));
      }
    })
    .catch(error => {
      console.error('Error:', error);
      alert('댓글 삭제 중 오류가 발생했습니다.');
    });
  }

  // 블로그 글 삭제 함수
  function deletePost(postId) {
    if (!confirm('이 기록을 삭제하시겠습니까?\n삭제된 기록은 복구할 수 없습니다.')) return;
    
    let form = document.createElement('form');
    form.method = 'POST';
    form.action = '<c:url value="/artist/delete/"/>' + postId;
    
    document.body.appendChild(form);
    form.submit();
  }
  </script>

</body>
</html>
<%@ include file="common/footer.jsp" %> 