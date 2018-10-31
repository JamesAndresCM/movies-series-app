# frozen_string_literal: true

class VideosController < ApplicationController
  before_action :set_video
  before_action :set_serie

  def show
    page = params[:page].to_i
    if page.blank? || page.zero?
      redirect_back(fallback_location: series_path(params[:series_id]))
    else
      @videos = @serie.videos.paginate(page: page, per_page: 1)
                      .order(created_at: :asc)
      if @videos.empty?
        flash[:notice] = "Page #{params[:page]} not found"
        redirect_back(fallback_location: series_path(params[:series_id]))
      end
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  rescue StandardError
    flash[:notice] = "Video #{params[:id]} not found"
    redirect_back(fallback_location: series_path(params[:series_id]))
  end

  def set_serie
    @serie = Series.friendly.find(params[:series_id])
  rescue StandardError
    redirect_back(fallback_location: series_path(params[:series_id]))
  end
end
