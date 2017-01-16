class Group < ApplicationRecord
  validates :code,
            :presence => true,
            :format => { :with => /\A[\w\-\.]+\z/ },
            :uniqueness => { :case_sensitive => true },
            :length => { :within => 2..40 },
            :exclusion => { :in => %w( new ) }

end
