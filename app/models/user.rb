class User < ActiveRecord::Base
  attr_reader( :password )
  
  def password=( value )
    # ...
    @password = value
  end
end
