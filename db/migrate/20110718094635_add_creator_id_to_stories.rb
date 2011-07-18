class AddCreatorIdToStories < ActiveRecord::Migration
  def self.up
    add_column( :stories, :creator_id, :integer )
  end

  def self.down
    remove_column( :stories, :creator_id )
  end
end
