class SessionsController < ApplicationController
  public
  def destroy()
    session[ :user_id ] = nil
    redirect_to( new_session_path )
  end
  
  public
  def create()
    # user = User.find_by_sign_in_id( params[ :sign_in_id ] )
    # user = User.find( :first, :conditions => { :sign_in_id => params[ :sign_in_id ] } )
    
    # user = User.find_sall_by_sign_in_id( params[ :sign_in_id ] )
    # user = User.find( :all, :conditions => { :sign_in_id => params[ :sign_in_id ] } )
    
    user = User.find_by_sign_in_id( params[ :sign_in_id ] )
    if nil != user
      encrypted = User.encrypt_password( params[ :password ], user.salt )
      
      if encrypted == user.encrypted_password
        session[ :user_id ] = user.id
        
        redirect_to( users_path ) and return
      end
    end
    
    redirect_to( new_session_path )
  end
  
  public
  def new()
  end
end
