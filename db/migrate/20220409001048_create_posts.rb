class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :short_title
      t.string :title
      t.string :short_description
      t.references :person, null: false, foreign_key: true
      t.string :location
      t.string :color

      t.timestamps
    end
  end
end
