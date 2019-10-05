$(function(){

  function real_price(price){
    var p_01 = Math.floor(price / 10)
    var html_01 = `<b class='price_01'>${p_01}</b>`
    var html_09 = `<b class='price_09'>${price - p_01}</b>`
    $('.clearfix__right 01').append(html_01);
    $('.clearfix__right 09').append(html_09);
  }

  $('.input-price').on('keyup', function(e){
    
    var input = $('.input-price').val();
    
    $.ajax({
     type: 'GET',
     url: '/items/new',
     data: { keyword: input },
     dataType: 'json'
    })
    .done(function(price) {
      $('.price_01').empty();
      $('.price_09').empty();
      if (Number(price) >= 100) {
        real_price(Number(price));
      }
    })
    .fail(function() {
      alert('失敗しました');
    })
  })
});