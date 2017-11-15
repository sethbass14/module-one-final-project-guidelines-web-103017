class Venue < ActiveRecord::Base
  has_many :shows
  belongs_to :city
end
