class Quest < ApplicationRecord
  has_many :hero_quests

  reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode  # auto-fetch address
end
