class CreateMuseums < ActiveRecord::Migration[6.0]
  def change
    create_table :museums do |t|
      t.string :name
      t.string :location
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
