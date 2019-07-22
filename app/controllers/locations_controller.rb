class LocationsController < ApiController
  before_action :set_location, only: [:show, :update, :destroy]

  # GET /locations
  def index
    @locations = Location.all

    render json: @locations
  end

  # GET /locations/1
  def show
    render json: @location
  end

  # POST /locations
  def create
    if params.keys.include?('latitude') #input from Android GPS Logger
      @location = Location.new(location_params)
    else #input from Apple Overland
      @location = Location.new(
      longitude:params[:locations][0][:geometry][:coordinates][0].to_s, 
      latitude: params[:locations][0][:geometry][:coordinates][1].to_s,
      device: params[:device].to_s)
    #params[:locations][0][:geometry][:coordinates][0]
    end

    if @location.save
      render json: @location, status: :created, location: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locations/1
  def update
    if @location.update(location_params)
      render json: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  # DELETE /locations/1
  def destroy
    @location.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def location_params
      params.permit(:latitude, :longitude, :device)
    end
end
