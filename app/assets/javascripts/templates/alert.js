(function() {
  this.Template || (this.Template = {});
  Template.alert = function(text) {
    var badge = $(document.createElement('span')).addClass('close glyphicon glyphicon-remove');
    return $(document.createElement('div'))
      .addClass('alert alert-info')
      .attr('role', 'alert')
      .text(text)
      .append(badge);
  };

}).call(this);
