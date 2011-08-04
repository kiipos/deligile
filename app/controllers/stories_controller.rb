class StoriesController < ApplicationController
  public
  def show()
    begin
      @story = Story.find( params[ :id ] )
    rescue
      flash[ :failure ] = 'invalid story id' 
      redirect_to( stories_path )
      return      
    end
  end
  
  public
  def destroy()
    @story = Story.find( params[ :id ] )
    @story.destroy()
    
    redirect_to( stories_path )
  end
  
  public
  def index()
    @stories = Story.find( :all )
  end
  
  public
  def create()
    @story = Story.create!( params[ :story ] ) do | story |
      story.creator_id = session[ :user_id ]
    end
    
    redirect_to( stories_path )
  end
  
  public
  def new()
    @story = Story.new()
  end
end
