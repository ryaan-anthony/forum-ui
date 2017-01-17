class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :authentication_keys => [:username]
  validates :username,
            :presence => true,
            :format => { :with => /\A[\w\-\.]+\z/ },
            :uniqueness => { :case_sensitive => true },
            :length => { :within => 2..40 },
            :exclusion => { :in => %w( new ) }

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
