<link rel="stylesheet" href="../../../resources/wbs/css/wbsInfo.css">

<div class="wbs-register">
    <span class="wbs-detail-title">WBS 작업 등록</span>
    <form id="wbs_form" action="#" method="post" enctype="multipart/form-data">
        <label for="task-name">작업명</label>
        <input type="text" id="task-name" value="현행업무분석">

        <label for="status">상태</label>
        <select id="status">
            <option value="진행중">진행중</option>
        </select>

        <label for="superior-task">상위작업</label>
        <input type="text" id="superior-task" value="A 업무 시스템 > 현행업무" readonly>

        <label for="start-date">예정 시작일</label>
        <input type="date" id="start-date" value="2024-03-17">

        <label for="end-date">예정 종료일</label>
        <input type="date" id="end-date" value="2024-03-17">

        <label for="start-date">시작일</label>
        <input type="date" id="start-date1" value="2024-03-17">

        <label for="end-date">종료일</label>
        <input type="date" id="end-date1" value="2024-03-17">

        <label for="system">시스템/업무</label>
        <select id="system">
            <option value="option1">Option 1</option>
        </select>

        <label for="progress">진척도</label>
        <select id="progress">
            <option value="20%">20%</option>
        </select>

        <label for="value">가중치</label>
        <select id="value">
            <option value="30%">30%</option>
        </select>

        <label for="person-in-charge">담당자</label>
        <input type="text" id="person-in-charge" value="홍길동">

        <label for="output">관련 산출물</label>
        <input type="text" id="output" value="관련 산출물1">

        <label for="">선행작업</label>
        <input type="text" id="" value="">

        <div class="buttons">
            <button type="button">수정</button>
            <button type="button">삭제</button>
        </div>
    </form>
</div>