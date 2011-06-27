class UsersController < ApplicationController
  public
  def destroy()
    @user = User.find( params[ :id ] )
    @user.destroy()
    
    redirect_to( users_path )
  end
  
  public
  def index()
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
