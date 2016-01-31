class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :slogan, :string
    add_column :users, :description, :text
    add_column :users, :location, :string
    add_column :users, :phone, :string
  end
end
