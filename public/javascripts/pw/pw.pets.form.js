$.extend($.pw.pets, {
  form: {
    init: function(){
      $.pw.pets.form.fields();
    },
    
    fields: function(){
      var animal_diseases_ids = function(animal_id){
        var ids = [];
        $.each(DISEASES, function(index, disease) {
          if (disease.animal_id == animal_id) {
            ids.push(disease.id);
          };
        });
        return ids;
      };

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
        $('#pet_diseases_input ol li').hide();
        $.each(animal_diseases_ids($(this).val()), function(index, disease_id) {
          $('#pet_diseases_input ol li.disease_'+disease_id).show();
        });
      });
      address_autocompleter('pet');
      $('#pet_diseases_input ol li').hide();
      $.each(animal_diseases_ids($('#pet_animal_id').val()), function(index, disease_id) {
        $('#pet_diseases_input ol li.disease_'+disease_id).show();
      });
    }
  }
});