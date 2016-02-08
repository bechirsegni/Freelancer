class AddWorkerToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :worker, :integer
  end
end
