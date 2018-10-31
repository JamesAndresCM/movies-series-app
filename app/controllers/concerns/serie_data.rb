module SerieData
  extend ActiveSupport::Concern

  included do
    before_action :set_index, only: %i[index]
    before_action :check_serie, only: %i[search_serie_movie]
  end

  def check_serie
    serie = params[:search].parameterize
    if serie.blank?
      redirect_to root_path
    else
      serie = serie.match?('-') ? serie.tr('-', ' ') : serie
      @series = Series.type_attr_serie('name', serie)
      if @series.empty?
        redirect_to root_path, notice: "Serie or Movie #{serie} not found"
      else
        @series
      end
    end
  end

  def set_index
    @last_series = Series.includes(:category).order_data.limit(3)
    @series = Series.includes(:category).paginate(page: params[:page], per_page: 10)
    @categories = Category.joins(:series).uniq
  end
end