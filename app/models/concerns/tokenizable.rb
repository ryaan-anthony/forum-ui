module Tokenizable
  extend ActiveSupport::Concern
  included do
    before_save :ensure_authentication_tokens!
  end

  def ensure_authentication_tokens!
    self.production_token = generate_token(:production_token) if production_token.blank?
    self.development_token = generate_token(:development_token) if development_token.blank?
  end

  private

  def generate_token(type)
    loop do
      token = Devise.friendly_token
      break token unless Author.where("#{type}" => token).first
    end
  end
end
