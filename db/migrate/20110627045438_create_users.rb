class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table( :users ) do | t |
      t.string( :sign_in_id )
      t.string( :email )
      t.string( :encrypted_password )
      t.string( :salt )
      t.datetime( :created_at )
    end
    
    add_index( :users, :sign_in_id, :unique => true )
    add_index( :users, :email, :unique => true )
  end

  def self.down
    remove_index( :users, :email )
    remove_index( :users, :sign_in_id )
    
    drop_table( :users )
  end
end
