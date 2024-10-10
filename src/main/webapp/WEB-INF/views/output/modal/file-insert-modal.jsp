<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    Dropzone.autoDiscover = false;
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.9.3/min/dropzone.min.css" />

<meta charset="UTF-8">
<style>
    .modal-content {
        background-color: #F6F6F6;
    }

    .modal-dialog {
        max-width: 850px;
        margin: auto;
    }

    .modal-body .info-section {
        margin-bottom: 20px;
    }

    .modal-body .info-item {
        min-width: 370px;
    }

    .modal-body .info-item label {
        flex: 0 0 50px;
        margin: 0;
        color: #070606;
        font-weight: bolder;
        font-size: 15px;
    }

    .info-section span {
        font-size: 15px;
    }

    .es-star {
        margin-right: 10px !important;
        color: red !important;
    }

    .txt-area {
        padding: 4px;
        font-size: 17px;
        width: 240px;
        height: 35px;
        overflow-y: hidden;
    }

    .select-box {
        margin-left: 20px;
        width: 250px;
        height: 150px;
        padding: 10px;
        overflow-y: auto;
    }

    .jstree-div {
        border: 1px solid #ced4da;
    }

    .dropzone {
        border-radius: 5px;
        width: 100%;
        min-height: 30px;
        padding: 10px;
    }

    #dropzone-preview .dz-preview {
        width: 150px;
        margin: 5px;
    }

    #dropzone-preview .dz-preview .dz-filename {
        font-size: 12px;
    }

    #dropzone-preview .dz-preview .dz-size,
    #dropzone-preview .dz-preview .dz-error-message {
        font-size: 10px;
    }

    #dropzone-preview li.dz-preview {
        width: 100%;
        margin: 5px 0; /* 위아래 여백 설정 */
    }

    /* 미리보기 컨테이너 */
    #dropzone-preview .dz-preview {
        width: 100%;
    }

    /* 이미지 영역 */
    #dropzone-preview .dz-preview .dz-image {
        flex: 0 0 auto; /* 이미지 영역의 크기 고정 */
        margin-right: 15px; /* 이미지와 파일 정보 사이의 간격 */
    }

    .dz-image img {
        width: 40px !important;
        height: 40px;
    }

    /* 파일 정보 영역 */
    #dropzone-preview .dz-preview .dz-details {
        flex: 1 1 auto; /* 파일 정보 영역이 남은 공간을 차지하도록 */
        overflow: hidden;
    }

    /* 제거 버튼 영역 */
    #dropzone-preview .dz-preview .dz-remove {
        flex: 0 0 auto; /* 제거 버튼의 크기 고정 */
        margin-left: 15px; /* 파일 정보와 제거 버튼 사이의 간격 */
    }

    #dropzone-preview .dz-preview .dz-filename,
    #dropzone-preview .dz-preview .dz-size {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .file-section {
        height: 300px;
        border: 1px solid #C5C5C5;
        padding: 10px;
        overflow-y: auto;
    }

    .jstree-folder {
        height: 100px;
        border: 1px solid #C5C5C5;
        padding: 10px;
        overflow-y: auto;
    }

    .label-item {
        display: inline-block;
        background-color: #e9ecef;
        color: #495057;
        padding: 5px 10px;
        margin: 5px;
        border-radius: 15px;
        position: relative;
        font-size: 14px;
    }

    /* 삭제 버튼 스타일 */
    .label-item .remove-btn {
        background: none;
        border: none;
        color: #6c757d;
        font-size: 16px;
        line-height: 1;
        padding: 0;
        margin-left: 5px;
        cursor: pointer;
    }

    .label-item .remove-btn:hover {
        color: #dc3545;
    }
