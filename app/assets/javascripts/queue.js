var TOTAL_LINK_COUNT = 0;

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
        link_count: TOTAL_LINK_COUNT
      },
      dataType : "json"
    }).done(function(json) {
      console.log(json);
      TOTAL_LINK_COUNT += json.links.length;
      LinkBuilder.build(json.links);
    }).always(function(){
      setTimeout('Queue.request('+timeout+')', timeout);
    });
  }
}
