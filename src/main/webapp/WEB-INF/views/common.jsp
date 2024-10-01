<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String title = (String) request.getAttribute("titleName");
    if (title != null && title.length() > 1) {
        request.setAttribute("title", title);
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KCC PMS</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../../../resources/common/css/common.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

<button class="toggle-btn" id="toggle-btn">
    <span class="arrow">←</span>
</button>

<!-- 헤더 -->
<%@ include file="header.jsp" %>

<!-- 왼쪽 메뉴 -->
<aside class="sidebar" id="sidebar">
    <div class="sidebar-header">
        <a href="/project/dashboard">
            <img src="../../../resources/common/images/main_logo1.png" alt="Project Logo">
        </a>
    </div>
    <ul class="menu">
        <li>
            <a href="#">
                <i class="fas fa-box"></i><span>프로젝트</span>
                <i class="fas fa-chevron-down toggle-arrow"></i>
            </a>
            <ul class="submenu">
                <li><a href="/project/list"><span class="dot">•</span>프로젝트 현황</a></li>
                <li><a href="/project/dashboard"><span class="dot">•</span>대시보드</a></li>
                <li><a href="/project/info"><span class="dot">•</span>프로젝트 정보</a></li>
                <li><a href="#"><span class="dot">•</span>프로젝트 WBS</a></li>
                <li><a href="#"><span class="dot">•</span>프로젝트 산출물</a></li>
                <li><a href="#"><span class="dot">•</span>프로젝트 기능</a></li>
            </ul>
        </li>

        <li>
            <a href="#">
                <i class="fas fa-users"></i><span>인력</span>
                <i class="fas fa-chevron-down toggle-arrow"></i>
            </a>
            <ul class="submenu">
                <li><a href="#"><span class="dot">•</span>인력현황</a></li>
                <li><a href="#"><span class="dot">•</span>투입인력관리</a></li>
                <li><a href="#"><span class="dot">•</span>고객관리</a></li>
            </ul>
        </li>

        <li>
            <a href="#">
                <i class="fas fa-tasks"></i><span>내 업무</span>
                <i class="fas fa-chevron-down toggle-arrow"></i>
            </a>
            <ul class="submenu">
                <li><a href="#"><span class="dot">•</span>내 기능</a></li>
                <li><a href="#"><span class="dot">•</span>내 이슈</a></li>
                <li><a href="#"><span class="dot">•</span>내 산출물</a></li>
            </ul>
        </li>

        <li>
            <a href="#">
                <i class="fas fa-briefcase"></i><span>일반업무</span>
                <i class="fas fa-chevron-down toggle-arrow"></i>
            </a>
            <ul class="submenu">
                <li><a href="#"><span class="dot">•</span>위험 관리</a></li>
                <li><a href="#"><span class="dot">•</span>이슈 관리</a></li>
                <li><a href="#"><span class="dot">•</span>결함 관리</a></li>
                <li><a href="#"><span class="dot">•</span>요구사항 관리</a></li>
            </ul>
        </li>

        <li>
            <a href="#">
                <i class="fas fa-vial"></i><span>테스트</span>
                <i class="fas fa-chevron-down toggle-arrow"></i>
            </a>
            <ul class="submenu">
                <li><a href="#"><span class="dot">•</span>단위 테스트 관리</a></li>
                <li><a href="#"><span class="dot">•</span>통합 테스트 관리</a></li>
            </ul>
        </li>

        <li>
            <a href="#">
                <i class="fas fa-comments"></i><span>커뮤니티</span>
                <i class="fas fa-chevron-down toggle-arrow"></i>
            </a>
            <ul class="submenu">
                <li><a href="#"><span class="dot">•</span>공지사항</a></li>
            </ul>
        </li>

    </ul>
</aside>
