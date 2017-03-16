module LocationHelper
  def all_device_info
    hsh = {}
    Device.all.each { |d|
      loc = d.locations.where.not(longitude: nil).
        where.not(latitude: nil).last
      lp = d.locations.where(nmea: "@PANIC").last
      lpt = (lp.nil? ? 0 : lp.created_at.to_i)
      # loc = d.locations.last
      hsh[d.id] = { 
             latitude: loc.latitude, 
            longitude: loc.longitude,
                 time: loc.created_at.to_i,
                 name: d.name,
      last_panic_time: lpt
      }
    }
    return hsh
  end
end
