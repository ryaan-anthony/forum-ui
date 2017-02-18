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

  before_save :ensure_authentication_token

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless Author.where(authentication_token: token).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
