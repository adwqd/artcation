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

  <!-- Hero Background Images -->
  <style>
    .hero-bg-1 {
      background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('<c:url value='/assets/img/artist/김유라1.jpg'/>') center/cover;
      min-height: 100vh;
    }
    .hero-bg-2 {
      background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('<c:url value='/assets/img/artist/이경민1.jpg'/>') center/cover;
      min-height: 100vh;
    }
    .hero-bg-3 {
      background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('<c:url value='/assets/img/artist/정은영1.jpg'/>') center/cover;
      min-height: 100vh;
    }
    
    /* 예술인 호버 효과 */
    .team-member {
      position: relative;
      overflow: hidden;
      border-radius: 15px;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      transition: all 0.3s ease;
      cursor: pointer;
    }
    
    .team-member:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    }
    
    .team-member .member-img {
      position: relative;
      overflow: hidden;
      border-radius: 15px 15px 0 0;
    }
    
    .team-member .member-img img {
      transition: all 0.4s ease;
      width: 100%;
      height: 300px;
      object-fit: cover;
    }
    
    .team-member:hover .member-img img {
      transform: scale(1.05);
    }
    
    .team-member .member-info {
      padding: 20px;
      text-align: center;
      background: white;
      border-radius: 0 0 15px 15px;
      transition: all 0.3s ease;
    }
    
    .team-member .member-info h4 {
      margin-bottom: 8px;
      font-size: 20px;
      font-weight: 600;
      transition: all 0.3s ease;
    }
    
    .team-member .member-info span {
      font-size: 14px;
      color: #666;
      transition: all 0.3s ease;
    }
    
    /* 반응형 */
    @media (max-width: 768px) {
      .team-member .member-img img {
        height: 250px;
      }
    }
  </style>

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
          <li><a href="#about">아트케이션 고성이란?</a></li>
          <li><a href="<c:url value='/blog'/>">예술인 기록</a></li>
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

    <!-- Hero Section -->
    <section id="hero" class="hero section dark-background">

      <div id="hero-carousel" data-bs-interval="5000" class="container carousel carousel-fade" data-bs-ride="carousel">

        <!-- Slide 1 -->
        <div class="carousel-item active hero-bg-1">
          <div class="carousel-container">
            <h2 class="animate__animated animate__fadeInDown">아트케이션 고성에 오신 것을 <span>환영합니다</span></h2>
            <p class="animate__animated animate__fadeInUp">
              <strong style="color: #ff6b35;">도시소멸 위기를 예술로 극복하는</strong> 특별한 프로그램입니다.<br>
              일상에서 벗어나 예술적 영감을 위한 휴식과 창작, 모두가 한번쯤 꿈꿔 온 라이프를 고성에서 경험해보세요. 
              나만의 시간, 나만의 공간에서 조용하고 차분하게 새로운 발견을 도와줄 열두개의 '예술가의 방'이 여러분을 기다립니다.
            </p>
            <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">더 알아보기</a>
          </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item hero-bg-2">
          <div class="carousel-container">
            <h2 class="animate__animated animate__fadeInDown">예술하기 좋은 <span>고성</span></h2>
            <p class="animate__animated animate__fadeInUp">푸른 바다가 보이는 아침, 빛나는 석호를 거니는 점심, 포근한 산자락 품에서 잠드는 밤. 모든 일상이 아름다운 사는 게 예술인 고성에서 창작의 영감을 얻어보세요.</p>
            <a href="#goseong" class="btn-get-started animate__animated animate__fadeInUp scrollto">고성 알아보기</a>
          </div>
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item hero-bg-3">
          <div class="carousel-container">
            <h2 class="animate__animated animate__fadeInDown">함께하는 <span>예술인들</span></h2>
            <p class="animate__animated animate__fadeInUp">시각, 건축, 디자인, 공예, 만화, 문학, 사진, 음악, 영화 등 다양한 분야의 예술인 12명이 고성에서 창작 활동을 펼치고 있습니다. 그들의 이야기와 작품을 만나보세요.</p>
            <a href="#artists" class="btn-get-started animate__animated animate__fadeInUp scrollto">예술인 만나기</a>
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
        <h2>아트케이션 고성이란?</h2>
        <p><strong>도시소멸 위기를 극복하기 위한 예술적 해답</strong></p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-6 content" data-aos="fade-up" data-aos-delay="100">
            <div class="alert alert-info mb-4" style="border-left: 4px solid #ff6b35; background: linear-gradient(135deg, #fff8f0 0%, #ffeee6 100%);">
              <h5 class="mb-2" style="color: #ff6b35;"><i class="bi bi-exclamation-triangle-fill"></i> 도시소멸 위기 대응 프로그램</h5>
              <p class="mb-0" style="color: #666;">아트케이션 고성은 인구 감소와 지역 소멸 위기에 직면한 고성군에 새로운 활력을 불어넣기 위해 시작된 문화예술 프로그램입니다.</p>
            </div>
            
            <p>
              만 45세 이하 청년, 신진예술인들을 위한 창작 레지던시 프로그램으로, 
              <strong>예술의 힘으로 지역에 새로운 생명력을 불어넣고</strong> 지속가능한 지역 발전 모델을 만들어가고 있습니다.
            </p>
            <ul>
              <li><i class="bi bi-check2-circle"></i> <span>활동비 100만원 지원</span></li>
              <li><i class="bi bi-check2-circle"></i> <span>거주공간 제공 및 예술인 비평워크숍</span></li>
              <li><i class="bi bi-check2-circle"></i> <span>농촌생활 및 주민연계 프로그램 제공</span></li>
              <li><i class="bi bi-check2-circle"></i> <span>레지던시 명파 창작지원금(400만원 이내)</span></li>
              <li><i class="bi bi-check2-circle"></i> <span>아트케이션 페스티벌 참여 기회</span></li>
            </ul>
          </div>

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
            <div class="card border-0 shadow-sm mb-4" style="background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);">
              <div class="card-body p-4">
                <h5 class="card-title" style="color: #ff6b35;"><i class="bi bi-lightbulb-fill"></i> 예술로 살리는 지역</h5>
                <p class="card-text">예술인들이 고성에 머물며 지역 주민들과 교류하고, 지역의 이야기를 예술 작품으로 재탄생시키면서 <strong>문화적 활력과 경제적 효과</strong>를 동시에 창출합니다.</p>
              </div>
            </div>
            
            <p>이곳 한 달 살기의 씨앗심기가 레지던시의 새싹이 되어, 여러분의 축제에서 꽃으로 활짝 피어나길 바랍니다. 
            시각, 건축, 디자인, 공예, 만화, 문학, 사진, 음악, 영화 등 다양한 분야의 예술인들이 <strong>고성의 지속가능한 미래</strong>를 위한 새로운 창작의 가능성을 발견하고 있습니다.</p>
            <a href="#participation" class="read-more"><span>참여방법 알아보기</span><i class="bi bi-arrow-right"></i></a>
          </div>

        </div>

      </div>

    </section><!-- /About Section -->

    <!-- Goseong Section -->
    <section id="goseong" class="about section light-background">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>고성은 어떤 곳인가</h2>
        <p>예술적 영감이 넘치는 자연의 보고</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">
          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
            <div class="card h-100 border-0 shadow-sm">
              <div class="card-body text-center p-4">
                <div class="icon mb-3">
                  <i class="bi bi-tree" style="font-size: 3rem; color: #28a745;"></i>
                </div>
                <h4>예술하기 좋은 고성</h4>
                <p class="text-muted">면적 70%의 숲, 동해안 가장 긴 해변의 생태, DMZ와 금강산. 숨겨진 이야기가 예술적 영감이 되는 곳입니다.</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="200">
            <div class="card h-100 border-0 shadow-sm">
              <div class="card-body text-center p-4">
                <div class="icon mb-3">
                  <i class="bi bi-sun" style="font-size: 3rem; color: #ffc107;"></i>
                </div>
                <h4>사는 게 예술인 고성</h4>
                <p class="text-muted">푸른 바다가 보이는 아침, 빛나는 석호를 거니는 점심, 포근한 산자락 품에서 잠드는 밤. 모든 일상이 아름다운 곳입니다.</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="300">
            <div class="card h-100 border-0 shadow-sm">
              <div class="card-body text-center p-4">
                <div class="icon mb-3">
                  <i class="bi bi-camera" style="font-size: 3rem; color: #17a2b8;"></i>
                </div>
                <h4>여행이 예술인 고성</h4>
                <p class="text-muted">아름다운 산과 호수, 바다가 어우러진 생태의 보고. 풍부한 바다 자원과 DMZ를 간직한 평화의 보고입니다.</p>
              </div>
            </div>
          </div>
        </div>

        <div class="row mt-5">
          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="400">
            <h3>고성의 자연환경</h3>
            <p>고성은 동해안의 아름다운 자연환경을 자랑하는 곳입니다. 전체 면적의 70%가 숲으로 이루어져 있어 청정한 공기와 함께 창작 활동에 집중할 수 있는 환경을 제공합니다.</p>
            <ul>
              <li><i class="bi bi-check2-circle"></i> <span>동해안 가장 긴 해변과 아름다운 석호</span></li>
              <li><i class="bi bi-check2-circle"></i> <span>DMZ 접경지역의 독특한 생태계</span></li>
              <li><i class="bi bi-check2-circle"></i> <span>금강산과 이어지는 웅장한 산맥</span></li>
            </ul>
          </div>

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="500">
            <h3>문화적 특색</h3>
            <p>고성은 다채로운 이야기가 넘치는 곳입니다. 분단의 아픔과 평화의 희망이 공존하며, 풍부한 바다 자원과 전통 문화가 어우러져 예술인들에게 무한한 영감을 제공합니다.</p>
            <ul>
              <li><i class="bi bi-check2-circle"></i> <span>대한민국 평화의 상징적 의미</span></li>
              <li><i class="bi bi-check2-circle"></i> <span>동해안 씨푸드의 보고</span></li>
              <li><i class="bi bi-check2-circle"></i> <span>전통과 현대가 조화로운 문화</span></li>
            </ul>
          </div>
        </div>

      </div>

    </section><!-- /Goseong Section -->

    <!-- Activities Section -->
    <section id="activities" class="services section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>아트케이션 고성 활동</h2>
        <p>참여하면 어떤 활동을 하게 될까요?</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-house-heart" style="color: #0dcaf0;"></i>
              </div>
              <h3>거주공간 제공</h3>
              <p>나만의 시간, 나만의 공간에서 조용하고 차분하게 창작에 집중할 수 있는 '예술가의 방'을 제공합니다.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-chat-dots" style="color: #fd7e14;"></i>
              </div>
              <h3>예술인 비평워크숍</h3>
              <p>비평가, 예술감독 등 전문가들의 컨설팅을 통해 작품에 대한 깊이 있는 피드백을 받을 수 있습니다.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-people" style="color: #20c997;"></i>
              </div>
              <h3>농촌생활 및 주민연계</h3>
              <p>고성 지역 주민들과의 교류를 통해 지역 문화를 체험하고 새로운 영감을 얻을 수 있는 프로그램을 제공합니다.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="400">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-lightbulb" style="color: #df1529;"></i>
              </div>
              <h3>해커톤 창작지원</h3>
              <p>해커톤을 통한 <레지던시 명파> 창작지원금(400만원 이내)으로 더욱 창의적인 작품 활동을 지원합니다.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="500">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-calendar-event" style="color: #6610f2;"></i>
              </div>
              <h3>아트케이션 페스티벌</h3>
              <p>전시, 공연, 부스 운영 등 다양한 형태로 아트케이션 페스티벌에 참여하여 작품을 선보일 수 있습니다.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="600">
            <div class="service-item position-relative">
              <div class="icon">
                <i class="bi bi-currency-dollar" style="color: #f3268c;"></i>
              </div>
              <h3>활동비 지원</h3>
              <p>한 달간의 창작 활동을 위한 활동비 100만원을 지원하여 경제적 부담 없이 창작에 전념할 수 있습니다.</p>
            </div>
          </div>

        </div>

      </div>

    </section><!-- /Activities Section -->

    <!-- Participation Section -->
    <section id="participation" class="call-to-action section dark-background">

      <div class="container">
        
        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
          <h2 style="color: white;">참여방법</h2>
          <p style="color: #ccc;">아트케이션 고성에 어떻게 참여할 수 있을까요?</p>
        </div><!-- End Section Title -->

        <div class="row gy-4">
          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
            <h3 style="color: white;">지원 대상</h3>
            <ul style="color: #ccc;">
              <li><i class="bi bi-check2-circle" style="color: #ff6b35;"></i> 만 45세 이하 청년, 신진예술인</li>
              <li><i class="bi bi-check2-circle" style="color: #ff6b35;"></i> 시각, 건축, 디자인, 공예, 만화 (70%)</li>
              <li><i class="bi bi-check2-circle" style="color: #ff6b35;"></i> 문학, 사진, 음악, 영화 (30%)</li>
              <li><i class="bi bi-check2-circle" style="color: #ff6b35;"></i> 자차 소지자 우대</li>
              <li><i class="bi bi-check2-circle" style="color: #ff6b35;"></i> 3년이내 고성활동 인정 시 가점</li>
            </ul>
          </div>
          
          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
            <h3 style="color: white;">지원 방법</h3>
            <div style="color: #ccc;">
              <p><strong>접수기간:</strong> 2024년 5월 13일 ~ 2024년 5월 24일</p>
              <p><strong>신청방법:</strong></p>
              <ol>
                <li>고성문화재단 누리집 또는 공식 웹페이지 방문</li>
                <li>참가신청서 다운로드 후 작성</li>
                <li>포트폴리오 준비 (5장 이내, 자유형식)</li>
                <li>온라인 신청 및 서류 업로드</li>
              </ol>
              <a href="https://goseongcf.or.kr/bid_job/123" class="btn btn-outline-light mt-3" target="_blank">
                <i class="bi bi-globe"></i> 공식 웹페이지 방문
              </a>
            </div>
          </div>
        </div>

      </div>

    </section><!-- /Participation Section -->

    <!-- Artists Section -->
    <section id="artists" class="team section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>참여 예술인</h2>
        <p>아트케이션 고성과 함께하는 12명의 예술인들</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="100">
            <div class="team-member">
              <div class="member-img">
                <img src="<c:url value='/assets/img/artist/김유라.jpg'/>" class="img-fluid" alt="김유라">
              </div>
              <div class="member-info">
                <h4>김유라</h4>
                <span>시각예술가</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="200">
            <div class="team-member">
              <div class="member-img">
                <img src="<c:url value='/assets/img/artist/박상아.jpg'/>" class="img-fluid" alt="박상아">
              </div>
              <div class="member-info">
                <h4>박상아</h4>
                <span>디자이너</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="300">
            <div class="team-member">
              <div class="member-img">
                <img src="<c:url value='/assets/img/artist/시로.jpg'/>" class="img-fluid" alt="시로">
              </div>
              <div class="member-info">
                <h4>시로</h4>
                <span>만화가</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="400">
            <div class="team-member">
              <div class="member-img">
                <img src="<c:url value='/assets/img/artist/우빙빙.jpg'/>" class="img-fluid" alt="우빙빙">
              </div>
              <div class="member-info">
                <h4>우빙빙</h4>
                <span>건축가</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="500">
            <div class="team-member">
              <div class="member-img">
                <img src="<c:url value='/assets/img/artist/이경민.jpg'/>" class="img-fluid" alt="이경민">
              </div>
              <div class="member-info">
                <h4>이경민</h4>
                <span>사진작가</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="600">
            <div class="team-member">
              <div class="member-img">
                <img src="<c:url value='/assets/img/artist/이원홍.jpg'/>" class="img-fluid" alt="이원홍">
              </div>
              <div class="member-info">
                <h4>이원홍</h4>
                <span>음악가</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="700">
            <div class="team-member">
              <div class="member-img">
                <img src="<c:url value='/assets/img/artist/이정민.jpg'/>" class="img-fluid" alt="이정민">
              </div>
              <div class="member-info">
                <h4>이정민</h4>
                <span>문학가</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="800">
            <div class="team-member">
              <div class="member-img">
                <img src="<c:url value='/assets/img/artist/이현석.jpg'/>" class="img-fluid" alt="이현석">
              </div>
              <div class="member-info">
                <h4>이현석</h4>
                <span>영화감독</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="900">
            <div class="team-member">
              <div class="member-img">
                <img src="<c:url value='/assets/img/artist/임태웅.jpg'/>" class="img-fluid" alt="임태웅">
              </div>
              <div class="member-info">
                <h4>임태웅</h4>
                <span>공예가</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="1000">
            <div class="team-member">
              <div class="member-img">
                <img src="<c:url value='/assets/img/artist/정운.jpg'/>" class="img-fluid" alt="정운">
              </div>
              <div class="member-info">
                <h4>정운</h4>
                <span>조각가</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="1100">
            <div class="team-member">
              <div class="member-img">
                <img src="<c:url value='/assets/img/artist/정은영.jpg'/>" class="img-fluid" alt="정은영">
              </div>
              <div class="member-info">
                <h4>정은영</h4>
                <span>화가</span>
              </div>
            </div>
          </div><!-- End Team Member -->

          <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="1200">
            <div class="team-member">
              <div class="member-img">
                <img src="<c:url value='/assets/img/artist/정주하.jpg'/>" class="img-fluid" alt="정주하">
              </div>
              <div class="member-info">
                <h4>정주하</h4>
                <span>설치미술가</span>
              </div>
            </div>
          </div><!-- End Team Member -->

        </div>

      </div>

    </section><!-- /Artists Section -->

    <!-- Gallery Section -->
    <section id="gallery" class="portfolio section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>활동 사진</h2>
        <p>아트케이션 고성 예술인들의 창작 활동 모습</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="isotope-layout" data-default-filter="*" data-layout="masonry" data-sort="original-order">

          <div class="row gy-4 isotope-container" data-aos="fade-up" data-aos-delay="200">

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
              <img src="<c:url value='/assets/img/artist/김유라1.jpg'/>" class="img-fluid" alt="김유라 작업 모습">
              <div class="portfolio-info">
                <h4>김유라 작업실</h4>
                <p>시각예술 창작 과정</p>
                <a href="<c:url value='/assets/img/artist/김유라1.jpg'/>" title="김유라 작업실" data-gallery="portfolio-gallery-app" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
              <img src="<c:url value='/assets/img/artist/박상아1.jpg'/>" class="img-fluid" alt="박상아 작업 모습">
              <div class="portfolio-info">
                <h4>박상아 스튜디오</h4>
                <p>디자인 작업 과정</p>
                <a href="<c:url value='/assets/img/artist/박상아1.jpg'/>" title="박상아 스튜디오" data-gallery="portfolio-gallery-product" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
              <img src="<c:url value='/assets/img/artist/시로1.jpg'/>" class="img-fluid" alt="시로 작업 모습">
              <div class="portfolio-info">
                <h4>시로 작업공간</h4>
                <p>만화 창작 활동</p>
                <a href="<c:url value='/assets/img/artist/시로1.jpg'/>" title="시로 작업공간" data-gallery="portfolio-gallery-branding" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-app">
              <img src="<c:url value='/assets/img/artist/이경민1.jpg'/>" class="img-fluid" alt="이경민 촬영 모습">
              <div class="portfolio-info">
                <h4>이경민 촬영현장</h4>
                <p>사진 작업 과정</p>
                <a href="<c:url value='/assets/img/artist/이경민1.jpg'/>" title="이경민 촬영현장" data-gallery="portfolio-gallery-app" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-product">
              <img src="<c:url value='/assets/img/artist/이정민1.jpg'/>" class="img-fluid" alt="이정민 집필 모습">
              <div class="portfolio-info">
                <h4>이정민 서재</h4>
                <p>문학 창작 활동</p>
                <a href="<c:url value='/assets/img/artist/이정민1.jpg'/>" title="이정민 서재" data-gallery="portfolio-gallery-product" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

            <div class="col-lg-4 col-md-6 portfolio-item isotope-item filter-branding">
              <img src="<c:url value='/assets/img/artist/정은영1.jpg'/>" class="img-fluid" alt="정은영 그림 그리는 모습">
              <div class="portfolio-info">
                <h4>정은영 아틀리에</h4>
                <p>회화 작업 과정</p>
                <a href="<c:url value='/assets/img/artist/정은영1.jpg'/>" title="정은영 아틀리에" data-gallery="portfolio-gallery-branding" class="glightbox preview-link"><i class="bi bi-zoom-in"></i></a>
              </div>
            </div><!-- End Portfolio Item -->

          </div><!-- End Portfolio Container -->

        </div>

      </div>

    </section><!-- /Gallery Section -->

  </main>

  <footer id="footer" class="footer dark-background">
    <div class="container footer-top">
      <div class="row gy-5">
        
        <!-- 아트케이션 고성 소개 -->
        <div class="col-lg-6 col-md-6">
          <div class="footer-about h-100">
            <div class="footer-contact">
              <div class="contact-info">
                <p class="mb-3">(24734) 강원특별자치도 고성군 간성읍 수성로 3 달홀문화센터 1층 고성문화재단 </p>
                <p class="mb-3">TEL: 033-681-0105FAX: 033-681-0103</p>
                <!-- 관련 사이트 링크 -->
                <div class="related-links mt-3">
                  <div class="d-flex flex-wrap gap-3">
                    <a href="https://goseongcf.or.kr" target="_blank" class="text-decoration-none">
                      <i class="bi bi-chevron-right me-1"></i>고성문화재단
                    </a>
                    <a href="https://www.arko.or.kr" target="_blank" class="text-decoration-none">
                      <i class="bi bi-chevron-right me-1"></i>한국문화예술위원회
                    </a>
                    <a href="https://goseongcf.or.kr/bid_job/123" target="_blank" class="text-decoration-none">
                      <i class="bi bi-chevron-right me-1"></i>공식 웹페이지
                    </a>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>

        <!-- 소셜 미디어 -->
        <div class="col-lg-6 col-md-6">
          <div class="footer-newsletter h-100 text-center">
            <h4 class="mb-4">소셜 미디어</h4>
            <p class="mb-4">아트케이션 고성의 최신 소식을 만나보세요</p>
            <div class="social-links d-flex gap-3 justify-content-center">
              <a href="https://www.instagram.com/artcation_goseong" target="_blank" class="social-link" title="인스타그램">
                <i class="bi bi-instagram"></i>
              </a>
              <a href="https://goseongcf.or.kr" target="_blank" class="social-link" title="고성문화재단">
                <i class="bi bi-globe"></i>
              </a>
              <a href="mailto:goseongcf@daum.net" class="social-link" title="이메일">
                <i class="bi bi-envelope"></i>
              </a>
              <a href="tel:033-681-0105" class="social-link" title="전화">
                <i class="bi bi-telephone"></i>
              </a>
            </div>
          </div>
        </div>

      </div>
      
    </div>

    <div class="container">
      <div class="copyright text-center py-4 border-top">
        <div class="row align-items-center">
          <div class="col-12">
            <p class="mb-2">※ 이 사업은 고성문화재단과 한국문화예술위원회가 공동으로 협력 추진하는 사업입니다</p>
            <p class="mb-0">© <span>Copyright</span> <strong class="px-1 sitename">아트케이션 고성</strong> <span>All Rights Reserved</span></p>
          </div>
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