(function($) {
  $.fn.slider = function () {
    return this.each(function(){
      var
          container = $(this),
          next_button = container.find('a.view_next');

      next_button.css('display', 'block').click(function(evt){
        evt.preventDefault();
        nextSlide(container);
      });
    });
  };

  var nextSlide = function(container){
    var
        active = container.find('.active'),
        width  = active.width(),
        next   = active.next('.photo').css('left', width).show(),
        active_left = -width,
        next_left = 0;

    if (next.length == 0) {
      next = container.find('.photo').first().css('left', width).show();
    };

    active.animate({'left': active_left}, 800, 'easeInOutExpo', function(){
      $(this).removeClass('active');
    });
    next.animate({'left': next_left}, 800, 'easeInOutExpo', function(){
      $(this).addClass('active')
    });
  };
})(jQuery);