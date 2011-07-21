class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table( :tasks ) do | t |
      t.references( :story )
      t.references( :creator )
      t.string( :description )
      t.datetime( :created_at )
    end
  end

  def self.down
    drop_table( :tasks )
  end
end
