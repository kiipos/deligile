require ( './test_helper' )


class UserTest < ActiveSupport::TestCase
  test( 'password in fixture should be encrypted' ) do
    user = users( :user_1 )
    encrypted = User.encrypt_password( '121212', user.salt )
    assert_equal( encrypted, user.encrypted_password )
  end
  
  test( 'password should be encrypted' ) do
    password = '121212'
    user = User.create( :sign_in_id => 'crystal', :email => 'crystal@delimount.com',
      :password => password )
      
    encrypted = User.encrypt_password( password, user.salt )
    assert_equal( encrypted, user.encrypted_password )
  end
end
