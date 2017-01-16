class Link < ApplicationRecord
  belongs_to :author, optional: true
  belongs_to :group
end
