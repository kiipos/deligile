require( 'spec_helper' )


describe( TasksController ) do
  before( :each ) do
    Factory( :task )
    @task = Factory( :task )
    @story = @task.story
    @user = @story.creator
    session[ :user_id ] = @user.id
  end
  
  describe( :destroy ) do
    it( 'should destroy a task' ) do
      delete( :destroy, :story_id => @story.id, :id => @task.id )

      task = assigns( :task )
      task.should be_destroyed      
    end

    it( 'should redirect to story' ) do
      delete( :destroy, :story_id => @story.id, :id => @task.id )
      
      path = story_path( @story )
      response.should redirect_to( path )
    end
  end 
  
  describe( :edit ) do
    describe( 'invalid id' ) do
      it( 'should redirect to stories#show' ) do
        get( :edit, :story_id => @story.id, :id => 0 )
        
        path = story_path( @story )
        response.should redirect_to( path )
      end
    end
    
    it( 'should render edit' ) do
      get( :edit, :story_id => @story.id, :id => @task.id )
      response.should render_template( 'edit' )
    end
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
