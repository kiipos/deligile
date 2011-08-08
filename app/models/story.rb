class Story < ActiveRecord::Base
  # belongs_to( :creator, :class_name => User.name )
  belongs_to( :user )
  has_many( :tasks, :dependent => :destroy )
  
  attr_accessible( :title, :description )
  
  validates( :title, :presence => true )
  validates( :description, :presence => true )
end
