<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title><c:out value="${post.title}" default="커뮤니티 글"/> - 고성 예술인 플랫폼</title>
  <meta name="description" content="고성 지역 예술인들과 시민들이 소통하고 공유하는 커뮤니티">
  <meta name="keywords" content="고성, 커뮤니티, 소통, 공유">

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
    .community-info {
      background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
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
    
    /* 메타 정보 한 줄 표시 */
    .post-meta-enhanced .col-md-4 {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      font-size: 0.9rem;
    }
    
    /* 모바일에서는 줄바꿈 허용 */
    @media (max-width: 768px) {
      .post-meta-enhanced .col-md-4 {
        white-space: normal;
        margin-bottom: 0.5rem;
      }
    }
    
    /* 댓글 드롭다운 위치 조정 */
    .comment .dropdown-menu {
      position: absolute !important;
      top: auto !important;
      bottom: 100% !important;
      right: 0 !important;
      left: auto !important;
      transform: translateY(-5px) !important;
      z-index: 9999 !important;
      margin-bottom: 5px !important;
    }
    
    /* 댓글 컨테이너에 충분한 여백 확보 */
    .comment {
      position: relative !important;
      margin-bottom: 2rem !important;
      padding-bottom: 1rem !important;
    }
    
    /* 댓글 드롭다운이 위로 열릴 때 화살표 방향 조정 */
    .comment .dropdown-toggle::after {
      display: none !important;
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
    
    /* 드롭다운 메뉴 스타일 */
    .dropdown-menu {
      border: none !important;
      box-shadow: 0 4px 15px rgba(0,0,0,0.1) !important;
      border-radius: 8px !important;
      z-index: 9999 !important;
      min-width: 150px !important;
      position: absolute !important;
      top: 100% !important;
      left: auto !important;
      right: 0 !important;
      display: none !important;
    }
    
    .dropdown-menu.show {
      display: block !important;
    }
    
    /* 드롭다운 컨테이너 */
    .dropdown {
      position: relative !important;
    }
    
    /* 드롭다운 버튼 커서 스타일 */
    .dropdown-toggle {
      cursor: pointer !important;
      user-select: none !important;
      pointer-events: auto !important;
    }
    
    /* 템플릿 기본 드롭다운 비활성화 (충돌 방지) */
    .toggle-dropdown {
      pointer-events: none !important;
    }
    
    /* Bootstrap 드롭다운 우선순위 */
    [data-bs-toggle="dropdown"] {
      pointer-events: auto !important;
      z-index: 1000 !important;
    }
    
    .dropdown-item {
      border: none !important;
      outline: none !important;
      pointer-events: auto !important;
      cursor: pointer !important;
      display: block !important;
      width: 100% !important;
      background: transparent !important;
      color: #000000 !important;
    }
    
    .dropdown-item:hover,
    .dropdown-item:focus {
      background-color: transparent !important;
      color: #ff6b35 !important;
    }
    
    .dropdown-item.text-danger:hover,
    .dropdown-item.text-danger:focus {
      background-color: transparent !important;
      color: #dc3545 !important;
    }
    
    /* 드롭다운 토글 버튼 기본 스타일 */
    .btn-outline-secondary.dropdown-toggle {
      border: 1px solid #6c757d !important;
      background: white !important;
      color: #6c757d !important;
    }
    
    .btn-outline-secondary.dropdown-toggle:hover,
    .btn-outline-secondary.dropdown-toggle:focus,
    .btn-outline-secondary.dropdown-toggle:active,
    .btn-outline-secondary.dropdown-toggle.show {
      background-color: #ff6b35 !important;
      border-color: #ff6b35 !important;
      color: white !important;
      box-shadow: 0 0 0 0.2rem rgba(255, 107, 53, 0.25) !important;
    }
    
    /* 드롭다운 화살표 숨기기 (three-dots 아이콘 사용) */
    .dropdown-toggle::after {
      display: none !important;
    }
    
    /* 드롭다운이 열렸을 때 배경 스타일 */
    .dropdown.show .dropdown-toggle {
      background-color: #ff6b35 !important;
      border-color: #ff6b35 !important;
      color: white !important;
    }
    
    /* 입력창 호버 효과 */
    .form-control:hover {
      border-color: #ff6b35 !important;
      box-shadow: 0 0 0 0.2rem rgba(255, 107, 53, 0.25) !important;
    }
    
    /* 입력창 포커스 효과 */
    .form-control:focus {
      border-color: #ff6b35 !important;
      box-shadow: 0 0 0 0.2rem rgba(255, 107, 53, 0.25) !important;
    }
    
    /* 텍스트에리어 호버/포커스 효과 */
    textarea.form-control:hover,
    textarea.form-control:focus {
      border-color: #ff6b35 !important;
      box-shadow: 0 0 0 0.2rem rgba(255, 107, 53, 0.25) !important;
    }
    
    /* 검색 버튼 호버 효과 */
    .btn-primary:hover {
      background-color: #ff6b35 !important;
      border-color: #ff6b35 !important;
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

<body class="community-details-page">

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
          <li><a href="<c:url value='/blog'/>">예술인 기록</a></li>
          <li><a href="<c:url value='/community'/>" class="active">커뮤니티</a></li>
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
        <h1>커뮤니티 상세보기</h1>
        <p>고성 지역 예술인들과 시민들이 소통하고 공유하는 공간</p>
        
        <!-- breadcrumbs를 오른쪽 아래로 이동 -->
        <div class="d-flex justify-content-end mt-4">
          <nav class="breadcrumbs">
            <ol>
              <li><a href="<c:url value='/'/>">홈</a></li>
              <li><a href="<c:url value='/community'/>">커뮤니티</a></li>
              <li class="current"><c:out value="${post.title}" default="상세보기"/></li>
            </ol>
          </nav>
        </div>
      </div>
    </div><!-- End Page Title -->

    <div class="container">
      <div class="row">

        <div class="col-lg-8">

          <!-- Community Details Section -->
          <section id="community-details" class="blog-details section">
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
                  
                  <!-- 수정/삭제 버튼 (드롭다운) -->
                  <c:choose>
                    <c:when test="${post.authorId != null}">
                      <!-- 로그인 사용자가 작성한 글: 작성자 본인 또는 관리자만 -->
                      <c:if test="${not empty sessionScope.loginUser && (sessionScope.userId == post.authorId || sessionScope.role == 'admin')}">
                        <div class="dropdown">
                          <button class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" id="postDropdown1" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-three-dots-vertical"></i>
                          </button>
                          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="postDropdown1">
                            <li>
                              <a class="dropdown-item" href="<c:url value='/community/edit-form/${post.postId}'/>">
                                <i class="bi bi-pencil me-2"></i>수정
                              </a>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                              <button type="button" class="dropdown-item text-danger" onclick="deletePost(${post.postId})">
                                <i class="bi bi-trash me-2"></i>삭제
                              </button>
                            </li>
                          </ul>
                        </div>
                      </c:if>
                    </c:when>
                    <c:otherwise>
                      <!-- 비로그인 사용자가 작성한 글: 누구나 비밀번호로 수정/삭제 가능, 관리자는 바로 가능 -->
                      <div class="dropdown">
                        <button class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" id="postDropdown2" data-bs-toggle="dropdown" aria-expanded="false">
                          <i class="bi bi-three-dots-vertical"></i>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="postDropdown2">
                          <li>
                            <c:choose>
                              <c:when test="${sessionScope.role == 'admin'}">
                                <!-- 관리자는 바로 수정 가능 -->
                                <a class="dropdown-item" href="<c:url value='/community/edit-form/${post.postId}'/>">
                                  <i class="bi bi-pencil me-2"></i>수정 (관리자)
                                </a>
                              </c:when>
                              <c:otherwise>
                                <!-- 일반 사용자는 비밀번호 확인 후 수정 -->
                                <button type="button" class="dropdown-item" onclick="editGuestPost('${post.postId}')">
                                  <i class="bi bi-pencil me-2"></i>수정
                                </button>
                              </c:otherwise>
                            </c:choose>
                          </li>
                          <li><hr class="dropdown-divider"></li>
                          <li>
                            <c:choose>
                              <c:when test="${sessionScope.role == 'admin'}">
                                <!-- 관리자는 바로 삭제 가능 -->
                                <button type="button" class="dropdown-item text-danger" onclick="deletePostAsAdmin('${post.postId}')">
                                  <i class="bi bi-trash me-2"></i>삭제 (관리자)
                                </button>
                              </c:when>
                              <c:otherwise>
                                <!-- 일반 사용자는 비밀번호 확인 후 삭제 -->
                                <button type="button" class="dropdown-item text-danger" onclick="deleteGuestPost('${post.postId}')">
                                  <i class="bi bi-trash me-2"></i>삭제
                                </button>
                              </c:otherwise>
                            </c:choose>
                          </li>
                        </ul>
                      </div>
                    </c:otherwise>
                  </c:choose>
                </div>

                <!-- 게시글 메타 정보 -->
                <div class="post-meta-enhanced">
                  <div class="row text-center">
                    <div class="col-md-4 text-nowrap">
                      <i class="bi bi-calendar3 text-primary"></i>
                      <strong>작성일:</strong>
                      <time datetime="${post.createdAt}" class="d-inline-block">${post.createdAt.toString().replace('T', ' ').substring(0, 16)}</time>
                    </div>
                    <div class="col-md-4 text-nowrap">
                      <i class="bi bi-chat-dots text-success"></i>
                      <strong>댓글:</strong>
                      <span><c:out value="${commentCount}" default="0"/>개</span>
                    </div>
                    <div class="col-md-4 text-nowrap">
                      <i class="bi bi-eye text-info"></i>
                      <strong>조회:</strong>
                      <span>${post.viewCount}회</span>
                    </div>
                  </div>
                </div>

                <!-- 글 내용 -->
                <div class="content">
                  <div class="card border-0 shadow-sm">
                    <div class="card-body p-4">                  
                      <div class="content-text">
                        <c:choose>
                          <c:when test="${not empty post.content}">
                            <p style="white-space: pre-wrap; line-height: 1.8;"><c:out value="${post.content}"/></p>
                          </c:when>
                          <c:otherwise>
                            <p class="text-muted">내용이 없습니다.</p>
                          </c:otherwise>
                        </c:choose>
                      </div>
                    </div>
                  </div>
                </div>

              </article>

            </div>
          </section><!-- /Community Details Section -->

          <!-- Community Comments Section -->
          <section id="community-comments" class="blog-comments section">
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
                                  <!-- 로그인 사용자 -->
                                  <div class="bg-success rounded-circle d-flex align-items-center justify-content-center" style="width: 50px; height: 50px;">
                                    <i class="bi bi-person-check-fill text-white"></i>
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
                                    <!-- 디버깅: role 값 확인 -->
                                    <small class="text-muted">[Role: ${comment.authorRole}]</small>
                                    <c:choose>
                                      <c:when test="${comment.authorId != null}">
                                        <!-- 로그인 사용자: 관리자인지 확인 -->
                                        <c:choose>
                                          <c:when test="${comment.authorRole == 'admin'}">
                                            <span class="badge bg-danger ms-2">관리자</span>
                                          </c:when>
                                          <c:otherwise>
                                            <span class="badge bg-success ms-2">예술인</span>
                                          </c:otherwise>
                                        </c:choose>
                                      </c:when>
                                      <c:otherwise>
                                        <!-- 비회원 -->
                                        <span class="badge bg-secondary ms-2">비회원</span>
                                      </c:otherwise>
                                    </c:choose>
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
                                      <button class="btn btn-outline-secondary btn-sm dropdown-toggle" type="button" id="commentDropdown${comment.commentId}" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="bi bi-three-dots-vertical"></i>
                                      </button>
                                      <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="commentDropdown${comment.commentId}">
                                        <li>
                                          <button type="button" class="dropdown-item edit-comment-btn" 
                                                  data-comment-id="${comment.commentId}" 
                                                  data-comment-content="<c:out value='${comment.content}'/>"
                                                  data-is-guest="${comment.authorId == null}">
                                            <i class="bi bi-pencil me-2"></i>수정
                                          </button>
                                        </li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li>
                                          <button type="button" class="dropdown-item text-danger delete-comment-btn" 
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
          </section><!-- /Community Comments Section -->

          <!-- Comment Form Section -->
          <section id="comment-form" class="comment-form section">
            <div class="container">
              <div class="comment-form-korean">
                <!-- 플래시 메시지 표시 -->
                <c:if test="${not empty commentError}">
                  <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="bi bi-exclamation-triangle-fill"></i> ${commentError}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                  </div>
                </c:if>
                <c:if test="${not empty commentSuccess}">
                  <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="bi bi-check-circle-fill"></i> ${commentSuccess}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                  </div>
                </c:if>

                <form action="<c:url value='/community/view/${post.postId}/comments'/>" method="post">
                  <h4 class="mb-4">
                    <i class="bi bi-pencil-square text-primary"></i> 댓글 작성
                  </h4>
                  
                  <c:choose>
                    <c:when test="${not empty sessionScope.loginUser}">
                      <!-- 로그인된 사용자 -->
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
                          <input name="guestPw" type="password" class="form-control" id="guestPw" placeholder="비밀번호를 입력해주세요" required>
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

            <!-- 작성자 정보 위젯 -->
            <div class="sidebar-widget-korean">
              <div class="d-flex flex-column align-items-center text-center">
                <div class="bg-gradient-success rounded-circle d-flex align-items-center justify-content-center mb-3" 
                     style="width: 80px; height: 80px; background: linear-gradient(135deg, #28a745 0%, #20c997 100%);">
                  <i class="bi bi-person-fill text-white" style="font-size: 2rem;"></i>
                </div>
                <h5><c:out value="${post.authorName}" default="익명"/></h5>
                <p class="text-muted small mb-3">커뮤니티 참여자</p>
                
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
              <form action="<c:url value='/community'/>" method="get" class="d-flex">
                <input type="text" name="search" class="form-control me-2" placeholder="제목, 작성자..." value="<c:out value='${param.search}'/>">
                <button type="submit" class="btn btn-primary">
                  <i class="bi bi-search"></i>
                </button>
              </form>
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

  // 커뮤니티 글 삭제 함수 (로그인 사용자)
  window.deletePost = function(postId) {
    if (!confirm('이 글을 삭제하시겠습니까?\n삭제된 글은 복구할 수 없습니다.')) return;
    
    let form = document.createElement('form');
    form.method = 'POST';
    form.action = '<c:url value="/community/delete/"/>' + postId;
    
    document.body.appendChild(form);
    form.submit();
  };

  // 비로그인 사용자 글 삭제 함수
  window.deleteGuestPost = function(postId) {
    if (!confirm('이 글을 삭제하시겠습니까?\n삭제된 글은 복구할 수 없습니다.')) return;
    
    const password = prompt('삭제를 위해 작성시 입력한 비밀번호를 입력하세요:');
    if (password === null || password.trim() === '') return;
    
    let form = document.createElement('form');
    form.method = 'POST';
    form.action = '<c:url value="/community/delete/"/>' + postId;
    
    let pwInput = document.createElement('input');
    pwInput.type = 'hidden';
    pwInput.name = 'password';
    pwInput.value = password.trim();
    form.appendChild(pwInput);
    
    document.body.appendChild(form);
    form.submit();
  };

  // 관리자가 게스트 글 삭제 함수
  window.deletePostAsAdmin = function(postId) {
    if (!confirm('관리자 권한으로 이 글을 삭제하시겠습니까?\n삭제된 글은 복구할 수 없습니다.')) return;
    
    let form = document.createElement('form');
    form.method = 'POST';
    form.action = '<c:url value="/community/admin-delete/"/>' + postId;
    
    document.body.appendChild(form);
    form.submit();
  };

  // 게스트 글 수정 함수 (비밀번호 확인)
  window.editGuestPost = function(postId) {
    console.log('editGuestPost 함수 호출됨, postId:', postId);
    
    const password = prompt('수정을 위해 작성시 입력한 비밀번호를 입력하세요:');
    if (password === null || password.trim() === '') {
      console.log('비밀번호가 입력되지 않아 취소됨');
      return;
    }
    
    console.log('AJAX 방식으로 비밀번호 검증 후 수정 폼으로 이동');
    
    // AJAX 방식으로 비밀번호 검증
    const formData = new FormData();
    formData.append('password', password.trim());
    
    fetch('<c:url value="/community/edit/"/>' + postId, {
      method: 'POST',
      body: formData
    })
    .then(response => response.json())
    .then(data => {
      console.log('응답 데이터:', data);
      if (data.success) {
        console.log('비밀번호 검증 성공 - 수정 폼으로 이동');
        window.location.href = '<c:url value="/community/edit-form/"/>' + postId;
      } else {
        console.log('비밀번호 검증 실패:', data.message);
        alert(data.message || '비밀번호가 일치하지 않습니다.');
      }
    })
    .catch(error => {
      console.error('요청 오류:', error);
      alert('오류가 발생했습니다.');
    });
  };
  
  // 드롭다운 초기화
  document.addEventListener('DOMContentLoaded', function() {
    setTimeout(function() {
      if (typeof bootstrap === 'undefined') {
        return;
      }
      
      // 템플릿 기본 드롭다운 비활성화 (충돌 방지)
      const templateDropdowns = document.querySelectorAll('.toggle-dropdown');
      templateDropdowns.forEach(function(element) {
        element.style.pointerEvents = 'none';
      });
      
      // Bootstrap 드롭다운 초기화
      const dropdownButtons = document.querySelectorAll('[data-bs-toggle="dropdown"]');
      dropdownButtons.forEach(function(button) {
        const existingInstance = bootstrap.Dropdown.getInstance(button);
        if (existingInstance) {
          existingInstance.dispose();
        }
        
        try {
          new bootstrap.Dropdown(button);
        } catch (error) {
          // 초기화 실패 시 무시
        }
      });
      
    }, 1000);
  });
  
  // 중복 이벤트 방지를 위해 제거
  // onclick 속성만 사용하므로 추가 이벤트 리스너 불필요
  </script>

</body>
</html> 