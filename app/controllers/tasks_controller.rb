class TasksController < ApplicationController
  before_filter( :initialize_story, :only => [ :new, :create ] )
  before_filter( :initailize_task, :only => [ :edit, :destroy, :update ] )
  before_filter( :initialize_users, :only => [ :edit, :new ] )
  
  layout( 'stories' )
  
  protected
  def initialize_users()
    @users = User.find( :all )
  end
  
  protected
  def initailize_task()
    begin
      @task = Task.find( params[ :id ] )
      @story = @task.story
    rescue
      flash[ :failure ] = 'invalid task id'
      path = story_path( @story ) 
      redirect_to( path )
      return      
    end
  end
  
  protected
  def initialize_story()
    begin
      @story = Story.find( params[ :story_id ] )
    rescue ActiveRecord::RecordNotFound
      render( 'shared/failure' )
      return
    end
  end
  
  public
  def update()
    @task.update_attributes( params[ :task ] )
    
    path = story_path( @story )
    redirect_to( path )
  end
  
  public
  def destroy()
    @task.destroy()
    
    path = story_path( @story )
    redirect_to( path )
  end
  
  public
  def edit()
  end

  public
  def create()
    begin
      @task = @story.tasks.create!( params[ :task ] )
    rescue Exception => e
      flash[ :notice ] = 'error'
    end
    
    path = story_path( @story )
    redirect_to( path )
  end
  
  public
  def new()
    @task = Task.new()
  end
end
