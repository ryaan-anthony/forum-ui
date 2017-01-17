class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :url
      t.string :link_type
      t.text :title
      t.text :image
      t.text :video
      t.text :description
      t.references :author, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
