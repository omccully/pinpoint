class LocationController < ApplicationController
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
end
