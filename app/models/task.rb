class Task < ActiveRecord::Base
  belongs_to( :story )
  belongs_to( :creator, :class_name => User.name )
end
