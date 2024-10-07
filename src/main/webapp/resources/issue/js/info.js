let fd_file_index = 1;
let act_file_index = 1;

// 파일 박스 추가 함수
function addFileBox(gridId) {
    const grid = document.getElementById(gridId);

    // 새로운 파일 박스 생성
    const newFileBox = document.createElement('div');
    newFileBox.classList.add('file-box');

    // 파일 input 생성
    const newInput = document.createElement('input');
    newInput.type = 'file';
    newInput.accept = "image/*";  // 이미지 파일만 받기 (필요 시 모든 파일로 수정 가능)

    if (gridId === 'fdFile') {
        newInput.name = `fl_ms_fd_no_${fd_file_index}`;
        fd_file_index++;
    } else {
        newInput.name = `fl_ms_act_no_${act_file_index}`;
        act_file_index++;
    }

    // 삭제 버튼 생성
    const deleteBtn = document.createElement('button');
    deleteBtn.innerHTML = '×';
    deleteBtn.classList.add('delete-btn');
    deleteBtn.onclick = function() {
        deleteFileBox(newFileBox, gridId);  // 삭제 함수 호출
    };

    // 파일 박스에 input과 삭제 버튼 추가
    newFileBox.appendChild(newInput);
    newFileBox.appendChild(deleteBtn);

    // 그리드에서 '+' 버튼 바로 앞에 파일 박스 추가
    grid.insertBefore(newFileBox, grid.querySelector('.plus'));

    // 파일 선택을 위한 클릭 이벤트 추가
    newFileBox.addEventListener('click', (e) => {
        // 삭제 버튼 클릭시 파일 선택 창 안 뜨도록
        if (e.target !== deleteBtn) {
            newInput.click();
        }
    });

    // 파일 선택 시 썸네일 및 파일명 표시
    newInput.addEventListener('change', function(e) {
        if (newInput.files && newInput.files[0]) {
            const file = newInput.files[0];
            const reader = new FileReader();

            // 파일이 이미지인 경우 썸네일 표시
            if (file.type.startsWith('image/')) {
                reader.onload = function(e) {
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    newFileBox.appendChild(img);
                    newFileBox.appendChild(deleteBtn);
                    // const fileNameSpan = document.createElement('span');
                    // fileNameSpan.classList.add('file-name');
                    // fileNameSpan.textContent = file.name;
                    // newFileBox.appendChild(fileNameSpan);
                };
                reader.readAsDataURL(file);
            }
        }
    });
}

// 파일 박스 삭제 함수
function deleteFileBox(fileBox, gridId) {
    fileBox.remove();
    if (gridId === 'fdFile') {
        fd_file_index--;
    } else {
        act_file_index--;
    }
}

// 오늘 날짜를 "YYYY-MM-DD" 형식으로 반환하는 함수
function getTodayDate() {
    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 1을 더함
    const day = String(today.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
}

$(document).ready(function() {
    const dateInput = $('#record_dt');
    if (!dateInput.val()) {
        dateInput.val(getTodayDate());
    }

    const due_input = $('#due_dt');
    if (!due_input.val()) {
        due_input.val(getTodayDate());
    }

    const compl_input = $('#compl_date');
    if (!compl_input.val()) {
        compl_input.val(getTodayDate());
    }

});