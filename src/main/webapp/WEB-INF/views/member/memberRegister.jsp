<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>jstree 예제</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css" />
    <!-- ax5ui -->
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-calendar/master/dist/ax5calendar.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-picker/master/dist/ax5picker.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-select/master/dist/ax5select.css">

    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5core/master/dist/ax5core.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-calendar/master/dist/ax5calendar.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-picker/master/dist/ax5picker.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-formatter/master/dist/ax5formatter.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-select/master/dist/ax5select.min.js"></script>
    <script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-grid/master/dist/ax5grid.min.js"></script>
    <!--  -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.search.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.dnd.min.js"></script>
    <link rel="stylesheet" href="../../../resources/member/css/memberRegister.css">
    <link rel="stylesheet" href="../../../resources/member/css/ax5grid.css">
    <style>
        #jstree-container {
            position: relative;
            height: 400px;
            width: 300px;
            border: 1px solid black;
            display: flex;
            flex-direction: column;
        }

        #jstree-content {
            flex-grow: 1;
            overflow-y: auto;
        }

        #memberList {

            height: 400px;
            width: 600px;
            border-right: 1px solid black;
            border-top: 1px solid black;
            border-bottom: 1px solid black;
        }

        #usergroup-memberList-content {
            display: flex;
            flex-direction: row;
        }

        /* #usergroup-content {
            display: flex;
            flex-direction: column;
        } */

        #search {
            width: calc(100% - 20px); /* 양쪽 여백을 포함해 전체 너비 맞추기 */
            margin: 10px; /* input과 jstree의 경계 간격 */
            box-sizing: border-box;
            height: 20px; /* 높이 증가 */
            padding: 10px; /* 내부 여백 추가 */
            font-size: 16px; /* 텍스트 크기 */
            background-color: white; /* 고정된 검색창의 배경색 */
        }

        .group-name {
            margin-left: 20px;
        }

        .memberList-title-area{
            display: flex;

            justify-content: space-between; /* 제목과 버튼을 양 끝으로 배치 */
            align-items: center; /* 버튼과 제목을 수직 가운데 정렬 */
        }

        .member-add-button {
            margin-right: 20px;
            margin-top:10px;
            background-color: #4a4a4a;
            border: none;
            font-size: 10px;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            cursor: pointer; /* 마우스를 올렸을 때 포인터로 변경 */
            outline: none; /* 클릭했을 때 외곽선 제거 */
        }

        .member-remove-button, .member-edit-button  {
            margin-right: 20px;
            margin-top:10px;
            background-color: #4a4a4a;
            border: none;
            font-size: 10px;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            cursor: pointer; /* 마우스를 올렸을 때 포인터로 변경 */
            outline: none; /* 클릭했을 때 외곽선 제거 */
        }

        .member-add-button:hover {
            background-color: #3a3a3a;
        }

        .member-grid {
            margin-left: 5px;
        }

        .addedMembersList {
            width: 900px;
            height: 400px;

        }


        .button-container {
            display: flex;
            justify-content: flex-end; /* 버튼을 오른쪽 끝으로 배치 */
            gap: 3px; /* 버튼 사이에 간격 추가 */
            margin-top: 10px; /* 버튼 위쪽에 여백 추가 */
            margin-bottom: 10px;
        }
        #apply {
            background-color: #4a4a4a;
            color: white;
            border: none;
            padding: 5px 10px;
            font-size: 12px;
            border-radius: 5px;
            cursor: pointer;
            outline: none;
        }

        #apply:hover {
            background-color: #3a3a3a;
        }


        #group_total, #project_member_total {
            background-color: #4a4a4a; /* 어두운 배경색 */
            color: white; /* 텍스트 색상 */
            border: none; /* 테두리 제거 */
            padding: 5px 10px; /* 버튼 내부 여백 */
            font-size: 12px; /* 텍스트 크기 */
            border-radius: 5px; /* 둥근 모서리 */
            cursor: pointer; /* 마우스 포인터 변경 */
            outline: none; /* 클릭했을 때 외곽선 제거 */
        }

        #group_total:hover, #project_member_total:hover {
            background-color: #3a3a3a; /* 호버 시 더 어두운 배경색 */
        }

        #member-apply-title-container {
            border-bottom: 1px solid #989898;
            margin-bottom: 10px;
            width: 900px;
            padding-bottom: 10px;
        }
        .mem-apply-title {
            font-weight: bold;
            font-size: large;
        }
        .option-btn-container {
            display: flex;
            justify-content: flex-start;
            gap: 10px;
            width: 900px;
            margin-bottom: 15px;
        }
        #add-member-by-group {

        }

        #add-member-by-prjmem {

        }
        #prjmem_list {
            width: 900px;
            height: 400px;
        }
    </style>
</head>
<body>
<div id="member-apply-title-container">
    <span class="mem-apply-title">인력등록</span>
</div>
<div class="option-btn-container">
    <button id="group_total">조직도에서찾기</button>
    <button id="project_member_total">목록으로 찾기</button>
</div>

<div id="add-member-by-group">
    <div id="usergroup-memberList-content">
        <div id="jstree-container">
            <!-- jstree 내용을 위한 스크롤 가능한 영역 -->
            <div id="jstree-content">
                <div id="jstree"></div>
            </div>
            <input type="text" id="search" placeholder="검색..." />
        </div>
        <div id="memberList">
            <div class="memberList-title-area">
                <div>
                    <h3 class="group-name">SI 1팀</h3>
                </div>

                <button class="member-add-button">추가하기</button>
            </div>

            <div class="member-grid">
                <div style="position: relative;height:270px;" id="grid-parent">
                    <div data-ax5grid="groupmemGrid" data-ax5grid-config="{}" style="height: 100%;"></div>
                </div>
            </div>
        </div>
    </div>

    <div class="addedMembersList">
        <div class="memberList-title-area">
            <div>
                <h3 class="group-name">추가 인원</h3>
            </div>
            <div class="button-container">
                <button class="member-edit-button">편집</button>
                <button class="member-remove-button">제거하기</button>
            </div>
        </div>

        <div style="position: relative;height:270px;" id="grid-parent3">
            <div id="y-added-grid" data-ax5grid="added-grid" data-ax5grid-config="{}" style="height: 100%;"></div>
        </div>
        <div class="button-container">
            <button id="apply">적용하기</button>
        </div>
    </div>
</div>


<div id="add-member-by-prjmem">
    <div id="prjmem_list">
        <div class="memberList-title-area">
            <div>
                <h3 class="group-name">프로젝트 인원</h3>
            </div>
            <div class="button-container">
                <button class="member-add-button">추가하기</button>
            </div>
        </div>


        <div style="position: relative;height:270px;" id="grid-parent5">
            <div data-ax5grid="prjmember-grid" data-ax5grid-config="{}" style="height: 100%;"></div>
        </div>
    </div>
    <div class="addedMembersList">
        <div class="memberList-title-area">
            <div>
                <h3 class="group-name">추가 인원</h3>
            </div>
            <div class="button-container">
                <button class="member-edit-button">편집</button>
                <button class="member-remove-button">제거하기</button>
            </div>
        </div>

        <div style="position: relative;height:270px;" id="grid-parent2">
            <!--<div class="y-added-grid"  data-ax5grid="added-grid" data-ax5grid-config="{}" style="height: 100%;"></div>-->
        </div>
        <div class="button-container">
            <button id="apply">적용하기</button>
        </div>
    </div>
</div>


<script src="../../../resources/member/js/memberRegister.js"></script>
<script src="../../../resources/member/js/memberRegisterGrid.js"></script>
</body>
</html>
