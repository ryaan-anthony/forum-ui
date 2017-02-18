class Author < ApplicationRecord
  include Tokenizable
  # Include default devise modules. Others available are:
  #  :timeoutable and :omniauthable
  devise :database_authenticatable, :token_authenticatable, :registerable, :confirmable,
         :lockable, :recoverable, :rememberable, :trackable, :validatable
  validates :email, email: true, presence: true
end
