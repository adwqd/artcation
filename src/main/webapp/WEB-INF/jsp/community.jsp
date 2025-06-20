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
            <li class="dropdown"><a href="#"><span>더보기</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
              <ul>
                <li><a href="<c:url value='/artist'/>">예술인 관리</a></li>
                <li><a href="<c:url value='/starter'/>">공지사항</a></li>
                <li><a href="<c:url value='/#team'/>">운영진 소개</a></li>
              </ul>
            </li>
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
          <!-- Write Post Button -->
          <div class="row mb-4">
            <div class="col-12 text-end">
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
                      <tr>
                        <td>${post.postId}</td>
                        <td>
                          <a href="<c:url value='/community/view/${post.postId}'/>"
                            >${post.title}</a
                          >
                        </td>
                        <td>${post.authorName}</td>
                        <td>
                          ${post.createdAt}
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

          <!-- Pagination -->
          <div class="row">
            <div class="col-12">
              <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                  <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">이전</a>
                  </li>
                  <li class="page-item active">
                    <a class="page-link" href="#">1</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">2</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">3</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">다음</a>
                  </li>
                </ul>
              </nav>
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
