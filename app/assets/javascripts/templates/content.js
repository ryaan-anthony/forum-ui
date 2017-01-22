(function() {
  this.Template || (this.Template = {});
  Template.content = function(url, title, description) {
    var description_container = document.createElement('div');
    $(description_container).addClass('description-container').text(description);
    var title_container = document.createElement('div');
    return $(title_container)
      .addClass('col col-xs-10 title-container')
      .append(Template.title(title))
      .append(Template.url(url))
      .append($(description_container));
  };
  Template.url = function(url) {
    return $(document.createElement('a')).attr('href', url).attr('target', '_blank').text(url);
  };
  Template.title = function(title) {
    return $(document.createElement('h5')).text(title);
  };
}).call(this);
