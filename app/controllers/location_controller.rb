class LocationController < ApplicationController
  include LocationHelper
  skip_before_action :verify_authenticity_token

  def create
    @device = Device.find_by(id_code: params[:id_code])
    if @device.nil?
      @device = Device.create(name: nil, id_code: params[:id_code])
    end
                         
    msg = decoder.parse(params[:nmea])

    # if msg == "@PANIC"
     # @device.panic_signals.create
    if msg.start_with "@PANIC"
      match_data = /@PANIC-(.)-(\d+)/.match(msg)

      if match_data.nil? 
        render status: 400 # bad request
        return
      end

      tsp = match_data[2].to_i

      last_panic = @device.panic_signals.where('created_at >= :start',
        start: Time.now - (tsp + 10)).last
      if last_panic.nil?
        @device.panic_signals.create(created_at: Time.now - tsp)
      end
    else
      decoder = NMEAPlus::Decoder.new
    
      unless msg.checksum_ok?
        render nothing: true, status: 400 
        return
      end

      unless msg.latitude.nil? or msg.longitude.nil?
        @device.locations.create(latitude: msg.latitude,
                               longitude: msg.longitude,
                               nmea: params[:nmea])
      end
    end

    render status: 200
  end

  def index
    @all_device_info = all_device_info
    @locs = Location.all
    @last_loc = Device.find(2).locations.last
  end

  def json
    render json: all_device_info
  end
end
