$(document).on('turbolinks:load', function(){
  var dropzone = $('.dropzone-area');
  var dropzoneicon = $('.dropzone-area-icon');
  var dropzone_box = $('.dropzone-box');
  var images = [];
  var inputs  =[];
  var input_area = $('.input_area');
  var preview = $('#preview-image');
  var input_edit = $('.dropzone-area-edit');
  var add_image = 0
  
  $(window).ready(function (){
    var add_image = 0
  });

  $(document).on('change', 'input[type= "file"]#input-box-image',function() {
    // console.log(add_image)
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    inputs.push($(this));
    var img = $(`<div class= "img_box"><img></div>`);
    reader.onload = function(e) {
      var btn_wrapper = $('<div class="btn_wrapper"><div class="btn_delete">削除</div></div>');
      img.append(btn_wrapper);
      img.find('img').attr({src: e.target.result})
    }
    reader.readAsDataURL(file);
    images.push(img);
    add_image += 1
      if(images.length <= 4){
          $.each(images, function(index, image) {
          image.attr('data-image', index);
          preview.append(image);
          dropzone.css({
            'width': `calc(100% - (120px * ${images.length - 5}))`
          })
          dropzoneicon.css({
            'left': `calc(280px - (5px * ${images.length - 5} * ${images.length - 5}))`
          })

        })
        if(gon.length + add_image >= 5){
          input_edit.css({
            'display': 'none'
          })
        }
      } else if(images.length == 5) {
        dropzone.css({
          'display': 'none'
        })
        $.each(images, function(index, image) {
          image.attr('data-image', index);
          preview.append(image);
          dropzone.css({
            'width': `calc(100% - (20%* ${images.length - 5}))`
          })
        })
        if(gon.length + add_image >= 5){
          input_edit.css({
            'display': 'none'
          })
        }
      } 
      else if(images.length >= 6) {
        dropzone.css({
          'display': 'none'
        })
      } 
      else {

        return;
      }

    var new_image = $(`<input multiple= "multiple" name="images[url][]" class="input-box-image ${images.length}" data-image= ${images.length} type="file" id="input-box-image" style="display:none;">`);
    input_area.prepend(new_image);
  });
// -----------------削除--------------------------
$(document).on('click', '.btn_delete', function() {
  // console.log(add_image)
  var target_image = $(this).parent().parent();
  $.each(inputs, function(index, input){
    if ($(this).data('image') == target_image.data('image')){
      $(this).remove();
      target_image.remove();
      var num = $(this).data('image');
      images.splice(num, 1);
      inputs.splice(num, 1);
      add_image -= 1
      if(inputs.length == 0) {
        $('input[type= "file"].input-box-image').attr({'data-image': 0})
      }
    }
  })
  $('input[type= "file"].input-box-image:first').attr({
    'data-image': inputs.length
  })
  $.each(inputs, function(index, input) {
    var input = $(this)
    input.attr({
      'data-image': index
    })
    $('input[type= "file"].input-box-image:first').after(input)
  })
  dropzone.css({
    'display': 'block'
  })
  $.each(images, function(index, image) {
    image.attr('data-image', index);
    preview.append(image);
  })
  dropzone.css({
    'width': `calc(100% - (120px * ${images.length}))`
  })
  if(gon.length + add_image <= 5){
    input_edit.css({
      'display': 'block'
    })
  }
})


  $(".btn_delete").on("click", function() {
    var target_image = $(this).parent().parent();
    var killTarget = $(this).parent().siblings;
    if ($(this).data('image') == target_image.data('image')){
      target_image.remove();
      $(this).remove();
      $(killTarget).remove();
      $(this).val("");
    }
  });
  
});