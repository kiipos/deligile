class UsersController < ApplicationController
  skip_filter( :authenticate, :only => [ :new, :create ] )
  
  public
  def show()
    begin
      @user = User.find( params[ :id ] )
    rescue
      flash[ :failure ] = 'invalid user id' 
      redirect_to( stories_path )
      return      
    end
    
    @tasks = @user.tasks
  end

  public
  def destroy()
    @user = User.find( params[ :id ] )
    @user.destroy()
    
    redirect_to( users_path )
  end
  
  public
  def index()
    if nil == session[ :user_id ]
      redirect_to( new_session_path ) and return #error list.1
    end
    
    @users = User.find( :all )
  end
  
  public
  def create()
    @user = User.create( params[ :user ] )
    session[ :user_id ] = @user.id #solution of error list.1
    redirect_to( users_path ) 
  end
  
  public
  def new()
    @user = User.new()
  end
end
