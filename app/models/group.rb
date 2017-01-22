class Group < ApplicationRecord
  include RandomCode
  belongs_to :author, optional: true

  def can_submit
    true
  end

end
