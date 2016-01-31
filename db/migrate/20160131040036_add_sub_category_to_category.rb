class AddSubCategoryToCategory < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :category, index: true, foreign_key: true
  end
end
