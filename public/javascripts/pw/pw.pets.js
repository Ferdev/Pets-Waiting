$.extend($.pw, {
  pets: {
    init: function(){
      $.each($.pw.pets, function(index, mod){
        if (mod.init) {
          mod.init();
        };
      });
    }
  }
});