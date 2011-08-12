class Story < ActiveRecord::Base
  # belongs_to( :creator, :class_name => User.name )
  belongs_to( :user )
  has_many( :tasks, :dependent => :destroy )
  
  attr_accessible( :title, :description )
  
  validates( :title, :presence => true )
  validates( :description, :presence => true )

  public  
  def working_time()
    return tasks.inject( 0 ) { | sum, task | sum + ( task.working_time || 0 ) }
  end

  public  
  def estimated_time()
    return tasks.inject( 0 ) { | sum, task | sum + ( task.estimated_time || 0 ) }
  end
end
