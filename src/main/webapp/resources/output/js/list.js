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

$(function () {
    let API_SERVER = "http://api-demo.ax5.io";
    let firstGrid = new ax5.ui.grid();

    firstGrid.setConfig({
        target: $('[data-ax5grid="first-grid"]'),
        columns: [
            {key: "a", label: "field A"},
            {key: "b", label: "field B"},
            {key: "c", label: "numbers C"},
            {key: "d", label: "field D"},
            {key: "e", label: "field E"},
            {key: "f", label: "field F"},
        ]
    });
    firstGrid.setData(gridList);
    // 그리드 데이터 가져오기
    $.ajax({
        method: "GET",
        url: API_SERVER + "/api/v1/ax5grid",
        success: function (res) {
            res[0].__disable_selection__ = true;
            firstGrid.setData(res);
        }
    });
});
