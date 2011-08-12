require( 'spec_helper' )


describe( UsersController ) do
  before( :each ) do
    @task = Factory( :task )
    @user = @task.user
    session[ :user_id ] = @user.id
  end

  describe( :show ) do
    describe( 'invalid id' ) do
      it( 'should redirect to failure' ) do
        get( :show, :id => 0 )
        
        response.should redirect_to( stories_path )
        flash[ :failure ].should_not be_nil
      end
    end
    
    it( 'should have tasks' ) do
      get( :show, :id => @user.id )

      tasks = assigns( :tasks )
      tasks.should be_include( @task )
    end
    
    it( 'should render show' ) do
      get( :show, :id => @user.id )
      
      response.should render_template( 'show' )
    end
  end

end
