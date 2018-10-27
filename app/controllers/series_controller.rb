class SeriesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :update, :edit]
  before_action :set_series, only: [:show, :edit, :update, :destroy]
  before_action :serie_category_type, only: [:create, :new, :update, :edit]

  # GET /series
  def index
    @last_series = Series.includes(:category).order_data.limit(3)
    @series = Series.includes(:category).paginate(page:params[:page],per_page:10)
    @categories = Category.joins(:series).uniq
  end

  # GET /series/1
  def show
  end

  # GET /series/new
  def new
    @series = Series.new
  end

  # GET /series/1/edit
  def edit
  end

  # POST /series
  def create
    
    @series = Series.new(series_params)

    respond_to do |format|
      if @series.save
        format.html { redirect_to @series, notice: 'Series was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /series/1
  def update
    respond_to do |format|
      if @series.update(series_params)
        format.html { redirect_to @series, notice: 'Series was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /series/1
  def destroy
    @series.destroy
    respond_to do |format|
      format.html { redirect_to series_index_url, notice: 'Series was successfully destroyed.' }
    end
  end

  def get_letters
    if params[:letter]
      sanitize = params[:letter].parameterize
      @series = Series.get_data_letter(sanitize)
      render "search_movies_series"
    end
  end

  def get_by_category
    if params[:category]
      @series = Series.get_by_category(params[:category])
      render "search_movies_series"
    end
  end

  def search_serie_movie
      if params[:search]
        sanitize = params[:search].parameterize
        sanitize = sanitize.tr("-"," ") if sanitize.match("-")
        @series = Series.where("name ilike ?", "%#{sanitize}%")
        unless @series.empty?
          if @series.count == 1
            redirect_to series_path(@series[0][:id])
          else
            render "search_movies_series"
          end
        else
          redirect_to root_path, notice: "Serie or Movie #{sanitize} not found" 
        end
    end
  end

  def search_data
    sanitize = params[:term].parameterize
    @series = Series.order(:name).where("name ilike ?", "%#{sanitize}%")
    render json: @series.map(&:name)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_series
      @series = Series.friendly.find(params[:id])
    rescue => exception
      flash[:notice] = "#{params[:id]} not found"
      redirect_to root_path
    end

    def serie_category_type
      @categories = Category.all.map{|c| [ c.name, c.id ] }
      @types = Type.all.map{|c| [ c.name, c.id ] }
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
                                    videos_attributes: [:id, :img, :name, :video, :_destroy],
                                    tags_attributes: [:id, :name, :_destroy])
    end
end
