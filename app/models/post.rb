class Post < ApplicationRecord
  validates :title, presence: true,
                    length: {minimum: 3}
  validates :country_code, presence: true
  validates :country_name, presence: true
  validates :region_code, presence: true
  validates :region_name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :weather_description, presence: true
  validates :weather_icon, presence: true
  validates :temp, presence: true
  validates :temp_min, presence: true
  validates :temp_max, presence: true
end
