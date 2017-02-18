class AddDevelopmentTokenToAuthors < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :development_token, :string
    add_index :authors, :development_token, :unique => true
  end
end
