class ErrorsController < ApplicationController
  def not_found
    raise ActionController::RoutingError, "Route Not Found #{request.path.inspect}"
  end
end
