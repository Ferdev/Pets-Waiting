$.extend($.pw.pets.photos, {
  form: {
    init: function(){
      $.pw.pets.photos.form.fields();
    },

    fields: function(){

      var update_thumbnail = function(coords) {
        var
          rx = 200 / coords.w,
          ry = 200 / coords.h,
          img_width = $("#photo").width(),
          img_height = $("#photo").height();

        $('#thumbnail img').css({
          width: Math.round(rx * img_width) + 'px',
          height: Math.round(ry * img_height) + 'px',
          marginLeft: '-' + Math.round(rx * coords.x) + 'px',
          marginTop: '-' + Math.round(ry * coords.y) + 'px'
        });
        
        update_hiddens(coords);
      };

      var update_hiddens = function(coords) {
        $('#photo_crop_x').val(coords.x);
        $('#photo_crop_y').val(coords.y);
        $('#photo_crop_h').val(coords.w);
        $('#photo_crop_w').val(coords.h);
      };

      
      $.pw.pets.photos.form.jcrop = $.Jcrop('#photo', {
        onChange: update_thumbnail,
        onSelect: update_thumbnail,
        aspectRatio: 1,
        bgColor:     'black',
        bgOpacity:   .4,
        setSelect:   [ 0, 0, 200, 200 ],
      });
      
      $('#photo_image').prettyfile({html: $('#prettyfile_tmp').contents()});
    }
  }
});