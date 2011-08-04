require( 'spec_helper' )


describe( Story ) do
  it( 'can be' ) do
    Story.new.should be_an_instance_of( Story )
  end
end
