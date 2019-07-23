# frozen_string_literal: true

class DataController < ApiController
  before_action :set_datum, only: [:show, :update, :destroy]

  # GET /data
  def index
		if there_is_a_valid_range
			range = Time.parse(params["start_date"]) - Time.parse(params["end_date"])
		else
			params.delete(:start_date)
			params.delete(:end_date)
		end
    @data = Rack::Reducer.call(params, dataset: Datum.all, filters: [
      ->(device:) { where('lower(device) like ?', "%#{device.downcase}%") },
			-> (start_date:) { where('created_at - "%#{Time.parse(params["start_date"])}%" >= "%#{Time.parse(params["start_date"]).utc.iso8601}%" " + \
         "AND created_at <= #{range.utc.iso8601.inspect)}')},
    ])
    render json: @data
  end

  # GET /data/1
  def show
    render json: @datum
  end

  # POST /data
  def create
    @datum = Datum.new(datum_params)
		@datum = @datum.device.downcase
    if @datum.save
      render json: @datum, status: :created, location: @datum
    else
      render json: @datum.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /data/1
  def update
    if @datum.update(datum_params)
      render json: @datum
    else
      render json: @datum.errors, status: :unprocessable_entity
    end
    head :no_content
  end

  # DELETE /data/1
  def destroy
    @datum.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datum
      @datum = Datum.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def datum_params
      params[:positive_feeling].to_i
      params[:mixed_feeling].to_i
      params[:negative_feeling].to_i
      params.permit(:device, :PM2_5, :PM10, :positive_feeling, :mixed_feeling, :negative_feeling, :latitude, :longitude, :created_at, :updated_at)
    end

		def there_is_a_valid_range
			(params["start_date"] < params["end_date"])
		end

end
