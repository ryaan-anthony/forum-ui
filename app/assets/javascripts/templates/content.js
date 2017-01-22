(function() {
  this.Template || (this.Template = {});
  Template.content = function(url, title, description) {
    var description_container = document.createElement('div');
    $(description_container).addClass('description-container').text(description);
    var title_link_tag = document.createElement('a');
    var title_container = document.createElement('div');
    $(title_link_tag).attr('href', url).attr('target', '_blank').text(title);
    return $(title_container)
      .addClass('col col-xs-10 title-container')
      .append($(title_link_tag))
      .append($(description_container));
  };
}).call(this);