</style>
<div class="modal fade" id="insertModal" tabindex="-1" aria-labelledby="fileModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="fileModalLabel" style="color: #070606; font-weight: bold">새 산출물 등록</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <section class="info-section">
                    <div class="d-flex justify-content-between">
                        <div class="info-item">
                            <div class="info-item d-flex flex-column align-items-start ms-3">
                                <div class="d-flex justify-content-start">
                                    <div><label class="text-nowrap">제목&nbsp;&nbsp;&nbsp;<span class="es-star">*</span></label></div>
                                    <span><textarea class="txt-area"></textarea></span>
                                </div>
                                <div>
                                    <div><label>파일 위치&nbsp;&nbsp;&nbsp;<label class="es-star">*</label></label><span class="file-loc">example</span></div>
                                    <div class="jstree-div" style="width: 350px !important;">
                                        <div class="jstree-folder">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="info-item">
                            <div class="info-item d-flex flex-column align-items-start">
                                <div class="d-flex justify-content-start">
                                    <div><label class="text-nowrap">연결 작업 선택&nbsp;&nbsp;&nbsp;</label></div>
                                    <select class="form-select" aria-label="Multiple select example" id="task-select">
                                        <option value="" selected disabled>작업 선택하기</option>
                                        <option value="1">현행 업무분석</option>
                                        <option value="2">업무 프로세스 분석</option>
                                    </select>
                                </div>
                                <div class="select-box">

                                </div>
                            </div>
                        </div>
                    </div>

                </section>
                <div class="file-section mt-3">
                    <div class="info-item d-flex flex-column align-items-start">
                        <div><label>파일 선택</label></div>
                        <div class="dropzone"></div>
                        <ul class="list-unstyled mb-0 w-100" id="dropzone-preview">
                            <li class="mt-2 dz-preview dz-file-preview" id="dropzone-preview-list">
                                <div class="border rounded-3">
                                    <div class="d-flex align-items-center p-2">
                                        <!-- 이미지 영역 -->
                                        <div class="dz-image">
                                            <img data-dz-thumbnail alt="Preview" src='../../../../resources/output/images/file-icon.png' style="width: 16px"/>
                                        </div>
                                        <!-- 파일 정보 영역 -->
                                        <div class="dz-details flex-grow-1">
                                            <h6 class="font-semibold mb-1 dz-filename" data-dz-name>&nbsp;</h6>
                                            <p class="text-sm text-muted fw-normal dz-size" data-dz-size></p>
                                            <strong class="error text-danger dz-error-message" data-dz-errormessage></strong>
                                        </div>
                                        <!-- 제거 버튼 영역 -->
                                        <div class="dz-remove">
                                            <button data-dz-remove class="btn btn-sm btn-danger">제거</button>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="save-button" data-bs-dismiss="modal">&nbsp;&nbsp;저장하기&nbsp;&nbsp;</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.9.3/min/dropzone.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 이미 초기화된 Dropzone 인스턴스가 있는지 확인
        if (Dropzone.instances.length > 0) {
            Dropzone.instances.forEach(function(dz) {
                dz.destroy();
            });
        }

        // 미리보기 템플릿 가져오기
        const dropzonePreviewNode = document.querySelector('#dropzone-preview-list');
        dropzonePreviewNode.id = '';
        const previewTemplate = dropzonePreviewNode.parentNode.innerHTML;
        dropzonePreviewNode.parentNode.removeChild(dropzonePreviewNode);

        // Dropzone 초기화
        const dropzone = new Dropzone(".dropzone", {
            url: "https://httpbin.org/post",
            method: "post",
            previewTemplate: previewTemplate,
            previewsContainer: '#dropzone-preview',
        });
    });
</script>

