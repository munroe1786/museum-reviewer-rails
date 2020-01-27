class RemoveUserIdFromMuseums < ActiveRecord::Migration[6.0]
  def change

    remove_column :museums, :user_id, :integer
  end
end
