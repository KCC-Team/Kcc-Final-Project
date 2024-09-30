<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String title = "프로젝트 등록";
    request.setAttribute("title", title);
%>

<%@ include file="projectHeader.jsp" %>

<link rel="stylesheet" href="../../../resources/project/css/register.css">

<!-- 콘텐츠 영역 -->
<main class="content" id="content">
    <div class="main_content">

        <form class="project-form" action="#" method="post">
            <!-- 프로젝트 명 -->
            <div class="form-group full-width">
                <label>프로젝트 명 <span class="required-icon">*</span></label>
                <input type="text" id="title" name="title" required>
            </div>

            <!-- 상태 & 진척도 -->
            <div class="form-row">
                <div class="form-group">
                    <label for="status">상태 <span class="required-icon">*</span></label>
                    <select id="status" name="status" required>
                        <option value="">선택하세요.</option>
                        <option value="01">대기</option>
                        <option value="02">진행중</option>
                        <option value="03">종료</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="progress">진척도 <span class="required-icon">*</span></label>
                    <select id="progress" name="progress" required>
                        <option value="">선택하세요.</option>
                        <%
                            for (int i = 0; i <= 100; i++) {
                                int progress = i * 10;
                                out.println("<option value=\"" + progress + "\">" + progress + "%</option>");
                                if (progress == 100) {
                                    break;
                                }
                            }
                        %>
                    </select>
                </div>
            </div>

            <!-- 주관기관 -->
            <div class="form-group full-width">
                <label>주관기관 <span class="required-icon">*</span></label>
                <input type="text" id="organization" name="organization" required>
            </div>

            <!-- 프로젝트 예정 기간 -->
            <div class="form-group period-group">
                <label>프로젝트 예정 기간 <span class="required-icon">*</span></label>
                <div class="period-inputs">
                    <input type="date" id="pre_start_date" name="pre_start_date" required>
                    <span>~</span>
                    <input type="date" id="pre_end_date" name="pre_end_date" required>
                    <span class="pre_days">(0일)</span>
                </div>
            </div>

            <!-- 프로젝트 기간 -->
            <div class="form-group period-group">
                <label>프로젝트 기간</label>
                <div class="period-inputs">
                    <input type="date" id="start_date" name="start_date">
                    <span>~</span>
                    <input type="date" id="end_date" name="end_date">
                    <span class="days">(0일)</span>
                    <input type="checkbox" id="no_days_period" name="no_days_period">
                    <label class="no-period">기간없음</label>
                </div>
            </div>

            <!-- 프로젝트 관리자 -->
            <div class="form-group">
                <label>프로젝트 관리자(PM) <span class="required-icon">*</span></label>
                <div class="pm-input">
                    <input type="text" id="pm_id" name="pm_id" required>
                    <button type="button" class="pm-search" onclick="#">찾기</button>
                </div>
            </div>

            <!-- 프로젝트 설명 -->
            <div class="form-group full-width">
                <label for="description">프로젝트 설명</label>
                <textarea id="description" name="description" maxlength="500"></textarea>
                <span class="desc-count">
                    <span class="char-count">0</span> / 500
                </span>
            </div>

            <div class="form-actions">
                <button type="submit" class="save-btn">
                    <i class="fa-solid fa-check"></i>&nbsp; 저장
                </button>
                <button type="button" class="cancel-btn" onclick="history.back()">
                    <i class="fa-solid fa-arrow-right-to-bracket"></i>&nbsp; 취소
                </button>
            </div>
        </form>

    </div>
</main>

<script src="../../../resources/project/js/register.js"></script>

</body>
</html>
