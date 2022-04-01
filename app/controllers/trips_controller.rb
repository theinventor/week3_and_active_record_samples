class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy ]

  # GET /trips or /trips.json
  def index
    if params[:query]
      @trips = Trip.where("destination_city ilike ?", "%#{params[:query]}%")
    elsif params[:date_query]
      @trips = Trip.where(arrival_date: params[:date_query])
    elsif params[:near]
      @trips = Trip.near(params[:near], 100)
    else
      @trips = Trip.all
    end

    @result = 'empty'
    if params[:geo_query]
      base_url = "http://api.positionstack.com/v1/forward?access_key=#{ENV['API_KEY']}&query="
      @result = Faraday.get("#{base_url}#{params[:geo_query]}").body
    end
  end

  # GET /trips/1 or /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips or /trips.json
  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to trip_url(@trip), notice: "Trip was successfully created." }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1 or /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to trip_url(@trip), notice: "Trip was successfully updated." }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1 or /trips/1.json
  def destroy
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url, notice: "Trip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trip_params
      params.require(:trip).permit(:arrival_date, :departure_date, :destination_city)
    end
end
