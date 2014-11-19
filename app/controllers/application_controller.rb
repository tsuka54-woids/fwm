class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  layout :getLayout

  private
  def getLayout
    if params[:controller].match( %r{\A(management|staff)/} )
      Regexp.last_match[1]
    else
      'staff'
    end
  end
end
