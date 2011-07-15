class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter( :authenticate )
  
  def authenticate()
    if nil == session[ :user_id ]
      redirect_to( new_session_path )
    end
  end
end
