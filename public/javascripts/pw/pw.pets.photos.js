$.extend($.pw.pets, {
  photos: {
    init: function(){
      $.each($.pw.pets.photos, function(index, mod){
        if (mod.init) {
          mod.init();
        };
      });
    }
  }
});