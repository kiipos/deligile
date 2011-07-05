require( 'spec_helper' )


describe( StoriesController ) do
  describe( 'delete destroy' ) do
    before( :each ) do
      @story = Story.create( :title => 'hello', :description => 'world' )
      delete( :destroy, :id => @story.id )
    end
    
    it( 'should destory a story' ) do
      lambda do
        Story.find( @story.id )
      end.should raise_error ActiveRecord::RecordNotFound
    end
    
    it( 'should redirect to index' ) do
      response.should redirect_to( stories_path )
    end
  end
  
  describe( 'get index' ) do
    before( :each ) do
      get( :index )
    end
    
    it( 'should render index' ) do
      response.should render_template( 'index' )
    end
  end
  
  describe( 'post create' ) do
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
    
    it( 'should redirect to index' ) do
      response.should redirect_to( stories_path )
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
