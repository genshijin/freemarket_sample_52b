$(function(){

  function real_price(price){
    var p_01 = Math.floor(price / 10)
    var html_01 = `<b class='price_01'>${p_01}</b>`
    var html_09 = `<b class='price_09'>${price - p_01}</b>`
    $('#01').append(html_01);
    $('#09').append(html_09);
  }

  $('.input-price').on('keyup', function(e){
    
    var input = $('.input-price').val();
    var input_01 = Math.ceil(input * 0.1);
    var input_09 = input - input_01;
    $('#01').text('¥' + input_01);
    $('#09').text('¥' + input_09);
  })
});