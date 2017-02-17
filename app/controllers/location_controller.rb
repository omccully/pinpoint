class LocationController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    decoder = NMEAPlus::Decoder.new
    msg = decoder.parse(params[:nmea])
  
    render nothing: true, status: 400 unless msg.checksum_ok?

    @loc = Location.new
    @loc.latitude = msg.latitude
    @loc.longitude = msg.longitude
    @loc.nmea = params[:nmea]
    @loc.save

    render status: 200
  end

  def index
    @locs = Location.all
    @last_loc = Location.last
  end

  def json
    @loc = Location.last
    coords = { latitude: @loc.latitude, longitude: @loc.longitude,
        time: @loc.created_at.to_i }
    render json: coords
  end
end
