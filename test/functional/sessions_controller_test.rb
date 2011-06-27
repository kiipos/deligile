require( './test_helper' )


class SessionsControllerTest < ActionController::TestCase
  test( 'should destroy session' ) do
    parameters = { :format => :html }
    user = users( :user_1 )
    delete( :destroy, parameters, :user_id => user.id )
    
    assert_nil( session[ :user_id ] )
    
    assert_redirected_to( new_session_path )
  end
  
  test( 'should not create session' ) do
    parameters = { :format => :html, :sign_in_id => 'yuna', :password => '1212' }
    post( :create, parameters )
    
    assert_nil( session[ :user_id ] )
    assert_redirected_to( new_session_path )
  end
  
  test( 'should create session' ) do
    parameters = { :format => :html, :sign_in_id => 'yuna', :password => '121212' }
    post( :create, parameters )
    
    user = users( :user_1 )
    assert_equal( user.id, session[ :user_id ] )
    
    assert_redirected_to( users_path )
  end

  test( 'should get new' ) do
    parameters = { :format => :html }
    get( :new, parameters )
    
    assert_template( 'new' )
  end
end
