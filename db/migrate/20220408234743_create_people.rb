class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :last_name
      t.string :username
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
