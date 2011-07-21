require( './test_helper' )


class StoriesControllerTest < ActionController::TestCase
  def setup()
    @user = Factory( :user )
    @story = Factory( :story )
  end
  
  #
  #
  #
  test( 'should desctroy story' ) do
    # user = @story.creator
    parameters = { :format => :html, :id => @story.id }
    delete( :destroy, parameters, :user_id => @user.id )
    
    assert_redirected_to( stories_path )
  end

  test( 'should get index' ) do
    parameters = { :format => :html }
    get( :index, parameters, :user_id => @user.id )
    
    assert_template( 'index' )
  end
  
  test( 'should create story' ) do
    title = 'hello'
    description = 'world'
    parameters = { :format => :html, :story => { :title => title, 
      :description => description } }
    post( :create, parameters, :user_id => @user.id )

    story = Story.find( assigns( :story ) )
    assert_equal( title, story.title )
    
    assert_redirected_to( stories_path )
  end
  
  test( 'should get new' ) do
    parameters = { :format => :html }
    get( :new, parameters, :user_id => @user.id )
    
    assert_template( 'new' )
  end
end