<script>
    $(function () {
        let treeData = [
            {
                id: "1",
                text: "차세대 프로그램 구축",
                type: "folder",
                children: [
                    {
                        id: "1.1",
                        text: "요구사항 정의서",
                        type: "folder",
                    },
                    {
                        id: "1.2",
                        text: "요구사항추적표(설계)",
                        type: "folder",
                    },
                ],
            },
            {
                id: "2",
                text: "B 프로그램 구축",
                type: "folder",
                children: [
                    {
                        id: "2.1",
                        text: "개발환경 설치 작업계획서",
                        type: "folder",
                    },
                ],
            },
        ];

        // treeData를 jsTree 데이터로 변환하는 함수
        function convertToJsTreeData(nodes, parentId) {
            let jsTreeData = [];
            nodes.forEach(function(node) {
                let jsTreeNode = {
                    id: node.id,
                    parent: parentId || '#', // 루트 노드의 부모는 '#'
                    text: node.text,
                    type: node.type
                };
                jsTreeData.push(jsTreeNode);
                if (node.children && node.children.length > 0) {
                    jsTreeData = jsTreeData.concat(convertToJsTreeData(node.children, node.id));
                }
            });
            return jsTreeData;
        }

        let jsTreeData = convertToJsTreeData(treeData);

        // jsTree 초기화
        $('.jstree-folder').jstree({
            'core': {
                'data': jsTreeData,
                "themes" : { "stripes" : true },
                'check_callback': true
            },
            'plugins': ["types", "dnd", "wholerow", "search"],
            'types': {
                "default": {
                    "icon": "fa fa-folder text-warning"
                },
                "file": {
                    "icon": "fa fa-file text-info"
                }
            }
        });

        // 노드 이동 이벤트 핸들러
        $('.jstree-folder').on("move_node.jstree", function (e, data) {
            let movedNode = data.node;
            let newParentId = data.parent;
            updateTreeData(movedNode, newParentId);
        });

        // treeData 업데이트 함수
        function updateTreeData(movedNode, newParentId) {
            // 이동된 노드를 treeData에서 제거
            let node = removeNodeById(treeData, movedNode.id);

            // 새로운 부모 노드에 추가
            if (newParentId === '#') {
                // 최상위 노드로 이동
                treeData.push(node);
            } else {
                let parentNode = findNodeById(treeData, newParentId);
                if (parentNode) {
                    if (!parentNode.children) {
                        parentNode.children = [];
                    }
                    parentNode.children.push(node);
                }
            }
        }

        // 노드를 찾아서 제거하는 함수
        function removeNodeById(nodes, id) {
            for (let i = 0; i < nodes.length; i++) {
                if (nodes[i].id === id) {
                    return nodes.splice(i, 1)[0];
                } else if (nodes[i].children) {
                    let node = removeNodeById(nodes[i].children, id);
                    if (node) {
                        return node;
                    }
                }
            }
            return null;
        }

        // 노드를 ID로 찾는 함수
        function findNodeById(nodes, id) {
            for (let i = 0; i < nodes.length; i++) {
                if (nodes[i].id === id) {
                    return nodes[i];
                } else if (nodes[i].children) {
                    let node = findNodeById(nodes[i].children, id);
                    if (node) {
                        return node;
                    }
                }
            }
            return null;
        }

        // 위치 편집 버튼 클릭 이벤트
        $(".modify-btn").on("click", function () {
            // 텍스트 확인하여 상태 변경
            let isEditing = $(this).text().includes("위치 편집");
            $(this).html(
                isEditing
                    ? "&nbsp;&nbsp;&nbsp;저장&nbsp;&nbsp;&nbsp;"
                    : '&nbsp;<i class="fa-regular fa-folder"></i>&nbsp;&nbsp;위치 편집&nbsp;'
            );

            if (isEditing) {
                // 드래그 앤 드롭 활성화
                $('.jstree-folder').jstree(true).settings.dnd.is_draggable = function () { return true; };
            } else {
                // 드래그 앤 드롭 비활성화
                $('.jstree-folder').jstree(true).settings.dnd.is_draggable = function () { return false; };
            }
        });

        // 초기 상태에서 드래그 앤 드롭 비활성화
        $('.jstree-folder').jstree(true).settings.dnd.is_draggable = function () { return false; };

        $('.jstree-folder').on("select_node.jstree", function (e, data) {
            // 선택된 노드의 ID와 텍스트 가져오기
            let selectedNode = data.node;
            let fullPath = getFullPath(selectedNode);
            $('.file-loc').text(fullPath);
        });

        $('#search').on('keypress', function(e) {
            if (e.which === 13) { // 엔터 키 코드
                let v = $(this).val();
                $('.jstree-folder').jstree(true).search(v);
            }
        });

        $('#search-btn').on('click', function() {
            let v = $('#search').val();
            $('.jstree-folder').jstree(true).search(v);
        });

        const $selectElement = $('#task-select');
        const $selectBox = $('.select-box');

        // 선택된 옵션들을 저장할 배열
        let selectedOptions = [];

        // select 요소의 change 이벤트 리스너
        $selectElement.on('change', function() {
            const value = $selectElement.val();

            // 이미 선택된 옵션인지 확인
            if (value && !selectedOptions.includes(value)) {
                selectedOptions.push(value);
                createLabel(value);
            }

            // 선택된 후에 select 박스의 선택을 기본값으로 재설정
            $selectElement.val('');
        });

        // 레이블을 생성하여 select-box에 추가하는 함수
        function createLabel(value) {
            const optionText = $selectElement.find('option[value="' + value + '"]').text();
            console.log(optionText);

            // 레이블 요소 생성
            const $label = $('<span>', {
                class: 'label-item',
                text: optionText
            });

            // 삭제 버튼 생성
            const $removeBtn = $('<button>', {
                class: 'remove-btn',
                html: '&times;'
            });

            $removeBtn.on('click', function() {
                // 레이블 제거
                $label.remove();
                // selectedOptions 배열에서 제거
                selectedOptions = selectedOptions.filter(function(val) {
                    return val !== value;
                });
            });

            // 레이블에 삭제 버튼 추가
            $label.append($removeBtn);

            // select-box에 레이블 추가
            $selectBox.append($label);
        }
    });

    function getFullPath(node) {
        let path = node.text;
        let parentNode = $('.jstree-folder').jstree(true).get_parent(node);

        while(parentNode && parentNode !== '#') {
            let parentNodeData = $('.jstree-folder').jstree(true).get_node(parentNode);
            if(parentNodeData && parentNodeData.text) {
                path = parentNodeData.text + ' / ' + path;
                parentNode = $('.jstree-folder').jstree(true).get_parent(parentNodeData);
            } else {
                break;
            }
        }
        return path;
    }
</script>