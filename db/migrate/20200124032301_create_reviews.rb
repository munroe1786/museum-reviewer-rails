class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :date_visited
      t.text :content
      t.integer :rating
      t.integer :user_id, foreign_key: true
      t.integer :museum_id, foreign_key: true
      t.timestamps
    end
  end
end
