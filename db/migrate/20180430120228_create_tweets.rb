class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.text :content
      t.integer :user_id
      t.text :image
      t.timestamps
    end
  end
end
