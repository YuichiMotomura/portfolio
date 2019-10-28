$(function(){
  let btns = $('#headerBtns');
  let header = $('#header');
  let height = header.height() - btns.height();
  let flash = $('#flash');

  function headerFixed() {
    if($(window).scrollTop() > height) {
      btns.addClass('spots__header__btns--fixed');
    } else {
      btns.removeClass('spots__header__btns--fixed');
    }
  }

  function flashFadeOut(){
    flash.fadeOut('slow');
  }

  $(window).on('scroll', headerFixed);
  setTimeout(flashFadeOut, 3000);


});