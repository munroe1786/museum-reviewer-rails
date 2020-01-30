class AddUserIdToMuseums < ActiveRecord::Migration[6.0]
  def change
    add_column :museums, :user_id, :integer
  end
end
