$(function(){
  
  $('.sell-item__photo__dot:first').addClass('active');

  $('.sell-item__photo__dot').click(function(){

    $('.sell-item__photo__dot').removeClass('active');
    $(this).addClass('active');
    var imgSrc = event.target.src;
    $('#translate-img').attr('src', imgSrc);

    return false;

  });
});