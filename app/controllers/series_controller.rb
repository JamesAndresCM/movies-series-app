# frozen_string_literal: true

class SeriesController < ApplicationController
  include SerieData
  before_action :authenticate_user!, only: %i[create new update edit]
  before_action :set_series, only: %i[show edit update destroy]
  before_action :serie_category_type, only: %i[create new update edit]

  def index; end
  def show; end
  def edit; end

  def new
    @series = Series.new
  end

  

  def create
    @series = Series.new(series_params)
    if @series.save
      redirect_to @series, notice: 'Series was successfully created.'
    else
      render :new
    end
  end

  def update
    if @series.update(series_params)
      redirect_to @series, notice: "Serie #{@series.name} updated"
    else
      render :edit
    end
  end

  def destroy
    @series.destroy
    redirect_to series_index_url, notice: "Serie #{@series.name} destroyed"
  end

  def get_letters
    letter = params[:letter].parameterize
    @series = Series.type_attr_serie('letter', letter)
    render :search_movies_series
  end

  def get_by_category
    category = params[:category]
    @series = Series.get_by_category(category)
    render :search_movies_series
  end

  def search_serie_movie
    query = params[:search_series].presence && params[:search_series][:query]
    if query
      @series = Series.search_serie(query)
      (redirect_to series_path(@series[0].id) if @series.count == 1) and return
      (render :search_movies_series) and return
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_series
    @series = Series.friendly.find(params[:id]).decorate
  rescue StandardError
    flash[:notice] = "#{params[:id]} not found"
    redirect_to root_path
  end

  def serie_category_type
    @categories = Category.all.map { |c| [c.name, c.id] }
    @types = Type.all.map { |c| [c.name, c.id] }
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def series_params
    params.require(:series).permit(:name,
                                   :release_date,
                                   :description,
                                   :category_id,
                                   :type_id,
                                   :img,
                                   :remove_img,
                                   videos_attributes: %i[id img name video _destroy],
                                   tags_attributes: %i[id name _destroy])
  end
end
