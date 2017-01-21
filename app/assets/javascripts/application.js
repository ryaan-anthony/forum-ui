// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
var LAST_LINK_DATE;

class LinkBuilder
{
  constructor(timeout) {
    LinkBuilder.request(timeout);
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
      console.log(LAST_LINK_DATE);
      for(var i=0; i<json.links.length; i++){
        var link = json.links[i];
        var link_container = document.createElement('div');
        $(link_container)
          .addClass('link row')
          .append(LinkBuilder.build_image(link.url, link.image))
          .append(LinkBuilder.build_content(link.url, link.title, link.description));
        $("#links-container").prepend($(link_container));
      }
    }).always(function(){
      setTimeout('LinkBuilder.request('+timeout+')', timeout);
    });
  }

  static build_content(url, title, description) {
    var description_container = document.createElement('div');
    $(description_container).addClass('description-container').text(description);
    var title_link_tag = document.createElement('a');
    var title_container = document.createElement('div');
    $(title_link_tag).attr('href', url).attr('target', '_blank').text(title);
    return $(title_container)
      .addClass('col col-xs-10 title-container')
      .append($(title_link_tag))
      .append($(description_container));
  }

  static build_image(url, image) {
    var image_container = document.createElement('div');
    var image_tag = document.createElement('img');
    var image_link_tag = document.createElement('a');
    $(image_tag).attr('src', image);
    $(image_link_tag).attr('href', url).attr('target', '_blank').html($(image_tag));
    return $(image_container)
      .addClass('col col-xs-2 image-container')
      .append($(image_link_tag));
  }

}
