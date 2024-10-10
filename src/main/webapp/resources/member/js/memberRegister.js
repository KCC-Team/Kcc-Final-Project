$(document).ready(function() {
    $.jstree.defaults.core.themes.icons = false;

    $('#jstree').jstree({
        'core': {
            'data': [
                { "id": "public", "text": "<i class='fa-solid fa-users'></i> 공공",  "children": [
                        { "id": "si", "text": "<i class='fa-solid fa-users'></i> SI", "children": [
                                { "id": "si1", "text": "<i class='fa-solid fa-users'></i> SI 1팀", "children": [
                                        { "id": "task1", "text": "<i class='fa-solid fa-users'></i> 작업 1" },
                                        { "id": "task2", "text": "<i class='fa-solid fa-users'></i> 작업 2" },
                                        { "id": "task3", "text": "<i class='fa-solid fa-users'></i> 작업 3" },
                                        { "id": "task4", "text": "<i class='fa-solid fa-users'></i> 작업 4" },
                                        { "id": "task5", "text": "<i class='fa-solid fa-users'></i> 작업 5" },
                                        { "id": "task6", "text": "<i class='fa-solid fa-users'></i> 작업 6" },
                                        { "id": "task7", "text": "<i class='fa-solid fa-users'></i> 작업 7" },
                                        { "id": "task8", "text": "<i class='fa-solid fa-users'></i> 작업 8" }
                                    ]},
                                { "id": "si2", "text": "<i class='fa-solid fa-users'></i> SI 2팀", "children": [
                                        { "id": "taskA", "text": "<i class='fa-solid fa-users'></i> 작업 A" },
                                        { "id": "taskB", "text": "<i class='fa-solid fa-users'></i> 작업 B" },
                                        { "id": "taskC", "text": "<i class='fa-solid fa-users'></i> 작업 C" },
                                        { "id": "taskD", "text": "<i class='fa-solid fa-users'></i> 작업 D" },
                                        { "id": "taskE", "text": "<i class='fa-solid fa-users'></i> 작업 E" }
                                    ] }
                            ] }
                    ] },
                { "id": "finance", "text": "<i class='fa-solid fa-users'></i> 금융", "children": [
                        { "id": "finance_team", "text": "<i class='fa-solid fa-users'></i> 재무팀", "children": [
                                { "id": "plan1", "text": "<i class='fa-solid fa-users'></i> 계획 1" },
                                { "id": "plan2", "text": "<i class='fa-solid fa-users'></i> 계획 2" }
                            ]}
                    ] },
                { "id": "rnd", "text": "<i class='fa-solid fa-users'></i> R&D", "children": [
                        { "id": "projectA", "text": "<i class='fa-solid fa-users'></i> 프로젝트 A", "children": [
                                { "id": "stage1", "text": "<i class='fa-solid fa-users'></i> 단계 1" },
                                { "id": "stage2", "text": "<i class='fa-solid fa-users'></i> 단계 2" },
                                { "id": "stage3", "text": "<i class='fa-solid fa-users'></i> 단계 3" }
                            ]}
                    ] },
                { "id": "new_business", "text": "<i class='fa-solid fa-users'></i> 신사업", "children": [
                        { "id": "idea1", "text": "<i class='fa-solid fa-users'></i> 아이디어 1" },
                        { "id": "idea2", "text": "<i class='fa-solid fa-users'></i> 아이디어 2" }
                    ] },
                { "id": "cloud", "text": "<i class='fa-solid fa-users'></i> 클라우드", "children": [
                        { "id": "service1", "text": "<i class='fa-solid fa-users'></i> 서비스 1" },
                        { "id": "service2", "text": "<i class='fa-solid fa-users'></i> 서비스 2" },
                        { "id": "service3", "text": "<i class='fa-solid fa-users'></i> 서비스 3" }
                    ] },
                { "id": "support", "text": "<i class='fa-solid fa-users'></i> 지원", "children": [
                        { "id": "customer_support", "text": "<i class='fa-solid fa-users'></i> 고객 지원" },
                        { "id": "tech_support", "text": "<i class='fa-solid fa-users'></i> 기술 지원" }
                    ] }
            ],
            "check_callback": true
        },
        "plugins": ["search", "dnd"]  // 검색 및 드래그 앤 드롭 플러그인 추가
    });

    // 검색 기능
    $('#search').on('keyup', function () {
        var searchString = $(this).val();
        $('#jstree').jstree(true).search(searchString);

        setTimeout(() => {
            var results = $('#jstree').jstree(true).get_json('#', { flat: true });
            var found = results.filter(node => node.text.includes(searchString));
            if (found.length > 0) {
                var firstResult = found[0];

                $('#jstree').jstree(true).deselect_all();
                $('#jstree').jstree(true).select_node(firstResult.id);

                $('#' + firstResult.id).get(0).scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
        }, 0);
    });

    $('#jstree').on("move_node.jstree", function (e, data) {
        const movedNodeId = data.node.id;  // 이동된 노드의 ID
        const newParentId = data.parent;  // 새 부모 노드의 ID
        const newPosition = data.position;
        const is_multi = data.is_multi;

        console.log(newParentId);
        console.log(movedNodeId);
        console.log(newPosition);
    });
});