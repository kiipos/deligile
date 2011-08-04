require( 'spec_helper' )


describe( TasksController ) do
  before( :each ) do
    @story = Factory( :story )
    @user = @story.creator
    session[ :user_id ] = @user.id
  end
  
  describe( :post ) do
    before( :each ) do
      @attributes = { :description => 'description' }
    end

    describe( 'invalid story id' ) do
      it( 'should render failure' ) do
        post( :create, :story_id => 0, :task => @attributes )
        
        response.should render_template( 'shared/failure' )
      end
    end
    
    describe( 'invalid attributes' ) do
      it( 'should have notice' ) do
        post( :create, :story_id => @story.id, :task => { :description => nil } )

        flash[ :notice ].should_not be_nil
      end
    end
    
    it( 'should create a task' ) do
      post( :create, :story_id => @story.id, :task => @attributes )
      
      task = assigns( :task )
      task.should be_persisted
    end

    it( 'should redirect to index' ) do
      post( :create, :story_id => @story.id, :task => @attributes )
      
      response.should redirect_to( story_path( @story ) )
    end
  end
  
  describe( :new ) do
    before( :each ) do
      get( :new, :story_id => @story.id )
    end
    
    it( 'should render new' ) do
      response.should render_template( 'new' )
    end
  end
end
