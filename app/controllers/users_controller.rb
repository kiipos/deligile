class UsersController < ApplicationController
  public
  def destroy()
    @user = User.find( params[ :id ] )
    @user.destroy()
    
    redirect_to( users_path )
  end
  
  public
  def index()
    if nil == session[ :user_id ]
      redirect_to( new_session_path ) and return
    end
    
    @users = User.find( :all )
  end
  
  public
  def create()
    @user = User.create( params[ :user ] )
    
    redirect_to( users_path )
  end
  
  public
  def new()
    @user = User.new()
  end
end
