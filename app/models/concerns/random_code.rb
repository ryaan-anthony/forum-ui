module RandomCode
  extend ActiveSupport::Concern

  included do
    before_create :generate_code
  end

  protected

  def generate_code
    self.code = loop do
      random_token = SecureRandom.urlsafe_base64(4, false)
      break random_token unless self.class.exists?(code: random_token)
    end
  end
end
