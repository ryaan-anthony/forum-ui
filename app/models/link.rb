class Link
  include ActiveModel::Validations
  include Elasticsearch::Persistence::Model

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

  def save
    assign_attributes fetch_metadata
    normalize :video_url
    raise Errors::InvalidLinkError unless self.valid?
    super
  end

  private

  # Some attributes can sometimes be an array
  def normalize(attribute)
    public_send("#{attribute}=", public_send(attribute).first) if public_send(attribute).is_a? Array
  end

  def fetch_metadata
    result = ::OpenGraph.fetch(self.url)
    raise Errors::InvalidLinkError unless result
    result
  end

  def assign_attributes(attributes)
    attributes.each do |k, v|
      _assign_attribute(k, v)
    end
  end

  def _assign_attribute(k, v)
    public_send("#{k}=", v) if respond_to?("#{k}=")
  end

end
