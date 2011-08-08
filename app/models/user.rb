class User < ActiveRecord::Base
  SEED = 'Beansgirl'
  
  has_many( :stories, :dependent => :nullify )
  has_many( :tasks, :dependent => :nullify )
  # has_many( :create_tasks, :dependent => :nullify )
  # has_many( :working_tasks, :dependent => :nullify )
  
  attr_reader( :password )
  attr_accessible( :sign_in_id, :email, :password )

  public
  def self.encrypt_password( password, salt )
    concatenated = password.to_s + User::SEED + salt
    return Digest::SHA2.hexdigest( concatenated )
  end
 
  public
  def password=( value )
    salt = object_id.to_s() + rand.to_s()
    write_attribute( :salt, salt )
    
    encrypted = User.encrypt_password( value, salt )
    write_attribute( :encrypted_password, encrypted ) # self.encrypted_password = value <- 나쁜 소스
  end
end
