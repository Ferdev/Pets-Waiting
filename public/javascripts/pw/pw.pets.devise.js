$.extend($.pw.pets, {
  devise: {
    init: function(){
      $.pw.pets.devise.forms();
    },
    
    forms: function(){
      address_autocompleter('user');
    }
  }
});