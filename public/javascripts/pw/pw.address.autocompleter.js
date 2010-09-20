
var address_autocompleter = function(field_prefix){

  var GEOCODER = new google.maps.Geocoder();
  var cache = {};
  
  $('#'+field_prefix+'_address_attributes_address').autocomplete({
    minLength: 3,
    source: function(request, response) {
      if ( request.term in cache ) {
        response( cache[ request.term ] );
        return;
      };

      GEOCODER.geocode({'address': request.term}, function(results, status){

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

      $('#'+field_prefix+'_address_attributes_street').val(null);
      $('#'+field_prefix+'_address_attributes_postal_code').val(null);
      $('#'+field_prefix+'_address_attributes_lat').val(null);
      $('#'+field_prefix+'_address_attributes_lon').val(null);
      $('#'+field_prefix+'_address_attributes_country').val(null);
      $('#'+field_prefix+'_address_attributes_country_code').val(null);
      $('#'+field_prefix+'_address_attributes_state').val(null);
      $('#'+field_prefix+'_address_attributes_substate').val(null);
      $('#'+field_prefix+'_address_attributes_city').val(null);

      $('#'+field_prefix+'_address_attributes_lat').val(address.geometry.location.lat());
      $('#'+field_prefix+'_address_attributes_lon').val(address.geometry.location.lng());
      $('#'+field_prefix+'_address_attributes_street').val(street());
      $('#'+field_prefix+'_address_attributes_city').val(city());
      $('#'+field_prefix+'_address_attributes_substate').val(substate());
      $('#'+field_prefix+'_address_attributes_state').val(state());
      $('#'+field_prefix+'_address_attributes_postal_code').val(postal_code());
      $('#'+field_prefix+'_address_attributes_country').val(country());
      $('#'+field_prefix+'_address_attributes_country_code').val(country_code());
  }
}