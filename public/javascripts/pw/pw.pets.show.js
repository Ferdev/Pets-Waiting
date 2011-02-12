$.extend($.pw.pets, {
  show: {
    init: function(){
      $('div.pet div.photos').slider();

      if (PET_ADDRESS) {
        var
          map_div       = $('#content div.pet .description_and_location .location .map'),
          map_container = $('<div/>').addClass('container').appendTo(map_div).get(0);

        map_div.find('img').remove();

        var
          geocoder = new google.maps.Geocoder(),
          myOptions = {
            disableDefaultUI: true,
            zoom: 8,
            mapTypeId: google.maps.MapTypeId.TERRAIN
          },
          map = new google.maps.Map(map_container, myOptions);

        geocoder.geocode( { 'address': PET_ADDRESS}, function(results, status) {
          if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
          };
        });
      };
    }
  }
});
