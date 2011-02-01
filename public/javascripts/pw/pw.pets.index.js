$.extend($.pw.pets, {
  index: {
    init: function(){
      $.pw.pets.index.vars();
      $.pw.pets.index.events();
    },

    page: 1,

    loading: false,

    vars: function(){
      this.footer = $('footer');
    },

    events: function(){
      // Disables non-javascript pagination
      $('div.pagination').remove();

      $('div.filters a.button').click(function(evt){
        evt.preventDefault();
        var link_url = $(this).attr('href');
        $(this).toggleClass('active');

        $('ul.pets').empty().append($('<li class="loading"><span class="spinner"/></li>'));

        $.get(link_url, function(data, textStatus, xhr) {
          $('ul.pets li.loading').remove();
          //optional stuff to do after success
          $('ul.pets').append(data);
        });

      });

      $('div.results li.pet form input').click(function(evt){
        $(this).toggleClass('active');
      });

      // Load more pets when scroll is at the end of the page
      $(document).scroll(function(evt){
        var
          scroll        = $(this).scrollTop(),
          footer_offset = $.pw.pets.index.footer.offset()['top'],
          is_descending = function(scroll){
            var descending = false;
            this.previous_scroll = this.previous_scroll || 0;
            if (scroll > this.previous_scroll) {
              descending = true;
            };
            this.previous_scroll = scroll;
            return descending;
          },
          load_pets     = function(){
            $.pw.pets.index.loading = true;
            $.pw.pets.index.page++;
            $('ul.pets').append($('<li class="loading"><span class="spinner"/></li>'));
            $.get('/pets', {page: $.pw.pets.index.page}, function(data, textStatus, xhr) {
              $('ul.pets li.loading').remove();
              //optional stuff to do after success
              $('ul.pets').append(data);
              $.pw.pets.index.loading = false;
            });
          };

        if ((footer_offset - scroll) <= 175 && is_descending(scroll) && $.pw.pets.index.loading == false) {
          load_pets();
        };
      });

    }
  }
});
