<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<meta charset="UTF-8">
<style>
    .modal-content {
        display: flex;
        flex-direction: column;
        background-color: #F6F6F6;
    }

    .modal-dialog {
        max-width: 700px;
        margin: auto;
    }

    .modal-body .info-section {
        display: flex;
        flex-wrap: wrap;
        margin-bottom: 20px;
    }

    .modal-body .info-item {
        display: flex;
        align-items: center;
        flex: 1;
        min-width: 450px;
    }

    .modal-body .info-item label {
        flex: 0 0 80px;
        color: #070606;
        font-weight: bolder;
        font-size: 15px;
        margin-right: 10px;
    }

    .modal-body .info-item span {
        flex: 1;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .card-body .green-btn {
        margin-left: 320px;
    }

    .card-body:hover {
        border: 1px solid #a2a2a2;
    }

    #versionHistory {
        height: 300px;
        border: 1px solid #C5C5C5;
        padding: 10px;
        overflow-y: auto;
    }

    .info-section span {
        font-size: 15px;
    }
</style>
<div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="fileModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="fileModalLabel" style="color: #070606; font-weight: bold">산출물 파일 상세</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div>
                    <h5 style="color: #070606; font-weight: bold">파일정보</h5>
                </div>
                <section class="info-section">
                    <div class="info-item">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>파일명</label>
                        <span id="fileName"></span>
                    </div>
                    <div class="info-item">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>크기</label>
                        <span id="fileSize"></span>
                    </div>
                    <div class="info-item">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>버전</label>
                        <span id="fileVersion"></span>
                    </div>
                    <div class="info-item">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>형식</label>
                        <span id="fileType"></span>
                    </div>
                </section>
                <div class="version-history-section mt-3">
                    <h5 style="color: #070606; font-weight: bold">버전 이력</h5>
                    <div id="versionHistory">
                        <!-- 버전 이력 카드는 여기에 동적으로 추가됩니다 -->
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="custom-button" data-bs-dismiss="modal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;닫기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
            </div>
        </div>
    </div>
</div>
