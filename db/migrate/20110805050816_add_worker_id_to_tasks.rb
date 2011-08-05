class AddWorkerIdToTasks < ActiveRecord::Migration
  def self.up
    add_column( :tasks, :worker_id, :integer )
  end

  def self.down
    remove_column( :tasks, :worker_id )
  end
end
