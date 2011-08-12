class AddEstimatedTimeToTasks < ActiveRecord::Migration
  def self.up
    add_column( :tasks, :estimated_time, :float )
    add_column( :tasks, :working_time, :float )
  end

  def self.down
    remove_column( :tasks, :working_time )
    remove_column( :tasks, :estimated_time )
  end
end
