class LinkIndex
  def self.current_index
    'links'
  end
  def self.current_type
    'link'
  end
end
class Link
  include ActiveModel::Validations
  include Elasticsearch::Persistence::Model

  # Set the index to be used for this request
  index_name LinkIndex.current_index

  document_type LinkIndex.current_type

  attribute :author_id, Integer, default: 0, mapping: { type: 'integer' }
  attribute :description, String
  attribute :group_id, Integer, mapping: { type: 'integer' }
  attribute :image, String
  attribute :title, String
  attribute :type, String
  attribute :url, String
  attribute :video_url, String
  validates :type, presence: true
  validates :title, presence: true
  validates :url, presence: true, :format => URI::regexp(%w(http https))
  validates :video_url, :format => URI::regexp(%w(http https))

  def search
    index_name LinkIndex.current_index+'*'
    super
  end

  def save
    assign_attributes fetch_metadata
    #todo provide meaningful errors (BAD REQUEST)
    raise Errors::InvalidLinkError unless self.valid?
    super
  end

  def assign_attributes(attributes)
    attributes.each do |k, v|
      _assign_attribute(k, v)
    end
  end

  private

  def _assign_attribute(k, v)
    public_send("#{k}=", v) if respond_to?("#{k}=")
  end

  def fetch_metadata
    result = OpenGraph.fetch(self.url)
    #todo provide meaningful errors (BAD LINK)
    raise Errors::InvalidLinkError unless result
    result
  end

end
