<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../common.jsp" %>

<%
    String type = request.getParameter("type");
    String disabled = ("register".equals(type) || "modify".equals(type)) ? "": "disabled";
    String titleName = "위험 상세 정보";
    if ("register".equals(type)) {
        titleName = "위험 등록";
    } else if ("modify".equals(type)) {
        titleName = "위험 수정";
    }
%>

<link rel="stylesheet" href="../../../resources/issue/css/info.css">

<!-- 콘텐츠 영역 -->
<main class="content" id="content">
    <div class="main_content">

        <div class="project-content">
            <div class="project-info"><%=titleName%></div>
            <a href="/projects/dangers" class="btn btn-back"><i class="fa-solid fa-arrow-left"></i> 목록으로 돌아가기</a>
        </div>

        <form class="project-form" action="#" method="post" enctype="multipart/form-data">
            <input type="hidden" name="prj_no" value="">
            <input type="hidden" name="type_cd" value="001">
            <div class="form-group group-row">
                <div class="form-group main-text">
                    <label>제목 <span class="required-icon">*</span></label>
                    <input type="text" id="risk_ttl" name="risk_ttl" value="" required <%=disabled%> >
                </div>
                <div class="form-group main-text">
                    <label>위험분류 <span class="required-icon">*</span></label>
                    <select id="class_cd" name="class_cd" required <%=disabled%> >
                        <option value="">선택하세요.</option>
                        <option value="001">고객 변심</option>
                        <option value="002">일정 지연</option>
                        <option value="003">품질 문제</option>
                        <option value="004">범위 관련</option>
                        <option value="005">위험 관련</option>
                        <option value="006">규정 관련</option>
                    </select>
                </div>
                <div class="form-group main-text">
                    <label>시스템 분류</label>
                    <select id="sys_no" name="sys_no" <%=disabled%>>
                        <option value="">선택하세요.</option>
                        <option value="001">A업무시스템</option>
                        <option value="002">B업무시스템</option>
                        <option value="003">C업무시스템</option>
                    </select>
                </div>
            </div>

            <div class="form-row group-row">
                <div class="form-group main-text">
                    <label>위험 ID <span class="required-icon">*</span></label>
                    <input type="text" id="risk_id" name="risk_id" value="" required <%=disabled%> >
                </div>
                <div class="form-group main-text">
                    <label>우선순위 <span class="required-icon">*</span></label>
                    <select id="pri_cd" name="pri_cd" required <%=disabled%> >
                        <option value="">선택하세요.</option>
                        <option value="001">즉시</option>
                        <option value="002">긴급</option>
                        <option value="003">높음</option>
                        <option value="004">보통</option>
                        <option value="005">낮음</option>
                    </select>
                </div>
            </div>

            <div class="form-row group-row">
                <div class="form-group description-area">
                    <label>위험내용 <span class="required-icon">*</span></label>
                    <textarea id="rick_cont" name="rick_cont" required <%=disabled%> ></textarea>
                </div>
            </div>

            <div class="form-row group-row">
                <div class="form-group description-area">
                    <label>위험완화계획</label>
                    <textarea id="risk_plan" name="risk_plan" <%=disabled%> ></textarea>
                </div>
            </div>

            <div class="form-row group-row gap-row">
                <div class="form-group">
                    <label> 조치 희망일 <span class="required-icon">*</span></label>
                    <input type="date" id="due_dt" name="due_dt" value="" required <%=disabled%> >
                </div>
                <div class="form-group">
                    <label>조치 완료일</label>
                    <input type="date" id="compl_date" name="compl_date" value="" <%=disabled%> >
                </div>
            </div>

            <div class="form-row group-row gap-row">
                <div class="form-group">
                    <label>위험 상태 <span class="required-icon">*</span></label>
                    <select id="stat_cd" name="stat_cd" required <%=disabled%>>
                        <option value="">선택하세요.</option>
                        <option value="001">신규</option>
                        <option value="002">진행</option>
                        <option value="003">조치완료</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>발견자</label>
                    <select id="mem_no" name="mem_no" <%=disabled%>>
                        <option value="">선택하세요.</option>
                    </select>
                </div>
            </div>

            <div class="file-section">
                <label>위험 발견 첨부파일</label>
                <div class="file-grid" id="fdFile">
                    <% if (type != null) { %>
                    <div class="file-box plus" onclick="addFileBox('fdFile');">+</div>
                    <% } %>
                </div>
            </div>

            <div class="file-section">
                <label>위험 조치 첨부파일</label>
                <div class="file-grid" id="actFile">
                    <% if (type != null) { %>
                    <div class="file-box plus" onclick="addFileBox('actFile');">+</div>
                    <% } %>
                </div>
            </div>

            <div class="btn-actions">
                <% if ("modify".equals(type) || type == null) { %>
                    <button type="button" class="action-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        <i class="fa-solid fa-check"></i>&nbsp; 위험조치
                    </button>
                <% } %>
                <% if ("register".equals(type) || "modify".equals(type)) { %>
                    <button type="submit" class="save-btn">
                        <i class="fa-solid fa-check"></i>&nbsp; 저장
                    </button>
                <% } %>
                <% if (type == null) { %>
                    <button type="button" class="modify-btn" onclick="window.location.href='/projects/dangerInfo?type=modify'">
                        <i class="fa-solid fa-check"></i>&nbsp; 수정
                    </button>
                <% } %>
                <% if ("modify".equals(type) || type == null) { %>
                    <button class="del-btn" onclick="info_del();">
                        <i class="fa-solid fa-check"></i>&nbsp; 삭제
                    </button>
                <% } %>
            </div>
        </form>

        <% if (type == null) { %>
        <div class="history-section">
            <div class="history-title">이력</div>

            <div class="history-item">
                <div class="history-header">
                    <div class="history-name">홍길동</div>
                    <div class="history-date">2022-05-17</div>
                </div>
                <div class="history-content">
                    이슈조치내용이슈조치내용이슈조치내용이슈조치내용이슈조치내용이슈조치내용이슈조치내용
                </div>
            </div>

            <div class="history-item">
                <div class="history-header">
                    <div class="history-name">홍길동</div>
                    <div class="history-date">2022-05-17</div>
                </div>
                <div class="history-content">
                    이슈조치내용이슈조치내용이슈조치내용이슈조치내용이슈조치내용이슈조치내용이슈조치내용
                </div>
            </div>
        </div>
        <% } %>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">위험 조치</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <form id="historyForm" action="#" method="post">
                        <div class="modal-body">
                            <div>
                                <div>
                                    <label for="record_dt">조치일자</label>
                                    <input type="date" id="record_dt" name="record_dt" class="form-control">
                                </div>
                                <label for="record_cont" class="form-label">조치내용</label>
                                <textarea id="record_cont" name="record_cont" class="form-control" rows="4" placeholder="조치 내용을 입력하세요"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">등록</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

    </div>
</main>

<script src="../../../resources/danger/js/info.js"></script>

<%@ include file="../footer.jsp" %>