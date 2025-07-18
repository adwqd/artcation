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

    <style>
      .search-form .btn-primary:hover {
        background-color: #e55a2b;
        border-color: #e55a2b;
      }
      
      /* 검색 결과 스타일 */
      .search-result-info {
        background: linear-gradient(135deg, #6c757d 0%, #5a6268 100%);
        color: white;
        padding: 15px 20px;
        border-radius: 10px;
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

  <body>
    <header id="header" class="header d-flex align-items-center fixed-top">
      <div
        class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between"
      >
        <a href="<c:url value='/'/>" class="logo d-flex align-items-center">
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
          <h1>커뮤니티 <span style="color: #ff6b35;">게시판</span></h1>
          <p>소통과 공유의 공간에서 다양한 이야기를 나누어보세요</p>
          
          <!-- 검색 폼 -->
          <div class="mt-4">
            <div class="d-flex justify-content-center mb-3">
              <div class="col-lg-6 col-xl-5">
                <form action="<c:url value='/community'/>" method="get" class="search-form">
                  <div class="input-group">
                    <input type="text" name="search" class="form-control" placeholder="제목 또는 작성자명으로 검색..." value="<c:out value='${searchKeyword}'/>">
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
                  <a href="<c:url value='/community'/>" class="btn btn-outline-light">
                    <i class="bi bi-x-circle"></i> 검색 초기화
                  </a>
                </c:if>
              </div>
              <nav class="breadcrumbs">
                <ol>
                  <li><a href="<c:url value='/'/>">홈</a></li>
                  <li class="current">커뮤니티</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div><!-- End Page Title -->

      <!-- Community Section -->
      <section class="community section">
        <div class="container">
          <!-- Write Post Button and Sort Options -->
          <div class="row mb-4">
            <div class="col-md-6">
              <div class="d-flex align-items-center">
                <label for="sortSelect" class="form-label me-2 mb-0"></label>
                <select id="sortSelect" class="form-select" style="width: auto;" onchange="changeSortOrder()">
                  <option value="latest" ${currentSort == 'latest' ? 'selected' : ''}>최신순</option>
                  <option value="views" ${currentSort == 'views' ? 'selected' : ''}>조회순</option>
                  <option value="oldest" ${currentSort == 'oldest' ? 'selected' : ''}>오래된순</option>
                </select>
              </div>
            </div>
            <div class="col-md-6 text-end">
              <a
                href="<c:url value='/community/write'/>"
                class="btn btn-primary"
              >
                <i class="bi bi-pencil"></i> 글쓰기
              </a>
            </div>
          </div>
          
          <!-- 검색 결과 정보 -->
          <c:if test="${not empty searchKeyword}">
            <div class="search-result-info mb-4">
              <div class="d-flex align-items-center">
                <i class="bi bi-search me-2" style="font-size: 1.5rem;"></i>
                <div>
                  <h5 class="mb-1">검색 결과</h5>
                  <p class="mb-0">"<strong>${searchKeyword}</strong>" 검색 결과 총 <strong>${totalPosts}</strong>개의 글을 찾았습니다.</p>
                </div>
              </div>
            </div>
          </c:if>

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
                      <tr onclick="location.href='<c:url value='/community/view/${post.postId}'/>'" style="cursor: pointer;">
                        <td>${post.postId}</td>
                        <td>
                          <a href="<c:url value='/community/view/${post.postId}'/>"
                            >${post.title}</a
                          >
                        </td>
                        <td>${post.authorName}</td>
                        <td>
                          ${post.createdAt.toString().substring(0, 10)}
                        </td>
                        <td>${post.viewCount}</td>
                      </tr>
                    </c:forEach>

                    <!-- Sample Posts (when no data) -->
                    <c:if test="${empty posts}">
                      <tr onclick="location.href='#'" style="cursor: pointer;">
                        <td>1</td>
                        <td>
                          <a href="#">고성 아트케이션에 대한 의견</a>
                        </td>
                        <td>방문자</td>
                        <td>2024-06-20</td>
                        <td>15</td>
                      </tr>
                      <tr onclick="location.href='#'" style="cursor: pointer;">
                        <td>2</td>
                        <td>
                          <a href="#">문화 행사 후기</a>
                        </td>
                        <td>예술가</td>
                        <td>2024-06-19</td>
                        <td>23</td>
                      </tr>
                      <tr onclick="location.href='#'" style="cursor: pointer;">
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

          <!-- 검색 결과가 없을 때 -->
          <c:if test="${empty posts && not empty searchKeyword}">
            <div class="row">
              <div class="col-12 text-center py-5">
                <div class="alert alert-info">
                  <i class="bi bi-info-circle-fill me-2"></i>
                  "<strong>${searchKeyword}</strong>"에 대한 검색 결과가 없습니다.
                  <br><br>
                  <small class="text-muted">
                    • 다른 키워드로 검색해보세요<br>
                    • 작성자 이름이나 제목을 정확히 입력해보세요<br>
                    • 검색어를 줄여서 다시 시도해보세요
                  </small>
                </div>
              </div>
            </div>
          </c:if>

          <!-- 페이지네이션 -->
          <c:if test="${totalPages > 1}">
            <div class="row">
              <div class="col-12">
                <nav aria-label="Community pagination" class="d-flex justify-content-center mt-5">
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
                        "${searchKeyword}" 검색 결과: 총 ${totalPosts}개 중 ${(currentPage - 1) * 10 + 1} - ${currentPage * 10 > totalPosts ? totalPosts : currentPage * 10}번째
                      </c:when>
                      <c:otherwise>
                        총 ${totalPosts}개의 글 중 ${(currentPage - 1) * 10 + 1} - ${currentPage * 10 > totalPosts ? totalPosts : currentPage * 10}번째 글
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
    
    <script>
      function changeSortOrder() {
        const sortSelect = document.getElementById('sortSelect');
        const selectedSort = sortSelect.value;
        
        // 현재 URL에서 파라미터 가져오기
        const urlParams = new URLSearchParams(window.location.search);
        
        // 정렬 파라미터 설정
        urlParams.set('sort', selectedSort);
        urlParams.set('page', '1'); // 정렬 변경 시 첫 페이지로
        
        // 새 URL로 이동
        window.location.href = '<c:url value="/community"/>' + '?' + urlParams.toString();
      }
    </script>
  </body>
</html>
