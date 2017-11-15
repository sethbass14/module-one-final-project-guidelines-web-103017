class Song < ActiveRecord::Base
  has_many :show_songs
  has_many :shows, through: :show_songs

  # conencts to years through show_songs and shows


end
