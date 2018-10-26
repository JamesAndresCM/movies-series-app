class Api::V1::SeriesController < ApiController

  def index
    series = Series.includes(:videos, :tags, :type, :category).paginate(page:params[:page],per_page:10)
    render json: series
  end

  def search
    unless params[:q].blank?
      sanitize = params[:q].parameterize
      sanitize = sanitize.tr("-"," ") if sanitize.match("-")
      series = Series.where("name ilike ?", "%#{sanitize}%")
      if series.blank?
        render json: { status: 201, msg: "Serie or Movie #{params[:q]} not found" }
      else
        render json: series
      end
    end
  end

end