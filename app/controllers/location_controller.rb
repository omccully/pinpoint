class LocationController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @device = Device.find_by(id_code: params[:id_code])
    if @device.nil?
      @device = Device.create(name: nil, id_code: params[:id_code])
    end
                         
    decoder = NMEAPlus::Decoder.new
    msg = decoder.parse(params[:nmea])
  
    render nothing: true, status: 400 unless msg.checksum_ok?

    #@loc = Location.new
    #@loc.latitude = msg.latitude
    #@loc.longitude = msg.longitude
    #@loc.nmea = params[:nmea]
    #@loc.save
    unless msg.latitude.nil? or msg.longitude.nil?
      @device.locations.create(latitude: msg.latitude,
                             longitude: msg.longitude,
                             nmea: params[:nmea])
    end

    render status: 200
  end

  def index
    @locs = Location.all
    @last_loc = Location.last
  end

  def json
    hsh = { }

    Device.all.each { |d|
      loc = d.locations.last
      hsh[d.id_code] = { latitude: loc.latitude, 
                 longitude: loc.longitude,
                 time: loc.created_at.to_i,
                 name: d.name
      }
    }
    # @loc = Location.last

    #coords = { latitude: @loc.latitude, longitude: @loc.longitude,
    #    time: @loc.created_at.to_i }
    render json: hsh
  end
end
