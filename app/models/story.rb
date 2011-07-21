class Story < ActiveRecord::Base
  belongs_to( :creator, :class_name => User.name )
  has_many( :tasks, :dependent => :destroy )
  
  attr_accessible( :title, :description )
  
  validates( :title, :presence => true )
  validates( :description, :presence => true )
end
