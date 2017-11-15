class Show < ActiveRecord::Base
  belongs_to :year
  belongs_to :venue
  has_many :show_songs
  has_many :songs, through: :show_songs

  



end
