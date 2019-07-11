document.addEventListener('turbolinks:load', function () {
    var timer = document.querySelector('.timer');
    if (timer) {
        var timer_count = timer.dataset.timer;
        var test_passage_id = timer.dataset.id;


        var timerId = setInterval(function () {
            timer_count = timer_count - 1;
            changeTimer(timer_count, timer);

        }, 1000);

        setTimeout(function () {
            clearInterval(timerId);
            document.location.replace('/test_passages/' + test_passage_id + '/result');
        }, timer_count * 1000);
    }
});

function changeTimer(timer_count, timer_obj) {
    line = 'Осталось времени на тест: ';
    timer_obj.innerHTML = (line + timer_count);

}
