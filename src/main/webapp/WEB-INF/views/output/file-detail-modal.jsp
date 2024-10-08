<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<style>
    .modal-content {
        display: flex;
        flex-direction: column;
        background-color: #F6F6F6;
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
        min-width: 250px;
    }

    .modal-body .info-item label {
        flex: 0 0 80px;
        margin-right: 10px;
    }

    .modal-body .info-item span {
        flex: 1;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
</style>
<div class="modal fade" id="fileModal" tabindex="-1" aria-labelledby="fileModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="fileModalLabel">산출물 파일 상세</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="info-section">
                    <div class="info-item">
                        <label>파일명</label>
                        <span id="fileName"></span>
                    </div>
                    <div class="info-item">
                        <label>크기</label>
                        <span id="fileSize"></span>
                    </div>
                    <div class="info-item">
                        <label>버전</label>
                        <span id="fileVersion"></span>
                    </div>
                    <div class="info-item">
                        <label>형식</label>
                        <span id="fileType"></span>
                    </div>
                </div>
                <div class="version-history-section mt-3">
                    <h5>버전 이력</h5>
                    <div id="versionHistory">
                        <!-- 버전 이력 카드는 여기에 동적으로 추가됩니다 -->
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
<script>
    function loadVersionHistory() {
        const versions = [
            { fileName: '파일명1', fileSize: '1.77 MB', date: '2024-01-29', fileType: 'xls/xlsx' },
            { fileName: '파일명2', fileSize: '1.58 MB', date: '2024-01-11', fileType: 'xls/xlsx' },
        ];

        const versionHistoryContainer = document.getElementById('versionHistory');
        versionHistoryContainer.innerHTML = '';

        versions.forEach(version => {
            const card = document.createElement('div');
            card.className = 'card';
            card.innerHTML = `
            <div class="card-body">
                <div class="card-title">${version.fileName}</div>
                <div class="version-card-item">크기: ${version.fileSize}</div>
                <div class="version-card-item">등록일: ${version.date}</div>
                <div class="version-card-item">형식: ${version.fileType}</div>
            </div>
        `;
            versionHistoryContainer.appendChild(card);
        });
    }
</script>

