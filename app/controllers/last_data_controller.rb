class LastDataController < ApiController
  before_action :set_last_datum, only: [:show, :edit, :update, :destroy]

  # GET /last_data
  # GET /last_data.json
  def index
    @last_data = LastDatum.all

    render json: @last_data
  end

  # GET /last_data/1
  # GET /last_data/1.json
  def show
    render json: @last_datum
  end

  # POST /last_data
  # POST /last_data.json
  def create
    @last_datum = LastDatum.new(last_datum_params)

    if @last_datum.update(datum_params)
      render json: @last_datum
    else
      render json: @last_datum.errors, status: :unprocessable_entity
    end
    head :no_content

  end

  # PATCH/PUT /last_data/1
  # PATCH/PUT /last_data/1.json
  def update
    if @last_datum.update(datum_params)
      render json: @last_datum
    else
      render json: @last_datum.errors, status: :unprocessable_entity
    end
    head :no_content
  end

  # DELETE /last_data/1
  # DELETE /last_data/1.json
  def destroy
    @last_datum.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_last_datum
      @last_datum = LastDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def last_datum_params
      params.require(:last_datum).permit(:devise, :PM2_5, :PM10, :positive_feeling, :mixed_feeling, :negative_feeling, :latitude, :longitude)
    end
end
