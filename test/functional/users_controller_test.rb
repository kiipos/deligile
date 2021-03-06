require( './test_helper' )


class UsersControllerTest < ActionController::TestCase
  def setup()
    @user = Factory( :user )
  end
  
  #
  #
  #
  
  test( 'should not get users' ) do
    parameters = { :format => :html }
    get( :index, parameters, :user_id => nil )
    
    assert_redirected_to( new_session_path )
  end
  
  test( 'should get users' ) do
    parameters = { :format => :html }
    get( :index, parameters, :user_id => @user.id )
    
    assert_template( 'index' )
  end
  
  test( 'should create user' ) do
    email = 'kiipos@delimount.com'
    password = '121212'
    parameters = { :format => :html, :user => { :sign_in_id => 'kiipos', 
      :email => email, :password => password } }
    post( :create, parameters )
    
    # assert_equal( password, assigns( :user ).password )
    
    user_id = assigns( :user ).id
    user = User.find( user_id )
    assert_equal( 'kiipos', user.sign_in_id )
    assert_equal( email, user.email )
    
    encrypted = User.encrypt_password( password, user.salt )
    assert_equal( encrypted, user.encrypted_password )
    
    assert_redirected_to( users_path )
  end
  
  test( 'should get new' ) do
    parameters = { :format => :html }
    get( :new, parameters )
    
    assert_template( 'new' )
  end

  # test( 'should destroy user' ) do
    # parameters = { :format => :html, :id => user.id }
    # delete( :destroy, parameters, :user_id => user.id )
#     
    # user_id = assigns( :user ).id
    # assert_raise( ActiveRecord::RecordNotFound ) do
      # User.find( user_id )
    # end
#     
    # assert_redirected_to( users_path )
  # end
end
