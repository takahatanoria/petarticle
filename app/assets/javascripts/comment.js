$(document).on('turbolinks:load', function() {
  var commentzone = $('.article-post-comment-list');
  var comment_on_btn = $('.comment-display-on');
  var comment_off_btn = $('.comment-display-off');
  
  $(document).on('click', '.comment-display-on',function() {
    commentzone.css({
      'display': 'block'
    })
    comment_on_btn.css({
      'display': 'none'
    })
    comment_off_btn.css({
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

  $(document).on('click', '.comment-display-off',function() {
    commentzone.css({
      'display': 'none'
    })
    comment_on_btn.css({
      'display': 'block'
    })
    comment_off_btn.css({
      'display': 'none'
    })
  });


});