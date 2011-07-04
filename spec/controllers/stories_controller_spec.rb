require 'spec_helper'

describe StoriesController do
  describe 'post create' do
    before( :each ) do
      @attributes = { :title => 'hello', :description => 'world' }
      post( :create, :story => @attributes )
    end
    
    it( 'should create a story' ) do
      story = assigns( :story )
      lambda do
        Story.find( story.id )
      end.should_not raise_error ActiveRecord::RecordNotFound
    end
    
    it( 'should render create' ) do
      response.should render_template( 'create' )
     end
  end
  
  describe( 'get new' ) do
    before( :each ) do
      get( :new )
    end
    
    it( 'should render new' ) do
      response.should render_template( 'new' )
    end
  end
end
