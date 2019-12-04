$(document).on('turbolinks:load', function() {
  $('a[href^="#"]').click(function () {
      var speed = 500;
      var href= $(this).attr("href");
      var target = $(href == "#" || href == "" ? 'html' : href);
      var position = target.offset().top;
      $("html, body").animate({scrollTop:position - 100}, speed, 'swing');
      return false;
  });

  $('.main-contents-categories__dogs').hover(
    function() {
      //マウスカーソルが重なった時の処理
      $(this).children('ul').show();
    },
    function() {
        //マウスカーソルが離れた時の処理
      $(this).children('ul').hide();
    }
  );

  $('.parents__list-box').hover(
    function() {
      $(this).addClass("now-selected-header");
    
    },
    function() {
      $(this).removeClass("now-selected-header");
    },
  );
});

