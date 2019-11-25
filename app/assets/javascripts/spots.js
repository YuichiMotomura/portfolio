$(function(){
  let btns = $('#headerBtns');
  let header = $('#header');
  let height = header.height() - btns.height();
  let flash = $('#flash');
  let main = $('#main');

  function headerFixed() {
    if($(window).scrollTop() > height) {
      btns.addClass('spots__header__btns--fixed');
      main.css('margin-top', '83px');

    } else {
      btns.removeClass('spots__header__btns--fixed');
      main.css('margin-top', '0px');
    }
  }

  function flashFadeOut(){
    flash.fadeOut('slow');
  }

  $(window).on('scroll', headerFixed);
  setTimeout(flashFadeOut, 3000);


});