<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!-- header -->
<header class="header">
    <div class="header-content">
        <% if (title != null) { %>
            <span><%=title%></span>
        <% } else { %>
            <div class="dropdown header-project-name">
                <a class="btn dropdown-toggle project-title" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    차세대 프로그램 구축
                </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#" onclick="#">B 프로젝트</a></li>
                    <li><a class="dropdown-item" href="#" onclick="#">C 프로젝트</a></li>
                </ul>
            </div>
        <% } %>
    </div>
    <div class="header-icons">
        <i class="fa-solid fa-folder-open"></i>     <!-- 폴더 아이콘 -->
        <i class="fas fa-bell"></i>                 <!-- 알림 아이콘 -->
        <i class="fa-regular fa-envelope"></i>      <!-- 이메일 메뉴 아이콘 -->
        <div class="dropdown header-user-name">
            <a class="btn dropdown-toggle project-user-name" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                홍길동 주임
            </a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">내 정보</a></li>
                <li><a class="dropdown-item" href="#">로그아웃</a></li>
            </ul>
        </div>
    </div>
</header>