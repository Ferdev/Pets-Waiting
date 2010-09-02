$.extend($, {
  pw: {
    init: function(){
      $.each($.pw, function(index, mod){
        if (mod.init) {
          mod.init();
        };
      });
    }
  }
});