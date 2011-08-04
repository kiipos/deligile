Factory.define( :user ) do | user |
  user.sequence( :sign_in_id ) { | n | "sign_in_id-#{n}" }
  user.sequence( :email ) { | n | "email-#{n}@delimount.com" }
  user.password( '121212' )
end

Factory.define( :story ) do | story |
  story.association( :creator, :factory => :user )
  story.title( 'title' )
  story.description( 'description' )
end

Factory.define( :task ) do | task |
  task.association( :story )
  task.description( 'description' )
end
