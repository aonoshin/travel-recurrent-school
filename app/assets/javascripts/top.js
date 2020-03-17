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


// [TOP画面スライドショー機能/スマホのみ]
$(window).on('turbolinks:load',function(){
    let count = $('#top-image-slide .sp-ver > li').length;
    let current = 1;
    let next = 2;
    let interval = 4000;
    let duration = 1000;
    let timer;
    $('#top-image-slide .sp-ver > li:not(:first-child)').hide();
    timer = setInterval(slideTimer, interval);
    function slideTimer(){
        $('#top-image-slide .sp-ver > li:nth-child('+ current +')').fadeOut(duration);
        $('#top-image-slide .sp-ver > li:nth-child('+ next +')').fadeIn(duration);
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



// [スムーススクロール機能]
$(window).on('turbolinks:load', function(){
    $('a[href^="#"]').click(function(){
        let speed = 500;
        let href = $(this).attr('href');
        let target = $(href == '#' || href == '' ? 'html' : href);
        let position = target.offset().top;
        $('body, html').animate({
            scrollTop:position
        }, speed, 'swing');
        return false;
    });
});


// [スクロールするとcss効果が加わる機能]
$(document).on('turbolinks:load', window).scroll(function(){
    $('.salon-introduction-title, .salon-introduction-title h1, .salon-introduction-title span, .salon-introduction-airplane img, .salon-introduction-text span, .salon-about h1, .salon-about-1, .salon-about-2, .salon-about-2-text span, .salon-about-3 h2, .salon-about-3-text, .top-faculty, .salon-about-4 h1, .top-event, .salon-about-4-text, .salon-about-5 h1, .top-news, .salon-about-6 h1, .top-fee, .salon-about-6-enroll, .salon-about-7-p, .top-profile span, .salon-about-8-p, .enroll-area, .contact-area, .wanted-area, .salon-about-8-text').each(function(){
        let dummy = $(this).offset().top,
            scroll = $(window).scrollTop(),
            windowHeight = $(window).height(); 
        if (scroll > dummy - windowHeight + 120){
            $(this).addClass('scroll');
        }
    });
});


// [マウスを重ねると文字が変わる機能]
// $(window).on('turbolinks:load', function(){
//     $('.top-enroll-position a').hover(function(){
//         $(this).html('入学する');
//     }, function(){
//         $(this).html('Enroll in School');
//     });
// });

$(window).on('turbolinks:load', function(){
    $('.salon-about-6-enroll a').hover(function(){
        $(this).html('入学する').css({padding:'5px 90px', transition:'0.8s'});
    }, function(){
        $(this).html('Enroll in School').css({padding:'5px 70px', transition:'0.8s'});
    });
});

$(window).on('turbolinks:load', function(){
    $('.enroll-area a').hover(function(){
        $(this).html('入学する').css({padding:'5px 50px', transition:'0.8s', color:'#fff', background:'#ff9900'});
    }, function(){
        $(this).html('Enroll in School').css({padding:'5px 30px', transition:'0.8s', color:'#ff9900', background:'#fff'});
    });
});

$(window).on('turbolinks:load', function(){
    $('.contact-area a').hover(function(){
        $(this).html('問い合わせる').css({padding:'5px 50px', transition:'0.8s', color:'#fff', background:'#6699cc'});
    }, function(){
        $(this).html('Contact').css({padding:'5px 30px', transition:'0.8s', color:'#6699cc', background:'#fff'});
    });
});

$(window).on('turbolinks:load', function(){
    $('.wanted-area a').hover(function(){
        $(this).html('先生を応募する').css({padding:'5px 50px', transition:'0.8s', color:'#fff', background:'#3cb371'});
    }, function(){
        $(this).html('Teacher Wanted').css({padding:'5px 30px', transition:'0.8s', color:'#3cb371', background:'#fff'});
    });
});