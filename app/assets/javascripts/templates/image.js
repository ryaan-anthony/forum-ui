(function() {
  this.Template || (this.Template = {});
  Template.image = function(url, image) {
    var image_container = document.createElement('div');
    var image_tag = document.createElement('img');
    var image_link_tag = document.createElement('a');
    $(image_tag).attr('src', image);
    $(image_link_tag).attr('href', url).attr('target', '_blank').html($(image_tag));
    return $(image_container)
      .addClass('col col-xs-2 image-container')
      .append($(image_link_tag));
  };
}).call(this);
