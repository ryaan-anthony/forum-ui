class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :token_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :authentication_keys => [:username]
  validates :username,
            :presence => true,
            :format => { :with => /\A[\w\-\.]+\z/ },
            :uniqueness => { :case_sensitive => true },
            :length => { :within => 2..40 },
            :exclusion => { :in => %w( new ) }

  before_save :ensure_authentication_tokens

  def ensure_authentication_tokens
    self.authentication_token = generate_token(:authentication_token) if authentication_token.blank?
    self.development_token = generate_token(:development_token) if development_token.blank?
  end

  private

  def generate_token(type)
    loop do
      token = Devise.friendly_token
      break token unless Author.where("#{type}" => token).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
