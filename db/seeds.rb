
require 'pry'
require_relative '../config/environment.rb'


a = Adapter.new

def seed(array)
  array.each do |show_hash|
    date_year = show_hash["eventDate"]
    year = Year.find_or_create_by(year: date_year.split("-").last.to_i)
    show = Show.find_or_create_by(date: date_year)
    year.shows << show
    venue = Venue.find_or_create_by(name: show_hash["venue"]["name"])
    venue.shows << show
    city = City.find_or_create_by(name: show_hash["venue"]["city"]["name"])
    city.venues << venue
    show_hash["sets"]["set"].each do |set_hash|
      set_hash['song'].each do |song_hash|
        song = Song.find_or_create_by(name: song_hash["name"])
        #This associaton looks good
        ShowSong.create(show_id: show.id, song_id: song.id)

      end
    end
  end

end
seed(a.all_data)
