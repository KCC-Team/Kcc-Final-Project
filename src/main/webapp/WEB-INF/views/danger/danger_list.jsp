<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../common.jsp" %>


<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5core/master/dist/ax5core.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-grid/master/dist/ax5grid.min.js"></script>
<link rel="stylesheet" href="../../../resources/danger/css/danger.css">
<link rel="stylesheet" href="../../../resources/danger/css/ax5grid.css">
<style>
    .ddd{
        margin-left: 65px;
        margin-right: 30px;
    }

    [data-ax5grid] [data-ax5grid-container="root"] [data-ax5grid-container="body"] [data-ax5grid-panel] table tr {
        background: white !important;
    }

</style>
<main class="content" id="content">
    <div class="main_content">
        <h4>위험현황</h4>

        <div class="filter-section">
            <form action="#" method="post">
                상태
                <select name="status">
                    <option>전체</option>
                    <option value="1">발생전</option>
                    <option value="2">진행</option>
                    <option value="3">종료</option>
                </select>
                <input type="text" name="title" class="search-text" placeholder="프로젝트명을 검색하세요">
                <input type="submit" class="search" value="검색">
            </form>
            <div class="action-buttons">
                <a href="#">
                    <button class="add-project">+ 위험등록</button>
                </a>
                <a href="#">
                    <button class="danger-export-excel"><i class="fa-solid fa-download"></i> 액셀받기</button>

                </a>
            </div>
        </div>

        <div style="position: relative;height:100%; width: 90%;" id="grid-parent">
            <!-- 위험 목록 테이블 -->
            <div class="ddd" data-ax5grid="first-grid"  data-ax5grid-config="{
                sortable: true,
                header: {
                    columnHeight: 60
                },
                body: {
                    columnHeight: 60
                }
            }" style="height: 687px; width: 100%;">
            </div>
        </div>
    </div>
</main>

<script src="../../../resources/danger/js/danger.js"></script>
<%@ include file="../footer.jsp" %>