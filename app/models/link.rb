class Link < ApplicationRecord
  belongs_to :author, optional: true
  belongs_to :group
  validates :url, :format => URI::regexp(%w(http https))
  before_create :fetch_title

  private

  def fetch_title
    self.title = metadata.title #required
    self.link_type = metadata.type #required
    self.video = metadata.video
    self.image = metadata.image
    self.description = metadata.description
  end

  def metadata
    @metadata ||= fetch_metadata
  end

  def fetch_metadata
    result = OpenGraph.fetch(self.url)
    raise Errors::InvalidLinkError unless result
    result
  end

end
