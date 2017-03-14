module LocationHelper
  def all_device_info
    hsh = {}
    Device.all.each { |d|
      loc = d.locations.last
      hsh[d.id] = { latitude: loc.latitude, 
                 longitude: loc.longitude,
                 time: loc.created_at.to_i,
                 name: d.name
      }
    }
    return hsh
  end
end
