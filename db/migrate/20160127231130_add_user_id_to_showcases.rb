class AddUserIdToShowcases < ActiveRecord::Migration[5.0]
  def change
    add_column :showcases, :user_id, :integer
  end
end
