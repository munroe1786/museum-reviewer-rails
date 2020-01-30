class AddUserIdToMuseums < ActiveRecord::Migration[6.0]
  def change
    add_reference :museums, :user, foreign_key: true
  end
end
