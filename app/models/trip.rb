class Trip < ApplicationRecord
  reverse_geocoded_by :lattitude, :longitude
end
