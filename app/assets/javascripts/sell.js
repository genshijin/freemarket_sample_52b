$(document).on('turbolinks:load', function() {
  $(function(){

    function add_html(blobUrl){
      var HTML = `
      <div class='sellitem_contener_image'>
        <img class="edit_image" src='${blobUrl}' id='image_tag'></img>
      </div>
      <div class='sell-image-upload'>
        <a class='sell-image-upload-btn'>編集</a>
        <a class='sell-image-upload-btn'>削除</a>
      </div>`
      $('#img').append(HTML);
      
    }


    $('.input-price').on('keyup', function(e){
      
      $('#01').empty();
      $('#09').empty();
      var input = $('.input-price').val();
      var input_01 = Math.ceil(input * 0.1);
      var input_09 = input - input_01;
      if(input_01){
        $('#01').text('¥' + input_01);
        $('#09').text('¥' + input_09);
      }
    })

    $('#file_input').on('change', function(e){
      var file = e.target.files[0];
      var blobUrl = window.URL.createObjectURL(file);
      $('#img').empty();
      add_html(blobUrl);
    })

  });
});