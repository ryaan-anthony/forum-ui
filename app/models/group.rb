class Group < ApplicationRecord
  include RandomCode
  belongs_to :author, optional: true

end
