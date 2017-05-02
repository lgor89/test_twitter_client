class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.text :title
      t.text :post

      t.timestamps
    end
  end
end
