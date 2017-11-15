class Show < ActiveRecord::Base
  belongs_to :year
  has_many :songs, through: :show_songs

end
