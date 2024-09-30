$(document).ready(function(){
    // 프로젝트 기간
    $('#no_days_period').click(function(){
        let checked = $('#no_days_period').is(':checked');
        if (checked) {
            $("#start_date").attr("readonly", true).val('').css("background-color", "#e9ecef");
            $("#end_date").attr("readonly", true).val('').css("background-color", "#e9ecef");
        } else {
            $("#start_date").removeAttr("readonly").css("background-color", "");
            $("#end_date").removeAttr("readonly").css("background-color", "");
        }
    });

    $('#pre_start_date, #pre_end_date').on('change', function() {
        calculateDaysBetween('pre');
    });

    $('#start_date, #end_date').on('change', function() {
        calculateDaysBetween();
    });

    // 날짜 계산
    function calculateDaysBetween(division) {
        let sDate = '#start_date';
        let eDate = '#end_date';
        let days = '.days';

        if (division === 'pre') {
            sDate = '#pre_start_date';
            eDate = '#pre_end_date';
            days = '.pre_days';
        }

        let startDate = new Date($(sDate).val());
        let endDate = new Date($(eDate).val());

        // Ensure both dates are selected
        if (!isNaN(startDate) && !isNaN(endDate)) {
            let timeDifference = endDate.getTime() - startDate.getTime();
            let dayDifference = timeDifference / (1000 * 3600 * 24);

            // Update the days span
            $(days).text(`(${dayDifference}일)`);
        } else {
            $(days).text('(0일)');
        }
    }

    $("#description").keyup(function (e){
        let content = $(this).val();
        if (content.length == 0 || content == "") {
            $(".char-count").text('0');
        } else {
            $(".char-count").text(content.length);
        }
        if (content.length > 500) {
            alert("글자수는 500까지 입력 가능합니다.");
            return false;
        }
    });

});