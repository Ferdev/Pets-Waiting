$.extend($.pw.pets, {
  show: {
    init: function(){
      $.pw.pets.show.init_ad_gallery();
    },
    
    init_ad_gallery: function(){
      $('#content ul.pet.detail li.photos .ad-gallery').adGallery({
        height: 300,
        loader_image: '/images/extra/spinner.gif',
        description_wrapper: false,
        thumb_opacity: 0.7,
        start_at_index: 0, // Which image should be displayed at first? 0 is the first image
        animate_first_image: false, // Should first image just be displayed, or animated in?
        animation_speed: 400, // Which ever effect is used to switch images, how long should it take?
        display_next_and_prev: true, // Can you navigate by clicking on the left/right on the image?
        display_back_and_forward: true, // Are you allowed to scroll the thumb list?
        scroll_jump: 0, // If 0, it jumps the width of the container
        slideshow: { enable: false },
        effect: 'slide-hori', // or 'slide-vert', 'resize', 'fade', 'none' or false
        enable_keyboard_move: true, // Move to next/previous image with keyboard arrows?
        cycle: true, // If set to false, you can't go from the last image to the first, and vice versa
        callbacks: {
          init: function() {
            this.preloadAll();
          }
        }
      });
    }
  }
});
