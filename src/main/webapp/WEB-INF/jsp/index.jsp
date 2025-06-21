<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>아트케이션 고성 - 예술인들의 소통공간</title>
  <meta name="description" content="고성 지역 예술인들의 작품 공유와 소통을 위한 온라인 플랫폼">
  <meta name="keywords" content="고성, 예술인, 아트, 커뮤니티, 예술작품, 문화">

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

  <!-- =======================================================
  * Template Name: Selecao
  * Template URL: https://bootstrapmade.com/selecao-bootstrap-template/
  * Updated: Aug 07 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body class="index-page">

  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

      <a href="<c:url value='/'/>" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="<c:url value='/assets/img/logo.png'/>" alt=""> -->
        <h1 class="sitename">Artcation Goseong</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="#hero" class="active">홈</a></li>
          <li><a href="#about">예술인 소개</a></li>
          <li><a href="<c:url value='/blog'/>">예술인 기록</a></li>
          <li><a href="<c:url value='/community'/>">커뮤니티</a></li>
          <li><a href="#promotions">홍보 및 공지</a></li>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

    </div>
  </header>

  <main class="main">

    <!-- Hero Section -->
    <section id="hero" class="hero section dark-background">

      <div id="hero-carousel" data-bs-interval="5000" class="container carousel carousel-fade" data-bs-ride="carousel">

        <!-- Slide 1 -->
        <div class="carousel-item active">
          <div class="carousel-container">
            <h2 class="animate__animated animate__fadeInDown">아트케이션 고성에 오신 것을 <span>환영합니다</span></h2>
            <p class="animate__animated animate__fadeInUp">고성 지역 예술인들의 창작 활동과 작품을 공유하고, 서로의 경험을 나누며 함께 성장하는 온라인 소통 공간입니다. 다양한 장르의 예술인들이 모여 새로운 영감을 얻고 협력할 수 있는 플랫폼을 제공합니다.</p>
            <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">더 알아보기</a>
          </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item">
          <div class="carousel-container">
            <h2 class="animate__animated animate__fadeInDown">예술인 기록을 <span>공유하세요</span></h2>
            <p class="animate__animated animate__fadeInUp">작품 제작 과정, 전시 후기, 창작 노하우 등 예술인들의 소중한 경험과 이야기를 기록하고 공유할 수 있습니다. 여러분의 예술적 여정을 다른 예술인들과 함께 나누어보세요.</p>
            <a href="<c:url value='/blog'/>" class="btn-get-started animate__animated animate__fadeInUp scrollto">예술인 기록 보기</a>
          </div>
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item">
          <div class="carousel-container">
            <h2 class="animate__animated animate__fadeInDown">커뮤니티에서 <span>소통하세요</span></h2>
            <p class="animate__animated animate__fadeInUp">질문과 답변, 정보 공유, 작품 피드백 등 다양한 주제로 예술인들과 소통할 수 있는 커뮤니티 공간입니다. 함께 성장하고 발전할 수 있는 네트워킹의 기회를 만들어보세요.</p>
            <a href="<c:url value='/community'/>" class="btn-get-started animate__animated animate__fadeInUp scrollto">커뮤니티 참여하기</a>
          </div>
        </div>

        <a class="carousel-control-prev" href="#hero-carousel" role="button" data-bs-slide="prev">
          <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
        </a>

        <a class="carousel-control-next" href="#hero-carousel" role="button" data-bs-slide="next">
          <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
        </a>

      </div>

      <svg class="hero-waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 24 150 28 " preserveAspectRatio="none">
        <defs>
          <path id="wave-path" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z"></path>
        </defs>
        <g class="wave1">
          <use xlink:href="#wave-path" x="50" y="3"></use>
        </g>
        <g class="wave2">
          <use xlink:href="#wave-path" x="50" y="0"></use>
        </g>
        <g class="wave3">
          <use xlink:href="#wave-path" x="50" y="9"></use>
        </g>
      </svg>

    </section><!-- /Hero Section -->

    <!-- About Section -->
    <section id="about" class="about section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>예술인 소개</h2>
        <p>아트케이션 고성이 함께하는 예술인들</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-6 content" data-aos="fade-up" data-aos-delay="100">
            <p>
              아트케이션 고성은 고성 지역의 다양한 장르 예술인들이 모인 창작 공동체입니다. 
              미술, 음악, 문학, 공연 등 각 분야의 전문 예술인들이 함께 활동하며 지역 문화 발전에 기여하고 있습니다.
            </p>
            <ul>
              <li><i class="bi bi-check2-circle"></i> <span>다양한 장르의 전문 예술인들과의 네트워킹</span></li>
              <li><i class="bi bi-check2-circle"></i> <span>창작 경험과 노하우 공유를 통한 성장</span></li>
              <li><i class="bi bi-check2-circle"></i> <span>지역 문화 발전을 위한 협력 프로젝트 진행</span></li>
            </ul>
          </div>

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
            <p>우리는 예술인 개개인의 창작 활동을 지원하고, 서로의 작품과 경험을 나누며 함께 성장하는 것을 목표로 합니다. 
            또한 고성 지역의 문화적 특색을 살린 다양한 예술 프로젝트를 기획하고 실행하여 지역 사회와 소통하고 있습니다.</p>
            <a href="<c:url value='/blog'/>" class="read-more"><span>예술인 기록 보기</span><i class="bi bi-arrow-right"></i></a>
          </div>

        </div>

      </div>

    </section><!-- /About Section -->

    <!-- Features Section -->
    <section id="features" class="features section">

      <div class="container">

        <ul class="nav nav-tabs row  d-flex" data-aos="fade-up" data-aos-delay="100">
          <li class="nav-item col-3">
            <a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#features-tab-1">
              <i class="bi bi-binoculars"></i>
              <h4 class="d-none d-lg-block">Modi sit est dela pireda nest</h4>
            </a>
          </li>
          <li class="nav-item col-3">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#features-tab-2">
              <i class="bi bi-box-seam"></i>
              <h4 class="d-none d-lg-block">Unde praesenti mara setra le</h4>
            </a>
          </li>
          <li class="nav-item col-3">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#features-tab-3">
              <i class="bi bi-brightness-high"></i>
              <h4 class="d-none d-lg-block">Pariatur explica nitro dela</h4>
            </a>
          </li>
          <li class="nav-item col-3">
            <a class="nav-link" data-bs-toggle="tab" data-bs-target="#features-tab-4">
              <i class="bi bi-command"></i>
              <h4 class="d-none d-lg-block">Nostrum qui dile node</h4>
            </a>
          </li>
        </ul><!-- End Tab Nav -->

        <div class="tab-content" data-aos="fade-up" data-aos-delay="200">

          <div class="tab-pane fade active show" id="features-tab-1">
            <div class="row">
              <div class="col-lg-6 order-2 order-lg-1 mt-3 mt-lg-0">
                <h3>Voluptatem dignissimos provident quasi corporis voluptates sit assumenda.</h3>
                <p class="fst-italic">
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
                  magna aliqua.
                </p>
                <ul>
                  <li><i class="bi bi-check2-all"></i>
                    <spab>Ullamco laboris nisi ut aliquip ex ea commodo consequat.</spab>
                  </li>
                  <li><i class="bi bi-check2-all"></i> <span>Duis aute irure dolor in reprehenderit in voluptate velit</span>.</li>
                  <li><i class="bi bi-check2-all"></i> <span>Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate trideta storacalaperda mastiro dolore eu fugiat nulla pariatur.</span></li>
                </ul>
                <p>
                  Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
                  culpa qui officia deserunt mollit anim id est laborum
                </p>
              </div>
              <div class="col-lg-6 order-1 order-lg-2 text-center">
                <img src="<c:url value='/assets/img/working-1.jpg'/>" alt="" class="img-fluid">
              </div>
            </div>
          </div><!-- End Tab Content Item -->

          <div class="tab-pane fade" id="features-tab-2">
            <div class="row">
              <div class="col-lg-6 order-2 order-lg-1 mt-3 mt-lg-0">
                <h3>Neque exercitationem debitis soluta quos debitis quo mollitia officia est</h3>
                <p>
                  Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
                  culpa qui officia deserunt mollit anim id est laborum
                </p>
                <p class="fst-italic">
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
                  magna aliqua.
                </p>
                <ul>
                  <li><i class="bi bi-check2-all"></i> <span>Ullamco laboris nisi ut aliquip ex ea commodo consequat.</span></li>
                  <li><i class="bi bi-check2-all"></i> <span>Duis aute irure dolor in reprehenderit in voluptate velit.</span></li>
                  <li><i class="bi bi-check2-all"></i> <span>Provident mollitia neque rerum asperiores dolores quos qui a. Ipsum neque dolor voluptate nisi sed.</span></li>
                  <li><i class="bi bi-check2-all"></i> <span>Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate trideta storacalaperda mastiro dolore eu fugiat nulla pariatur.</span></li>
                </ul>
              </div>
              <div class="col-lg-6 order-1 order-lg-2 text-center">
                <img src="<c:url value='/assets/img/working-2.jpg'/>" alt="" class="img-fluid">
              </div>
            </div>
          </div><!-- End Tab Content Item -->

          <div class="tab-pane fade" id="features-tab-3">
            <div class="row">
              <div class="col-lg-6 order-2 order-lg-1 mt-3 mt-lg-0">
                <h3>Voluptatibus commodi ut accusamus ea repudiandae ut autem dolor ut assumenda</h3>
                <p>
                  Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
                  culpa qui officia deserunt mollit anim id est laborum
                </p>
                <ul>
                  <li><i class="bi bi-check2-all"></i> <span>Ullamco laboris nisi ut aliquip ex ea commodo consequat.</span></li>
                  <li><i class="bi bi-check2-all"></i> <span>Duis aute irure dolor in reprehenderit in voluptate velit.</span></li>
                  <li><i class="bi bi-check2-all"></i> <span>Provident mollitia neque rerum asperiores dolores quos qui a. Ipsum neque dolor voluptate nisi sed.</span></li>
                </ul>
                <p class="fst-italic">
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
                  magna aliqua.
                </p>
              </div>
              <div class="col-lg-6 order-1 order-lg-2 text-center">
                <img src="<c:url value='/assets/img/working-3.jpg'/>" alt="" class="img-fluid">
              </div>
            </div>
          </div><!-- End Tab Content Item -->

          <div class="tab-pane fade" id="features-tab-4">
            <div class="row">
              <div class="col-lg-6 order-2 order-lg-1 mt-3 mt-lg-0">
                <h3>Omnis fugiat ea explicabo sunt dolorum asperiores sequi inventore rerum</h3>
                <p>
                  Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
                  culpa qui officia deserunt mollit anim id est laborum
                </p>
                <p class="fst-italic">
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
                  magna aliqua.
                </p>
                <ul>
                  <li><i class="bi bi-check2-all"></i> <span>Ullamco laboris nisi ut aliquip ex ea commodo consequat.</span></li>
                  <li><i class="bi bi-check2-all"></i> <span>Duis aute irure dolor in reprehenderit in voluptate velit.</span></li>
                  <li><i class="bi bi-check2-all"></i> <span>Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate trideta storacalaperda mastiro dolore eu fugiat nulla pariatur.</span></li>
                </ul>
              </div>
              <div class="col-lg-6 order-1 order-lg-2 text-center">
                <img src="<c:url value='/assets/img/working-4.jpg'/>" alt="" class="img-fluid">
              </div>
            </div>
          </div><!-- End Tab Content Item -->

        </div>

      </div>

    </section><!-- /Features Section -->

    <!-- Call To Action Section -->
    <section id="call-to-action" class="call-to-action section dark-background">

      <div class="container">

        <div class="row" data-aos="zoom-in" data-aos-delay="100">
          <div class="col-xl-9 text-center text-xl-start">
            <h3>아트케이션 고성에 참여하세요</h3>
            <p>고성 지역의 예술인이시라면 누구나 아트케이션 고성의 멤버가 될 수 있습니다. 여러분의 창작 이야기를 공유하고, 다른 예술인들과 소통하며 함께 성장해나가세요.</p>
          </div>
          <div class="col-xl-3 cta-btn-container text-center">
            <a class="cta-btn align-middle" href="<c:url value='/community'/>">지금 참여하기</a>
          </div>
        </div>

      </div>

    </section><!-- /Call To Action Section -->

    <!-- Promotions Section -->
    <section id="promotions" class="services section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>홍보 및 공지</h2>
        <p>아트케이션 고성의 다양한 활동과 소식</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
            <div class="service-item  position-relative">
              <div class="icon">
                <i class="bi bi-palette" style="color: #0dcaf0;"></i>
              </div>
              <a href="<c:url value='/blog'/>" class="stretched-link">
                <h3>예술 작품 전시</h3>
              </a>
              <p>예술인들의 다양한 작품을 온라인으로 전시하고 공유할 수 있는 공간을 제공합니다. 미술, 조각, 사진 등 다양한 장르의 작품을 감상해보세요.</p>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-calendar4-week" style="color: #fd7e14;"></i>
              </div>
              <a href="<c:url value='/starter'/>" class="stretched-link">
                <h3>워크샵 및 행사</h3>
              </a>
              <p>정기적으로 개최되는 예술 워크샵, 세미나, 전시회 등의 일정과 참여 방법을 안내합니다. 함께 배우고 성장할 수 있는 기회를 놓치지 마세요.</p>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-chat-text" style="color: #20c997;"></i>
              </div>
              <a href="<c:url value='/community'/>" class="stretched-link">
                <h3>멘토링 프로그램</h3>
              </a>
              <p>경험이 풍부한 선배 예술인들이 신진 예술인들에게 창작 노하우와 경험을 전수하는 멘토링 프로그램을 운영합니다.</p>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="400">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-people" style="color: #df1529;"></i>
              </div>
              <a href="<c:url value='/community'/>" class="stretched-link">
                <h3>협력 프로젝트</h3>
              </a>
              <p>다양한 장르의 예술인들이 함께 참여하는 융복합 프로젝트를 기획하고 진행합니다. 새로운 창작 영역을 탐색해보세요.</p>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="500">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-globe" style="color: #6610f2;"></i>
              </div>
              <a href="<c:url value='/blog'/>" class="stretched-link">
                <h3>지역 문화 행사</h3>
              </a>
              <p>고성 지역의 문화적 특색을 살린 다양한 예술 행사와 축제 정보를 제공합니다. 지역 사회와 함께하는 문화 활동에 참여해보세요.</p>
            </div>
          </div><!-- End Service Item -->

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="600">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-award" style="color: #f3268c;"></i>
              </div>
              <a href="<c:url value='/starter'/>" class="stretched-link">
                <h3>창작 지원 프로그램</h3>
              </a>
              <p>예술인들의 창작 활동을 지원하는 다양한 프로그램과 지원금 정보를 안내합니다. 창작에 집중할 수 있는 환경을 만들어드립니다.</p>
            </div>
          </div><!-- End Service Item -->

        </div>

      </div>

    </section><!-- /Promotions Section -->

    <!-- Portfolio Section -->
    <section id="portfolio" class="portfolio section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>작품 갤러리</h2>
        <p>예술인들의 다양한 작품들</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="isotope-layout" data-default-filter="*" data-layout="masonry" data-sort="original-order">

          <ul class="portfolio-filters isotope-filters" data-aos="fade-up" data-aos-delay="100">
            <li data-filter="*" class="filter-active">전체</li>
            <li data-filter=".filter-app">미술</li>
            <li data-filter=".filter-product">공예</li>
            <li data-filter=".filter-branding">사진</li>
          </ul><!-- End Portfolio Filters -->

          <div class="row gy-4 isotope-container" data-aos="fade-up" data-aos-delay="200">

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
              <img src="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-1.jpg'/>" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>수채화 풍경</h4>
                <p>고성의 아름다운 자연</p>
                <a href="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-1.jpg'/>" title="수채화 풍경" data-gallery="portfolio-gallery-app" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="<c:url value='/portfolio/1'/>" title="상세보기" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
              <img src="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-2.jpg'/>" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>도자기 작품</h4>
                <p>전통 기법의 현대적 해석</p>
                <a href="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-2.jpg'/>" title="도자기 작품" data-gallery="portfolio-gallery-product" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="<c:url value='/portfolio/2'/>" title="상세보기" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
              <img src="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-3.jpg'/>" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>인물 사진</h4>
                <p>예술인의 일상 모습</p>
                <a href="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-3.jpg'/>" title="인물 사진" data-gallery="portfolio-gallery-branding" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="<c:url value='/portfolio/3'/>" title="상세보기" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
              <img src="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-4.jpg'/>" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>유화 작품</h4>
                <p>추상적 표현의 현대미술</p>
                <a href="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-4.jpg'/>" title="유화 작품" data-gallery="portfolio-gallery-app" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="<c:url value='/portfolio/4'/>" title="상세보기" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
              <img src="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-5.jpg'/>" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>목공예품</h4>
                <p>자연 소재의 따뜻한 감성</p>
                <a href="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-5.jpg'/>" title="목공예품" data-gallery="portfolio-gallery-product" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="<c:url value='/portfolio/5'/>" title="상세보기" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
              <img src="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-6.jpg'/>" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>풍경 사진</h4>
                <p>고성의 사계절 아름다움</p>
                <a href="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-6.jpg'/>" title="풍경 사진" data-gallery="portfolio-gallery-branding" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="<c:url value='/portfolio/6'/>" title="상세보기" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
              <img src="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-7.jpg'/>" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>서예 작품</h4>
                <p>전통 서예의 현대적 감각</p>
                <a href="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-7.jpg'/>" title="서예 작품" data-gallery="portfolio-gallery-app" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="<c:url value='/portfolio/7'/>" title="상세보기" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
              <img src="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-8.jpg'/>" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>금속공예</h4>
                <p>전통과 현대의 만남</p>
                <a href="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-8.jpg'/>" title="금속공예" data-gallery="portfolio-gallery-product" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="<c:url value='/portfolio/8'/>" title="상세보기" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
              <img src="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-9.jpg'/>" class="img-fluid" alt="">
              <div class="portfolio-info">
                <h4>작업실 모습</h4>
                <p>예술인들의 창작 공간</p>
                <a href="<c:url value='/assets/img/masonry-portfolio/masonry-portfolio-9.jpg'/>" title="작업실 모습" data-gallery="portfolio-gallery-branding" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
                <a href="<c:url value='/portfolio/9'/>" title="상세보기" class="details-link"><i class="bi bi-link-45deg"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

          </div><!-- End Portfolio Container -->

        </div>

      </div>

    </section><!-- /Portfolio Section -->

    <!-- Testimonials Section -->
    <section id="testimonials" class="testimonials section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Testimonials</h2>
        <p>What they are saying about us</p>
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="swiper init-swiper">
          <script type="application/json" class="swiper-config">
            {
              "loop": true,
              "speed": 600,
              "autoplay": {
                "delay": 5000
              },
              "slidesPerView": "auto",
              "pagination": {
                "el": ".swiper-pagination",
                "type": "bullets",
                "clickable": true
              },
              "breakpoints": {
                "320": {
                  "slidesPerView": 1,
                  "spaceBetween": 40
                },
                "1200": {
                  "slidesPerView": 3,
                  "spaceBetween": 10
                }
              }
            }
          </script>
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="<c:url value='/assets/img/testimonials/testimonials-1.jpg'/>" class="testimonial-img" alt="">
                <h3>Saul Goodman</h3>
                <h4>Ceo &amp; Founder</h4>
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                <h3>Sara Wilsson</h3>
                <h4>Designer</h4>
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                <h3>Jena Karlis</h3>
                <h4>Store Owner</h4>
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
                <h3>Matt Brandon</h3>
                <h4>Freelancer</h4>
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat minim velit minim dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
                <h3>John Larson</h3>
                <h4>Entrepreneur</h4>
                <div class="stars">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                </div>
                <p>
                  <i class="bi bi-quote quote-icon-left"></i>
                  <span>Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid.</span>
                  <i class="bi bi-quote quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>

    </section><!-- /Testimonials Section -->

    <!-- Pricing Section -->
    <section id="pricing" class="pricing section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Pricing</h2>
        <p>What they are saying about us</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-3">

          <div class="col-xl-3 col-lg-6" data-aos="fade-up" data-aos-delay="100">
            <div class="pricing-item">
              <h3>Free</h3>
              <h4><sup>$</sup>0<span> / month</span></h4>
              <ul>
                <li>Aida dere</li>
                <li>Nec feugiat nisl</li>
                <li>Nulla at volutpat dola</li>
                <li class="na">Pharetra massa</li>
                <li class="na">Massa ultricies mi</li>
              </ul>
              <div class="btn-wrap">
                <a href="#" class="btn-buy">Buy Now</a>
              </div>
            </div>
          </div><!-- End Pricing Item -->

          <div class="col-xl-3 col-lg-6" data-aos="fade-up" data-aos-delay="200">
            <div class="pricing-item featured">
              <h3>Business</h3>
              <h4><sup>$</sup>19<span> / month</span></h4>
              <ul>
                <li>Aida dere</li>
                <li>Nec feugiat nisl</li>
                <li>Nulla at volutpat dola</li>
                <li>Pharetra massa</li>
                <li class="na">Massa ultricies mi</li>
              </ul>
              <div class="btn-wrap">
                <a href="#" class="btn-buy">Buy Now</a>
              </div>
            </div>
          </div><!-- End Pricing Item -->

          <div class="col-xl-3 col-lg-6" data-aos="fade-up" data-aos-delay="400">
            <div class="pricing-item">
              <h3>Developer</h3>
              <h4><sup>$</sup>29<span> / month</span></h4>
              <ul>
                <li>Aida dere</li>
                <li>Nec feugiat nisl</li>
                <li>Nulla at volutpat dola</li>
                <li>Pharetra massa</li>
                <li>Massa ultricies mi</li>
              </ul>
              <div class="btn-wrap">
                <a href="#" class="btn-buy">Buy Now</a>
              </div>
            </div>
          </div><!-- End Pricing Item -->

          <div class="col-xl-3 col-lg-6" data-aos="fade-up" data-aos-delay="400">
            <div class="pricing-item">
              <span class="advanced">Advanced</span>
              <h3>Ultimate</h3>
              <h4><sup>$</sup>49<span> / month</span></h4>
              <ul>
                <li>Aida dere</li>
                <li>Nec feugiat nisl</li>
                <li>Nulla at volutpat dola</li>
                <li>Pharetra massa</li>
                <li>Massa ultricies mi</li>
              </ul>
              <div class="btn-wrap">
                <a href="#" class="btn-buy">Buy Now</a>
              </div>
            </div>
          </div><!-- End Pricing Item -->

        </div>

      </div>

    </section><!-- /Pricing Section -->

    <!-- Faq Section -->
    <section id="faq" class="faq section">
      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Frequently Asked Questions</h2>
        <p>Frequently Asked Questions</p>
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up">
        <div class="row">
          <div class="col-12">
            <div class="custom-accordion" id="accordion-faq">
              <div class="accordion-item">
                <h2 class="mb-0">
                  <button class="btn btn-link" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-faq-1">
                    How to download and register?
                  </button>
                </h2>

                <div id="collapse-faq-1" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion-faq">
                  <div class="accordion-body">
                    Far far away, behind the word mountains, far from the countries
                    Vokalia and Consonantia, there live the blind texts. Separated
                    they live in Bookmarksgrove right at the coast of the Semantics,
                    a large language ocean.
                  </div>
                </div>
              </div>
              <!-- .accordion-item -->

              <div class="accordion-item">
                <h2 class="mb-0">
                  <button class="btn btn-link collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-faq-2" "="">
                How to create your paypal account?
              </button>
            </h2>
            <div id=" collapse-faq-2" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion-faq">
                    <div class="accordion-body">
                      A small river named Duden flows by their place and supplies it
                      with the necessary regelialia. It is a paradisematic country, in
                      which roasted parts of sentences fly into your mouth.
                    </div>
              </div>
            </div>
            <!-- .accordion-item -->

            <div class="accordion-item">
              <h2 class="mb-0">
                <button class="btn btn-link collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse-faq-3">
                  How to link your paypal and bank account?
                </button>
              </h2>

              <div id="collapse-faq-3" class="collapse" aria-labelledby="headingThree" data-parent="#accordion-faq">
                <div class="accordion-body">
                  When she reached the first hills of the Italic Mountains, she
                  had a last view back on the skyline of her hometown
                  Bookmarksgrove, the headline of Alphabet Village and the subline
                  of her own road, the Line Lane. Pityful a rethoric question ran
                  over her cheek, then she continued her way.
                </div>
              </div>
            </div>
            <!-- .accordion-item -->

          </div>
        </div>
      </div>
      </div>
    </section><!-- /Faq Section -->

    <!-- Team Section -->
    <section id="team" class="team section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>운영진 소개</h2>
        <p>아트케이션 고성을 이끌어가는 사람들</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="team-member">
              <div class="member-img">
                <img src="assets/img/team/team-1.jpg" class="img-fluid" alt="">
                <div class="social">
                  <a href=""><i class="bi bi-twitter-x"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4>김예술</h4>
                <span>아트케이션 고성 대표</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
            <div class="team-member">
              <div class="member-img">
                <img src="<c:url value='/assets/img/team/team-2.jpg'/>" class="img-fluid" alt="">
                <div class="social">
                  <a href=""><i class="bi bi-twitter-x"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4>이창작</h4>
                <span>기획 및 전시 담당</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="300">
            <div class="team-member">
              <div class="member-img">
                <img src="<c:url value='/assets/img/team/team-3.jpg'/>" class="img-fluid" alt="">
                <div class="social">
                  <a href=""><i class="bi bi-twitter-x"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4>박문화</h4>
                <span>교육 및 워크샵 담당</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="400">
            <div class="team-member">
              <div class="member-img">
                <img src="<c:url value='/assets/img/team/team-4.jpg'/>" class="img-fluid" alt="">
                <div class="social">
                  <a href=""><i class="bi bi-twitter-x"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4>정소통</h4>
                <span>홍보 및 마케팅 담당</span>
              </div>
            </div>
          </div><!-- End Team Member -->

        </div>

      </div>

    </section><!-- /Team Section -->

    <!-- Recent Posts Section -->
    <section id="recent-posts" class="recent-posts section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>최신 예술인 기록</h2>
        <p>예술인들의 최근 활동과 이야기<br></p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">

          <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
            <article>

              <div class="post-img">
                <img src="<c:url value='/assets/img/blog/blog-1.jpg'/>" alt="" class="img-fluid">
              </div>

              <p class="post-category">미술</p>

              <h2 class="title">
                <a href="<c:url value='/blog/1'/>">고성 바다를 담은 수채화 연작 전시회 후기</a>
              </h2>

              <div class="d-flex align-items-center">
                <img src="<c:url value='/assets/img/blog/blog-author.jpg'/>" alt="" class="img-fluid post-author-img flex-shrink-0">
                <div class="post-meta">
                  <p class="post-author">김해안</p>
                  <p class="post-date">
                    <time datetime="2024-12-20">2024년 12월 20일</time>
                  </p>
                </div>
              </div>

            </article>
          </div><!-- End post list item -->

          <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
            <article>

              <div class="post-img">
                <img src="<c:url value='/assets/img/blog/blog-2.jpg'/>" alt="" class="img-fluid">
              </div>

              <p class="post-category">공예</p>

              <h2 class="title">
                <a href="<c:url value='/blog/2'/>">전통 옹기 제작 워크샵 참여 후기</a>
              </h2>

              <div class="d-flex align-items-center">
                <img src="<c:url value='/assets/img/blog/blog-author-2.jpg'/>" alt="" class="img-fluid post-author-img flex-shrink-0">
                <div class="post-meta">
                  <p class="post-author">박도예</p>
                  <p class="post-date">
                    <time datetime="2024-12-18">2024년 12월 18일</time>
                  </p>
                </div>
              </div>

            </article>
          </div><!-- End post list item -->

          <div class="col-xl-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
            <article>

              <div class="post-img">
                <img src="<c:url value='/assets/img/blog/blog-3.jpg'/>" alt="" class="img-fluid">
              </div>

              <p class="post-category">사진</p>

              <h2 class="title">
                <a href="<c:url value='/blog/3'/>">고성의 사계절을 담은 사진전 개최 소식</a>
              </h2>

              <div class="d-flex align-items-center">
                <img src="<c:url value='/assets/img/blog/blog-author-3.jpg'/>" alt="" class="img-fluid post-author-img flex-shrink-0">
                <div class="post-meta">
                  <p class="post-author">이셔터</p>
                  <p class="post-date">
                    <time datetime="2024-12-15">2024년 12월 15일</time>
                  </p>
                </div>
              </div>

            </article>
          </div><!-- End post list item -->

        </div><!-- End recent posts list -->

      </div>

    </section><!-- /Recent Posts Section -->


  </main>

  <footer id="footer" class="footer dark-background">
    <div class="container">
      <h3 class="sitename">아트케이션 고성</h3>
      <p>고성 지역 예술인들이 함께 만들어가는 창작 공동체입니다. 서로의 경험을 나누고, 함께 성장하며, 지역 문화 발전에 기여합니다.</p>
      <div class="social-links d-flex justify-content-center">
        <a href=""><i class="bi bi-twitter-x"></i></a>
        <a href=""><i class="bi bi-facebook"></i></a>
        <a href=""><i class="bi bi-instagram"></i></a>
        <a href=""><i class="bi bi-youtube"></i></a>
        <a href=""><i class="bi bi-envelope"></i></a>
      </div>
      <div class="container">
        <div class="copyright">
          <span>Copyright</span> <strong class="px-1 sitename">아트케이션 고성</strong> <span>All Rights Reserved</span>
        </div>
        <div class="credits">
          <!-- All the links in the footer should remain intact. -->
          <!-- You can delete the links only if you've purchased the pro version. -->
          <!-- Licensing information: https://bootstrapmade.com/license/ -->
          <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
      </div>
    </div>
  </footer>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="<c:url value='/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/php-email-form/validate.js'/>"></script>
  <script src="<c:url value='/assets/vendor/aos/aos.js'/>"></script>
  <script src="<c:url value='/assets/vendor/glightbox/js/glightbox.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/isotope-layout/isotope.pkgd.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/swiper/swiper-bundle.min.js'/>"></script>

  <!-- Main JS File -->
  <script src="<c:url value='/assets/js/main.js'/>"></script>

</body>

</html>