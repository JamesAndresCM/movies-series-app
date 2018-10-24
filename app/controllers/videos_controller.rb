class VideosController < ApplicationController

  def show
    #@video = Video.find(params[:id])
    @serie = params[:series_id]
    @videos = Video.where(series_id: @serie).paginate(page:params[:page], per_page: 1)
    rescue => exception
        flash[:notice] = "#{params[:id]} Chapter not found"
        redirect_back(fallback_location: series_path(params[:series_id]))
  end



end
