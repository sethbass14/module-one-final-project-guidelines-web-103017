class Song < ActiveRecord::Base
  has_many :shows, through: :show_songs

  # conencts to years through show_songs and shows
  has_many :years, through: :shows
  
end
