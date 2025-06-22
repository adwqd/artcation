<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>페이지 오류 - 고성 예술인 플랫폼</title>
  <meta name="description" content="요청하신 페이지를 찾을 수 없습니다">

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

  <!-- Main CSS File -->
  <link href="<c:url value='/assets/css/main.css'/>" rel="stylesheet">
  
  <style>
    .error-page {
      background: #2a2c39;
      min-height: 100vh;
    }
    
    .main {
      display: flex;
      align-items: center;
      justify-content: center;
      min-height: calc(100vh - 140px);
      padding: 140px 0 2rem;
      position: relative;
    }
    
    .main::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(45deg, rgba(239, 102, 3, 0.1) 0%, rgba(42, 44, 57, 0.9) 100%);
    }
    
    .error-container {
      background: white;
      border-radius: 20px;
      box-shadow: 0 20px 40px rgba(0,0,0,0.3);
      padding: 3rem;
      text-align: center;
      max-width: 600px;
      margin: 2rem;
      position: relative;
      z-index: 1;
    }
    
    .error-icon {
      font-size: 8rem;
      color: #ef6603;
      margin-bottom: 1rem;
      animation: bounce 2s infinite;
    }
    
    .error-code {
      font-size: 4rem;
      font-weight: 700;
      color: #2a2c39;
      margin-bottom: 1rem;
    }
    
    .error-title {
      font-size: 2rem;
      color: #2a2c39;
      margin-bottom: 1rem;
      font-family: 'Raleway', sans-serif;
    }
    
    .error-message {
      font-size: 1.1rem;
      color: #444444;
      margin-bottom: 2rem;
      line-height: 1.6;
    }
    
    .btn-home {
      background: #ef6603;
      border: none;
      padding: 12px 30px;
      border-radius: 50px;
      color: white;
      font-weight: 500;
      text-decoration: none;
      display: inline-block;
      transition: all 0.3s ease;
      margin: 0.5rem;
      font-family: 'Poppins', sans-serif;
    }
    
    .btn-home:hover {
      background: #d55503;
      transform: translateY(-2px);
      box-shadow: 0 10px 20px rgba(239, 102, 3, 0.3);
      color: white;
    }
    
    .btn-back {
      background: #2a2c39;
      border: none;
      padding: 12px 30px;
      border-radius: 50px;
      color: white;
      font-weight: 500;
      text-decoration: none;
      display: inline-block;
      transition: all 0.3s ease;
      margin: 0.5rem;
      font-family: 'Poppins', sans-serif;
    }
    
    .btn-back:hover {
      background: #1f212a;
      transform: translateY(-2px);
      box-shadow: 0 10px 20px rgba(42, 44, 57, 0.3);
      color: white;
    }
    
    @keyframes bounce {
      0%, 20%, 50%, 80%, 100% {
        transform: translateY(0);
      }
      40% {
        transform: translateY(-10px);
      }
      60% {
        transform: translateY(-5px);
      }
    }
    
    .help-text {
      background: #f9f9f9;
      border-radius: 10px;
      padding: 1.5rem;
      margin-top: 2rem;
      border-left: 4px solid #ef6603;
    }
    
    .help-text h6 {
      color: #ef6603;
      margin-bottom: 0.5rem;
      font-family: 'Raleway', sans-serif;
    }
    
    .help-text p {
      color: #444444;
      margin: 0;
      font-size: 0.9rem;
    }
  </style>
</head>

<body class="error-page">

  <header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center justify-content-between">

      <a href="<c:url value='/'/>" class="logo d-flex align-items-center">
        <h1 class="sitename">Artcation Goseong</h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="<c:url value='/'/>">홈</a></li>
          <li><a href="<c:url value='/#about'/>">아트케이션 고성이란?</a></li>
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
    <div class="error-container">
    <c:choose>
      <c:when test="${pageContext.errorData.statusCode == 404}">
        <i class="bi bi-search error-icon"></i>
        <div class="error-code">404</div>
        <h1 class="error-title">페이지를 찾을 수 없습니다</h1>
        <p class="error-message">
          요청하신 페이지가 존재하지 않거나 이동되었을 수 있습니다.<br>
          URL을 다시 확인하시거나 홈페이지에서 다시 시작해 주세요.
        </p>
      </c:when>
      <c:when test="${pageContext.errorData.statusCode == 500}">
        <i class="bi bi-exclamation-triangle error-icon"></i>
        <div class="error-code">500</div>
        <h1 class="error-title">서버 내부 오류</h1>
        <p class="error-message">
          서버에서 오류가 발생했습니다.<br>
          잠시 후 다시 시도해 주시거나 관리자에게 문의해 주세요.
        </p>
      </c:when>
      <c:when test="${pageContext.errorData.statusCode == 403}">
        <i class="bi bi-shield-x error-icon"></i>
        <div class="error-code">403</div>
        <h1 class="error-title">접근 권한이 없습니다</h1>
        <p class="error-message">
          이 페이지에 접근할 권한이 없습니다.<br>
          로그인이 필요하거나 권한이 부족할 수 있습니다.
        </p>
      </c:when>
      <c:otherwise>
        <i class="bi bi-exclamation-circle error-icon"></i>
        <div class="error-code">오류</div>
        <h1 class="error-title">예상치 못한 오류가 발생했습니다</h1>
        <p class="error-message">
          요청을 처리하는 중 문제가 발생했습니다.<br>
          잠시 후 다시 시도해 주시거나 관리자에게 문의해 주세요.
        </p>
      </c:otherwise>
    </c:choose>
    
    <div class="mt-4">
      <a href="<c:url value='/'/>" class="btn-home">
        <i class="bi bi-house-fill me-2"></i>홈으로 돌아가기
      </a>
      <button onclick="history.back()" class="btn-back">
        <i class="bi bi-arrow-left me-2"></i>이전 페이지로
      </button>
    </div>
    

      </div>
  </main>

  <%@ include file="common/footer.jsp" %> 

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="<c:url value='/assets/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
  <script src="<c:url value='/assets/vendor/aos/aos.js'/>"></script>

  <!-- Main JS File -->
  <script src="<c:url value='/assets/js/main.js'/>"></script>

</body>
</html> 