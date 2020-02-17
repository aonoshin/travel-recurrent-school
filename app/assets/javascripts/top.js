// [途中でheader固定機能]
$(window).on('turbolinks:load',function(){
    var navPos = $('.navbar-top').offset().top;
    $(window).scroll(function(){
        if ($(window).scrollTop() > navPos){
            $('.navbar-top').css('position', 'fixed');
        } else {
            $('.navbar-top').css('position', 'static');
        }
    });
});


// [TOP画面スライドショー機能]
$(window).on('turbolinks:load',function(){
    let count = $('#top-image-slide li').length;
    let current = 1;
    let next = 2;
    let interval = 4000;
    let duration = 1000;
    let timer;
    $('#top-image-slide li:not(:first-child)').hide();
    timer = setInterval(slideTimer, interval);
    function slideTimer(){
        $('#top-image-slide li:nth-child('+ current +')').fadeOut(duration);
        $('#top-image-slide li:nth-child('+ next +')').fadeIn(duration);
        current = next;
        next = ++next;
        if(next > count){
            next = 1;
        }
        $('#top-image-btn li a').removeClass('target');
        $('#top-image-btn li:nth-child('+ current +') a').addClass('target');
    }
    
    $('#top-image-btn li a').click(function(){
        next = $(this).html();
        clearInterval(timer);
        timer = setInterval(slideTimer, interval);
        slideTimer();
        return false;
    });
});