$.extend($.pw, {
  home: {
    init: function(){
      $.pw.home.events();
    },
    
    events: function(){
      $('#pet_animal_id').change(function() {
        var breeds_select = $('#pet_breed_id');
        breeds_select.after($('<span class="spinner"/>'));
        $.ajax({
          type: "GET",
          url: '/breeds',
          dataType: "json",
          data: {animal_id: $(this).val()},
          success: function(breeds){
            breeds_select.empty().next().remove();
            $.each(breeds, function(index, item) {
              if (!item.breed) { return; };
              breeds_select.append(new Option(item.breed.name, item.breed.id));
            });
          },
          error: function(XMLHttpRequest, textStatus, errorThrown){
            breeds_select.next().remove();
          }
        });
      });
    }
  }
});