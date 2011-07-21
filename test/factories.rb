Factory.define( :user ) do | user |
  user.sequence( :sign_in_id ) { | n | "sign_in_id-#{n}" }
  user.sequence( :email ) { | n | "email-#{n}delimount.com" }
  user.password( '121212' )
end

Factory.define( :story ) do | story |
  story.title( 'title' )
  story.description( 'description' )
  story.association( :creator, :factory => :user )
end

Factory.define( :task ) do | task |
  task.description( 'description' )
  task.association( :story )
end
