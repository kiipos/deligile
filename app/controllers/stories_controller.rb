class StoriesController < ApplicationController
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
