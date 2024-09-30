<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>KCC PMS</title>
    <link rel="stylesheet" href="../../resources/css/login.css">
</head>
<body>
<div class="login-container">
    <!-- 로고 섹션 -->
    <div class="logo">
        <img src="../../resources/images/main_logo2.png" alt="KCC PMS 로고">
    </div>
    <!-- 로그인 폼 섹션 -->
    <h2>로그인</h2>
    <form action="/project/list" method="get" class="login-form">
        <div class="input-group">
            <input type="text" placeholder="아이디" name="username" required>
        </div>
        <div class="input-group">
            <input type="password" placeholder="패스워드" name="password" required>
        </div>
        <button type="submit" class="login-button">로그인</button>
    </form>
</div>
</body>
</html>
