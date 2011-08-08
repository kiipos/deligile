class AddUserIdToStories < ActiveRecord::Migration
  def self.up
    add_column( :stories, :user_id, :integer )
    rename_column( :tasks, :worker_id, :user_id )
  end

  def self.down
    rename_column( :tasks, :user_id, :worker_id )
    remove_column( :stories, :user_id )
  end
end
