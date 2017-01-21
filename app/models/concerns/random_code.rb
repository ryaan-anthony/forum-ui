module RandomCode
  extend ActiveSupport::Concern
  include ActiveSupport::Inflector

  included do
    before_create :generate_code
    before_save :parameterize_code
  end

  protected

  def parameterize_code
    self.parameterize(self.code, separator: '-', preserve_case: true)
  end

  def generate_code
    self.code = loop do
      random_token = SecureRandom.urlsafe_base64(4, false)
      break random_token unless self.class.exists?(code: random_token)
    end
  end
end
