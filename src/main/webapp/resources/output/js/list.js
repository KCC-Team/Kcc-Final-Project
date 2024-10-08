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
                    children: [
                        { id: "1.1.1", text: "A 업무 시스템 요구사항 정의서", type: "file" },
                        { id: "1.1.2", text: "B 업무 시스템 요구사항 정의서", type: "file" },
                    ],
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
        {
            id: "3",
            text: "ProjectExcelDown_초기 프로젝트 등록 테스트",
            type: "file",
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
    $('#jstree').jstree({
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
    $('#jstree').on("move_node.jstree", function (e, data) {
        let movedNode = data.node;
        let newParentId = data.parent;
        updateTreeData(movedNode, newParentId);

        console.log('Updated treeData:', treeData);
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
            $('#jstree').jstree(true).settings.dnd.is_draggable = function () { return true; };
        } else {
            // 드래그 앤 드롭 비활성화
            $('#jstree').jstree(true).settings.dnd.is_draggable = function () { return false; };
        }
    });

    // 초기 상태에서 드래그 앤 드롭 비활성화
    $('#jstree').jstree(true).settings.dnd.is_draggable = function () { return false; };

    $('#search').on('keypress', function(e) {
        if (e.which === 13) { // 엔터 키 코드
            let v = $(this).val();
            $('#jstree').jstree(true).search(v);
        }
    });

    $('#search-btn').on('click', function() {
        let v = $('#search').val();
        $('#jstree').jstree(true).search(v);
    });
});

let gridData = [
    {
        fileName: "A 업무 시스템 요구사항 정의서_1",
        fileType: "xls/xlsx",
        size: "2.1MB",
        version: "0.1",
        date: "2024-02-17",
        author: "이수호"
    },
    {
        fileName: "A 업무 시스템 요구사항 정의서_2",
        fileType: "xls/xlsx",
        size: "1.77MB",
        version: "0.1",
        date: "2024-02-17",
        author: "이수호"
    }
];
$(function () {
    let grid = new ax5.ui.grid();
    grid.setConfig({
        target: $('[data-ax5grid="my-grid"]'),
        showRowSelector: true,
        multipleSelect: true,
        columns: [
            {
                key: "fileName",
                label: "파일명",
                width: 180,
                align: "center",
                formatter: function () {
                    return `<button onclick="openModal('${this.item.fileName}', gridData)" class="btn-link">${this.item.fileName}</button>`;
                }
            },
            {key: "fileType", label: "파일형식", width: 80, align: "center"},
            {key: "size", label: "용량", width: 80, align: "center"},
            {key: "version", label: "버전", width: 60, align: "center"},
            {key: "date", label: "날짜", width: 100, align: "center"},
            {key: "author", label: "작성자", width: 60, align: "center"},
            {
                key: null,
                label: "작업",
                width: 100,
                align: "center",
                formatter: function () {
                    return `
                                <div class="me-5">
                                    <button class="ms-1 file-btn" data-file="${this.item.fileName}">&nbsp;다운로드&nbsp;</button>
                                    <button class="file-btn" data-file="${this.item.fileName}">&nbsp;업로드&nbsp;</button>
                                </div>
                            `;
                }
            }
        ]
    });

    grid.setData(gridData);
    $('#detail-cnt').text(gridData.length);
    $(document).on('click', '.btn-download', function () {
        let fileName = $(this).data('file');
        // 다운로드 로직 구현
        alert(fileName + ' 다운로드 버튼 클릭됨');
    });

    $(document).on('click', '.btn-upload', function () {
        let fileName = $(this).data('file');
        // 업로드 로직 구현
        alert(fileName + ' 업로드 버튼 클릭됨');
    });
});

function openModal(fileName, gridData) {
    // 파일명에 따라 파일 데이터를 가져오는 로직 구현
    // 예시를 위해 gridData에서 해당 파일을 찾습니다.
    const fileData = gridData.find(item => item.fileName === fileName);

    if (!fileData) {
        alert('파일 정보를 찾을 수 없습니다.');
        return;
    }

    // 파일 정보를 모달에 표시
    $('#fileName').text(fileData.fileName);
    $('#fileSize').text(fileData.size);
    $('#fileVersion').text(fileData.version);
    $('#fileType').text(fileData.fileType);

    // 버전 히스토리를 가져오는 로직 구현
    // 여기서는 예시로 하드코딩된 데이터를 사용합니다.
    const versionHistory = [
        { fileName: fileData.fileName + " 3차", fileSize: "1.77 MB", registeredOn: "2024-01-29", fileType: "xls/xlsx" },
        { fileName: fileData.fileName + " 2차", fileSize: "1.58 MB", registeredOn: "2024-01-11", fileType: "xls/xlsx" },
        { fileName: fileData.fileName + " 초안", fileSize: "1.26 MB", registeredOn: "2024-01-03", fileType: "xls/xlsx" }
    ];

    const versionHistoryTable = $('#versionHistory');
    versionHistoryTable.empty(); // 기존 내용 삭제

    versionHistory.forEach(function(item) {
        const row = `
            <tr>
                <td>${item.fileName}</td>
                <td>${item.fileSize}</td>
                <td>${item.registeredOn}</td>
                <td>${item.fileType}</td>
            </tr>
        `;
        versionHistoryTable.append(row);
    });

    $('#fileModal').modal('show');
}