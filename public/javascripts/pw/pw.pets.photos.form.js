$.extend($.pw.pets.photos, {
  form: {
    init: function(){
      $.pw.pets.photos.form.fields();
    },

    fields: function(){
      var update_thumbnail = function(img, selection){
        var scaleX = 200 / (selection.width || 1);
        var scaleY = 200 / (selection.height || 1);

        $('#thumbnail img').css({
            width: Math.round(scaleX * 400) + 'px',
            height: Math.round(scaleY * 400) + 'px',
            marginLeft: '-' + Math.round(scaleX * selection.x1) + 'px',
            marginTop: '-' + Math.round(scaleY * selection.y1) + 'px'
        });
        update_hiddens(img, selection);
      };
      
      var update_hiddens = function(img, selection) {
        $('#photo_crop_x').val(selection.x1);
        $('#photo_crop_y').val(selection.y1);
        $('#photo_crop_h').val(selection.width);
        $('#photo_crop_w').val(selection.height);
      };
      
      $.pw.pets.photos.form.ias = $('#photo').imgAreaSelect({
        aspectRatio: '1:1',
        onSelectChange: update_thumbnail,
        onSelectEnd: update_hiddens,
        instance: true,
        show: true
      });
      if ($.pw.pets.photos.form.ias) {
        $.pw.pets.photos.form.ias.setSelection(0, 0, 200, 200, true);
        $.pw.pets.photos.form.ias.update();
      };
    }
  }
});