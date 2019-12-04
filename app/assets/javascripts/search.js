$(document).on('turbolinks:load', function() {
  var serch_result_zone = $('.show-all-search-display-off');
  var serch_result_on_btn = $('.show-all-search-btn');
  var serch_result_off_btn = $('.show-all-search-off-btn');
  
  $(document).on('click', '.show-all-search-btn',function() {
    serch_result_zone.css({
      'display': 'block'
    })
    serch_result_on_btn.css({
      'display': 'none'
    })
    serch_result_off_btn.css({
      'display': 'block'
    })
  });

  // $(".comment-display-off").on("click", function() {
  //   commentzone.css({
  //     'display': 'none'
  //   })
  //   comment_on_btn.css({
  //     'display': 'block'
  //   })
  //   comment_off_btn.css({
  //     'display': 'none'
  //   })
  // });  

  $(document).on('click', '.show-all-search-off-btn',function() {
    serch_result_zone.css({
      'display': 'none'
    })
    serch_result_on_btn.css({
      'display': 'block'
    })
    serch_result_off_btn.css({
      'display': 'none'
    })
  });


});