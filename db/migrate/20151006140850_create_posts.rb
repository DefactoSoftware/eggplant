class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :tweet
      t.integer :user_id
      t.datetime :planned_time

      t.timestamps
    end
  end
end
