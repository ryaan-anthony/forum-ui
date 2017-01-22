var LAST_LINK_DATE;

class Queue
{
  static start(timeout) {
    Queue.request(timeout);
  }

  static request(timeout) {
    $.ajax({
      url : window.location+".json",
      type : "get",
      data: {
        last_date: LAST_LINK_DATE
      },
      dataType : "json"
    }).done(function( json ) {
      if (json.links.length) LAST_LINK_DATE = json.links[json.links.length - 1].created_at;
      console.log(json);
      for(var i=0; i<json.links.length; i++){
        var link = json.links[i];
        var link_container = document.createElement('div');
        $(link_container)
          .addClass('link row')
          .append(Template.image(link.url, link.image))
          .append(Template.content(link.url, link.title, link.description));
        $("#links-container").prepend($(link_container));
      }
    }).always(function(){
      setTimeout('Queue.request('+timeout+')', timeout);
    });
  }
}
