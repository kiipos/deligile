class StoriesController < ApplicationController
  public
  def create()
    @story = Story.create( params[ :story ] )
  end
  
  public
  def new()
    @story = Story.new()
  end
end
