$(window).on('turbolinks:load', function(){
  let scrollPosition;
  $('.js-modal-open').on('click',function(){
      $('.js-modal').fadeIn();
      scrollPosition = $(window).scrollTop();
        $('body').addClass('fixed').css({'top': -scrollPosition});
  });
  $('.js-modal-close').on('click',function(){
      $('.js-modal').fadeOut();
      $('body').removeClass('fixed').css({'top': 0});
        window.scrollTo( 0 , scrollPosition );
  });
});