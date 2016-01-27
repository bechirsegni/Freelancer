class CreateShowcases < ActiveRecord::Migration[5.0]
  def change
    create_table :showcases do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
