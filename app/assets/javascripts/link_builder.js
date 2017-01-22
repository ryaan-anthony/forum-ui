class LinkBuilder
{
  /**
   * Build the links
   * @param links
   */
  static build(links)
  {
    for(var i=0; i<links.length; i++){
      var link = links[i];
      // Build the link and prepend it the the links container
      $("#links-container").prepend(this.render(link));
    }
  }

  /**
   * Render the link object
   * @param link
   * @returns {void|*|jQuery}
   */
  static render(link)
  {
    return $(document.createElement('div'))
      .addClass('link row')
      .append(Template.image(link.url, link.image))
      .append(Template.content(link.url, link.title, link.description));
  }
}
