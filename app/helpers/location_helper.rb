module LocationHelper

  def all_device_info
    hsh = {}
    Device.all.each { |d|
      loc = d.locations.where.not(longitude: nil).
        where.not(latitude: nil).last
      next if loc.nil?
      lp = d.panic_signals.last
      lpt = (lp.nil? ? 0 : lp.created_at.to_i)
      # loc = d.locations.last
      hsh[d.id] = { 
             latitude: loc.latitude, 
            longitude: loc.longitude,
                 time: loc.created_at.to_i,
                 name: d.name,
      last_panic_time: lpt,
           velocities: { }
      }
      

      [1.minute, 5.minutes, 1.hour].each do |tp|
        hsh[d.id][:velocities][tp] = d.velocity_in_last tp       
      end
    }
    return hsh
  end
end
