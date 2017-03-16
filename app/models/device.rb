class Device < ApplicationRecord
  has_many :locations
  has_many :panic_signals
end
