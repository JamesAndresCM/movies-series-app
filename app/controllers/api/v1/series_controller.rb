class Api::V1::SeriesController < ApiController
  def index
    series = Series.includes(:videos, :tags, :type, :category)
    render json: series
  end
end