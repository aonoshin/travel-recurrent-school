// // [トップメニューにホバーすると少し動く機能]
// $(window).on('turbolinks:load', function(){
//     $('.navbar-list li:nth-of-type(odd)').hover(function(){
//         $(this).css('transform', 'translate(0, -6px)');
//     }, function(){
//         $(this).css('transform', 'translate(0, 0)')
//     });
// });


// [トグル機能]※スマホ＆タブレット版のみ
$(window).on('turbolinks:load', function(){
    $('.toggle-btn').click(function(){
        $('.navbar-list > ul').slideToggle(300);
    });
});
