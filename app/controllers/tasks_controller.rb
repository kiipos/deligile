class TasksController < ApplicationController
  public
  def destroy()
    begin
      @task = Task.find( params[ :id ] )
    rescue
      flash[ :failure ] = 'invalid task id'
      path = story_path( @story ) 
      redirect_to( path )
      return      
    end
    
    @task.destroy()

    path = story_path( @story ) 
    redirect_to( path )
  end
  
  public
  def edit()
    begin
      @story = Story.find( params[ :story_id ] )
    rescue ActiveRecord::RecordNotFound
      render( 'shared/failure' )
      return
    end
    
    begin
      @task = Task.find( params[ :id ] )
    rescue
      flash[ :failure ] = 'invalid task id'
      path = story_path( @story ) 
      redirect_to( path )
      return      
    end
  end

  public
  def create()
    begin
      @story = Story.find( params[ :story_id ] )
    rescue ActiveRecord::RecordNotFound
      render( 'shared/failure' )
      return
    end
    
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
  end
end
