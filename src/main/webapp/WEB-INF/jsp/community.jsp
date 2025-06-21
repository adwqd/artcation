<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>커뮤니티 - Artcation Goseong</title>
    <meta
      name="description"
      content="고성 아트케이션 커뮤니티 - 소통과 공유의 공간"
    />
    <meta name="keywords" content="고성, 아트케이션, 커뮤니티, 소통, 공유" />

    <!-- Favicons -->
    <link href="<c:url value='/assets/img/favicon.png'/>" rel="icon" />
    <link
      href="<c:url value='/assets/img/apple-touch-icon.png'/>"
      rel="apple-touch-icon"
    />

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect" />
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet"
    />

    <!-- Vendor CSS Files -->
    <link
      href="<c:url value='/assets/vendor/bootstrap/css/bootstrap.min.css'/>"
      rel="stylesheet"
    />
    <link
      href="<c:url value='/assets/vendor/bootstrap-icons/bootstrap-icons.css'/>"
      rel="stylesheet"
    />
    <link href="<c:url value='/assets/vendor/aos/aos.css'/>" rel="stylesheet" />

    <!-- Main CSS File -->
    <link href="<c:url value='/assets/css/main.css'/>" rel="stylesheet" />
    
    <!-- Custom CSS for Community -->
    <style>
      /* 페이지네이션 스타일 */
      .pagination .page-link {
        color: #333;
        background-color: #ffffff;
        border-color: #dee2e6;
        padding: 0.75rem 1rem;
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

      /* 커뮤니티 행 호버 효과 */
      .community-row:hover {
        background-color: #f8f9fa !important;
        transform: translateY(-1px);
        transition: all 0.2s ease;
      }

      .community-row {
        transition: all 0.2s ease;
      }
    </style>
  </head>

  <body class="community-page">
    <header id="header" class="header d-flex align-items-center fixed-top">
      <div
        class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between"
      >
        <a href="<c:url value='/'/>" class="logo d-flex align-items-center">
          <!-- Uncomment the line below if you also wish to use an image logo -->
          <!-- <img src="<c:url value='/assets/img/logo.png'/>" alt=""> -->
          <h1 class="sitename">Artcation Goseong</h1>
        </a>

        <nav id="navmenu" class="navmenu">
          <ul>
            <li><a href="<c:url value='/'/>">홈</a></li>
            <li><a href="<c:url value='/#about'/>">예술인 소개</a></li>
            <li><a href="<c:url value='/blog'/>">예술인 기록</a></li>
            <li><a href="<c:url value='/community'/>" class="active">커뮤니티</a></li>
            <li><a href="<c:url value='/#promotions'/>">홍보 및 공지</a></li>
          </ul>
          <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>
      </div>
    </header>

    <main class="main">
      <!-- Page Title -->
      <div class="page-title dark-background">
        <div class="container position-relative">
          <h1>커뮤니티</h1>
          <p>고성 지역 예술인들과 시민들이 소통하고 공유하는 공간</p>
          <nav class="breadcrumbs">
            <ol>
              <li><a href="<c:url value='/'/>">홈</a></li>
              <li class="current">커뮤니티</li>
            </ol>
          </nav>
        </div>
      </div><!-- End Page Title -->

      <!-- Community Section -->
      <section class="community section">
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
          <!-- Action Buttons and Sorting -->
          <div class="row mb-4">
            <div class="col-lg-8 d-flex align-items-center">
              <div class="d-flex align-items-center">
                <label for="sortSelect" class="form-label me-2 mb-0">정렬:</label>
                <select id="sortSelect" class="form-select" style="width: auto;" onchange="changeSortOrder()">
                  <option value="latest" ${currentSort == 'latest' ? 'selected' : ''}>최신순</option>
                  <option value="views" ${currentSort == 'views' ? 'selected' : ''}>조회순</option>
                  <option value="oldest" ${currentSort == 'oldest' ? 'selected' : ''}>오래된순</option>
                </select>
              </div>
            </div>
            <div class="col-lg-4 text-end">
              <a
                href="<c:url value='/community/write'/>"
                class="btn btn-primary"
              >
                <i class="bi bi-pencil"></i> 글쓰기
              </a>
            </div>
          </div>

          <!-- Posts List -->
          <div class="row">
            <div class="col-12">
              <div class="table-responsive">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일</th>
                      <th>조회수</th>
                    </tr>
                  </thead>
                  <tbody>
                                          <c:forEach var="post" items="${posts}" varStatus="status">
                        <tr class="community-row" onclick="location.href='<c:url value='/community/view/${post.postId}'/>';" style="cursor: pointer;">
                        <td>${post.postId}</td>
                        <td>
                          ${post.title}
                        </td>
                        <td>${post.authorName}</td>
                        <td>
                          ${post.createdAt.toString().replace('T', ' ').substring(0, 19)}
                        </td>
                        <td>${post.viewCount}</td>
                      </tr>
                    </c:forEach>

                    <!-- Sample Posts (when no data) -->
                    <c:if test="${empty posts}">
                      <tr>
                        <td>1</td>
                        <td>
                          <a href="#">고성 아트케이션에 대한 의견</a>
                        </td>
                        <td>방문자</td>
                        <td>2024-06-20</td>
                        <td>15</td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td>
                          <a href="#">문화 행사 후기</a>
                        </td>
                        <td>예술가</td>
                        <td>2024-06-19</td>
                        <td>23</td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td>
                          <a href="#">전시회 소개</a>
                        </td>
                        <td>관리자</td>
                        <td>2024-06-18</td>
                        <td>45</td>
                      </tr>
                    </c:if>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

          <!-- 페이지네이션 -->
          <c:if test="${totalPages > 1}">
            <div class="row">
              <div class="col-12">
                <nav aria-label="Community pagination" class="d-flex justify-content-center mt-5">
                  <ul class="pagination pagination-lg">
                    <!-- 이전 페이지 -->
                    <c:if test="${currentPage > 1}">
                      <li class="page-item">
                        <a class="page-link" href="?page=${currentPage - 1}&sort=${currentSort}" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                        </a>
                      </li>
                    </c:if>
                    
                    <!-- 페이지 번호들 -->
                    <c:forEach var="i" begin="1" end="${totalPages}">
                      <li class="page-item ${i == currentPage ? 'active' : ''}">
                        <a class="page-link" href="?page=${i}&sort=${currentSort}">${i}</a>
                      </li>
                    </c:forEach>
                    
                    <!-- 다음 페이지 -->
                    <c:if test="${currentPage < totalPages}">
                      <li class="page-item">
                        <a class="page-link" href="?page=${currentPage + 1}&sort=${currentSort}" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                        </a>
                      </li>
                    </c:if>
                  </ul>
                </nav>
                
                <!-- 페이지 정보 -->
                <div class="text-center mt-3">
                  <small class="text-muted">
                    총 ${totalPosts}개의 글 중 ${(currentPage - 1) * 10 + 1} - ${currentPage * 10 > totalPosts ? totalPosts : currentPage * 10}번째 글
                  </small>
                </div>
              </div>
            </div>
          </c:if>
        </div>
      </section>
    </main>

    <!-- Vendor JS Files -->
    <script src="<c:url value='/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
    <script src="<c:url value='/assets/vendor/aos/aos.js'/>"></script>

    <!-- Main JS File -->
    <script src="<c:url value='/assets/js/main.js'/>"></script>

    <style>
      /* 커뮤니티 행 호버 효과 */
      .community-row:hover {
        background-color: #f8f9fa !important;
        transform: translateY(-1px);
        transition: all 0.2s ease;
      }

      .community-row {
        transition: all 0.2s ease;
      }
    </style>

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
