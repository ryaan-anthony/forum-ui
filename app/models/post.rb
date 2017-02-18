class PostIndex
  def self.current_index
    'index'
  end
  def self.current_type
    'typeed'
  end
end
class Post
  include ActiveModel::Validations
  include Elasticsearch::Persistence::Model

  # Set the index to be used for this request
  index_name PostIndex.current_index

  document_type PostIndex.current_type

  attribute :author_id, Integer, mapping: { type: 'integer' }
  attribute :description, String, mapping: { similarity: 'BM25' }
  attribute :image, String
  attribute :title, String, mapping: { similarity: 'BM25' }
  attribute :type, String
  attribute :url, String
  attribute :video_url, String
  validates :author_id, presence: true
  validates :type, presence: true
  validates :title, presence: true
  validates :url, presence: true, :format => URI::regexp(%w(http https))
  validates :video_url, :format => URI::regexp(%w(http https)), allow_nil: true

  def search
    index_name PostIndex.current_index+'*'
    super
  end

  def save
    assign_attributes fetch_metadata
    #todo provide meaningful errors (BAD REQUEST)
    raise Errors::InvalidPostError unless self.valid?
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
    raise Errors::InvalidPostError unless result
    result
  end

end
