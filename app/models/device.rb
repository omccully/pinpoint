class Device < ApplicationRecord
  has_many :locations
  has_many :panic_signals

  validates :id_code, length: { minimum: 10 }

  def velocity_in_last time
    last_loc = locations.last
    first_loc = locations.where(created_at: time.seconds.ago..Time.current).first
    return nil if last_loc.nil? || first_loc.nil?

    distance = last_loc.distance_from first_loc
    time_change = (last_loc[:created_at] - first_loc[:created_at]).to_i
    return distance / time_change
  end
end
