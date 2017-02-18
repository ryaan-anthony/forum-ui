class AddAuthenticationTokenToAuthors < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :authentication_token, :string
    add_index :authors, :authentication_token, :unique => true
  end
end
