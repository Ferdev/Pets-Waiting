$.extend($.pw, {
  new_pet: {
    init: function(){
      $.pw.new_pet.form();
    },
    
    form: function(){
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
      if (!this.geocoder) {
        this.geocoder = new google.maps.Geocoder();
      };

      var cache = {};
      $('#pet_address_attributes_address').autocomplete({
        minLength: 3,
        source: function(request, response) {
          if ( request.term in cache ) {
            response( cache[ request.term ] );
            return;
          };

          $.pw.new_pet.geocoder.geocode({'address': request.term}, function(results, status){

            if(status == google.maps.GeocoderStatus.OK){
              results = $.map(results, function(element, index){
                return {'label': element.formatted_address, 'value': element};
              });
              cache[ request.term ] = results;
              response( results );
            }
          });
        },
        focus: function(event, ui){
          $(this).val(ui.item.label);
          return false;
        },
        select: function(event, ui) {
          if (!ui || !ui.item) { return; };
          var address = ui.item.value;

          $(this).val(ui.item.label);
          
          address_to_form(address);
          
          return false;
        }
      });
      
      var address_to_form = function(address){
          if (!address || !address.address_components) { return; };

          var find_in_address = function(callback, result_callback){
            var result = ['',''], address_component;
            for (var i = address.address_components.length - 1; i >= 0; i--){
              address_component = address.address_components[i];
              callback(result, address_component);
            };
            return result_callback ? result_callback(result) : result[0];
          };
          
          var street = function(){
            return find_in_address(
              function(result, address_component){
                if ($.inArray('route', address_component.types) > -1) {
                  result[0] = address_component.long_name;
                }else if($.inArray('street_number', address_component.types) > -1){
                  result[1] = address_component.long_name;
                };
              },
              function(result){
                return result[0] + ', ' + result[1];
              }
            );
          };
          
          var city = function(){
            return find_in_address(
              function(result, address_component){
                if ($.inArray('locality', address_component.types) > -1) {
                  result[0] = address_component.long_name;
                };
              }
            );
          };
          
          var substate = function(){
            return find_in_address(
              function(result, address_component){
                if ($.inArray('administrative_area_level_2', address_component.types) > -1) {
                  result[0] = address_component.long_name;
                };
              }
            );
          };

          var state = function(){
            return find_in_address(
              function(result, address_component){
                if ($.inArray('administrative_area_level_1', address_component.types) > -1) {
                  result[0] = address_component.long_name;
                };
              }
            );
          };

          var postal_code = function(){
            return find_in_address(
              function(result, address_component){
                if ($.inArray('postal_code', address_component.types) > -1) {
                  result[0] = address_component.long_name;
                };
              }
            );
          };

          var country = function(){
            return find_in_address(
              function(result, address_component){
                if ($.inArray('country', address_component.types) > -1) {
                  result[0] = address_component.long_name;
                };
              }
            );
          };

          var country_code = function(){
            return find_in_address(
              function(result, address_component){
                if ($.inArray('country', address_component.types) > -1) {
                  result[0] = address_component.short_name;
                };
              }
            );
          };

          $('#pet_address_attributes_street').val(null);
          $('#pet_address_attributes_postal_code').val(null);
          $('#pet_address_attributes_lat').val(null);
          $('#pet_address_attributes_lon').val(null);
          $('#pet_address_attributes_country').val(null);
          $('#pet_address_attributes_country_code').val(null);
          $('#pet_address_attributes_state').val(null);
          $('#pet_address_attributes_substate').val(null);
          $('#pet_address_attributes_city').val(null);
          
          $('#pet_address_attributes_lat').val(address.geometry.location.lat());
          $('#pet_address_attributes_lon').val(address.geometry.location.lng());
          $('#pet_address_attributes_street').val(street());
          $('#pet_address_attributes_city').val(city());
          $('#pet_address_attributes_substate').val(substate());
          $('#pet_address_attributes_state').val(state());
          $('#pet_address_attributes_postal_code').val(postal_code());
          $('#pet_address_attributes_country').val(country());
          $('#pet_address_attributes_country_code').val(country_code());
      }
    }
  }
});