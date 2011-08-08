class Task < ActiveRecord::Base
  belongs_to( :story )
  belongs_to( :user )
  # belongs_to( :creator, :class_name => User.name )
  # belongs_to( :worker, :class_name => User.name )

  
  validates( :description, :presence => true )
end
