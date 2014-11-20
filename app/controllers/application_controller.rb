class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # layout
  layout :getLayout
  
  # Exception
  if !Rails.env.development?
    rescue_from Exception,                      with: :rescueRender500
    rescue_from ActionController::RoutingError, with: :rescueRender404
    rescue_from ActiveRecord::RecordNotFound,   with: :rescueRender404
    rescue_from ActiveRecord::RecordNotUnique,  with: :rescueRender409
    #rescue_from UnauthorizedError,              with: :rescueRender401
    #rescue_from IllegalAccessError,             with: :rescueRender403
  end
  
  private
  def getLayout
    if params[:controller].match( %r{\A(management|staff)/} )
      Regexp.last_match[1]
    else
      'staff'
    end
  end
  
  def rescueRender400(e)
    @exception = e
    render 'errors/error_400', status: 400
  end

  def rescueRender401(e)
    @exception = e
    render 'errors/error_401', status: 401
  end
  
  def rescueRender403(e)
    @exception = e
    render 'errors/error_403', status: 403
  end

  def rescueRender404(e)
    @exception = e
    render 'errors/error_404', status: 404
  end

  def rescueRender500(e)
    @exception = e
    render 'errors/error_500', stauts: 500
  end
end
