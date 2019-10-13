$(document).on('turbolinks:load', function() {
  $(function(){

    function real_price(price){
      var HTML = ``
      
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
  });
});