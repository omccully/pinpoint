class Device < ApplicationRecord
  has_many :locations
  has_many :panic_signals

  validates :id_code, length: { minimum: 10 }
end
