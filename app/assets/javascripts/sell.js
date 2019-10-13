$(document).on('turbolinks:load', function() {
  $(function(){

    function add_html(inputs){
      var HTML = `
      <div class='sellitem_contener'>
        <div class='sellitem_contener_image'>
          <img class="edit_image"></img>
        </div>
        <div class='sell-image-upload'>
          <a class='sell-image-upload-btn'>編集</a>
          <a class='sell-image-upload-btn'>削除</a>
        </div>
      </div>
      <label class='file_upload_box'>
      <input style="display: none;" class="sell-upload-drop-file" id="file_input" type="file" name="item[image]">
        <div class='sell-upload-drop-box have-item-0 edit_page'>
          <pre class="visible-pc">ドラッグアンドドロップ<br>またはクリックしてファイルをアップロード</pre> 
          <div class='icon-camera'>
            <i class='fa fa-camera' "aria-hidden"= "true"></i>
          </div>
        </div>
      </label>  `
      $('#edit_page').append(HTML);
      
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
      console.log(inputs);
      $('#edit_page').empty();
      var inputs = $('#file_input').val();
      add_html(inputs);
    })

  });
});