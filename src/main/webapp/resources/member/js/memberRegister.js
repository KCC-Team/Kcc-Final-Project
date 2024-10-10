$(document).ready(function() {
    $.jstree.defaults.core.themes.icons = false;

    function addIcons(node) {
        node.text = `<i class='fa-solid fa-users'></i> ${node.text}`;

        if (node.children && node.children.length > 0) {
            node.children = node.children.map(addIcons);  //재귀호출로 손자노드까지 아이콘 추가
        }
        return node;
    }

    $.ajax({
        url: '/projects/getGroupList',
        method: 'GET',
        success: function(response) {
            const treeDataWithIcons = response.map(addIcons);
            $('#jstree').jstree({
                'core': {
                    'data': treeDataWithIcons,
                    'check_callback': true
                },
                'plugins': ["search", "dnd"]
            });
        },
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