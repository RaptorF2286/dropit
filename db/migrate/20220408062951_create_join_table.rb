class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :posts, :users do |t|
      t.index %i[post_id user_id]
      t.index %i[user_id post_id]
    end
  end
end
