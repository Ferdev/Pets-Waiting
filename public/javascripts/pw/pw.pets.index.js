$.extend($.pw.pets, {
  index: {
    init: function(){
      $.pw.pets.index.events();
    },
    
    page: 1,
    
    loading: false,
    
    events: function(){
      $('div.pagination').remove();
      $(document).scroll(function(evt){
        var 
          total_height  = $(this).height(),
          scroll        = $(this).scrollTop()
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
            
          };
          
          
        if (scroll / total_height >= 0.6 && is_descending(scroll) && !$.pw.pets.index.loading) {
          $.pw.pets.index.loading = true;
          $.pw.pets.index.page++;
          $('.pets.results ul').append($('<li class="loading"><span class="spinner"/></li>'));
          $.get('/pets', {page: $.pw.pets.index.page}, function(data, textStatus, xhr) {
            $('.pets.results ul li.loading').remove();
            //optional stuff to do after success
            $('.pets.results ul').append(data);
            $.pw.pets.index.loading = false;
          });
          
        };
      });
      
    }
  }
});
