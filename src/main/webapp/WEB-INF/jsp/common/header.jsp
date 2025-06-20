<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title><c:out value="${pageTitle}" default="ArtcationGoseong"/></title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="<c:url value='/assets/vendor/bootstrap/css/bootstrap.min.css'/>" />
  <!-- 템플릿 CSS -->
  <link rel="stylesheet" href="<c:url value='/assets/css/style.css'/>" />
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">
    <a class="navbar-brand" href="<c:url value='/'/>">ArtcationGoseong</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav" aria-controls="navbarNav"
            aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link" href="<c:url value='/'/>">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="<c:url value='/community'/>">Community</a></li>
        <!-- 필요한 메뉴 추가 -->
      </ul>
    </div>
  </div>
</nav>

<main class="container mt-4">
