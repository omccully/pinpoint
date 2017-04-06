class Location < ApplicationRecord
  belongs_to :device

  # Adapted frmo Oto Brglez's code from:
  # http://stackoverflow.com/questions/12966638/how-to-calculate-the-distance-between-two-gps-coordinates-without-using-google-m
  def distance_from other_loc
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlat_rad = (self[:latitude]-other_loc[:latitude]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (self[:longitude]-other_loc[:longitude]) * rad_per_deg

    lat1_rad = self[:latitude] * rad_per_deg
    lon1_rad = self[:longitude] * rad_per_deg
    lat2_rad = other_loc[:latitude] * rad_per_deg
    lon2_rad = other_loc[:longitude] * rad_per_deg

    #lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    #lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rm * c # Delta in meters
  end

end
