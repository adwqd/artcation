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
  </style>
</head>

<body class="blog-details-page">

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
    <div class="page-title dark-background">
      <div class="container position-relative">
        <h1>예술인 기록 상세보기</h1>
        <p>고성 지역 예술인들의 창작 활동과 작품 이야기를 만나보세요</p>
        <nav class="breadcrumbs">
          <ol>
            <li><a href="<c:url value='/'/>">홈</a></li>
            <li><a href="<c:url value='/blog'/>">예술인 기록</a></li>
            <li class="current"><c:out value="${post.title}" default="상세보기"/></li>
          </ol>
        </nav>
      </div>
    </div><!-- End Page Title -->

    <div class="container">
      <div class="row">

        <div class="col-lg-8">

          <!-- Blog Details Section -->
          <section id="blog-details" class="blog-details section">
            <div class="container">

              <article class="article">

                <!-- 작품 이미지 (메인) -->
                <c:if test="${not empty post.imageUrl}">
                  <div class="post-img mb-4">
                    <img src="<c:url value='${post.imageUrl}'/>" alt="${post.title}" class="artwork-image img-fluid">
                  </div>
                </c:if>

                <!-- 제목과 작업 도구 -->
                <div class="d-flex justify-content-between align-items-start mb-4">
                  <h2 class="title mb-0"><c:out value="${post.title}" default="제목 없음"/></h2>
                  
                  <!-- 수정/삭제 버튼 (작성자 또는 관리자만 표시) -->
                  <c:if test="${not empty sessionScope.loginUser && (sessionScope.userId == post.artistId || sessionScope.role == 'admin')}">
                    <div class="btn-group" role="group">
                      <a href="<c:url value='/artist/edit/${post.postId}'/>" class="btn btn-outline-warning btn-sm">
                        <i class="bi bi-pencil"></i> 수정
                      </a>
                      <form action="<c:url value='/artist/delete/${post.postId}'/>" method="post" style="display: inline;" 
                            onsubmit="return confirm('정말로 이 기록을 삭제하시겠습니까?');">
                        <button type="submit" class="btn btn-outline-danger btn-sm">
                          <i class="bi bi-trash"></i> 삭제
                        </button>
                      </form>
                    </div>
                  </c:if>
                </div>

                <!-- 예술인 정보 -->
                <div class="artist-info">
                  <div class="row align-items-center">
                    <div class="col-md-8">
                      <h4><i class="bi bi-palette"></i> 예술인: <c:out value="${post.displayName}" default="익명"/></h4>
                      <p class="mb-0">고성 지역에서 활동하는 예술인입니다.</p>
                    </div>
                    <div class="col-md-4 text-end">
                      <div class="artist-stats">
                        <small><i class="bi bi-eye"></i> 조회 ${post.viewCount}회</small>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- 게시글 메타 정보 -->
                <div class="post-meta-enhanced">
                  <div class="row">
                    <div class="col-md-4">
                      <i class="bi bi-calendar3 text-primary"></i>
                      <strong>작성일:</strong><br>
                      <time datetime="${post.createdAt}">${post.createdAt.year}년 ${post.createdAt.monthValue}월 ${post.createdAt.dayOfMonth}일</time>
                    </div>
                    <div class="col-md-4">
                      <i class="bi bi-chat-dots text-success"></i>
                      <strong>댓글:</strong><br>
                      <span><c:out value="${commentCount}" default="0"/>개</span>
                    </div>
                    <div class="col-md-4">
                      <i class="bi bi-tag text-warning"></i>
                      <strong>분류:</strong><br>
                      <span>예술 작품</span>
                    </div>
                  </div>
                </div>

                <!-- 작품 설명 -->
                <div class="content">
                  <div class="card border-0 shadow-sm">
                    <div class="card-body p-4">
                      <h5 class="card-title"><i class="bi bi-brush"></i> 작품 소개</h5>
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

                <!-- 태그 -->
                <div class="meta-bottom mt-4">
                  <div class="d-flex flex-wrap align-items-center">
                    <i class="bi bi-tags text-primary me-2"></i>
                    <span class="badge bg-primary me-2">예술</span>
                    <span class="badge bg-secondary me-2">창작</span>
                    <span class="badge bg-success me-2">고성</span>
                    <span class="badge bg-info">작품</span>
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
                        <div id="comment-${comment.id}" class="comment border-bottom pb-3 mb-3">
                          <div class="d-flex">
                            <div class="comment-avatar me-3">
                              <div class="bg-primary rounded-circle d-flex align-items-center justify-content-center" style="width: 50px; height: 50px;">
                                <i class="bi bi-person-fill text-white"></i>
                              </div>
                            </div>
                            <div class="flex-grow-1">
                              <div class="d-flex justify-content-between align-items-start mb-2">
                                <h6 class="mb-0"><c:out value="${comment.author}"/></h6>
                                <small class="text-muted">
                                  <fmt:formatDate value="${comment.createdAt}" pattern="yyyy년 MM월 dd일 HH:mm"/>
                                </small>
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
                <form action="<c:url value='/blog/${post.postId}/comment'/>" method="post">
                  <h4 class="mb-4">
                    <i class="bi bi-pencil-square text-primary"></i> 댓글 작성
                  </h4>
                  <p class="text-muted mb-4">여러분의 소중한 의견을 들려주세요. * 표시는 필수 입력 항목입니다.</p>
                  
                  <div class="row">
                    <div class="col-md-6 form-group mb-3">
                      <label for="author" class="form-label">이름 *</label>
                      <input name="author" type="text" class="form-control" id="author" placeholder="이름을 입력해주세요" required>
                    </div>
                    <div class="col-md-6 form-group mb-3">
                      <label for="email" class="form-label">이메일 *</label>
                      <input name="email" type="email" class="form-control" id="email" placeholder="이메일을 입력해주세요" required>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col form-group mb-3">
                      <label for="website" class="form-label">웹사이트 (선택)</label>
                      <input name="website" type="url" class="form-control" id="website" placeholder="웹사이트 주소 (선택사항)">
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col form-group mb-4">
                      <label for="content" class="form-label">댓글 내용 *</label>
                      <textarea name="content" class="form-control" id="content" rows="5" placeholder="댓글을 입력해주세요..." required></textarea>
                    </div>
                  </div>

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
                <p class="text-muted small mb-3">고성 지역 예술인</p>
                
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
                <i class="bi bi-search text-primary"></i> 작품 검색
              </h5>
              <form action="<c:url value='/blog'/>" method="get" class="d-flex">
                <input type="text" name="search" class="form-control me-2" placeholder="작품명, 예술인명..." value="<c:out value='${param.search}'/>">
                <button type="submit" class="btn btn-primary">
                  <i class="bi bi-search"></i>
                </button>
              </form>
            </div>

            <!-- 카테고리 위젯 -->
            <div class="sidebar-widget-korean">
              <h5 class="widget-title mb-3">
                <i class="bi bi-grid text-primary"></i> 분류
              </h5>
              <ul class="list-unstyled">
                <li class="mb-2">
                  <a href="<c:url value='/blog?category=painting'/>" class="text-decoration-none d-flex justify-content-between">
                    <span><i class="bi bi-brush me-2"></i>회화</span>
                    <span class="badge bg-light text-dark">12</span>
                  </a>
                </li>
                <li class="mb-2">
                  <a href="<c:url value='/blog?category=sculpture'/>" class="text-decoration-none d-flex justify-content-between">
                    <span><i class="bi bi-box me-2"></i>조각</span>
                    <span class="badge bg-light text-dark">8</span>
                  </a>
                </li>
                <li class="mb-2">
                  <a href="<c:url value='/blog?category=craft'/>" class="text-decoration-none d-flex justify-content-between">
                    <span><i class="bi bi-scissors me-2"></i>공예</span>
                    <span class="badge bg-light text-dark">15</span>
                  </a>
                </li>
                <li class="mb-2">
                  <a href="<c:url value='/blog?category=design'/>" class="text-decoration-none d-flex justify-content-between">
                    <span><i class="bi bi-palette2 me-2"></i>디자인</span>
                    <span class="badge bg-light text-dark">6</span>
                  </a>
                </li>
              </ul>
            </div>

            <!-- 최근 작품 위젯 -->
            <div class="sidebar-widget-korean">
              <h5 class="widget-title mb-3">
                <i class="bi bi-clock-history text-primary"></i> 최근 작품
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
                    최근 작품이 없습니다.
                  </p>
                </c:otherwise>
              </c:choose>
            </div>

            <!-- 태그 위젯 -->
            <div class="sidebar-widget-korean">
              <h5 class="widget-title mb-3">
                <i class="bi bi-tags text-primary"></i> 인기 태그
              </h5>
              <div class="d-flex flex-wrap gap-2">
                <a href="<c:url value='/blog?tag=예술'/>" class="badge bg-primary text-decoration-none">예술</a>
                <a href="<c:url value='/blog?tag=창작'/>" class="badge bg-secondary text-decoration-none">창작</a>
                <a href="<c:url value='/blog?tag=고성'/>" class="badge bg-success text-decoration-none">고성</a>
                <a href="<c:url value='/blog?tag=전시'/>" class="badge bg-warning text-decoration-none">전시</a>
                <a href="<c:url value='/blog?tag=작품'/>" class="badge bg-info text-decoration-none">작품</a>
                <a href="<c:url value='/blog?tag=문화'/>" class="badge bg-light text-dark text-decoration-none">문화</a>
                <a href="<c:url value='/blog?tag=지역'/>" class="badge bg-dark text-decoration-none">지역</a>
              </div>
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

</body>
</html>