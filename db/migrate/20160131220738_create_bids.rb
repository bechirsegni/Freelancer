class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.string :price
      t.string :time
      t.text :proposal
      t.integer :user_id
      t.integer :job_id

      t.timestamps
    end
  end
end
