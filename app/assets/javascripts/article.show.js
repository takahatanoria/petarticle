$(document).on('turbolinks:load', function() {
  $('img.details__image__low__image').mouseover(function() {
    var ImgSrc = $(this).attr("src");
    $("img#mainimage").attr({src:ImgSrc});
    $("img#mainimage").hide();
    $("img#mainimage").fadeIn();
        return false;
    });
  });