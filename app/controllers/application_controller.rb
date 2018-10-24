class ApplicationController < ActionController::Base
  def routing
    respond_to do |format|
      error = ActionController::RoutingError.new("Page #{request.path.tr("/","")} not found ")
      format.html { redirect_to root_path , notice: error }
    end
  end
end
