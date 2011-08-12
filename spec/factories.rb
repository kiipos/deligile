# Factory.sequence( :sign_in_id ) do | n |
  # "sign_in_id-#{n}"
# end
# 
# Factory.sequence( :email ) do | n |
  # "email-#{n}@delimount.com"
# end

Factory.define( :user ) do | user |
  user.sequence( :sign_in_id ) { | n | "sign_in_id-#{n}" }
  user.sequence( :email ) { | n | "email-#{n}@delimount.com" }
  user.password( '121212' )
  # user.sign_in_id( Factory.next( :sign_in_id ) )
  # user.email( Factory.next( :email ) )
end

Factory.define( :story ) do | story |
  story.association( :user )
  story.title( 'title' )
  story.description( 'description' )
end

Factory.define( :task ) do | task |
  task.association( :user )
  task.association( :story )
  task.description( 'description' )
  task.estimated_time( 1 )
  task.working_time( 1 )
end
